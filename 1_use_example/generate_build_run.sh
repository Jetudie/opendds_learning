# generate files
tao_idl Messenger.idl &&\
opendds_idl Messenger.idl && \
mpc.pl -type gnuace Messenger.mpc

if [ $? -eq 0 ]; then
	echo "good, let build it!"
    for name in Idl Subscriber Publisher
    do
        make -f GNUmakefile.Messenger_$name
    done
fi

if [ $? -eq 0 ]; then
    echo "build done, start to test..."
fi

# execute publisher and subscriber
./publisher -DCPSConfigFile rtps.ini &
./subscriber -DCPSConfigFile rtps.ini