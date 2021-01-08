.PHONY: init
init:
	git submodule update --force

add: init
	$(MAKE) -C facetime-hd
	$(MAKE) -C facetime-hd install
	echo 'install_items+=" /usr/lib/firmware/facetimehd/firmware.bin "' | tee /etc/dracut.conf.d/facetimehd.conf
	dnf copr enable frgt10/facetimehd-dkms
	dnf install facetimehd

install:
	install -vT files/modules.conf /etc/modules-load.d/macbook.conf
	install -vT files/macbook.conf /etc/dracut.conf.d/macbook.conf
	install -vT files/fixsleep.sh /usr/local/bin/fixsleep.sh
	install -vT files/on-sleep.service /etc/systemd/system/on-sleep.service
	systemctl enable --now fixsleep.service
	dracut -f
	grubby --update-kernel=ALL --args="efi=noruntime pcie_ports=compat brcmfmac.rambase_addr=0x160000"
