# Notes

## hexdump
* `hexdump -v -C /file | less`

## ZFS: zpool
* `zpool list -v zsys`
* `zpool attach -w zsys /dev/gpt/zsys  /dev/ada2p2.eli`
* `zpool detach zsys /dev/device`

## NVME nullen
* `nvmecontrol format -E /dev/nvme0`
* `nvmecontrol sanitize -a block /dev/nvme0`

## hbsdcontrol
* [shlibrandom, segvguard, prohibit_ptrace_capsicum,]
* [pageexec, mprotect, insecure_kmod]
* [harden_shm, disallow_map32bit]
* `hbsdcontrol pax list`
* `hbsdcontrol -H -d pax disable feature $(which file)`
* `hbsdcontrol pax disable insecure_kmod /path/module.ko`

## kern
* `sysctl hardening.harden_rtld`
