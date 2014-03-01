if [ ! -d CloudBot/ ]; then
    echo "No CloudBot found - Nothing to clean!"
    exit 0
fi

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

if [ -d persist/ ]; then
    rm -rf persist_backup
    mv -f persist persist_backup
    echo "Made backup of old persist backup to persist_backup/!"
fi

if [ -d CloudBot/persist/ ]; then
    cp -Rf CloudBot/persist/ persist
    echo "Made backup of CloudBot/persist to persist/!"
else
    echo "No persisting data found."
fi

echo "Now removing CloudBot working copy..."
rm -rf CloudBot
echo "Removed old CloudBot working copy!"

echo "Done cleaning!"
