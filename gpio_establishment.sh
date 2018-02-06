gpio -h > /dev/null 2>&1

if [ $? -eq 127 ]; then
    echo " Wiring pi has not been installed. To start install Wiring pi. "
    
    git -h > /dev/null 2>&1
    if [ $? -eq 127 ]; then
        sudo apt-get install git-core
    fi

    cd ~
    git clone git://git.drogon.net/wiringPi
    cd ~/wiringPi
    git pull origin

    cd ~/wiringPi
    ./build

    gpio -h > /dev/null 2>&1
    if [ $? -eq 127 ]; then
        echo " Error has occued. You should self install "Wiring Pi". "
        echo " Please ref this URL http://wiringpi.com/download-and-install/"
    
    else
        echo " Wiring Pi collectly insralled. "
        gpio readall
    fi

else
    echo " Wiring pi already installed. "
    gpio readall
fi



