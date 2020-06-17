# Debugging proccesses and services in Linux

In this second chapter, we will be looking into how we can find out details about running proccesses and services on our system.

## What is a process?

A process refers to a program which is currently running or just ran.

Any command or long running program we have in Linux is a **process**. The **process** is the actual piece of code which is getting executed by our processor/CPU.

Processes are usually either long running/background proccesses or short. Some examples of programs which can be long running are:

  - the proccesses responsible for showing us the graphical interface on a desktop, all the icons and videos etc.
  - web browsers, such as Chrome or Firefox, they are being executed as proccesses for the whole duration while we do browsing
  - web servers which serve pages, such as **Nginx** or **Apache**

On the other hand a "short running" process could be:

  - a bash script which does some simple tasks
  - a command we just ran, such as `ls -la` will be executed as a process and then stop after it managed to show us all the files


## What is a service?

A service is just a program which makes sure that an application is running and stays running.

It's a way through which we can easily **start**, **stop**, **restart** and easily manage programs/applications.

Services usually start at the **start up time** of the system. Such examples of **services** could be:

  - a program such as Skype, Dropbox, OneDrive if configured to start-up
  - Nginx/Apache, configured to start serving web pages when the server starts
  - a Java/.NET web application


## How to debug proccesses

In order to see all running proccesses/programs on our system, we can run the `ps` command, like so: `ps auxw`{{execute}}

Usually if you want to only see details about a single process/program, you can use `grep`.

For example in order to check if **nginx** is running and other details about it, we can just run: `ps auxw | grep nginx`{{execute}}

In the first column of the output, we can see the user that started that process/command, in our case for the **nginx** program, the user is **root**.

The second column contains the PID number, that is an unique **P**rocess **ID**.

The last column contains the command with which the program/process started.

These kind of details are usually useful whenever we want to make sure that a program started with the right command.

For example the next step after seeing that a web application port like `80` is not opened on the system, is to check whether or not the process responsible to serve applications on that port is showing in the output of the `ps auxw` command.


## How to interact with services

Most common applications on systems get registered as **services**, in order to more easily manage them.

We can get a list of all the services on the system by running: `systemctl --type=service`{{execute}}

If we want to check the status of the `ssh` service for example, we can run: `systemctl status ssh`{{execute}}

This will tell us whether or not the program is currently running, when it started and how it started, and in case it failed it will give us some output logs.


Some other common commands when working with a service are:

  - `systemctl stop ssh`{{execute}} to stop a service
  - `systemctl start ssh`{{execute}} to start a service
  - `systemctl restart ssh`{{execute}} to stop and start a service
  - `systemctl reload nginx`{{execute}} to have an application re-apply their configuration files, without restarting the application. Beware that services like Java/.NET don't normally support reload of their configuration files, they need to be **restart**-ed


## Conclusion

We now know how to check if a process is running, and also manage it using `systemctl` if the process is registered as a **service**.

Feel free to play around with other services, check their output restart them and so on!
