<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
  <table border="2">
    <tr height="100">
      <xsl:for-each select="fila/num">  
      <xsl:sort select="."/>
      <td width="100" align="center" style="text-weight: bold;"><xsl:value-of select="."/></td>
      </xsl:for-each>
    </tr>
  </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet> 