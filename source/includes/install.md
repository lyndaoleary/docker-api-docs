# Installation Guides

## Debian

Debian 8 comes with a 3.16.0 Linux kernel, the `docker.io` package can be found in the `jessie-backports` repository. View reasoning behind this [here](https://lists.debian.org/debian-release/2015/03/msg00685.html). View instructions on how to enable the backports repository [here](http://backports.debian.org/Instructions/).

* Make sure you enabled the `jessie-backports` repository, as stated above.

* Ensure apt sources are up-to-date: `$ sudo apt-get update`

* Install the `docker.io` package: `$ sudo apt-get install docker.io`

* Verify that everything has worked as expected: `$ sudo docker run --rm hello-world`

This command downloads and runs the `hello-world` image in a container. When the
container runs, it prints an informational message. Then, it exits.

If you need to add an HTTP Proxy, set a different directory or partition for the
Docker runtime files, or make other customizations, read our Systemd article to
learn how to [customize your Systemd Docker daemon options](/articles/systemd/).

<aside class="warning">
Debian contains a much older KDE3/GNOME2 package called ``docker``, so the package and the executable are called ``docker.io``.
</aside>

<aside class="notice">
If you want to enable memory and swap accounting see <a href="/installation/ubuntulinux/#adjust-memory-and-swap-accounting">this</a>.
</aside>

