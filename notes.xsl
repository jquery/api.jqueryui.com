<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template name="note">
	<xsl:choose>
		<xsl:when test="@id = 'functional-css'">
			This widget requires some functional CSS, otherwise it won't work. If you build a custom theme, use the widget's specific CSS file as a starting point.
		</xsl:when>
	</xsl:choose>
</xsl:template>
</xsl:stylesheet>
