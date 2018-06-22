## Something more ...

### Inventory

An inventory is a place/file to show which machines a _cfgmgt_ will run/impact. Without an inventory on Ansible, you would have a set of playbooks that define your desired system state and would have to do a lot of manual setups.
<br> As we have seen, Puppet and Chef store this information on a central server. As there is no central server in Ansible, we will need another way to get all of this information to the code that runs to enforce the desired state. This is where the inventory file comes in.
<br>By default, Ansible will read `/etc/ansible/hosts` as its default inventory file - _do not do this!_. You should maintain a different inventory file for each project that you have and pass it to `ansible` or `ansible-playbook` with the `-i` flag.

```bash
ansible all -i /path/to/inventory-file -m ping
```

This file can be an `INI` file or a `JSON` file. If you look around you will see lots of `INI` examples and on real life you will see lots of `json`, because the latest are dynamically generated. As an an example of a simple inventory file:

```
host1.ibm-linkit.nl
host2.ibm-linkit.nl
192.168.9.31
```

If you run the ping above against this inventory, `ansible` will run against each of them in turn and in sequence. This is the simplest kind of inventory file that you can have. There is no additional information for any of the hosts; it is simply a list of hosts to run Ansible against. If you run SSHD on a non-standard port, you can specify this in your inventory file as well. To do this, add a colon followed by the port number to the end of your hostname:

```
host1.ibm-linkit.nl:50822
host2.ibm-linkit.nl:2200
192.168.9.31
```

Common naming schemes can be used on the inventory file with a simple expansion:

```
host[1:2].ibm-linkit.nl
192.168.9.31
```

This is similar to python slicing functions, so you can do something like `host[1:8:3].ibm-linkit.nl` as `host[min:max:step].ibm-linkit.nl` would be:

```
host1.ibm-linkit.nl
host4.ibm-linkit.nl
host7.ibm-linkit.nl
```
### Roles
We did a simple application using TLS but everything was in one file - with the exception of templates.
<br> But, come on! We are now treating configuration management of servers remotely with code... if it is code, we must be able to reuse it afterwards. That is where the concept of Ansible **Roles** really shines!

Playbooks and roles are very similar but have a different goal. A playbook is a standalone file that Ansible can run that contains all of the information required to set a machine’s state to what you expect. A playbook can contain variables, tasks, handlers, roles, and even other playbooks, all in the same file. You don’t need any other files to accomplish your task.

A __role__ is (_kinda_) like a playbook that is split up into multiple different files. Instead of having a single file that contains everything that you need, there’s one file for variables, one for tasks, and another for handlers. You can’t run a role on its own, though; you need to include it inside a playbook along with the information about which hosts to run on.
<br> These are just mechanisms that you use to package up tasks, handlers, and everything else that you need into reusable components that you can put together in a playbook.

### A fancier application with some code on a Repo

Now let's go over in deploying a website within 2 hosts that we create using 3 roles!

Let's see the `ansible.cfg`, `hosts` and the `site.yml`!

### Ansible Galaxy

Roles are a core concept in Ansible. They perform such a core function, in fact, that they even have their own repository and accompanying command-line tool. Ansible Galaxy is a website where people can upload roles that they have developed for other people to use. If you want to examine some of these roles, go to https://galaxy.ansible.com/ and explore.

As with any open code repository, there are both good and bad contributions. You can search for a role and order the results by the number of downloads—the higher the number of downloads, the more likely it is to be a good role. Each role will have a link to its source code - look into some, review what it does and start playing around!

When installing a role, you can either install it globally on your machine or locally to a project. As with any dependency, you want it to be local to your project in case multiple projects want different versions of the same dependency. To download a role, you call the ansible-galaxy command, providing the `-p` (for path) flag to make it install the role in a folder named roles. You should run the ansible-galaxy command in the same directory of the playbook.

```
ansible-galaxy install geerlingguy.nginx -p roles
```

This will create a folder called roles and download the role into it. To use this role, you need to create a playbook and include it. As usual, you need to tell Ansible which servers to run on!

I hope you followed along and you can start using Ansible or any other `cfgmgt` tools in your daily job... things can be so much easier!! :-)

### Thanks!!

