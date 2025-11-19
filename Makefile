help:
	@echo "Makefile commands:"
	@echo "  update   - Update the 'include/barry' directory with the latest from the barry repository."
	@echo "  docs     - Generate documentation using roxygen2."
	@echo "  check    - Check the package using devtools."
	@echo "  install  - Install the package using devtools."

update:
	git clone --depth=1 https://github.com/USCbiostats/barry.git barry-tmp && \
	rsync -avz --delete barry-tmp/include/barry inst/include/. && \
	rsync -avz --delete barry-tmp/design/logo.svg man/figures/.
	rm -rf barry-tmp

docs:
	Rscript --vanilla -e 'devtools::document()'

check:
	Rscript --vanilla -e 'devtools::check()'

install:
	Rscript --vanilla -e 'devtools::install()'

.PHONY: update docs check install