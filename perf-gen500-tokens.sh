#¡/bin/sh


get_id () {
    echo `"$@" | awk '/ id / { print $4 }'`
}

unset OS_SERVICE_TOKEN OS_SERVICE_ENDPOINT
export OS_AUTH_URL=http://localhost:5000/v2.0
export OS_TENANT_NAME=admin
export OS_PASSWORD=admin
echo -n > /tmp/tokens_list.txt
for i in $(seq 500); do
    export OS_USERNAME=admin
    get_id keystone token-get >> /tmp/tokens_list.txt
    if [ "$?" != 0 ]; then
        echo "Token get failed"
        break
    fi
done

