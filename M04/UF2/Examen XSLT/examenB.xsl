<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
    <html>
          <head/>
      <body>
      <table border="1">
        <tr bgcolor="yellow">
          <th>Pais</th>
          <th>Capital</th>
        </tr>
    <xsl:for-each select="mondial/country/encompassed[@continent='f0_119']">

        <tr>
          <td><xsl:value-of select="../name"/></td>
          <td><xsl:value-of select="../city[@id=(../@capital or ../../@capital)]/name"/></td>
        </tr>

    </xsl:for-each>
      </table>
      </body>
    </html>
</xsl:template>

</xsl:stylesheet> 