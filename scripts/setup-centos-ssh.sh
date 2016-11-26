#!/bin/bash
# http://unix.stackexchange.com/questions/59003/why-ssh-copy-id-prompts-for-the-local-user-password-three-times
# http://linuxcommando.blogspot.com/2008/10/how-to-disable-ssh-host-key-checking.html
# http://linuxcommando.blogspot.ca/2013/10/allow-root-ssh-login-with-public-key.html
# http://stackoverflow.com/questions/12118308/command-line-to-execute-ssh-with-password-authentication
# http://www.cyberciti.biz/faq/noninteractive-shell-script-ssh-password-provider/
source "/vagrant/scripts/common.sh"
TOTAL_NODES=2

while getopts s:t: option
do
	case "${option}"
	in
		t) TOTAL_NODES=${OPTARG};;
	esac
done
#echo "total nodes = $TOTAL_NODES"



function setupSSHKey {
	echo "setting up ssh key"
	#ssh-keygen -t rsa -P "" -f ~/.ssh/id_rsa
	mkdir ~/.ssh
	chmod 700 ~/.ssh
	cat /vagrant/resources/ssh/id_rsa.pub > ~/.ssh/authorized_keys
	chmod 600 ~/.ssh/authorized_keys
	cp -f $RES_SSH_CONFIG ~/.ssh
	cp -f /vagrant/resources/ssh/id_rsa ~/.ssh
	cp -f /vagrant/resources/ssh/id_rsa.pub ~/.ssh
}


echo "setup ssh"
#installSSHPass
setupSSHKey
#overwriteSSHCopyId
#sshCopyId
