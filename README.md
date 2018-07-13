# dotfiles `~/.`
This repository stores some config and setup files. I'm currently writing this on Debian GNU/Linux, but I hope to make something reasonably compatible with OS X in the future.

## Getting Started
This is still a work-in-progress; if you have `git`, you can clone this repository and run the `setup.sh` script:

```sh
git clone https://github.com/air-wreck/dotfiles.git
cd dotfiles
./setup.sh
```

The script assumes you have at least a minimal system up and running. (Fun story: I once installed Debian without an Internet connection, and even `sudo` ended up not being installed. It was frustrating.)

Perhaps I may decide to host a file on my website that you can simply `curl` and run to install `git` and run the installation; e.g. (hypothetically):

```sh
curl air-wreck.gitlab.io/files/dot.sh > dot.sh
chmod +x dot.sh
./dot.sh
```
