api.jqueryui.com
================

## Building

### Requirements
* <a href="http://www.xmlsoft.org/">libxml2</a>
* <a href="http://xmlsoft.org/XSLT/">libxslt</a>

The `xmllint` and `xsltproc` utilities need to be in your path. If you are on Windows, you can get libxml2 and
libxslt from <a href="http://sourceforge.net/projects/gnuwin32/files/">GnuWin32</a>.

### Build

1. `npm install`
2. cp config-sample.json config.json
3. # Edit config.json to set up deployment target and auth
4. `grunt`
