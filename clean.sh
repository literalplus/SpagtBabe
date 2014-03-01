echo "This is going to remove your current CloudBot working copy! (But backup the plugins/data/ folder)"
# Taken from http://stackoverflow.com/a/1885534/1117552
read -p "Are you sure that you want to update CloudBot with your SpagtBabe patches? " -n 1 -r
echo    # move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "Your data is safe!"
    exit 1
fi
#end

echo "Cleaning..."

if [ -d data/ ]; then
    mv -f data/ data_backup
    echo "Made backup of old data backup to data_backup/!"
fi

if [ -d CloudBot/plugins/data/ ]; then
    cp -Rf CloudBot/plugins/data/ data
    echo "Made backup of CloudBot/plugins/data/ to data/!"
else
    echo "Ummm... You do have plugin data, right? Did not find it."
fi

echo "Now removing CloudBot working copy..."
rm -rf CloudBot
echo "Removed old CloudBot working copy!"

echo "Done cleaning!"
