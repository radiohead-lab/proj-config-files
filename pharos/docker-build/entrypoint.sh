#!/bin/bash

if [[ ! -d /app/config/conf ]]; then
    mv /opt/tplink/PharosControl/conf /app/config
else
    rm -rf /opt/tplink/PharosControl/conf
fi
if [[ ! -d /app/config/db ]]; then
    mv /opt/tplink/PharosControl/db /app/config
else
    rm -rf /opt/tplink/PharosControl/db
fi

ln -s /app/config/conf /opt/tplink/PharosControl/conf
ln -s /app/config/db /opt/tplink/PharosControl/db

pharosctl theme rag
chown -R pharoscontrol:pharoscontrol /opt/tplink/PharosControl/conf
chown -R pharoscontrol:pharoscontrol /opt/tplink/PharosControl/db
exec gosu pharoscontrol "${@}"