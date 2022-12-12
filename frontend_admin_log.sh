#!/bin/bash

/usr/local/bin/aws logs tail frontend-admin-error_log --since 5m > admin_cw.txt

if [ -s admin_cw.txt ]; then

        curl -F file=@admin_cw.txt -F "initial_comment=Please Check, Something wrong happened in frontend-admin service" -F channels=C03NPMT1C20 -H "Authorization: Bearer xoxb-1209496133302-3893449021877-y0736rwaWxcyrdpuRWk3QT9a" https://slack.com/api/files.upload
        # The file is not-empty.
        #log="$(grep -m 5 [error] cw.txt)"
        #echo "${log}"
        #curl -X POST -H 'Content-type: application/json' --data "{'errror detected '"$log"' i hope it might be helpful'}" https://hooks.slack.com/services/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
else
        # The file is empty.
        echo " "
fi
