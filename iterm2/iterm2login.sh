#!/usr/bin/expect

set timeout 30

send_user "
<Mapbar>
mapbar-jishu@*.*.*.*          -f+ivvX7w2Q
mapbar-root@192.168.0.162     BIq2q9A2Pv13LvEHTjOtDCRN
mapbar-root@192.168.0.164     292rTr&^2Ts(r20110726eX)X164

<Conoha>
conoha-root@133.130.113.226    ssd9fF#7BYnV
"
send_user "\n"

set port [lindex $argv 0]
set user [lindex $argv 1]
set ip [lindex $argv 2]
#set password [lindex $argv 3]
spawn ssh -p $port $user@$ip
expect {
        "(yes/no)?"
        {send "yes\n";exp_continue}
        "password:"
        # {
          # send $password
          # send "\n"
        # }
}
interact
