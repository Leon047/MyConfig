# ------------------<==========  ALIAS ===========>-----------------------

# leptop
alias leptop='sudo dmidecode | grep -A 9 "System Information"'

# ping
alias ping='ping -c 5'
alias fastping='ping -c 100 -s.2'

# port
alias ports='netstat -tulanp'

# maunt
alias mount='mount |column -t'

# echo oll path
alias path='echo -e ${PATH//:/\\n}'

# 
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'

# Memory
alias meminfo='free -m -l -t'

# Show processes consuming the most memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

# Show processes using processor
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

# View video card memory
# lscpu
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

# browsers
alias ff='/opt/firefox4/firefox'
alias chrome='/opt/google/chrome/chrome'
alias opera='/opt/opera/opera'

# show display information
alias df='df -H'
alias du='du -ch'

# restart nfs
alias nfsrestart='sync && sleep 2 && /etc/init.d/httpd stop && umount netapp2:/exports/http && sleep 2 && mount -o rw,sync,rsize=32768,wsize=32768,intr,hard,proto=tcp,fsc natapp2:/exports /http/var/www/html && /etc/init.d/httpd start'

# Caching server state
alias mcdstats='/usr/bin/memcached-tool 10.10.27.11:11211 stats'
alias mcdshow='/usr/bin/memcached-tool 10.10.27.11:11211 display'

# Sistem backup 
alias backup='sudo /home/scripts/admin/scripts/backup/wrapper.backup.sh --type local --taget /raid1/backups'

# Server management
# alias nginxreload='sudo /usr/local/nginx/sbin/nginx -s reload'
# alias nginxtest='sudo /usr/local/nginx/sbin/nginx -t'
# alias lightyload='sudo /etc/init.d/lighttpd reload'
# alias lightytest='sudo /usr/sbin/lighttpd -f /etc/lighttpd/lighttpd.conf -t'
# alias httpdreload='sudo /usr/sbin/apachectl -k graceful'
# alias httpdtest='sudo /usr/sbin/apachectl -t && /usr/sbin/apachectl -t -D DUMP_VHOSTS'

# System administration
# eth1
# alias dnstop='dnstop -l 5 eth1'
# alias vnstat='vnstat -i eth1'
# alias iftop='iftop -i eth1'
# alias tcpdump='tcpdump -i eth1'
# alias ethtool='ethtool eth1'
# wlan0
# alias iwconfig='iwconfig wlan0'

# -----===== Servers =====-----
# alias wakeupnas01='/usr/bin/wakeonlan 00:11:32:11:15:FC'
# alias wakeupnas02='/usr/bin/wakeonlan 00:11:32:11:15:FD'
# alias wakeupnas03='/usr/bin/wakeonlan 00:11:32:11:15:FE'

# -----===== IPTABLES =====-----
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias firewall=iptlist

# -----===== Python3 =====----- 
alias py3='python3'

# 
alias myserver='ssh mrleon@45.94.158.112'
# alias galaqsy='ssh @192.168.0.100'

# -----===== KN =====-----
alias orca_back="sudo docker-compose -f docker-compose_local.yml up backend"
alias orca_front="sudo docker-compose -f docker-compose_local.yml up frontend"
