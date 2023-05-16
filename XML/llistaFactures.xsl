<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <xsl:output method="html" encoding="utf-8" indent="yes"/>

    <xsl:template match="celler">
        <html>
            <head>
                <title>factures</title>
                <link href="llista.css" rel="stylesheet"/>
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
        <tr id="factura-client">

            <td colspan="2"><xsl:value-of select="@numero"/></td>
            <xsl:apply-templates select="//client[@codi = $codi_client]"/>
        </tr>

        <tr id="columnes">
            <td>Codi</td>
            <td>Producte</td>
            <td>Preu</td>
            <td>Unitats</td>
            <td>Total</td>
        </tr>

        <xsl:variable name="total">
            <xsl:for-each select="unitats">
                <xsl:variable name="codi_producte" select="@codi"/>
                <xsl:variable name="preu" select="//producte[@codi = $codi_producte]/@preu"/>
                <xsl:variable name="quantitat" select="."/>
                <xsl:element name="subtotal">
                    <xsl:value-of select="$preu * quantitat"/>
                </xsl:element>
                <xsl:value-of select="subtotal"/>
            </xsl:for-each>
        </xsl:variable>
        
        <xsl:for-each select="unitats">
            <xsl:variable name="codi_producte" select="@codi"/>
            <tr>
                <td><xsl:value-of select="@codi"/></td>
                <xsl:apply-templates select="//producte[@codi = $codi_producte]"/>
                <td><xsl:value-of select="."/></td>
                <td><xsl:value-of select="format-number(. * //producte[@codi = $codi_producte]/@preu, '#,00 €')"/></td>
            </tr>
        </xsl:for-each>

        <tr>
            <td colspan="2">Total de la Factura</td>
            <td colspan="3">
                <xsl:value-of select="format-number(sum($total/subtotal), '#,00 €')"/>
            </td>
        </tr>
        
    </xsl:template>

    <xsl:template match="producte">
        <td><xsl:value-of select="."/></td>
        <td><xsl:value-of select="format-number(@preu, '#,00€')"/></td>
    </xsl:template>

    <xsl:template match="client">
        <td colspan="2"><xsl:value-of select="nom/."/></td>
    </xsl:template>
    
</xsl:stylesheet>