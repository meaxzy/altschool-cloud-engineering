### Preamble

1.  Creation of *altschool* login user: sudo useradd -m Altschool
2.  Set the password for *altschool* user:  `sudo passwd altschool` (_follow the password creation prompt_).
3.  Login to *altschool* user account with altschool environment variables and home dir: `su -  altschool`
4.  Create the requested directories (_code, tests, personal and misc_): `mkdir code tests personal misc`

  



### Assignment Solutions:

| Question | Todo Description | Solution |
|--------|------------------|----------|
| a      | Change directory to the tests directory using absolute pathname                 | `cd /home/altschool/tests`     |
| b      | Change directory to the tests directory using relative pathname                  | `cd tests`         |
| c      | Use echo command to create a file named fileA with text content ‘Hello A’ in the misc directory                  | `echo "Hello A" > /home/altschool/misc/fileA`          |
| d      | Create an empty file named fileB in the misc directory                  | `touch /home/altschool/misc/fileB`         |
| e      | Copy contents of fileA into fileC                  | `cp /home/altschool/misc/fileA /home/altschool/misc/fileC`         |
| f      |  Move contents of fileB into fileD                | `mv /home/altschool/misc/fileB /home/altschool/misc/fileD`          |
| g      | Create a tar archive called misc.tar for the contents of misc directory                  | `tar -cvf misc.tar misc`          |
| h      | Compress the tar archive to create a misc.tar.gz file  | `gzip misc.tar`         |
| I      | Create a user and force the user to change his/her password upon login                 |i. create new user: _Ademide_ `sudo useradd Ademide` <br> ii. force **Ademide** password change on login: `sudo passwd -e Ademide
| J      | Lock a users password | `sudo passwd -l Ademide`         |
| K      | Create a user with no login shell                 |  `sudo useradd -s /usr/sbin/nologin Neriah`        |
| L      | Disable password based authentication for ssh                  | Use `sudo vim /etc/ssh/sshd_config` and set `PasswordAuthentication no`       | 
| M      | Disable root login     | Use `sudo vim /etc/ssh/sshd_config` and set `PermitRootLogin no`          |
