#!/bin/bash

# You can schedule this to run however often you would like.

echo '._____________________________________________________________________________________________';
echo '(.............................................................................................)';
echo '.)...........................................................................................(';
echo '(.............................................................................................)';
echo '.)...........................................................................................(';
echo '(.........._____..______._____..__..__._____.._____._____._____.____.._..._.._____............)';
echo '.)........|..__.\|..____|..__.\|..\/..|_..._|/.____/.____|_..._/.__.\|.\.|.|/.____|..........(';
echo '(.........|.|__).|.|__..|.|__).|.\../.|.|.|.|.(___|.(___...|.||.|..|.|..\|.|.(___.............)';
echo '.)........|..___/|..__|.|.._../|.|\/|.|.|.|..\___.\\___.\..|.||.|..|.|...`.|\___.\...........(';
echo '(.........|.|....|.|____|.|.\.\|.|..|.|_|.|_.____).|___).|_|.||.|__|.|.|\..|____).|...........)';
echo '.)........|_|....|______|_|..\_\_|..|_|_____|_____/_____/|_____\____/|_|.\_|_____/...........(';
echo '(.............................................................................................)';
echo '.)...........................................................................................(';
echo '(.............................................................................................)';
echo '.)...........................................................................................(';
echo '(_____________________________________________________________________________________________)';




# check if array is started
ls /mnt/disk[1-9]* 1>/dev/null 2>/dev/null
if [ $? -ne 0 ]
then
   echo "ERROR: Array must be started before using this script"
   exit
fi

# Array of directories
directories=('/mnt/user/plex/data' '/mnt/user/plex/transcode' '/mnt/user/appdata/plex/Library/Application Support/Plex Media Server/Codecs')
# add as many share directories you want. Just put them inside 'quotes' and seperate with a space.

# Function to check and set permissions
check_and_set_permissions() {
    local directory=$1
    local permissions=$(stat -c "%a" "$directory")
    
    if [ "$permissions" != "775" ]; then
        echo "Updating permissions for $directory"
        chmod -R 775 "$directory"
        echo -e "\nDone.\n"
    else
        echo -e "Permissions for $directory are already set to 775\n"
    fi
}

# Set each directory's permissions to 775
for directory in "${directories[@]}"
do
    check_and_set_permissions "$directory"
    sleep 1
done

echo -e "Done.\n"
