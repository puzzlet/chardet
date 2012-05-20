Universal Encoding Detector for Python (2.6+ and 3)

Changelog
---------

3.0 (yet to be released)

* New supported encodings:
    * CP949 (Korean) - a superset of "EUC-KR" (Korean)
* Adapted to pass more test cases, imported from Mozilla, Chromium, and [ude](http://code.google.com/p/ude/)
* Changes in the names of detected encodings:
    * "GB2312" (Chinese) prober actually supports the superset "GB18030", hence renamed
    * "EUC-KR" (Korean) is superseded with its superset "CP949"

For older logs, see <http://puzzlet.github.com/chardet/docs/history.html>.


History
-------

This is a fork from Mark Pilgrim's [chardet project at Google Code](http://code.google.com/p/chardet/)(not available).

The [original revision](https://github.com/puzzlet/chardet/tree/gh-pages) of the project ([mercurial equivalent](https://bitbucket.org/puzzlet/chardet/changeset/0806d726c97b)) also serves as the original website of the project, which used to be at <http://chardet.feedparser.org/>(again, not available):

* <http://puzzlet.github.com/chardet/>
* <http://puzzlet.github.com/chardet/docs/>

