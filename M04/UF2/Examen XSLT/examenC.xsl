<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
    <html>
          <head/>
      <body>
      <table border="1">
        <tr bgcolor="yellow">
          <th>Ciutat</th>
          <th>Latitud</th>
          <th>Longitud</th>
          <th>País</th>
        </tr>
    <xsl:for-each select="mondial/country/city[@latitude&gt;41.1]">
      <xsl:sort select="../name" order='descending'/>
          <tr>
            <td><xsl:value-of select="name"/></td>
            <td><xsl:value-of select="@latitude"/></td>
            <td><xsl:value-of select="@longitude"/></td>
            <td><xsl:value-of select="../name"/></td>
          </tr>
    </xsl:for-each>
      </table>
      </body>
    </html>
</xsl:template>

</xsl:stylesheet> 