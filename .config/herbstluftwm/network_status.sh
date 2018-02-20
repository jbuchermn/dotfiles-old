pingtime=$(ping -c 4 www.stackoverflow.com 2>&1 | tail -1 | awk '{print $4}' | cut -d '/' -f 2)
network=""
connected=0

if [ $(awk -v a="$pingtime" 'BEGIN{ print((a==a+0)); }') == "1" ]; then
    connected=1
    pingtime=$(printf "%.0fms" $pingtime)

    wpa_status=$(wpa_cli status)
    while IFS='' read -r line || [[ -n "$line" ]]; do
        line=(${line//=/ })
        if [ "${line[0]}" == "ssid" ]; then
            network="${line[@]:1}"
        fi
    done <<< "$wpa_status"
fi

if [ "$connected" == "1" ]; then
    echo "$network - $pingtime" > /tmp/network_status
else
    echo "Not connected" > /tmp/network_status
fi

