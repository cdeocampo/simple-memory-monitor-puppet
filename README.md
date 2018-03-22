# Simple Memory Monitor with Puppet
## Instructions
1. Get installer: `wget https://raw.githubusercontent.com/cdeocampo/simple-memory-monitor-puppet/master/install.sh -O ~/install.sh && chmod u+x ~/install.sh`
2. Run `~/install.sh`
3. Update `/etc/puppet/hieradata/common.yaml` with the right values below:
    ```
    ---
    memory_monitor::critical_treshold: <0-100>
    memory_monitor::warning_treshold: <0-100>
    memory_monitor::email: <email>
    memory_monitor::relay_user: '<mailgun user>'
    memory_monitor::relay_path: '<mailgun api url>'
    ```
4. Apply puppet manifest: `cd /etc/puppet && puppet apply /etc/puppet/manifests/site.pp`