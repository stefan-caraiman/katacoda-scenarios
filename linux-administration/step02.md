# Debugging proccesses and services in Linux

In this second chapter, we will be looking into how we can find out details about running proccesses and services on our system.

## What is a process?

A process refers to a program which is currently running or just ran.

Any command or long running program we have in Linux is a **process**. The **process** is the actual piece of code which is getting execute by our proccessor/CPU.

Processes are usually either long running/background proccesses or short. Some examples of programs which can be long running are:

  - the proccesses responsible for showing us the graphical interface on a desktop, all the icons and videos etc.
  - web browsers, such as Chrome or Firefox, they are being executed as proccesses for the whole duration while we do browsing
  - web servers which serve pages, such as **Nginx** or **Apache**

On the other hand a "short running" process could be:

  - a bash script which does some simple tasks
  - a command we just ran, such as `ls -la` will be executed as a process and then stop after it managed to show us all the files

## What is a service?

A service is just another program/process which makes sure that an application is running and stays running.

It's a way through which we can easily **start**, **stop**, **restart** and easily manage a program.

Services usually start at the **start up time** of the system. Such examples of **services** could be:

  - a program such as Skype, Dropbox, OneDrive if configured to start-up
  - Nginx/Apache, configured to start serving web pages when the server starts
  - a Java web application


## How to debug proccesses

In order to see all running proccesses/programs on our system, we can run the `ps` command, like so: `ps auxw`{{execute}}

Usually if you want to only see details about a single process/program, you can use `grep`.

For example in order to check if **nginx** is running and other details about it, we can just run: `ps auxw | grep nginx`{{execute}}

In the first column of the output, we can see the user that started that process/command, in our case for **nginx**, its user **root**.

The second column contains the PID number, that is an unique **P**rocess **ID**.