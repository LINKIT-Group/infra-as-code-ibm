# Infrastructure as code instructions for the IBM crash course

## Agenda
> UNDER CONSTRUCTION

**16:00 - 17:00** 
<br>&nbsp;&nbsp;&nbsp;&nbsp;Welcome and coffee to get it started!
<br>**17:00 - 18:00** 
<br>&nbsp;&nbsp;&nbsp;&nbsp;Immutable Infrastructure - from pets to cattle
<br>**18:00 - 18:30** 
<br>&nbsp;&nbsp;&nbsp;&nbsp;Dinner
<br>**18:30 - 19:45** 
<br>&nbsp;&nbsp;&nbsp;&nbsp;Hands-on Session Part 1: A fresh start
<br>**19:45 - 20:00** 
<br>&nbsp;&nbsp;&nbsp;&nbsp;Break
<br>**20:00 - 21:00** 
<br>&nbsp;&nbsp;&nbsp;&nbsp;Hands-on Session Part 2: The Return

-------------------

## Before you start

The first third of the session is going to be an open discussion about infrastructure-as-code: configuration management, secret management, provisioning tools, ... 
The remaining part is going to be hands-on session with Ansible on your local machines.

To follow along this course you need a **test instance machine** with RHEL (Red Hat Enterprise Linux) or Ubuntu Server that you can `ssh` into it from **your laptop**. Due to the speed of changes and necessity to recreate the instance during this course, I do not recommend a full virtualization on your local machine.

Feel free to use a cloud instance that you can easily spawn, [Docker](https://www.docker.com) or [Vagrant](https://www.vagrantup.com/).

And of course, you need [Ansible](https://www.ansible.com/) installed. Follow along [here](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) to install the latest version for your Linux system (_Windows people, sorry, it only runs on Linux_).

On the hands-on session I will also use terraform to provide some instances on the fly and make the scripts available. If you want, you can create a [1st AWS account for Free Tier](https://aws.amazon.com/free/) and [setup Terraform on your machine](https://www.terraform.io/intro/getting-started/install.html).

-------------------

## Troubles/Feedback

Send in your thoughts, troubles and feedback directly to [Thiago de Faria](mailto:thiago.de.faria@linkit.nl).
