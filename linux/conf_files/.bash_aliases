# 	----------==========  ALIAS ==========----------

# Leptop System Information
alias leptop='sudo dmidecode | grep -A 9 "System Information"'
alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT0'

# ping
alias ping='ping -c 5'
alias fastping='ping -c 100 -s.2'

# port list
alias ports='netstat -tulanp'

# maunt
alias mount='mount |column -t'

# echo oll path list
alias path='echo -e ${PATH//:/\\n}'

# ... 
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'

# Hard memory information list
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

# --- Servers ---
alias up_vps=''
alias down_vps=''

# --- hosts --- 
# alias devserver='ssh mrleon@45.94.158.112'
alias fone='ssh @192.168.0.100'
alias raspberry='ssh leon@192.168.1.6'

# --- IPTABLES ---
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias firewall=iptlist

# --- Python --- 
alias py='python3'
alias py9='python3.9'

# --- KN ---
alias orca_back_start="sudo docker-compose -f docker-compose_local.yml up backend"
alias orca_front_start="sudo docker-compose -f docker-compose_local.yml up frontend"

alias orca="cd ~/Documents/Kuehne_Nagel/ORCA/orca2"
alias orca_back="cd ~/Documents/Kuehne_Nagel/ORCA/orca2/back"
alias  orca_front="cd ~/Documents/Kuehne_Nagel/ORCA/orca2/front/orca/src/app"

alias knparser="cd ~/Documents/Kuehne_Nagel/knparser"

# --------------------------------- Mr.Leon -----------------------------------|
