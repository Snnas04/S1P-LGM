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
                    <xsl:apply-templates select="//factura"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="factura">
        <xsl:variable name="codi_client" select="comprador/@codi"/>
        <xsl:variable name="client" select="//client[@codi=$codi_client]"/>
        <tr>
            <td><xsl:value-of select="@numero"/></td>
            <td><xsl:value-of select="$client/nom"/></td>
        </tr>
        <xsl:for-each select="unitats">
            <xsl:variable name="codi_producte" select="@codi"/>
            <xsl:variable name="producte" select="//producte[@codi=$codi_producte]"/>
            <tr>
                <td><xsl:value-of select="$codi_producte"/></td>
                <td><xsl:value-of select="producte"/></td>
                <td><xsl:value-of select="."/></td>
                <td><xsl:value-of select="producte/@preu"/></td>
                <td><xsl:value-of select=". * $producte/@preu"/></td>
            </tr>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>
