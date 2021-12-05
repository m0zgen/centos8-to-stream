# CentOS 8 to Stream script

This is a simple script for converting CentOS 8 to CentOS 8 Stream.

You can run script with two parameters:

* `-u` - Update. Scrupt automatically will check current distro as Stream or not, if not will upgrade.
* `-a` - Automatic DNF. Install automatic dnf functionality for automatic apply updates to current distro.

## Usage

```
./upgrade.sh -u -a
```