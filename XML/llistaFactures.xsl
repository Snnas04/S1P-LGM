<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <xsl:output method="html" encoding="utf-8" indent="yes"/>

    <xsl:template match="celler">
        <html>
            <head>
                <title>factures</title>
                <link href="estil.css" rel="stylesheet"/>
            </head>
            <body>
                <table>
                    <xsl:apply-templates select="//client"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="client">
        <xsl:variable name="codi_client" select="@codi"/>
        <xsl:variable name="filtre" select="//factura[comprador/@codi=$codi_client and count(unitats)=4]"/>
        <xsl:variable name="quants" select="count($filtre)"/>
        <xsl:if test="$quants!=0">
            <tr>
                <td><xsl:value-of select="$codi_client"/></td>
                <td><xsl:value-of select="nom"/></td>
                <xsl:for-each select="$filtre">
                    <td><xsl:value-of select="@numero"/></td>
                </xsl:for-each>
            </tr>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>
