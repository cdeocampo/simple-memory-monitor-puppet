#!/bin/bash
DIR_NAME='simple-memory-monitor-puppet'

rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
yes | yum -y install puppet
hostname bpx.server.local
echo "bpx.server.local" >> /etc/resolv.conf
echo "127.0.0.1     bpx.server.local" >> /etc/hosts
sed -i -e 's/localhost.localdomain/bpx.server.local/' /etc/sysconfig/network
service network restart

# clone repo
yum -y install git
git clone https://github.com/cdeocampo/simple-memory-monitor-puppet.git ~/$DIR_NAME
cp -R ~/$DIR_NAME/manifests /etc/puppet/
cp -R ~/$DIR_NAME/modules /etc/puppet/
cp ~/$DIR_NAME/hiera.yaml /etc/puppet/
mkdir /etc/puppet/hieradata
touch /etc/puppet/hieradata/common.yaml

# setting timezone to PHT
cp /etc/localtime /root/old.timezone
rm -f /etc/localtime
ln -s /usr/share/zoneinfo/Asia/Manila /etc/localtime
