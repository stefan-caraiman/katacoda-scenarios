# How to debug network issues in Linux

In this first chapter, we will be looking into how we can debug common network issues.


## Debugging DNS issues

One of the most common problems when it comes down to a server or a client finding the IP address/correct IP address of another remote server/web application. Meaning, is the DNS working correctly?

In simple terms, DNS is the one responsible to tell us the IP address of a given URL address.

You can think of it like a big phonebook of the internet, which knows that each phone number(IP) is associated with a name and address(URL address).

Most common commands for checking DNS information are: `dig`, `nslookup`, `whois`, `host`


**Using `dig`**

`dig google.com`{{execute}} will give us the DNS information about the `google.com` domain.


**Using `nslookup`**

`nslookup google.com`{{execute}} will also give us DNS/IP information


**Using `whois`**

`whois google.com`{{execute}} will give us details about who owns the domain, when it was bought etc.


**Using `host`**

The host command is also similar to the previous ones, it can give us all the DNS records(IPs etc.) in a more readable format.

`host netflix.com`{{execute}}


**Further DNS details:**

Beware that you should always first check your `/etc/resolv.conf` file, because the **nameserver** set in there is the actual DNS server which translates an URL to IP.

In our case if we run `cat /etc/resolv.conf`{{execute}} we will see that our `nameserver` is set to `8.8.8.8`. 

`8.8.8.8` is one of the most popular DNS servers on the planet, it is one of the DNS servers maintained by Google.

Also, you should be aware that if a URL/address is already set on the server in the `/etc/hosts` file, the DNS server will not be executed.

Meaning that if we set `google.com` to the localhost IP, `127.0.0.1`, our system will **always** go to IP `127.0.0.1` when we try to access `google.com`.

Like so `echo "127.0.0.1 google.com" >> /etc/hosts`{{execute}}

If we try to access `google.com` by `ping`-ing it, we will notice that the IP shown by `ping` is `127.0.0.1`.

`ping -c2 google.com`{{execute}}

This happens because in Linux, whenever a program/user tries to access a IP, it will do the following steps:

1. Check `/etc/hosts` file, if the `DNS` name is set in there, use that IP
2. If the `DNS` name is not set in `/etc/hosts` file, look in the local `DNS cache`, meaning already saved `DNS` records, **only if** configured by the system administrator.
3. If the `DNS` is not present in the cache, go to `/etc/resolv.conf` and ask the `nameserver` IP, about the adress we are trying to reach.

Thus you should always check the `/etc/hosts` file on the system as well, when debugging an incorrect IP.


## Checking if a port is working

What is a port?

A port is a way through which an application can expose and communicate with other clients/servers in a network. You can think of it like the **entry door** for an application which is running on our system.

Ports are used as a way to expose multiple programs on the same system. The same way a street can have multiple houses residing on it, and each house hosts a different family, a port is a different house on the **network street** of the system.

One of the most popular tools to use for checking the status of a port, locally or remote, is the `nc`/`netcat` command.

You can use `nc` like so: `nc -v -w1 netflix.com 443`{{execute}}

  - `-v` : tells `nc` to print extra information/`verbose`, such as whether a connection worked or not
  - `-w1` : tells `nc` to wait for one second to connect, if the connection didn't succeed within `1 second` it will stop

We can replace the `netflix.com` address with our localhost IP as well: `nc -v -w1 127.0.0.1 80`{{execute}}

If we ever get a `connection refused` it means that the Port is not opened.

If we get a `timeout` it means that the port might be opened, but the application didn't manage to respond to us in a timely manner.

In either of these 2 cases, we should further investigate if the `IP` is the correct one, if the process is running or check the logs of the application which is misbehaving.

Some common ports in the world of web applications are:

  - `22` used for SSH
  - `80` used for HTTP requests
  - `443` used for HTTPS requests
  - `8080` sometimes used by Apache web server
  - `5432` used by PostgreSQL


## Checking if a remote server is up

## Checking if a local port is running on the system

Most of the times when working with an application on a Linux system, you will need to check that a certain port for an application is still running. This is the first thing that you should check in case someone complains that they are getting a `connection refused` or `I can't access the website`.

In order to check open ports on the system, we can either use the `netstat` command or the newer version `ss`.

Most commonly you will run the `netstat` command as it follows(you can click the text to automatically run it in the terminal):

  - `netstat -lepunta`{{execute}}

Each letter after the dash sign/ `-` is an argument for the netstat command, they each fetch certain networking information:

  - `-p` : Display information about what process/program is running on that port
  - `-l` : Check what ports are open/listening on the system
  - `-a` : Show all types of listeners(services, special sockets/programs)
  - `-n` : Show the number of the ports instead of the names(shows 443 instead of HTTPS for example)
  - `-e` : Display extra information
  - `-t` : Show TCP ports
  - `-u` : Show UDP ports

For example if we want to check if port `22` is opened we can use `grep` on the output of the `netstat`, like so: `netstat -lepunta | grep 22`{{execute}}

If the expected port is not running, you can start from there to investigate further.

Checking if the process is running, checking the logs of the application etc.


## Checking the response from a web application

If you want to check the response of a web page you can use the `curl` command.

It's extremly useful when it comes down to checking the response, trying to see if the connection works with a port, and see what kind of Headers and extra information the server gives back to us.

For example running: `curl -vk http://example.com/`{{execute}}

Will give us the `index.html` from the `example.com` webpage and additional headers. The `-vk` argument means that we want to recieve **verbose**(`-v`) information and the `-k` means that we want to ignore SSL certificate errors, in case the domain isn't running on HTTPS for example.


## Conclusion

We now have the basis on how to look up for IPs, opened ports, DNS records and overall network information.

In the next chapter we will go through ways to further debug an issue if for example a port is not opened, or an application is not running.

