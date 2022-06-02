CHROME_FILE=google-chrome-stable_current_amd64.deb

wget https://dl.google.com/linux/direct/$CHROME_FILE

sudo apt install -y ./$CHROME_FILE

sudo rm $CHROME_FILE
