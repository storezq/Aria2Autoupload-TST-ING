# Aria2Autoupload-TST-ING
Auto upload your download file form Aria2.  
This project use aria2 and rclone.  
Written in shell  
***  
**NOTICE: IS A TESTING PROJECT**  
**Do not use in a production environment**  
***  
### Usage  
Configure your rclone and change the path in the shell as needed  
add this config to your aria2.conf  
```
on-download-complete=/yourpath/autoupload.sh
```  
Or run with
```
aria2c --on-download-complete=/yourpath/autoupload.sh
```
### Todo-list  
- Online unpack  
- ~~Write log~~  
- ~~Abnormal capture~~  
- Looking for some other uploading tools
- Debug mode

### Known issue  
If RAM of your VPS or PC are too low, that maybe make OOM problem