CHROME_FILE=google-chrome-stable_current_x86_64.rpm

wget https://dl.google.com/linux/direct/$CHROME_FILE

sudo dnf install -y ./$CHROME_FILE

sudo rm $CHROME_FILE
