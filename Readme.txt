Dumping and Flashing firmware from Commandline

X = COM PORT NUMBER FOR ARDUINO

bc415 pin 16 goes to pin 10 on arduino
bc415 pin 17 goes to pin 11 on arduino
bc415 pin 18 goes to pin 12 on arduino
bc415 pin 19 goes to pin 13 on arduino

BlueFlashCmd.exe -TRANS "SPITRANS=LPT SPIPORT=x" -DUMP OriginalFirmware

Will Dump firmare

pscli.exe  -TRANS "SPITRANS=LPT SPIPORT=x" query backup.psr dump.psq

will backup some important parameters to backup.psr

BlueFlashCmd -TRANS "SPITRANS=LPT SPIPORT=x" newfirmware

will flash firmware newfirmware.xdv and newfirmware.xpv

pscli.exe  -TRANS "SPITRANS=LPT SPIPORT=x" merge backup.psr

will restore important parameters to bt module.
