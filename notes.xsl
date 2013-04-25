<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template name="note">
	<xsl:choose>
		<xsl:when test="@id = 'functional-css'">
			This widget requires some functional CSS, otherwise it won't work. If you build a custom theme, use the widget's specific CSS file as a starting point.
		</xsl:when>
		<xsl:when test="@id = 'native-change-warning'">
			This widget manipulates its element's value programmatically, therefore a native change event may not be fired when the element's value changes.
		</xsl:when>
		<xsl:otherwise>
			<xsl:apply-templates/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
</xsl:stylesheet>
