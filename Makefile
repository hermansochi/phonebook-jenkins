init: docker-down docker-pull docker-build docker-up
up: docker-up
down: docker-down

docker-up:
	docker-compose up -d

docker-down:
	docker-compose down --remove-orphans

docker-pull:
	docker-compose pull

docker-build:
	docker-compose build --pull

build:
	docker --log-level=debug build --pull --file=docker/common/jenkins/Dockerfile --tag=${REGISTRY}/jenkins:${IMAGE_TAG} docker

push:
	docker push ${REGISTRY}/jenkins:${IMAGE_TAG}

show-initial-password:
	docker compose exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword

deploy:
	ssh -o StrictHostKeyChecking=no deploy@${HOST} -p ${PORT} 'docker network create --driver=overlay traefik-public || true'
	ssh -o StrictHostKeyChecking=no deploy@${HOST} -p ${PORT} 'rm -rf jenkins && mkdir jenkins'
	scp -P ${PORT} docker-compose-production.yml deploy@${HOST}:jenkins/docker-compose.yml
	scp -P ${PORT} -r docker deploy@${HOST}:jenkins/docker
	ssh -o StrictHostKeyChecking=no deploy@${HOST} -p ${PORT} 'cd jenkins && docker stack deploy --with-registry-auth -c docker-compose.yml jenkins'