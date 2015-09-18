if [ -d patches ]; then
    echo "Making backup of patches to patches_bkp"
    rm -r patches_bkp >/dev/null 2>&1
    mv patches patches_bkp
fi
rm -r patches >/dev/null 2>&1
cd CloudBot
git format-patch -o ../patches origin/master
cd ..
