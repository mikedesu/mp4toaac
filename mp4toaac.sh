#!/bin/bash

if command -v mkvmerge >/dev/null 2>&1 ; then 
    #echo "mkvmerge found"
    if command -v mkvextract >/dev/null 2>&1 ; then 
        #echo "mkvextract found"
        if [ $# -eq 0 ] ; then
            echo "Usage: ./mp4toaac.sh input_file_path output_file_basename"
        else 
            mkvmerge $1 -o $2.mkv
            mkvextract tracks $2.mkv 1:$2.aac
            echo "cleaning up..."
            rm $2.mkv 
        fi
    else 
        echo "mkvextract not found"
    fi
else 
    echo "mkvmerge not found"
fi

