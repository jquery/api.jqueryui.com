<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:import href="entries2html-base.xsl"/>
<xsl:output method="html" omit-xml-declaration="yes"/>

<xsl:template name="example-code">
	<xsl:param name="name"/>
	<xsl:param name="css"/>
	<xsl:param name="html"/>
	<xsl:param name="code"/>
	<code data-linenum="true">
&lt;!doctype html&gt;
&lt;html lang="en"&gt;
&lt;head&gt;
	&lt;meta charset="utf-8"&gt;
	&lt;title&gt;<xsl:value-of select="$name"/> demo&lt;/title&gt;
	&lt;link rel="stylesheet" href="/resources/jquery-ui.css"&gt;<xsl:if test="$css">
	&lt;style&gt;<xsl:value-of select="$css"/>	&lt;/style&gt;</xsl:if>
	&lt;script src="/resources/jquery.js"&gt;&lt;/script&gt;
	&lt;script src="/resources/jquery-ui.js"&gt;&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
<xsl:value-of select="$html"/>
&lt;script&gt;<xsl:value-of select="$code"/>&lt;/script&gt;

&lt;/body&gt;
&lt;/html&gt;
</code>
</xsl:template>

</xsl:stylesheet>
