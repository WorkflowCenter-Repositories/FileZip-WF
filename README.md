# FileZip Workflow

![myimage-alt-tag](https://github.com/WorkflowCenter-Repositories/FileZip-WF/raw/master/Filezip.jpg)
  
FileZip is a simple workflow for zipping a file with password
  
  WF-Title: FileZip    
  version: 1.0    
  Description: a simple workflow for zipping file.  
  
###WF-Tasks:  
  
  No-of-tasks: 3  
  Tasks: {importfile: 1, filezip: 1, ExportFiles: 1}  
  Dependency-Libs: {java1.7: all}   

###Blueprint:

  blueprint-name: FileZip.yaml  
  Docker-images: dtdwd/filezip1  
  sizes: 251 MB (Virtual size 575 MB)  
  OS-types: ubuntu14.4  
  tools: Java1.7  
  
###Input:  
  
  input-file:  file.jpg    
  description: input file
  types: jpeg image

###Outputs:

  output-folder: '~/blueprint-name'  
  output-file(s): {zipfile.zip}  
  description:  a zipped jpg file
  types: {zip file}  

###Execution-Environment:  
  
  Cloudify-version: 3.2  
  Docker-version: 1.8+  
  OS-type: ubuntu14.04  
  Disk-space: 10 GB  
  RAM: 3 GB  
  
#Deployment Instruction  
This repository includes all files and scripts to deploy FileZip workflow on Multiple Docker containers as follow:  
  
1- Clone the repository to your machine, open a terminal window and change to workflow repository.  
2- To execute the workflow with multi containers and the attached input sample, in the terminal run:   
   . ./FileZip-deploy.sh 1    
3- If you have own input files, copy your files Dir to FileZip/Input-sample folder, open Input.yaml file and change input Dir name, then  
   run: . ./FileZip-deploy.sh 1  
  
4- To execute the workflow with single container, follow either step 2 or 3 but run:    
   . ./FileZip-deploy 2  
  
After successfully running the workflow, the output file can be found in ~/blueprint-name folder
