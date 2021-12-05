#!/bin/bash
# Simple script for converting CentOS 8 to CentOS 8 Stream
# Created by Yevgeniy Goncharov, https://sys-adm.in

# Functions

# Help information
usage() {

    echo -e "" "\nParameters:\n"
    echo -e "-u - Update to CentOS 8 Stream"
    echo -e "-a - Install DNF Automate\n"
    exit 1

}

dnf_automatic() {
    dnf install dnf-automatic -y
    sed -i 's/random_sleep.*/random_sleep = 300/' /etc/dnf/automatic.conf
    sed -i 's/apply_updates.*/apply_updates = yes/' /etc/dnf/automatic.conf
    systemctl enable --now dnf-automatic.timer
    systemctl enable --now dnf-automatic-download.timer
}

update_centos() {
    if grep -i 'stream' /etc/redhat-release; then
    echo "CentOS Stream already configured"
    else
        echo STREAM NOT INSTALLED
        dnf update -y
        dnf install centos-release-stream -y
        dnf swap centos-{linux,stream}-repos -y
        dnf distro-sync -y
    fi
}

if [[ -z "$1" ]]; then
    usage;
fi

# Checks arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -u|--update) _UP=1; ;;
        -a|--auto) _AUTO=1; ;;
        -h|--help) usage ;; 
    esac
    shift
done

if [[ "$_UP" -eq "1" ]]; then
    update_centos
fi

if [[ "$_AUTO" -eq "1" ]]; then
    dnf_automatic
fi