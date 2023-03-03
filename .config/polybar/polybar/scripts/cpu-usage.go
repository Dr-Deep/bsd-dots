//usr/local/bin/go run "$0" "$@"; exit

package main

import (
	"fmt"
	// _ "golang.org/x/sys/unix"
)

func main() {
	fmt.Println("0%")

}

//syscall.Sysctl("kern.smp.active")

//vm.loadavg

//hw.ncpu ; kern.smp.cpus
//dev.cpu.{int}.cx_usage ?

/*
__sysctlbyname("kern.smp.active",15,0x6d15d3357e4,0x6d97d982f18,0x0,0) = 0 (0x0)

__sysctlbyname("vm.nswapdev",11,0x6d97d982f20,0x6d97d982f18,0x0,0) = 0 (0x0)
__sysctlbyname("kern.ccpu",9,0x6d15d3357fc,0x6d97d982ed0,0x0,0) = 0 (0x0)
__sysctlbyname("kern.smp.maxcpus",16,0x6d15d335830,0x6d97d982ed0,0x0,0) = 0 (0x0)
__sysctlbyname("kern.cp_times",13,0x6d9858ae000,0x6d97d982f18,0x0,0) = 0 (0x0)

sigprocmask(SIG_SETMASK,{ },0x0)		 = 0 (0x0)
__sysctlbyname("kern.cp_times",13,0x6d9858c7000,0x6d97d982eb8,0x0,0) = 0 (0x0)
__sysctlbyname("kern.cp_time",12,0x6d15d335880,0x6d97d982e70,0x0,0) = 0 (0x0)
__sysctlbyname("vm.loadavg",10,0x6d97d982ed8,0x6d97d982e70,0x0,0) = 0 (0x0)
__sysctlbyname("kern.lastpid",12,0x6d15d3358a8,0x6d97d982e70,0x0,0) = 0 (0x0)
__sysctlbyname("vfs.bufspace",12,0x6d15d335938,0x6d97d982e70,0x0,0) = 0 (0x0)

__sysctlbyname("vm.stats.vm.v_active_count",26,0x6d15d335950,0x6d97d982e70,0x0,0) = 0 (0x0)
__sysctlbyname("vm.stats.vm.v_inactive_count",28,0x6d15d335954,0x6d97d982e70,0x0,0) = 0 (0x0)
__sysctlbyname("vm.stats.vm.v_laundry_count",27,0x6d15d335958,0x6d97d982e70,0x0,0) = 0 (0x0)
__sysctlbyname("vm.stats.vm.v_wire_count",24,0x6d15d33595c,0x6d97d982e70,0x0,0) = 0 (0x0)
__sysctlbyname("vm.stats.vm.v_free_count",24,0x6d15d335964,0x6d97d982e70,0x0,0) = 0 (0x0)

__sysctl("kern.boottime",2,0x6d97d982ef0,0x6d97d982eb8,0x0,0) = 0 (0x0)
__sysctl("kern.proc.proc",3,0x0,0x6d97d982dd0,0x0,0) = 0 (0x0)
__sysctl("kern.proc.proc",3,0x6d985935180,0x6d97d982dd0,0x0,0) = 0 (0x0)
*/

/*
import (
    "fmt"
    "time"

    "github.com/shirou/gopsutil/cpu"
    //_ "github.com/shirou/gopsutil/v3"5
)

func main() {
    // In welchem Intervall sollen die CPU-Stats aktualisiert werden
    refreshInterval := 1 * time.Second

    // Unendliche Schleife, um die CPU-Stats in regelmäßigen Abständen auszugeben
    for {
        // CPU-Stats abrufen
        cpuPercentages, err := cpu.Percent(refreshInterval, false)
        if err != nil {
            fmt.Printf("Fehler beim Abrufen der CPU-Stats: %s\n", err)
            continue
        }

        // Summe aller CPU-Lasten berechnen
        var totalCpuPercent float64
        for _, cpuPercentage := range cpuPercentages {
            totalCpuPercent += cpuPercentage
        }

        // Durchschnittliche CPU-Auslastung berechnen und ausgeben
        avgCpuPercent := totalCpuPercent / float64(len(cpuPercentages))
        fmt.Printf("Systemweite CPU-Auslastung: %.2f%%\n", avgCpuPercent)

        // Warten bis zum nächsten Aktualisierungsintervall
        time.Sleep(refreshInterval)
    }
}
*/

/*
	cptimeOut, err := exec.Command("sysctl", "-n", "kern.cp_time").Output()
	if err != nil {
		panic(err)
	}

	var (
		cpTimes      = strings.Fields(string(cptimeOut))
		totalCpuTime int
	)
	for _, cpTime := range cpTimes {
		time, err := strconv.Atoi(cpTime)
		if err != nil {
			panic(err)
		}
		totalCpuTime += time
	}



	idleTime := totalCpuTime - (2 * (totalCpuTime / len(cpTimes)))

	// %
	cpuUsage := 100.0 * (float64(totalCpuTime-idleTime) / float64(totalCpuTime))

	//
	fmt.Printf("Auslastung: '%.2f%%'\n", cpuUsage)
	fmt.Printf("'%v'\n", cpuUsage)
*/
