.PHONY : all pdf images web install
all: pdf web install

pdf:
	pretext build print --clean
	
images:
	pretext generate latex-image

web:
	pretext build web

install:
	cp output/print/condensed.pdf ~/www/papers/condensed.pdf;
	scp output/print/condensed.pdf web:www/papers/condensed.pdf;
	rsync -au output/web/ ~/www/condensed/;
	rsync -au -e "ssh" output/web/ web:www/condensed/

