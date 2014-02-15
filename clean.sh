echo "Cleaning..."
if [ -d CloudBot/plugins/data ]; then
    cp -r CloudBot/plugins/data data
fi
rm -rf CloudBot
echo "Done cleaning!"
