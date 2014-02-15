#!/bin/bash
echo "=======================Cleaning"
./clean.sh
echo "========================Cloning"
git submodule add https://github.com/ClouDev/CloudBot.git
git submodule update --init --rebase CloudBOt
cd CloudBot
echo "=======================Patching"
echo "Applying patches!"
git am -3 ../patches/*.patch
if [ "$?" != "0" ]; then
    echo "========================Failing" #I R MAVEN!!1
    echo "PATCH FAILED"
    echo "==============================="
else
    echo "=====================Succeeding" #I R MAVEN!!1
    echo "PATCH SUCCESS"
    echo "==============================="
    
    if [ -f ../config ]; then
        echo "Found config! Copying."
        cp ../config config
    else
        echo "Config not found! Copying default config (please edit CloudBot/config)"
        echo "If you want your config there automagically, make a file with name config in the main directory."
        cp config.default config
    fi
    
    if [ -d ../data ]; then
        echo "Found previous data! Copying!"
        cp -r ../data plugins/data
    fi
fi

cd ../
echo "Bye!"