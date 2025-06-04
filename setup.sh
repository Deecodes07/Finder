clear
read -p "Please enter your name:" name

#Installation of waybackurls
sudo apt install golang -y
go install github.com/tomnomnom/waybackurls@latest
cd
cd go
cd bin
sudo mv waybackurls /usr/bin
cd

#Installation Of Katana
go install github.com/projectdiscovery/katana/cmd/katana@latest
cd 
cd go
cd bin
sudo mv katana /usr/bin
cd

clear

#Installation of figlet
sudo apt install figlet -y

clear

#installation of gobuster
sudo apt install gobuster -y

clear

#installation of dirb
sudo apt install dirb -y

clear

#installation of cowsay
sudo apt install cowsay -y

clear

figlet $name Done .!..
