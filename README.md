# CentOS 8 to Stream script Converter

This is a simple script for converting CentOS 8 to CentOS 8 Stream.

You can run script with two parameters:

* `-u` - Update. Scrupt automatically will check current distro as Stream or not, if not will upgrade.
* `-a` - Automatic DNF. Install automatic dnf functionality for automatic apply updates to current distro.

## Usage

```
./upgrade.sh -u -a
```

## CentOS 8 EOL

CentOS Linux 8 will reach End Of Life (EOL) on December 31st, 2021:
* https://www.centos.org/centos-linux-eol/

If short from official article:
`In line with the EOL of previous releases, we will NOT be automatically migrating anyone to the next version (which is CentOS Stream 8 in this case).`

