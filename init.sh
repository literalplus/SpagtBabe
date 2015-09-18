#!/bin/bash
echo "=======================Cleaning"

./clean.sh
if [ "$?" != "0" ]; then
    echo "Cleaning failed!"
fi

echo "========================Cloning"

if [ ! -d CloudBot/ ]; then
    git clone https://github.com/CloudBotIRC/CloudBot.git
fi
cd CloudBot/

git checkout master >/dev/null 2>&1
git fetch origin >/dev/null 2>&1
git reset --hard origin/master

echo "=======================Patching"

echo "Applying patches!"
git am --abort >/dev/null 2>&1
git am -3 ../patches/*.patch

if [ "$?" != "0" ]; then
    echo "========================Failing" #I R MAVEN!!1
    echo "PATCH FAILED"
    echo "==============================="
    
    cd ../
else
    echo "=====================Succeeding" #I R MAVEN!!1
    echo "PATCH SUCCESS"
    echo "==============================="
    
    cd ../
    
    if [ -f config ]; then
        echo "Found config.json! Copying."
        cp -f config.json CloudBot/config.json
    else
        echo "Config not found! Copying default config (please edit CloudBot/config)"
        echo "If you want your config there automagically, make a file named 'config' in the SpagtBabe root directory."
        cp -f CloudBot/config.json.default CloudBot/config.json
    fi
    
    if [ -d persist ]; then
        echo "Found previous persisting data! Copying!"
        cp -Rf persist CloudBot/persist
    fi
fi
echo "KTHXBYE"
