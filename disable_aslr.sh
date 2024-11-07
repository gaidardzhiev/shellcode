#!/bin/sh

check_proc_permissions() {
	if [ -w /proc ]; then
		echo "/proc is writable"
		return 0
	else
		echo "/proc is not writable..."
		return 1
	fi
}

disable_aslr() {
	echo "disabling ASLR"
	echo 0 > /proc/sys/kernel/randomize_va_space
	if [ $? -eq 0 ]; then
		echo "ASLR has been successfully disabled"
	else
		echo "failed to disable ASLR"
	fi
}

echo "checking permissions for /proc..."
if check_proc_permissions; then
	disable_aslr
else
	echo "operation aborted due to insufficient permissions."
fi

