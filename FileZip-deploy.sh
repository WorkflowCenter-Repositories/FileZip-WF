wf=$1
#!/bin/bash

#install wget
Wget=$(which wget)
#echo "${Dock}"
if [[ -z ${Wget} ]]; then
   echo "wget installation"
   sudo apt-get install -y wget
fi

#Docker & Cloudify installation
if [[ ! -f  tools-install.sh ]]; then
  wget https://github.com/WorkflowCenter-Repositories/ToolsInstallationScripts/raw/master/tools-install.sh
  chmod u+x tools-install.sh
fi

. ./tools-install.sh

sudo service docker start

echo "deploy the workflow"
if [[ ${wf} == 1 ]]; then
   if [[ -d ~/FileZip ]]; then
      echo "previous workflow execution exists and will be deleted"
      rm -rf ~/FileZip 
   fi
  cfy local init --install-plugins -p FileZip.yaml --input input.yaml
else
   if [[ -d ~/FileZip-1container  ]]; then
      echo "previous workflow execution exists and will be deleted"
      rm -rf ~/FileZip-1container
   fi
  cfy local init --install-plugins -p FileZip-1container.yaml -i input.yaml
fi

cfy local execute -w install


