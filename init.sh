#!/bin/bash
echo "=======================Cleaning"
git submodule deinit --force . >/dev/null
rm -rf CloudBot >/dev/null
echo "========================Cloning"
git submodule add -b develop --force https://github.com/ClouDev/CloudBot.git
git submodule update --init --remote
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
fi

cd ../
echo "Bye!"