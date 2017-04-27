#!/bin/bash
cd ~/Google\ Drive/Worship\ Guide/Worship\ Guide\ PDFs/
cd $(head -n 1 <(ls -t))
cd "$(head -n 1 <(ls -t))"
filename=$(head -n 1 <(ls -t *.pdf))
cp "$filename" worshipguide.pdf
pwd
echo $filename
echo Uploading the ServerUp page...
# Start of "here" document
ftp <<**
open media.ironworkschurch.org
cd media.ironworkschurch.org/pdf
bin
put worshipguide.pdf
bye
**
# End of "here" document
echo FTP ended - your web site is now marked as UP.
rm worshipguide.pdf