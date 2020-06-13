# How to debug network issues in Linux

In this first chapter, we will be looking into how we can debug common network issues.

## Checking if a DNS record is registered/works

## Checking IP information

## Checking if a remote port is working

## Checking if a remote server is up

## Checking if a local port is running on the system

Most of the times when working with a applications on a Linux system, you will need to check that a certain port for an application is still running. This is the first thing that you should check in case someone complains that they are getting a `connection refused` or `I can't access the website`.

In order to check open ports on the system, we can either use the `netstat` command or the newer version `ss`.

Most commonly you will run the `netstat` command as it follows(you can click the text to automatically run it in the terminal):

  - `netstat -lepunta`{{execute}}

Each letter after the dash sign/ `-` is an argument for the netstat command, they each fetch certain networking information:

  - `-p` : Display information about what process/program is running on that port
  - `-u` : Show UDP ports
  - `-l` : Check what ports are open/listening on the system
  - `-a` : Show all types of listeners
  - `-n` : Show number of the ports instead of names
  - `-e` : Display extra information
  - `-t` : Show TCP ports

For example if we want to check if port `22` is opened we can use `grep` on the output of the `netstat`, like so: `netstat -lepunta | grep 22`{{execute}}

## Checking the response from a webservice