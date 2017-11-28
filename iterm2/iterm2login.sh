#!/usr/bin/expect

set timeout 30

send_user "
<Mapbar>
<Server>
jishu@*.*.*.*          -f+ivvX7w2Q
root@192.168.0.162     BIq2q9A2Pv13LvEHTjOtDCRN
root@192.168.0.164     292rTr&^2Ts(r20110726eX)X164
<Mysql>
root@10.10.115.40      k3RRcjZWxrrGmq3E5ld9X9YxF
  mysql -h10.10.40.115 -uroot -pk3RRcjZWxrrGmq3E5ld9X9YxF

<Conoha>
root@133.130.113.226    ssd9fF#7BYnV
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
