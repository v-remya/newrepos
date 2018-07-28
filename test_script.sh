#!/bin/bash
# Test script
# it can be coded in a better way
# am putting like this :- Ajoy :-)


#get kernel
get_kernel () {
echo "Kernel Version is:- `uname -r` "
}

#get host name
get_host () {
echo "Host name is:- `hostname -s` "
}

#get OS version
get_osver () {
echo "OS is:- `uname -s`"
}

#get OS version
print_hello () {
echo -n "Enter User name:-"
read our_string
echo "Hello User $our_string..!!"
}

# Trap the termination
remove_lock () {
echo "Interrupt Signal EXITING (Terminated by USER)....!!!!"
rm -f $HOME/script.lock
exit 1
}

##      Our Main Menu
press_enter () {
echo ""
echo -n "Press Enter to continue"
read
clear
}

selection=
until [ "$selection" = "0" ]; do
clear
if [ -f $HOME/script.lock ]; then
set x `ls -l $HOME/script.lock`
echo "The test script is in use...!!"
echo "Waiting for user $4 to exit..(working since $7 $8 $9)...!!"
echo "Try after some time..!!"
exit 0
fi
exit 0
touch $HOME/script.lock
trap remove_lock 1 2 15
echo ""
echo "==================================="
echo ""
echo "1 - Kernel Version"
echo ""
echo "2 - Hostname"
echo ""
echo "3 - OS Version"
echo ""
echo "4 - Hello World"
echo ""
echo "0 - Exit Program"
echo ""
echo "==================================="
echo -n "Enter Selection: "
read selection
echo ""
case $selection in
1 ) get_kernel ; rm -f $HOME/script.lock ; press_enter ;;
2 ) get_host ;  rm -f $HOME/script.lock ; press_enter ;;
3 ) get_osver ; rm -f $HOME/script.lock ; press_enter ;;
4 ) print_hello ; rm -f $HOME/script.lock ; press_enter ;;
0 ) rm -f $HOME/script.lock ; exit ;;
* ) echo "Please enter 1 or 2 or 3 or 4 or 0"; rm -f $HOME/script.lock ; press_enter; 
esac
done 
exit 0
