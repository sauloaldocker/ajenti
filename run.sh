docker stop ajenti; docker rm ajenti

SRC=$HOME/data/docker
SRC_DATA=$SRC/ajenti

docker run -d --name ajenti -p 127.0.1.1:8001:8000 -v $SRC_DATA:/etc/ajenti crosbymichael/ajenti

#docker.io run -it --rm --name ajentit -v $PWD/data:/etc/ajenti crosbymichael/ajenti

#docker.io run -d --name ajenti -p 127.0.1.1:8000:8000 crosbymichael/ajenti

#http://stackoverflow.com/questions/18580637/iptables-redirect-from-external-interface-to-loopbacks-port
#/etc/rinetd.conf
#127.0.1.1        8000            127.0.0.1       8000
#/etc/init.d/rinetd restart

#docker.io run -d --name ajenti -p 0.0.0.0:8000:8000 crosbymichael/ajenti
#iptables -t nat -I PREROUTING --src 0/0 --dst 127.0.0.1 -p tcp --dport 80 -j REDIRECT --to-ports 8080
#sysctl -w net.ipv4.conf.eth0.route_localnet=1
#iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 8001 -j DNAT --to-destination 172.17.0.8:8001
#iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 8001 -j DNAT --to-destination 127.0.0.1:8001
#iptables -t nat -A PREROUTING -p tcp --dport 8001 -j REDIRECT --to 127.0.0.1:8001
