myip=$(ip a | grep inet | grep brd | cut -d' ' -f6 | cut -d'/' -f1)
address=maneamarius@gmail.com

if netstat -tulpn  | grep httpd | grep 80; then
    if netstat -tulpn  | grep httpd | grep 443; then
        exit 0
    else
        echo "Server status FAILED for $myip, port 443" | mailx -r admin@aws.com -s "Server status FAILED for $myip" $address
    fi
else
    echo "Server status FAILED for $myip, port 80" | mailx -r admin@aws.com -s "Server status FAILED for $myip" $address
fi
