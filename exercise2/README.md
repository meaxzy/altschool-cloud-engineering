<h2>1. Write a shell script that checks the disk usage in a given directory.</h2>

The script can take two optional arguments and one compulsory argument...
-d: which means that all files and directory within the specified directory or directories should be listed.
-n: which means that the top N enteries should be returned.
list of directories: this will be the directories you want to check it's disk usage

eg yourscript.sh -n 5 /var

<h4>should return the top 5 directories disk usage in /var directory</h4>
yourscript.sh -d /var

<h4>should list both directories and files</h4>

<h4>Note: if -n argument is not given, it should return 8 enteries by default.</h4>

<h2>2. Create a backup script. This script creates a backup of a given directory and saves it in another directory with a timestamp. It takes two arguments:</h2>

The source directory and the destination directory
<h4>Note: The backup should be a tar archive</h4>

