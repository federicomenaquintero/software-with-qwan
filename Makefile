SOURCES=			\
	software-with-qwan.xml

IMAGES=					\
	1.png				\
	2.png				\
	3.png				\
	4.png				\
	5.png

SOURCE_MAIN=software-with-qwan.xml

CSS=docbook.css

STYLESHEET=/usr/share/xml/docbook/stylesheet/nwalsh/current/xhtml/onechunk.xsl
#STYLESHEET=/usr/share/xml/docbook/stylesheet/nwalsh/html/onechunk.xsl
#STYLESHEET=/usr/share/sgml/docbook/xsl-stylesheets-1.65.1-2/xhtml/onechunk.xsl
#STYLESHEET=/usr/share/yelp/xslt/db2html.xsl

OUTPUTDIR=html

all: html.stamp

html.stamp: $(SOURCES) $(IMAGES)
	mkdir -p $(OUTPUTDIR)
	cp $(IMAGES) $(OUTPUTDIR)/
	xsltproc -o $(OUTPUTDIR)/ --stringparam html.stylesheet $(CSS) $(STYLESHEET) \
		$(SOURCE_MAIN)
	cp $(CSS) $(OUTPUTDIR)/
	touch html.stamp

#web: html.stamp
#	rm -rf /home/federico/public_html/misc/novell/admin-tools
#	cp -r html /home/federico/public_html/misc/novell/admin-tools
#	update-web

clean:
	rm -f html.stamp
	rm -rf $(OUTPUTDIR)
	rm -f *~
