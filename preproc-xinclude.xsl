<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <!-- IdentityTransform -->
  <!-- For more info, see http://www.usingxml.com/Transforms/XslIdentity or google 'identity xsl' -->
  <xsl:template match="/ | @* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="widget-inherit">
    <xi:include xmlns:xi="http://www.w3.org/2001/XInclude">
        <xsl:attribute name="href">../inherits/<xsl:value-of select="@id"/>.xml</xsl:attribute>
    </xi:include>
  </xsl:template>
</xsl:stylesheet>