cd
echo "downloading files"
git clone --depth 1 -b master https://github.com/kartikeytewari/build_latex

echo "downloading dependencies"
sudo apt install texlive-base
sudo apt install apt-file 
sudo apt-file update

echo "configuring ~/.bashrc file"
echo "" >> ~/.bashrc
echo "#configuration for build_latex CLI-tool" >> ~/.bashrc
echo "source ~/build_latex/main.sh" >> ~/.bashrc

echo "For more information visit: www.kartikeytewari.github.io/build_latex"
cd -
