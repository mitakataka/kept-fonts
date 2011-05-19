VERSION=$(shell cat VERSION)
FAMILY=KePT
SANS=KePTSans
SERIF=KePTSerif
SANSFILE=keptsans
SERIFFILE=keptserif
DOCUMENTS=OFL.txt OFL-FAQ.txt FONTLOG.txt
KEPTSANS=$(SANS)-Regular.ttf $(SANS)-Italic.ttf $(SANS)-Bold.ttf $(SANS)-BoldItalic.ttf \
	$(SANS)-Narrow.ttf $(SANS)-NarrowBold.ttf $(SANS)-Caption.ttf $(SANS)-CaptionBold.ttf
KEPTSERIF=$(SERIF)-Regular.ttf $(SERIF)-Italic.ttf $(SERIF)-Bold.ttf $(SERIF)-BoldItalic.ttf \
	$(SERIF)-Caption.ttf $(SERIF)-CaptionItalic.ttf
PTSANS=PTS55F.ttf PTS56F.ttf PTS75F.ttf PTS76F.ttf PTN57F.ttf PTN77F.ttf PTC55F.ttf PTC75F.ttf
PTSERIF=PTF55F.ttf PTF56F.ttf PTF75F.ttf PTF76F.ttf PTZ55F.ttf PTZ56F.ttf
FFSCRIPT=make-kept-fonts.ff

ttf: ttf-sans ttf-serif

ttf-sans: $(KEPTSANS)

ttf-serif: $(KEPTSERIF)

webfonts-sans: OPT=--webfonts
webfonts-sans: ttf-sans 

webfonts-serif: OPT=--webfonts
webfonts-serif: ttf-serif

webfonts: OPT=--webfonts
webfonts: webfonts-sans webfonts-serif

all: webfonts

$(KEPTSANS): $(FFSCRIPT) $(PTSANS)
	$(FFSCRIPT) --format ttf --version $(VERSION) PTS55F.ttf
	if [ -f $(SANS)-Regular.afm ]; then rm $(SANS)-Regular.afm; fi
	if [ "$(OPT)" = "--webfonts" ]; then ttf2eot < $(SANS)-Regular.ttf > $(SANS)-Regular.eot; fi
	
$(SANS)-Italic.ttf: $(FFSCRIPT) PTS56F.ttf
	$(FFSCRIPT) $(OPT) --version $(VERSION) PTS56F.ttf
	if [ -f $(SANS)-Italic.afm ]; then rm $(SANS)-Italic.afm; fi
	if [ "$(OPT)" = "--webfonts" ]; then ttf2eot < $(SANS)-Italic.ttf > $(SANS)-Italic.eot; fi
		
$(SANS)-Bold.ttf: $(FFSCRIPT) PTS75F.ttf
	$(FFSCRIPT) $(OPT) --version $(VERSION) PTS75F.ttf
	if [ -f $(SANS)-Bold.afm ]; then rm $(SANS)-Bold.afm; fi
	if [ "$(OPT)" = "--webfonts" ]; then ttf2eot < $(SANS)-Bold.ttf > $(SANS)-Bold.eot; fi

$(SANS)-BoldItalic.ttf: $(FFSCRIPT) PTS76F.ttf
	$(FFSCRIPT) $(OPT) --version $(VERSION) PTS76F.ttf
	if [ -f $(SANS)-BoldItalic.afm ]; then rm $(SANS)-BoldItalic.afm; fi
	if [ "$(OPT)" = "--webfonts" ]; then ttf2eot < $(SANS)-BoldItalic.ttf > $(SANS)-BoldItalic.eot; fi

$(SANS)-Narrow.ttf: $(FFSCRIPT) PTN57F.ttf
	$(FFSCRIPT) $(OPT) --version $(VERSION) PTN57F.ttf
	if [ -f $(SANS)-Narrow.afm ]; then rm $(SANS)-Narrow.afm; fi
	if [ "$(OPT)" = "--webfonts" ]; then ttf2eot < $(SANS)-Narrow.ttf > $(SANS)-Narrow.eot; fi

$(SANS)-NarrowBold.ttf: $(FFSCRIPT) PTN77F.ttf
	$(FFSCRIPT) $(OPT) --version $(VERSION) PTN77F.ttf
	if [ -f $(SANS)-NarrowBold.afm ]; then rm $(SANS)-NarrowBold.afm; fi
	if [ "$(OPT)" = "--webfonts" ]; then ttf2eot < $(SANS)-NarrowBold.ttf > $(SANS)-NarrowBold.eot; fi
	
$(SANS)-Caption.ttf: $(FFSCRIPT) PTC55F.ttf
	$(FFSCRIPT) $(OPT) --version $(VERSION) PTC55F.ttf
	if [ -f $(SANS)-Caption.afm ]; then rm $(SANS)-Caption.afm; fi
	if [ "$(OPT)" = "--webfonts" ]; then ttf2eot < $(SANS)-Caption.ttf > $(SANS)-Caption.eot; fi

$(SANS)-CaptionBold.ttf: $(FFSCRIPT) PTC75F.ttf
	$(FFSCRIPT) $(OPT) --version $(VERSION) PTC75F.ttf
	if [ -f $(SANS)-CaptionBold.afm ]; then rm $(SANS)-CaptionBold.afm; fi
	if [ "$(OPT)"="--webfonts" ]; then ttf2eot < $(SANS)-CaptionBold.ttf > $(SANS)-CaptionBold.eot; fi

$(SERIF)-Regular.ttf: $(FFSCRIPT) PTF55F.ttf
	$(FFSCRIPT) $(OPT) --version $(VERSION) PTF55F.ttf
	if [ -f $(SERIF)-Regular.afm ]; then rm $(SERIF)-Regular.afm; fi
	if [ "$(OPT)" = "--webfonts" ]; then ttf2eot < $(SERIF)-Regular.ttf > $(SERIF)-Regular.eot; fi

$(SERIF)-Italic.ttf: $(FFSCRIPT) PTF56F.ttf
	$(FFSCRIPT) $(OPT) --version $(VERSION) PTF56F.ttf
	if [ -f $(SERIF)-Italic.afm ]; then rm $(SERIF)-Italic.afm; fi
	if [ "$(OPT)" = "--webfonts" ]; then ttf2eot < $(SERIF)-Italic.ttf > $(SERIF)-Italic.eot; fi

$(SERIF)-Bold.ttf: $(FFSCRIPT) PTF75F.ttf
	$(FFSCRIPT) $(OPT) --version $(VERSION) PTF75F.ttf
	if [ -f $(SERIF)-Bold.afm ]; then rm $(SERIF)-Bold.afm; fi
	if [ "$(OPT)" = "--webfonts" ]; then ttf2eot < $(SERIF)-Bold.ttf > $(SERIF)-Bold.eot; fi

$(SERIF)-BoldItalic.ttf: $(FFSCRIPT) PTF76F.ttf
	$(FFSCRIPT) $(OPT) --version $(VERSION) PTF76F.ttf
	if [ -f $(SERIF)-BoldItalic.afm ]; then rm $(SERIF)-BoldItalic.afm; fi
	if [ "$(OPT)" = "--webfonts" ]; then ttf2eot < $(SERIF)-BoldItalic.ttf > $(SERIF)-BoldItalic.eot; fi

$(SERIF)-Caption.ttf: $(FFSCRIPT) PTZ55F.ttf
	$(FFSCRIPT) $(OPT) --version $(VERSION) PTZ55F.ttf
	if [ -f $(SERIF)-Caption.afm ]; then rm $(SERIF)-Caption.afm; fi
	if [ "$(OPT)" = "--webfonts" ]; then ttf2eot < $(SERIF)-Caption.ttf > $(SERIF)-Caption.eot; fi

$(SERIF)-CaptionItalic.ttf: $(FFSCRIPT) PTZ56F.ttf
	$(FFSCRIPT) $(OPT) --version $(VERSION) PTZ56F.ttf
	if [ -f $(SERIF)-CaptionItalic.afm ]; then rm $(SERIF)-CaptionItalic.afm; fi
	if [ "$(OPT)" = "--webfonts" ]; then ttf2eot < $(SERIF)-CaptionItalic.ttf > $(SERIF)-CaptionItalic.eot; fi

dist-sans-ttf: ttf
	cp FONTLOG-keptsans.txt FONTLOG.txt
	cp OFL-keptsans.txt OFL.txt
	zip keptsans-ttf-$(VERSION).zip  $(DOCUMENTS) $(KEPTSANS)
	rm FONTLOG.txt OFL.txt

dist-serif-ttf: ttf
	cp FONTLOG-keptserif.txt FONTLOG.txt
	cp OFL-keptserif.txt OFL.txt
	zip keptserif-ttf-$(VERSION).zip  $(DOCUMENTS) $(KEPTSERIF)
	rm FONTLOG.txt OFL.txt
	
dist-sans-web: webfonts-sans
	cp FONTLOG-keptsans.txt FONTLOG.txt
	cp OFL-keptsans.txt OFL.txt
	zip keptsans-ttf-$(VERSION).zip  $(DOCUMENTS) $(KEPTSANS)
	zip keptsans-web-$(VERSION).zip  $(DOCUMENTS) $(KEPTSANS) $(KEPTSANS:.ttf=.woff) \
		$(KEPTSANS:.ttf=.svg) $(KEPTSANS:.ttf=.eot)
	rm FONTLOG.txt OFL.txt	

dist-serif-web: webfonts-serif
	cp FONTLOG-keptserif.txt FONTLOG.txt
	cp OFL-keptserif.txt OFL.txt
	zip keptserif-ttf-$(VERSION).zip  $(DOCUMENTS) $(KEPTSERIF)
	zip keptserif-web-$(VERSION).zip  $(DOCUMENTS) $(KEPTSERIF) $(KEPTSERIF:.ttf=.woff) \
		$(KEPTSERIF:.ttf=.svg) $(KEPTSERIF:.ttf=.eot)
	rm FONTLOG.txt OFL.txt
	
dist-ttf: dist-sans-ttf dist-serif-ttf

dist-web: dist-sans-web dist-serif-web

dist: dist-web

.PHONY: dist dist-web dist-ttf dist-sans-web dist-serif-web dist-sans-ttf dist-serif-ttf all

.PHONY: clean ttfclean distclean

clean:
	if [ -f KePTSans-Regular.ttf ]; then rm $(KEPTSANS) $(KEPTSANS:.ttf=.sfd); fi
	if [ -f KePTSerif-Regular.ttf ]; then rm $(KEPTSERIF) $(KEPTSERIF:.ttf=.sfd); fi
	if [ -f KePTSans-Regular.woff ]; then rm $(KEPTSANS:.ttf=.woff) $(KEPTSANS:.ttf=.eot) $(KEPTSANS:.ttf=.svg); fi
	if [ -f KePTSerif-Regular.woff ]; then rm $(KEPTSERIF:.ttf=.woff)  $(KEPTSERIF:.ttf=.eot) $(KEPTSERIF:.ttf=.svg); fi
	
ttfclean:
	if [ -f KePTSans-Regular.ttf ]; then rm $(KEPTSANS) $(KEPTSANS:.ttf=.sfd); fi
	if [ -f KePTSerif-Regular.ttf ]; then rm $(KEPTSERIF) $(KEPTSERIF:.ttf=.sfd); fi	

distclean: clean
	-rm *.zip

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
	
