<h1>Deploy LAMP_Stack</h1>

<h3>Objective:</h3>

* Automate the provisioning of two Ubuntu-based servers, named “Master” and “Slave”, using Vagrant.
* On the Master node, create a bash script to automate the deployment of a LAMP (Linux, Apache, MySQL, PHP) stack.
* This script should clone a PHP application from GitHub, install all necessary packages, and configure Apache web server and MySQL.
* Ensure the bash script is reusable and readable.

<h4>Using an Ansible playbook:</h4>

* Execute the bash script on the Slave node and verify that the PHP application is accessible through the VM’s IP address (take screenshot of this as evidence)
* Create a cron job to check the server’s uptime every 12 am.

<h3>Overview Of Task Execution</h3>

* In this Document i'll outline the steps required to deploy a PHP Laravel application using Ansible and Bash Script ensuring Accessibility.
* Ansible Communicates with slave node using SSH connection
