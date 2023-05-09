<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
                xmlns:sxl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="utf-8" indent="yes"/>

    <xsl:template match="celler">
        <html>
            <head>
                <title>factures</title>
                <link rel="stylesheet" herf="factures.css"/>
            </head>

            <body>
                <table>
                    <!--
                    per selecionar un client en lloc de fer un if tambe o podem posar a un select
                    <xsl:apply-templates select="factures/factura[comprador/@codi = 'C00032']"/>
                    -->
                    <xsl:apply-templates select="factures/factura"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="factura">
        <xsl:if test="comprador/@codi = 'C00032'">
            <tr>
                <td><sxl:value-of select="@numero"/></td>
                <td><sxl:value-of select="comprador/@codi"/></td>
                <xsl:for-each select="unitats">
                    <td><sxl:value-of select="@codi"/></td>
                    <td><sxl:value-of select="."/></td>
                </xsl:for-each>
            </tr>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
