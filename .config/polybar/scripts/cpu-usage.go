//usr/local/bin/go run "$0" "$@"; exit

package main

import (
	"fmt"
	//_ "github.com/shirou/gopsutil/v3"
)

func main() {
	fmt.Println("0%")
}

/*
import (
    "fmt"
    "time"

    "github.com/shirou/gopsutil/cpu"
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
