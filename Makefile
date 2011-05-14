VERSION=$(shell cat VERSION)
FAMILY=KePT
SANS=KePTSans
SERIF=KePTSerif
SANSFILE=keptsans
SERIFFILE=keptserif
DOCUMENTS=OFL.txt OFL-FAQ.txt FONTLOG.txt
TTFSANS=$(SANS)-Regular.ttf $(SANS)-Italic.ttf $(SANS)-Bold.ttf $(SANS)-BoldItalic.ttf \
	$(SANS)-Narrow.ttf $(SANS)-NarrowBold.ttf $(SANS)-Caption.ttf $(SANS)-CaptionBold.ttf
TTFSERIF=$(SERIF)-Regular.ttf $(SERIF)-Italic.ttf $(SERIF)-Bold.ttf $(SERIF)-BoldItalic.ttf \
	$(SERIF)-Caption.ttf $(SERIF)-CaptionItalic.ttf
SFDSANS=$(SANS)-Regular.sfd $(SANS)-Italic.sfd $(SANS)-Bold.sfd $(SANS)-BoldItalic.sfd \
	$(SANS)-Narrow.sfd $(SANS)-NarrowBold.sfd $(SANS)-Caption.sfd $(SANS)-CaptionBold.sfd
SFDSERIF=$(SERIF)-Regular.sfd $(SERIF)-Italic.sfd $(SERIF)-Bold.sfd $(SERIF)-BoldItalic.sfd \
	$(SERIF)-Caption.sfd $(SERIF)-CaptionItalic.sfd
FFSCRIPT=make-kept-fonts.ff


ttf: $(TTFSANS) $(TTFSERIF)

webfonts: OPTIONS=--webfont
webfonts: ttf
	
$(SANS)-Regular.ttf: $(FFSCRIPT) PTS55F.ttf
	$(FFSCRIPT) $(OPTIONS) --version $(VERSION) PTS55F.ttf

$(SANS)-Italic.ttf: $(FFSCRIPT) PTS56F.ttf
	$(FFSCRIPT) $(OPTIONS)--version $(VERSION) PTS56F.ttf

$(SANS)-Bold.ttf: $(FFSCRIPT) PTS75F.ttf
	$(FFSCRIPT) $(OPTIONS) --version $(VERSION) PTS75F.ttf

$(SANS)-BoldItalic.ttf: $(FFSCRIPT) PTS76F.ttf
	$(FFSCRIPT) $(OPTIONS) --version $(VERSION) PTS76F.ttf

$(SANS)-Narrow.ttf: $(FFSCRIPT) PTN57F.ttf
	$(FFSCRIPT) $(OPTIONS) --version $(VERSION) PTN57F.ttf

$(SANS)-NarrowBold.ttf: $(FFSCRIPT) PTN77F.ttf
	$(FFSCRIPT) $(OPTIONS) --version $(VERSION) PTN77F.ttf

$(SANS)-Caption.ttf: $(FFSCRIPT) PTC55F.ttf
	$(FFSCRIPT) $(OPTIONS) --version $(VERSION) PTC55F.ttf

$(SANS)-CaptionBold.ttf: $(FFSCRIPT) PTC75F.ttf
	$(FFSCRIPT) $(OPTIONS) --version $(VERSION) PTC75F.ttf

$(SERIF)-Regular.ttf: $(FFSCRIPT) PTF55F.ttf
	$(FFSCRIPT) $(OPTIONS) --version $(VERSION) PTF55F.ttf

$(SERIF)-Italic.ttf: $(FFSCRIPT) PTF56F.ttf
	$(FFSCRIPT) $(OPTIONS) --version $(VERSION) PTF56F.ttf

$(SERIF)-Bold.ttf: $(FFSCRIPT) PTF75F.ttf
	$(FFSCRIPT) $(OPTIONS) --version $(VERSION) PTF75F.ttf

$(SERIF)-BoldItalic.ttf: $(FFSCRIPT) PTF76F.ttf
	$(FFSCRIPT) $(OPTIONS) --version $(VERSION) PTF76F.ttf

$(SERIF)-Caption.ttf: $(FFSCRIPT) PTZ55F.ttf
	$(FFSCRIPT) $(OPTIONS) --version $(VERSION) PTZ55F.ttf

$(SERIF)-CaptionItalic.ttf: $(FFSCRIPT) PTZ56F.ttf
	$(FFSCRIPT) $(OPTIONS) --version VERSION PTZ56F.ttf

dist-sans-ttf: ttf
	cp FONTLOG-keptsans.txt FONTLOG.txt
	cp OFL-keptsans.txt OFL.txt
	zip keptsans-ttf-$(VERSION).zip  $(DOCUMENTS) $(TTFSANS)
	rm FONTLOG.txt OFL.txt


dist-serif-ttf: ttf
	cp FONTLOG-keptserif.txt FONTLOG.txt
	cp OFL-keptserif.txt OFL.txt
	zip keptserif-ttf-$(VERSION).zip  $(DOCUMENTS) $(TTFSERIF)
	rm FONTLOG.txt OFL.txt

dist-ttf: dist-sans-ttf dist-serif-ttf

dist: dist-ttf

clean:
	rm $(TTFSANS) $(TTFSERIF) $(SFDSANS) $(SFDSERIF)

distclean:
	rm $(TTFSANS) $(TTFSERIF) $(SFDSANS) $(SFDSERIF) *.zip

