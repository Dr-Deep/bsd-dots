//usr/local/bin/go run "$0" "$@"; exit

package main

import (
	"fmt"
	"os/exec"
	"strconv"
	"strings"
)

func main() {
	pageSize, err := sysctlUint("vm.stats.vm.v_page_size")
	if err != nil {
		panic(err)
	}

	physmem, err := sysctlUint("hw.physmem")
	if err != nil {
		panic(err)
	}

	inactive, err := sysctlUint("vm.stats.vm.v_inactive_count")
	if err != nil {
		panic(err)
	}

	laundry, err := sysctlUint("vm.stats.vm.v_laundry_count")
	if err != nil {
		panic(err)
	}

	free, err := sysctlUint("vm.stats.vm.v_free_count")
	if err != nil {
		panic(err)
	}

	free = free * pageSize
	inactive = inactive * pageSize
	laundry = laundry * pageSize

	var (
		available   = inactive + free + laundry
		used        = physmem - available
		usedPercent = float64(used) / float64(physmem) * 100.0
	)

	//? "0%/0.00GiB"
	fmt.Printf("%.2f%%\n", usedPercent)
}

func sysctlUint(name string) (uint, error) {
	out, err := exec.Command("sysctl", "-n", name).Output()
	if err != nil {
		return 0, err
	}

	i, err := strconv.Atoi(
		strings.TrimSpace(string(out)),
	)
	if err != nil {
		return 0, err
	}

	return uint(i), nil
}
