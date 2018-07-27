#!bin/bash
path=${3} #Original download path
downloadpath="/home/Fable/aria2/download" #your aria2 download path
rclone="/home/Fable/netdisk" #your rclone path
server=aws #which server you are use
logpath="/home/Fable/aria2/AutoUploadLOG" #which path you want to write log
drivename=od #Drive name set with rclone
#debug=off #(on/off) Turn on or turn off debug mod[To-Do]

if [ ${2} -eq 0 ] #if download file is zero, this shell could not run
then
	exit 1
fi
filename=${path##*/}
dirPath=${path%/*}
dp=${dirPath#"$downloadpath"}
mkdir -p ${rclone}${dp}
count=1
while(( ${count} < 3 ))
do
	rclone -v move ${path} ${drivename}:${server}${dp} >> ${logpath}/${filename}.log
    return_code=${?}
    if [ ${return_code} == 0 ]
    then
        echo `date` "File ${filename} upload succeeded" >> ${logpath}/success.log
        rm ${logpath}/${filename}.log
        exit 0
    
    elif [ -f "${path}" ]
    then
        echo `date` "File ${filename} upload failed，rclone return：${return_code}.Original file exists，ready to retry ${count}" >> ${logpath}/error.log
        count=`expr ${count} + 1`
        continue
        
    else
        echo `date` "File ${filename} upload failed, rclone return：${return_code}.Original file lost，upload termination" >> ${logpath}/error.log
        exit 1
    fi
done

echo `date` "File ${filename} upload failed, rclone return：${return_code}.Multiple uploads failed, upload terminated" >> error.log