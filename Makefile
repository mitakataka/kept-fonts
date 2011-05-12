VERSION=`cat VERSION`
FAMILY=KePT
SANS=KePTSans
SERIF=KePTSerif
TTFSANS=$(SANS)-Regular.ttf $(SANS)-Italic.ttf $(SANS)-Bold.ttf $(SANS)-BoldItalic.ttf \
	$(SANS)-Narrow.ttf $(SANS)-NarrowBold.ttf $(SANS)-Caption.ttf $(SANS)-CaptionBold.ttf
TTFSERIF=$(SERIF)-Regular.ttf $(SERIF)-Italic.ttf $(SERIF)-Bold.ttf $(SERIF)-BoldItalic.ttf \
	$(SERIF)-Caption.tff $(SERIF)-CaptionItalic.ttf
SFDSANS=$(SANS)-Regular.sfd $(SANS)-Italic.sfd $(SANS)-Bold.sfd $(SANS)-BoldItalic.sfd \
	$(SANS)-Narrow.sfd $(SANS)-NarrowBold.sfd $(SANS)-Caption.sfd $(SANS)-CaptionBold.sfd
SFDSERIF=$(SERIF)-Regular.sfd $(SERIF)-Italic.sfd $(SERIF)-Bold.sfd $(SERIF)-BoldItalic.sfd \
	$(SERIF)-Caption.sfd $(SERIF)-CaptionItalic.sfd
FFSCRIPT=make-kept-fonts.ff

all: $(TTFSANS) $(TTFSERIF) $(SFDSANS) $(SFDSERIF)

$(SANS)-Regular.ttf: $(FFSCRIPT) PTS55F.ttf
	$(FFSCRIPT) --version VERSION PTS55F.ttf

$(SANS)-Italic.ttf: $(FFSCRIPT) PTS56F.ttf
	$(FFSCRIPT) --version VERSION PTS56F.ttf

$(SANS)-Bold.ttf: $(FFSCRIPT) PTS75F.ttf
	$(FFSCRIPT) --version VERSION PTS75F.ttf

$(SANS)-BoldItalic.ttf: $(FFSCRIPT) PTS76F.ttf
	$(FFSCRIPT) --version VERSION PTS76F.ttf

$(SANS)-Narrow.ttf: $(FFSCRIPT) PTN57F.ttf
	$(FFSCRIPT) --version VERSION PTN57F.ttf

$(SANS)-NarrowBold.ttf: $(FFSCRIPT) PTN77F.ttf
	$(FFSCRIPT) --version VERSION PTN77F.ttf

$(SANS)-Caption.ttf: $(FFSCRIPT) PTC55F.ttf
	$(FFSCRIPT) --version VERSION PTC55F.ttf

$(SANS)-CaptionBold.ttf: $(FFSCRIPT) PTC75F.ttf
	$(FFSCRIPT) --version VERSION PTC75F.ttf

$(SERIF)-Regular.ttf: $(FFSCRIPT) PTF55F.ttf
	$(FFSCRIPT) --version VERSION PTF55F.ttf

$(SERIF)-Italic.ttf: $(FFSCRIPT) PTF56F.ttf
	$(FFSCRIPT) --version VERSION PTF56F.ttf

$(SERIF)-Bold.ttf: $(FFSCRIPT) PTF75F.ttf
	$(FFSCRIPT) --version VERSION PTF75F.ttf

$(SERIF)-BoldItalic.ttf: $(FFSCRIPT) PTF76F.ttf
	$(FFSCRIPT) --version VERSION PTF76F.ttf

$(SERIF)-Caption.ttf: $(FFSCRIPT) PTZ55F.ttf
	$(FFSCRIPT) --version VERSION PTZ55F.ttf

$(SERIF)-CaptionItalic.ttf: $(FFSCRIPT) PTZ56F.ttf
	$(FFSCRIPT) --version VERSION PTZ56F.ttf

