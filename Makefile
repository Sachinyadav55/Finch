build: makedirs roxygen
	R CMD build Finch
	mv Finch_*.tar.gz build/

makedirs:
	mkdir -p build

clean:
	rm -rf build

roxygen:
	R CMD BATCH --no-save  pkgsrc/roxygenize.R /dev/stdout

vignette: makedirs
	cp -rf Finch/vignettes build
	cp pkgsrc/vignette/Makefile build/vignettes
	make -C build/vignettes

manual: makedirs
	R CMD Rd2pdf --no-preview Finch
	mv -f Finch.pdf build/

