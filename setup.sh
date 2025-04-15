clear
read -p "Please enter your name:" name

#Installation of waybackurls

sudo apt install golang -y &> /dev/null
echo "[+] Installing Go lang"
go install github.com/tomnomnom/waybackurls@latest &> /dev/null
cd
cd go
cd bin
sudo mv waybackurls /usr/bin
cd

#Installation of figlet
echo "[+] Installing figlet"
sudo apt install figlet -y &> /dev/null

#installation of gobuster
echo "[+] Installing gobuster"
sudo apt install gobuster &> /dev/null

#installation of cowsay
echo "[+] Installing cowsay"
sudo apt install cowsay -y &> /dev/null

echo "[+] Installation is Completed"
echo

figlet $name Done .!..
