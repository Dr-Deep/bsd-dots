## 
`gpart show`

# Kern.FS

##
`newfs -t -U -L freebsd.kern /dev/adaXpX`



# Root.FS

## Initialisieren Sie das GELI-Verschlüsselungssystem
`geli init -b -s 4096 /dev/adaXpX`

## bububu
`geli attach /dev/adaXpX`

## Formatieren
`newfs -t -U -L freebsd-rootfs /dev/adaXpX.eli`

## Einhängen
`mount /dev/adaXpX.eli /mnt`

# 


`mkdir -p /mnt/kernfs/boot`

`mount /dev/adaXpX /mnt/kernfs`

`cd /mnt`
`mkdir bootfs/boot`
`ln -s bootfs/boot`



/boot/efi mounten

/tmp/bsdinstall_etc/fstab
```fstab
/dev/adaXpX.eli	/		ufs	rw	1 1
/dev/adaXpX     /kernfs		ufs	rw	0 0
/dev/adaXpX	/boot/efi	msdosfs rw	2 2
```

/tmp/bsdinstall_boot/loader.conf
```conf
geom_eli_load="YES"
vfs.root.mountfrom="ufs:adaXpX.eli"
```
