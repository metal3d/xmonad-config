UID=$(shell id -u)
DATE=$(shell date +"%s")

all: prepare install

install: install-xmonad install-xmobar install-tools clean

prepare:
	$(info User ID: $(UID))
ifeq ($(UID),0)
	@echo "run is as normal user" && exit 1
endif
	cd /tmp && git clone git://github.com/metal3d/xmonad-config.git && cd xmonad-config

install-xmonad:
	mkdir -p ~/.xmonad 2>&1 >/dev/null
	$(shell test -f ~/.xmonad/xmonad.hs && mv ~/.xmonad/xmonad.hs ~/.xmonad/xmonad.hs.$(DATE))
	cp /tmp/xmonad-config/xmonad/xmonad.hs ~/.xmonad/xmonad.hs
	xmonad --recompile

install-xmobar:
	$(shell test -f ~/.xmobarrc && mv ~/.xmobarrc ~/.xmobarrc.$(DATE))
	cp /tmp/xmonad-config/xmobarrc ~/.xmobarrc

install-tools:
	mkdir -p ~/bin 2>&1 >/dev/null
	cp /tmp/xmonad-config/bin/xmonad-startup ~/bin/xmonad-startup
	chmod ug+x ~/bin/xmonad-startup

install_mutt:
	$(shell test -f ~/.mailcap && mv ~/.mailcap ~/.mailcap.$(DATE))
	cp /tmp/xmonad-config/mailcap ~/.mailcap

clean:
	rm -rf /tmp/xmonad-config

