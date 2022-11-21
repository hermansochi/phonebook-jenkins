# Jenkins for Ubuntu 22.04

1. rename provisioning/hosts.yml.dst to hosts.yml and edit.

2. Edit nginx config docker\production\nginx\conf.d\jenkins.conf 

3. install on VM:

>cd provisioning && make server

4. Deploy from project root:

>cd .. && HOST=server_ip PORT=ssh_port make deploy


5. Open jenkins.your.site in browser and wait until "Unlock Jenkins" prompt.

6. Loh into VM and search admin password in jenkins_jenkins service log:


| Please use the following password to proceed to installation:
|
| XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
|
| This may also be found at: /var/jenkins_home/secrets/initialAdminPassword
