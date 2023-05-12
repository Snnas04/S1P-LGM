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

        <xsl:for-each select="unitats">
            <xsl:variable name="codi_producte" select="@codi"/>
            <xsl:variable name="suma_productes" select="sum(unitats * //producte[@codi = $codi_producte]/@preu)"/>
            <tr>
                <td><xsl:value-of select="@codi"/></td>
                <xsl:apply-templates select="//producte[@codi = $codi_producte]"/>
                <td><xsl:value-of select="."/></td>
                <td><xsl:value-of select="format-number(. * //producte[@codi = $codi_producte]/@preu, '#.00 €')"/></td>
                <td><xsl:value-of select="format-number($suma_productes, '#.00 €')"/></td>
            </tr>
        </xsl:for-each>

    </xsl:template>

    <xsl:template match="producte">
        <td><xsl:value-of select="."/></td>
        <td><xsl:value-of select="@preu"/> €</td>
    </xsl:template>

    <xsl:template match="client">
        <td colspan="2"><xsl:value-of select="nom/."/></td>
    </xsl:template>

</xsl:stylesheet>