#!/bin/bash

# make sure we’re running with root permissions.
if [ `whoami` != root ]; then
    echo "Please run this script as root using sudo."
    exit
fi

main()
{
    echo "Set the version of geckodriver, you want to download (X.Y.Z):"
    read version
    # change the variable commented below if you want to avoid the question above
    #version="0.29.1"
    # if your OS is 32-bit change the link below to x86
    driver_url="https://github.com/mozilla/geckodriver/releases/download/v${version}/geckodriver-v${version}-linux64.tar.gz"
    driver="geckodriver-v${version}-linux64.tar.gz"

    # use $() to run a bash command with arguments in if statement
    if [ $(find /usr/bin/geckodriver) ]; then
        echo "Driver already installed ..."
        echo "Want to override[y/n]?"
        read user_choice
        # to refer to a variable already declared use '$'
        if [ $user_choice == "y" ]; then
            delete_gecko
            # to send arguments to a function, in this case variables
            geckodriver_download $driver_url $driver
        else
            echo "Exiting the script."
            exit
        fi
    else
        geckodriver_download $driver_url $driver
    fi
}

geckodriver_download()
{
    echo "Downloading the driver ..."

    wget -c --show-progress $1 #first argument passed in the function call

    echo "Extracting the driver ..."

    tar -xzf $2 #first argument passed in the function call

    echo "Deleting the tarball ..."

    rm $2

    echo "Finding the driver..."

    if [ $(find geckodriver) ]; then
        echo "Geckodriver found, moving to a folder in PATH..."
        chmod +rwx geckodriver
        cp geckodriver /usr/bin/
        echo "Geckodriver moved successfully to /usr/bin/ now is on PATH ..."
        echo "Deleting the extra files..."
        rm geckodriver
        echo "Done!"
    else
        echo "Error: geckodriver not in this directory."
        exit
    fi
}

delete_gecko()
{
    echo "Deleting the current geckodriver"
    rm /usr/bin/geckodriver
    echo "Done!"
}

main