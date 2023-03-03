//usr/local/bin/go run "$0" "$@"; exit

package main

import "fmt"

//vm.swap_total
//vm.swap_enabled

func main() {
	fmt.Println("0%/0.00GiB")
}

/*
__sysctlbyname("vm.stats.vm.v_swappgsin",23,0x6d15d335940,0x6d97d982e70,0x0,0) = 0 (0x0)
__sysctlbyname("vm.stats.vm.v_swappgsout",24,0x6d15d335948,0x6d97d982e70,0x0,0) = 0 (0x0)
__sysctlbyname("vm.dmmax",8,0x6d98089cb4c,0x6d97d982e00,0x0,0) = 0 (0x0)

__sysctl("sysctl.name2oid vm.swap_info",2,0x6d97d982e60,0x6d97d982df8,0x6d98088c5d6,12) = 0 (0x0)
__sysctl("vm.swap_info.0",3,0x6d97d982e00,0x6d97d982df0,0x0,0) = 0 (0x0)
__sysctl("vm.swap_info.1",3,0x6d97d982e00,0x6d97d982df0,0x0,0) ERR#2 'No such file or directory'
__sysctlbyname("vm.swap_maxpages",16,0x6d15d335ec8,0x6d97d982e70,0x0,0) = 0 (0x0)
*/
