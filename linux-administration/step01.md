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


## Checking if a remote port is working

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

