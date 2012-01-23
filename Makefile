# Copyright (c) 2011 Mitaka
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

SHELL = /bin/sh
VERSION=$(shell cat VERSION)
FAMILY=KePT
SANS=KePTSans
SERIF=KePTSerif
MONO=KePTMono
PKGDIR=keptfonts
PKGSANS=keptsans
PKGSERIF=keptserif
PKGMONO=keptmono
DOCUMENTS=README.txt OFL-FAQ.txt OFL-keptsans.txt OFL-keptserif.txt OFL-keptmono.txt \
			FONTLOG-keptsans.txt FONTLOG-keptserif.txt FONTLOG-keptmono.txt
SCRIPTS=Makefile VERSION $(FFSCRIPT)
KEPTFONTS=$(KEPTSANS) $(KEPTSERIF) $(KEPTMONO)
KEPTSANS=$(SANS)-Regular.sfd $(SANS)-Italic.sfd $(SANS)-Bold.sfd $(SANS)-BoldItalic.sfd \
	$(SANS)-Narrow.sfd $(SANS)-NarrowBold.sfd $(SANS)-Caption.sfd $(SANS)-CaptionBold.sfd
KEPTSERIF=$(SERIF)-Regular.sfd $(SERIF)-Italic.sfd $(SERIF)-Bold.sfd $(SERIF)-BoldItalic.sfd \
	$(SERIF)-Caption.sfd $(SERIF)-CaptionItalic.sfd
KEPTMONO=$(MONO)-Regular.sfd
PTSANS=PTS55F.ttf PTS56F.ttf PTS75F.ttf PTS76F.ttf PTN57F.ttf PTN77F.ttf PTC55F.ttf PTC75F.ttf
PTSERIF=PTF55F.ttf PTF56F.ttf PTF75F.ttf PTF76F.ttf PTZ55F.ttf PTZ56F.ttf
PTMONO=PTM55F.ttf
FFSCRIPT=make-kept-fonts.ff
INSTALL=install
prefix=/usr
fontdir=$(prefix)/share/fonts/truetype/$(PKGDIR)
docdir=$(prefix)/share/doc/ttf-$(PKGDIR)

.PHONY: ttf all webfonts ttf-sans ttf-serif webfonts-sans webfonts-serif
.PHONY: dist dist-ttf dist-web dist-sans-web dist-serif-web dist-sans-ttf dist-serif-ttf
.PHONY: clean distclean published rollback version-up version-down

ttf: ttf-serif ttf-sans ttf-mono
ttf-sans: $(KEPTSANS:.sfd=.ttf) 
ttf-serif: $(KEPTSERIF:.sfd=.ttf)
ttf-mono: $(KEPTMONO:.sfd=.ttf)

all: webfonts

webfonts: webfonts-sans webfonts-serif webfonts-mono
webfonts-sans: ttf-sans $(KEPTSANS:.sfd=.woff) $(KEPTSANS:.sfd=.svg) $(KEPTSANS:.sfd=.eot)
webfonts-serif: ttf-serif $(KEPTSERIF:.sfd=.woff) $(KEPTSERIF:.sfd=.svg) $(KEPTSERIF:.sfd=.eot)	
webfonts-mono: ttf-mono $(KEPTMONO:.sfd=.woff) $(KEPTMONO:.sfd=.svg) $(KEPTMONO:.sfd=.eot)	

$(SANS)-Regular.sfd: $(FFSCRIPT) PTS55F.ttf VERSION
	$(FFSCRIPT) --format sfd --version $(VERSION) PTS55F.ttf

$(SANS)-Italic.sfd: $(FFSCRIPT) PTS56F.ttf VERSION
	$(FFSCRIPT) --format sfd --version $(VERSION) PTS56F.ttf
			
$(SANS)-Bold.sfd: $(FFSCRIPT) PTS75F.ttf VERSION
	$(FFSCRIPT) --format sfd --version $(VERSION) PTS75F.ttf

$(SANS)-BoldItalic.sfd: $(FFSCRIPT) PTS76F.ttf VERSION
	$(FFSCRIPT) --format sfd --version $(VERSION) PTS76F.ttf

$(SANS)-Narrow.sfd: $(FFSCRIPT) PTN57F.ttf VERSION
	$(FFSCRIPT) --format sfd --version $(VERSION) PTN57F.ttf

$(SANS)-NarrowBold.sfd: $(FFSCRIPT) PTN77F.ttf VERSION
	$(FFSCRIPT) --format sfd --version $(VERSION) PTN77F.ttf
	
$(SANS)-Caption.sfd: $(FFSCRIPT) PTC55F.ttf VERSION
	$(FFSCRIPT) --format sfd --version $(VERSION) PTC55F.ttf

$(SANS)-CaptionBold.sfd: $(FFSCRIPT) PTC75F.ttf VERSION
	$(FFSCRIPT) --format sfd --version $(VERSION) PTC75F.ttf

$(SERIF)-Regular.sfd: $(FFSCRIPT) PTF55F.ttf VERSION
	$(FFSCRIPT) --format sfd --version $(VERSION) PTF55F.ttf

$(SERIF)-Italic.sfd: $(FFSCRIPT) PTF56F.ttf VERSION
	$(FFSCRIPT) --format sfd --version $(VERSION) PTF56F.ttf

$(SERIF)-Bold.sfd: $(FFSCRIPT) PTF75F.ttf VERSION
	$(FFSCRIPT) --format sfd --version $(VERSION) PTF75F.ttf

$(SERIF)-BoldItalic.sfd: $(FFSCRIPT) PTF76F.ttf VERSION
	$(FFSCRIPT) --format sfd --version $(VERSION) PTF76F.ttf

$(SERIF)-Caption.sfd: $(FFSCRIPT) PTZ55F.ttf VERSION
	$(FFSCRIPT) --format sfd --version $(VERSION) PTZ55F.ttf

$(SERIF)-CaptionItalic.sfd: $(FFSCRIPT) PTZ56F.ttf VERSION
	$(FFSCRIPT) --format sfd --version $(VERSION) PTZ56F.ttf

$(MONO)-Regular.sfd: $(FFSCRIPT) PTM55F.ttf VERSION
	$(FFSCRIPT) --format sfd --version $(VERSION) PTM55F.ttf

$(KEPTFONTS:.sfd=.ttf): %.ttf: %.sfd
	fontforge -lang=ff -c "Open('$<'); Generate('$@');"

$(KEPTFONTS:.sfd=.svg): %.svg: %.sfd
	fontforge -lang=ff -c "Open('$<'); Generate('$@');"
		
$(KEPTFONTS:.sfd=.woff): %.woff: %.sfd
	fontforge -lang=ff -c "Open('$<'); Generate('$@');"
	if [ -f $(<:.sfd=.afm) ]; then rm $(<:.sfd=.afm); fi
	
$(KEPTFONTS:.sfd=.eot): %.eot: %.ttf
	ttf2eot < $< > $@;
	
.PHONY: dist dist-ttf dist-web dist-sans-web dist-serif-web dist-sans-ttf dist-serif-ttf

dist: dist-web dist-sfd dist-src

dist-ttf: dist-sans-ttf dist-serif-ttf dist-mono-ttf

dist-web: dist-sans-web dist-serif-web dist-mono-web

dist-sfd: dist-sans-sfd dist-serif-sfd dist-mono-sfd

dist-sans-ttf: ttf-sans
	if [ -d $(SANS)-$(VERSION) ]; then rm -r $(SANS)-$(VERSION); fi
	mkdir $(SANS)-$(VERSION)
	cp README.txt $(SANS)-$(VERSION)/README.txt
	cp FONTLOG-keptsans.txt $(SANS)-$(VERSION)/FONTLOG.txt
	cp OFL-keptsans.txt $(SANS)-$(VERSION)/OFL.txt
	cp OFL-FAQ.txt $(SANS)-$(VERSION)/OFL-FAQ.txt
	cp $(KEPTSANS:.sfd=.ttf) $(SANS)-$(VERSION)/
	zip $(PKGSANS)-$(VERSION)-ttf.zip  $(SANS)-$(VERSION)/*
	rm -r $(SANS)-$(VERSION)

dist-serif-ttf: ttf-serif
	if [ -d $(SERIF)-$(VERSION) ]; then rm -r $(SERIF)-$(VERSION); fi
	mkdir $(SERIF)-$(VERSION)
	cp README.txt $(SERIF)-$(VERSION)/README.txt
	cp FONTLOG-keptserif.txt $(SERIF)-$(VERSION)/FONTLOG.txt
	cp OFL-keptserf.txt $(SERIF)-$(VERSION)/OFL.txt
	cp OFL-FAQ.txt $(SERIF)-$(VERSION)/OFL-FAQ.txt
	cp $(KEPTSERIF:.sfd=.ttf) $(SERIF)-$(VERSION)/
	zip $(PKGSERIF)-$(VERSION)-ttf.zip  $(SERIF)-$(VERSION)/*
	rm -r $(SERIF)-$(VERSION)
	
dist-mono-ttf: ttf-mono
	if [ -d $(MONO)-$(VERSION) ]; then rm -r $(MONO)-$(VERSION); fi
	mkdir $(MONO)-$(VERSION)
	cp README.txt $(MONO)-$(VERSION)/README.txt
	cp FONTLOG-keptmono.txt $(MONO)-$(VERSION)/FONTLOG.txt
	cp OFL-keptmono.txt $(MONO)-$(VERSION)/OFL.txt
	cp OFL-FAQ.txt $(MONO)-$(VERSION)/OFL-FAQ.txt
	cp $(KEPTMONO:.sfd=.ttf) $(MONO)-$(VERSION)/
	zip $(PKGMONO)-$(VERSION)-ttf.zip  $(MONO)-$(VERSION)/*
	rm -r $(MONO)-$(VERSION)

	
dist-sans-web: webfonts-sans dist-sans-ttf
	if [ -d $(SANS)-$(VERSION) ]; then rm -r $(SANS)-$(VERSION); fi
	mkdir $(SANS)-$(VERSION)
	cp README.txt $(SANS)-$(VERSION)/README.txt
	cp FONTLOG-keptsans.txt $(SANS)-$(VERSION)/FONTLOG.txt
	cp OFL-keptsans.txt $(SANS)-$(VERSION)/OFL.txt
	cp OFL-FAQ.txt $(SANS)-$(VERSION)/OFL-FAQ.txt
	cp $(KEPTSANS:.sfd=.ttf) $(KEPTSANS:.sfd=.woff) $(KEPTSANS:.sfd=.svg) $(KEPTSANS:.sfd=.eot) $(SANS)-$(VERSION)/
	zip $(PKGSANS)-$(VERSION)-web.zip  $(SANS)-$(VERSION)/*
	rm -r $(SANS)-$(VERSION)

dist-serif-web: webfonts-serif dist-serif-ttf
	if [ -d $(SERIF)-$(VERSION) ]; then rm -r $(SERIF)-$(VERSION); fi
	mkdir $(SERIF)-$(VERSION)
	cp README.txt $(SERIF)-$(VERSION)/README.txt
	cp FONTLOG-keptserif.txt $(SERIF)-$(VERSION)/FONTLOG.txt
	cp OFL-keptserif.txt $(SERIF)-$(VERSION)/OFL.txt
	cp OFL-FAQ.txt $(SERIF)-$(VERSION)/OFL-FAQ.txt
	cp $(KEPTSERIF:.sfd=.ttf)  $(KEPTSERIF:.sfd=.woff) $(KEPTSERIF:.sfd=.svg) $(KEPTSERIF:.sfd=.eot) $(SERIF)-$(VERSION)/
	zip $(PKGSERIF)-$(VERSION)-web.zip  $(SERIF)-$(VERSION)/*
	rm -r $(SERIF)-$(VERSION)
	
dist-mono-web: webfonts-mono dist-mono-ttf
	if [ -d $(MONO)-$(VERSION) ]; then rm -r $(MONO)-$(VERSION); fi
	mkdir $(MONO)-$(VERSION)
	cp README.txt $(MONO)-$(VERSION)/README.txt
	cp FONTLOG-keptmono.txt $(MONO)-$(VERSION)/FONTLOG.txt
	cp OFL-keptmono.txt $(MONO)-$(VERSION)/OFL.txt
	cp OFL-FAQ.txt $(MONO)-$(VERSION)/OFL-FAQ.txt
	cp $(KEPTMONO:.sfd=.ttf)  $(KEPTMONO:.sfd=.woff) $(KEPTMONO:.sfd=.svg) $(KEPTMONO:.sfd=.eot) $(MONO)-$(VERSION)/
	zip $(PKGMONO)-$(VERSION)-web.zip  $(MONO)-$(VERSION)/*
	rm -r $(MONO)-$(VERSION)
	
dist-src:
	cd ..; zip kept-fonts/keptfonts-$(VERSION)-src.zip $(patsubst %, kept-fonts/%, $(SCRIPTS)) \
			$(patsubst %, kept-fonts/%, $(PTSANS)) $(patsubst %, kept-fonts/%, $(PTSERIF)) \
			$(patsubst %, kept-fonts/%, $(PTMONO)) $(patsubst %, kept-fonts/%, $(DOCUMENTS)) 

dist-sans-sfd:
	if [ -d $(SANS)-$(VERSION) ]; then rm -r $(SANS)-$(VERSION); fi
	mkdir $(SANS)-$(VERSION)
	cp README.txt $(SANS)-$(VERSION)/README.txt
	cp FONTLOG-keptsans.txt $(SANS)-$(VERSION)/FONTLOG.txt
	cp OFL-keptsans.txt $(SANS)-$(VERSION)/OFL.txt
	cp OFL-FAQ.txt $(SANS)-$(VERSION)/OFL-FAQ.txt
	cp $(KEPTSANS) $(SANS)-$(VERSION)/
	zip $(PKGSANS)-$(VERSION)-sfd.zip  $(SANS)-$(VERSION)/*
	rm -r $(SANS)-$(VERSION)
dist-serif-sfd:
	if [ -d $(SERIF)-$(VERSION) ]; then rm -r $(SERIF)-$(VERSION); fi
	mkdir $(SERIF)-$(VERSION)
	cp README.txt $(SERIF)-$(VERSION)/README.txt
	cp FONTLOG-keptserif.txt $(SERIF)-$(VERSION)/FONTLOG.txt
	cp OFL-keptserif.txt $(SERIF)-$(VERSION)/OFL.txt
	cp OFL-FAQ.txt $(SERIF)-$(VERSION)/OFL-FAQ.txt
	cp $(KEPTSERIF) $(SERIF)-$(VERSION)/
	zip $(PKGSERIF)-$(VERSION)-sfd.zip  $(SERIF)-$(VERSION)/*
	rm -r $(SERIF)-$(VERSION)
	
dist-mono-sfd:
	if [ -d $(MONO)-$(VERSION) ]; then rm -r $(MONO)-$(VERSION); fi
	mkdir $(MONO)-$(VERSION)
	cp README.txt $(MONO)-$(VERSION)/README.txt
	cp FONTLOG-keptmono.txt $(MONO)-$(VERSION)/FONTLOG.txt
	cp OFL-keptmono.txt $(MONO)-$(VERSION)/OFL.txt
	cp OFL-FAQ.txt $(MONO)-$(VERSION)/OFL-FAQ.txt
	cp $(KEPTMONO) $(SERIF)-$(VERSION)/
	zip $(PKGMONO)-$(VERSION)-sfd.zip  $(MONO)-$(VERSION)/*
	rm -r $(MONO)-$(VERSION)
	
.PHONY: clean distclean newbuild published rollback version-up version-down

clean: mostlyclean
	if [ -f KePTSans-Regular.ttf ]; then rm $(KEPTSANS) $(KEPTSANS:.sfd=.ttf); fi
	if [ -f KePTSerif-Regular.ttf ]; then rm $(KEPTSERIF) $(KEPTSERIF:.sfd=.ttf); fi
	if [ -f KePTMono-Regular.ttf ]; then rm $(KEPTMONO) $(KEPTMONO:.sfd=.ttf); fi

mostlyclean: 
	if [ -f KePTSans-Regular.woff ]; then rm $(KEPTSANS:.sfd=.woff) $(KEPTSANS:.sfd=.eot) $(KEPTSANS:.sfd=.svg); fi
	if [ -f KePTSerif-Regular.woff ]; then rm $(KEPTSERIF:.sfd=.woff)  $(KEPTSERIF:.sfd=.eot) $(KEPTSERIF:.sfd=.svg); fi
	if [ -f KePTMono-Regular.woff ]; then rm $(KEPTMONO:.sfd=.woff)  $(KEPTMONO:.sfd=.eot) $(KEPTMONO:.sfd=.svg); fi

distclean: clean
	-rm *.zip
	
install:
	mkdir -p $(fontdir)
	$(INSTALL) -p --mode=644 $(KEPTFONTS:.sfd=.ttf) $(fontdir)
	mkdir -p $(docdir)
	$(INSTALL) -p --mode=644 $(DOCUMENTS) $(docdir)

uninstall:
	rm -r $(fontdir)
	rm -r $(docdir)

newbuild:
	awk -F. '{if (NF<3) print $$1  "." $$2 ".1"; else print $$1  "." $$2 "." $$3+1 }' VERSION > NEW
	mv NEW VERSION
	cat VERSION
	
published:
	awk -F. '{print $$1  "." $$2+1}' VERSION > NEW
	mv NEW VERSION
	cat VERSION
	
rollback:
	awk -F. '{if($$2>0) print $$1 "." $$2-1; else print $$1 "." $$2;}' VERSION > NEW
	mv NEW VERSION
	cat VERSION
		
version-up:
	awk -F. '{print $$1+1 "." 0}' VERSION > NEW
	mv NEW VERSION
	cat VERSION
		
version-down:
	awk -F. '{if($$1>0) print $$1-1 "." 0; else print $$1 "." 0;}' VERSION > NEW
	mv NEW VERSION
	cat VERSION
	
