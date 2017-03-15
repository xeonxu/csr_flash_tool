#!/bin/bash

# Dumping and Flashing firmware from Commandline

# ----------------------------------------
# bc415 pin 16 goes to pin 10 on arduino
# bc415 pin 17 goes to pin 11 on arduino
# bc415 pin 18 goes to pin 12 on arduino
# bc415 pin 19 goes to pin 13 on arduino
# ----------------------------------------
# bc415 pin 16 goes to pin DTR on FT232
# bc415 pin 17 goes to pin RI  on FT232
# bc415 pin 18 goes to pin RSD/DSR on FT232
# bc415 pin 19 goes to pin RTS on FT232
# ----------------------------------------

export WINEDLLPATH=$WINEDLLPATH:`pwd`

function usage {
    cat <<EOF
`basename $0` [arduino|ft232] port back_filename [new_filename]
EOF
    exit 1
}

function chkerr {
    if [ $? -ne 0 ]
    then 
	cat <<EOF
	Error occurs!!!
EOF
	exit 1

    fi
}


if [ $# -lt 3 ]
then usage
fi

if [ "$1" == "arduino" ]
then
    ./BlueFlashCmd.exe -TRANS "SPITRANS=LPT SPIPORT=$2" -DUMP $3;chkerr
    ./pscli.exe  -TRANS "SPITRANS=LPT SPIPORT=$2" query $3.psr dump.psq;chkerr
    if [ "$4" != ""]
    then
	./BlueFlashCmd -TRANS "SPITRANS=LPT SPIPORT=$2" $4;chkerr
	./pscli.exe  -TRANS "SPITRANS=LPT SPIPORT=$2" merge backup.psr;chkerr
    fi
elif [ "$1" == "ft232" ]
then
    ./BlueFlashCmd.exe -TRANS "SPITRANS=usb SPIPORT=$2" -DUMP $3;chkerr
    ./pscli.exe  -TRANS "SPITRANS=usb SPIPORT=$2" query $3.psr dump.psq;chkerr
    if [ "$4" != ""]
    then
	./BlueFlashCmd -TRANS "SPITRANS=usb SPIPORT=$2" $4;chkerr
	./pscli.exe  -TRANS "SPITRANS=usb SPIPORT=$2" merge backup.psr;chkerr
    fi

else
    usage
fi
