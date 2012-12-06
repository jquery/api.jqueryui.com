<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:import href="node_modules/grunt-jquery-content/tasks/jquery-xml/entries2html-base.xsl"/>
<xsl:import href="notes.xsl"/>

<xsl:template name="example-code">
&lt;!doctype html&gt;
&lt;html lang="en"&gt;
&lt;head&gt;
	&lt;meta charset="utf-8"&gt;
	&lt;title&gt;<xsl:value-of select="//entry/@name"/> demo&lt;/title&gt;
	&lt;link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css"&gt;
	&lt;link rel="stylesheet" href="http://view.jqueryui.com/selectmenu/themes/base/jquery.ui.selectmenu.css"&gt;<xsl:if test="css">
	&lt;style&gt;<xsl:value-of select="css/text()"/>	&lt;/style&gt;</xsl:if>
	&lt;script src="http://code.jquery.com/jquery-1.8.3.js"&gt;&lt;/script&gt;
	&lt;script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"&gt;&lt;/script&gt;
	&lt;script src="http://view.jqueryui.com/selectmenu/ui/jquery.ui.selectmenu.js"&gt;&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
<xsl:value-of select="html/text()"/>
&lt;script&gt;<xsl:value-of select="code/text()"/>&lt;/script&gt;

&lt;/body&gt;
&lt;/html&gt;
</xsl:template>

<!-- <template name="core-link"/> will generate a link to the documentation for
the method of the same name from jQuery core -->
<xsl:template match="//placeholder[@name = 'core-link']">
	<a>
		<xsl:attribute name="href">
			<xsl:value-of select="concat('http://api.jquery.com/', ancestor::entry/@name)"/>
		</xsl:attribute>
		<code>
			<xsl:text>.</xsl:text>
			<xsl:value-of select="ancestor::entry/@name"/>
			<xsl:text>()</xsl:text>
		</code>
	</a>
</xsl:template>

</xsl:stylesheet>
