# Geckodriver shell script downloader

### Objective:
- Download the **geckodriver**, unpack and move it to a folder in `PATH` in this case `/usr/bin/`.
- **Made to use with a linux OS, based on ubuntu file system** I didn't test it on another OS.

### How to use:
```
git clone https://github.com/italopinto/geckodriver_downloader.git
cd geckodriver_downloader
sudo bash geckodriver_downloader.sh
```

- Make sure to run the shell script with sudo.

- Once executed, the script will ask you the version you want to download put like this `x.x.x` like `0.29.1`.

- Feel free to change the script and contribute if you want.

- In the end the tarballs and every other extra file are deleted.

### The problem:
- I've been working with web automation using selenium. I use firefox for browser, so I need the `geckodriver` from mozilla to use selenium and automate everything within the browser.
- The problem is that we must go to the geckodriver repository in releases, them we have to choose the right file and make the download. After that we need to unpack the tarball (or zip, if you use windows). Unless you want to use the geckodriver typing the full path to the driver, you should move it to a folder in PATH. With it selenium will find the driver without the full path in code, isn't it awesome? 