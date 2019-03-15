#!/bin/bash

#   --------------------------------
#
#   Author: Mo ELa (Aka: ShifraSec)
#  
#   --------------------------------


Path= #write the path where the Ghidra file is located (leave empty if it's in the root)
Ver=ghidra_9.0 #the Ghidra ver (open the Ghidra folder -> you will find only one folder copy that folder name here)

Red=`tput setaf 1`
Green=`tput setaf 2`
Bold=`tput bold`
NC=`tput sgr0` # No Color


echo " "
echo "#################################################################################"
echo -e "${Bold}${Green}-----------------------------${NC}Downloading ${Bold}${Red}Ghidra${NC}${Bold}${Green}-----------------------------${NC}"
echo "#################################################################################"
curl https://www.ghidra-sre.org/ghidra_9.0_PUBLIC_20190228.zip --output Ghidra.zip


echo "${Bold}${Green}----------------------${NC}getting ready for a ${Bold}${Green}fresh${NC} install${Bold}${Green}---------------------${NC}"
rm -r Ghidra

echo "#################################################################################"
echo "${Bold}${Green}---------------------------${NC}Installing ${Bold}${Red}Ghidra${NC}${Bold}${Green}----------------------------------------${NC}"
echo "#################################################################################"
mkdir Ghidra && unzip Ghidra.zip 2>/dev/null && mv ghidra_9.0/ Ghidra/


echo "#################################################################################"
echo "${Bold}${Green}-----------------------------${NC}Cleaning(Removing .Zip file)${Bold}${Green}--------------------------------${NC}"                                                                                          
echo "#################################################################################"
rm -r Ghidra.zip


echo "#################################################################################"
echo "${Bold}${Green}-------------------------------${NC}Chechking for JDK11${Bold}${Green}----------------------------------${NC}"
echo "#################################################################################"
sudo apt install openjdk-11-jdk

echo "${Bold}${Green}----------------${NC}Your Java Version${Bold}${Green}----------------${NC}"
java -version


echo "#################################################################################"
echo "${Bold}${Green}-----------------------------${NC}Modifying .bashrc(adding alias)${Bold}${Green}--------------------------------${NC}"
echo "#################################################################################"
cd
echo "#An Alias just to run the Ghidra tool" >> .bashrc
echo "alias gTool='sh /Ghidra/$Ver/ghidraRun .'" >> .bashrc
echo "" >> .bashrc
echo "#Always take me to root then Execute gTool so I can run the tool from Anywhere" >> .bashrc
echo "alias ghidra='cd /root && gTool'" >> .bashrc
source .bashrc

echo " "
echo "[${Bold}${Green}*${NC}]You can now type: ${Bold}${Red}ghidra${NC} in terminal to lunch the tool...(open new terminal tab)"
