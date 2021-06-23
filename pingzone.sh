#!/bin/bash
rm -rf chk_fail.txt
n=1
while true
do
read -p "输入需要解析的域名：" zone
echo "$zone" >> zone.txt
  if [ "$zone" != "?" ]
  then
     echo "继续输入域名"
     continue
  else
     echo "域名输入错误"
     break
  fi
done
cat zone.txt|grep com > domains.txt
for domain in `cat domains.txt`
do
    ip=`ping ${domain} -c 1|sed '1{s/[^(]*(//;s/).*//;q}'`
    echo -e $n "\t" $domain "\t" $ip
    if [ "$ip" != "0.0.0.0" ]
    then
        echo -e $domain"\t"$ip >> chk_fail.txt
    fi
    n=$(($n+1))
done
rm -rf zone.txt 
