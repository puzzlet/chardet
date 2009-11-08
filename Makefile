VERSION = 1.0.1
XSLTPROC = xsltproc
XMLLINT = xmllint
PYTHON2 = python2.6
PYTHON3 = python3

test:
	cd src-python2/chardet; \
	${PYTHON2} test.py "../../tests/*/*.xml"; \
	cd ..
	cd src-python3/chardet; \
	${PYTHON3} test.py "../../tests/*/*.xml"; \
	cd ..

validate:
	${XMLLINT} --noout --valid docs/xml/chardet.xml

.PHONY: docs

docs: validate
	cd docs; \
	${XSLTPROC} xsl/html.xsl xml/chardet.xml; \
	${PYTHON2} ../util/colorize.py . 0; \
	cd ..

clean:
	rm -f src-python2/chardet/*.pyc
	rm -f src-python3/chardet/*.pyc
	rm -f util/*.pyc
	rm -rf build
	rm -rf dist
	rm -rf docs/dist

maintainer-clean: clean
	rm -f docs/*.html

release-check:
	${PYTHON2} util/releasecheck.py

dist: validate
	cd docs; \
	mkdir -p dist/docs/; \
	rsync -az ../css dist/docs/; \
	rsync -az images dist/docs/; \
	${XSLTPROC} xsl/htmldist.xsl xml/chardet.xml; \
	${PYTHON2} ../util/colorize.py dist/docs/ 0; \
	cd ..

	mkdir -p dist/python2-chardet-${VERSION}
	cp COPYING dist/python2-chardet-${VERSION}
	cp setup.py dist/python2-chardet-${VERSION}
	rsync -az src-python2/chardet dist/python2-chardet-${VERSION}
	rsync -az docs/dist/docs dist/python2-chardet-${VERSION}
	cd dist; \
	tar cfz python2-chardet-${VERSION}.tgz python2-chardet-${VERSION}; \
	cd ..

	mkdir -p dist/python3-chardet-${VERSION}
	cp COPYING dist/python3-chardet-${VERSION}
	cp setup.py dist/python3-chardet-${VERSION}
	rsync -az src-python3/chardet dist/python3-chardet-${VERSION}
	rsync -az docs/dist/docs dist/python3-chardet-${VERSION}
	cd dist; \
	tar cfz python3-chardet-${VERSION}.tgz python3-chardet-${VERSION}; \
	cd ..

	mkdir -p dist/chardet-tests-${VERSION}
	rsync -az tests dist/chardet-tests-${VERSION}
	cd dist; \
	tar cfz chardet-tests-${VERSION}.tgz chardet-tests-${VERSION}; \
	cd ..

	ls -l dist

all: validate release-check maintainer-clean docs dist
