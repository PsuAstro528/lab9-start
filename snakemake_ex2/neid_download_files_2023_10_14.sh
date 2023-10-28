#!/bin/sh

#   If /bin/sh isn't available on your system, update the script to use bash instead:
#   #!/usr/bin/env bash

#read -p "Username: " user
#read -s -p "Password : " pass

wget --save-cookies neid_cookie.txt \
      --keep-session-cookies \
      --delete-after \
      https://neid.ipac.caltech.edu/login.php

#      --post-data "username=${user}&password=${pass}" \

wget --load-cookies neid_cookie.txt -nc -O neidL2_20231014T222232.fits "https://neid.ipac.caltech.edu/get_file.php?filehand=sci/2023/10/14/l2/pv2/neidL2_20231014T222232.fits&solar" || true
wget --load-cookies neid_cookie.txt -nc -O neidL2_20231014T215336.fits "https://neid.ipac.caltech.edu/get_file.php?filehand=sci/2023/10/14/l2/pv2/neidL2_20231014T215336.fits&solar" || true
wget --load-cookies neid_cookie.txt -nc -O neidL2_20231014T170939.fits "https://neid.ipac.caltech.edu/get_file.php?filehand=sci/2023/10/14/l2/pv2/neidL2_20231014T170939.fits&solar" || true
wget --load-cookies neid_cookie.txt -nc -O neidL2_20231014T184852.fits "https://neid.ipac.caltech.edu/get_file.php?filehand=sci/2023/10/14/l2/pv2/neidL2_20231014T184852.fits&solar" || true
wget --load-cookies neid_cookie.txt -nc -O neidL2_20231014T165021.fits "https://neid.ipac.caltech.edu/get_file.php?filehand=sci/2023/10/14/l2/pv2/neidL2_20231014T165021.fits&solar" || true
wget --load-cookies neid_cookie.txt -nc -O neidL2_20231014T160738.fits "https://neid.ipac.caltech.edu/get_file.php?filehand=sci/2023/10/14/l2/pv2/neidL2_20231014T160738.fits&solar" || true
wget --load-cookies neid_cookie.txt -nc -O neidL2_20231014T194649.fits "https://neid.ipac.caltech.edu/get_file.php?filehand=sci/2023/10/14/l2/pv2/neidL2_20231014T194649.fits&solar" || true
wget --load-cookies neid_cookie.txt -nc -O neidL2_20231014T203055.fits "https://neid.ipac.caltech.edu/get_file.php?filehand=sci/2023/10/14/l2/pv2/neidL2_20231014T203055.fits&solar" || true
wget --load-cookies neid_cookie.txt -nc -O neidL2_20231014T192727.fits "https://neid.ipac.caltech.edu/get_file.php?filehand=sci/2023/10/14/l2/pv2/neidL2_20231014T192727.fits&solar" || true
wget --load-cookies neid_cookie.txt -nc -O neidL2_20231014T161431.fits "https://neid.ipac.caltech.edu/get_file.php?filehand=sci/2023/10/14/l2/pv2/neidL2_20231014T161431.fits&solar" || true
