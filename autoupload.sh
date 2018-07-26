#!bin/bash
path=${3} #Original download path
downloadpath="/home/Fable/aria2/download" #your aria2 download path
rclone="/home/Fable/netdisk" #your rclone path
server=aws #which server you are use

if [ ${2} -eq 0 ] #if download file is zero, this shell could not run
then
	exit 1
fi
filename=${path##*/}
dirPath=${path%/*}
dp=${dirPath#"$downloadpath"}
mkdir -p ${rclone}${dp}
rclone move ${path} od:${server}$dp
echo ´date´ "File${filename}upload success"