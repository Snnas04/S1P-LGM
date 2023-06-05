<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" encoding="utf-8" indent="yes"/>

    <xsl:template match="celler" >
        <html>
            <head>
                <title>Factures</title>
                <link href="estil.css" rel="stylesheet"/>
            </head>
            <body>
                <xsl:apply-templates select="//factura"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="factura">
        <xsl:variable name="codi_client" select="comprador/@codi"/>
        <xsl:variable name="client" select="//client[@codi=$codi_client]"/>

        <div class="container">
            <div class="company-info">
                <!-- Nom de l'empresa -->
                <h2>(Vins Nadal]</h2>
                <!-- Direccio de l'empresa -->
                <div>Adreça: c/ Ramon Llull, 2</div>
                <div>Binissalem</div>
                <div>Teléfono: 971 511 058</div>
            </div>

            <div class="customer-details">
                <!-- codi + nom client -->
                <div class="titol" id="dadesClient">Código de Factura:</div>
                <div class="escrit" id="dadesClient"><xsl:value-of select="@numero"/></div>

                <div class="titol" id="dadesClient">Nombre del Cliente:</div>
                <div class="escrit" id="dadesClient"><xsl:value-of select="$client/nom"/></div>

                <div class="titol" id="dadesClient">Código del Cliente:</div>
                <div class="escrit" id="dadesClient"><xsl:value-of select="$codi_client"/></div>
                <!-- Telefons clients -->
                <div class="titol" id="dadesClient">Teléfonos:</div>
                <div class="tel">
                    <xsl:choose>
                        <xsl:when test="$client/telefon">
                            <xsl:value-of select="$client/telefon[1]"/>
                        </xsl:when>
                        <xsl:otherwise>/</xsl:otherwise>
                    </xsl:choose>
                </div>
                <div class="tel">
                    <xsl:choose>
                        <xsl:when test="$client/telefon[2]">
                            <xsl:value-of select="$client/telefon[2]"/>
                        </xsl:when>
                        <xsl:otherwise>/</xsl:otherwise>
                    </xsl:choose>
                </div>
            </div>

            <table class="invoice-table">
                <tr>
                    <th>Producto</th>
                    <th>Cantidad</th>
                    <th>Precio Unitario</th>
                    <th>Subtotal</th>
                </tr>

                <xsl:for-each select="unitats">
                    <xsl:variable name="codi_producte" select="@codi"/>
                    <xsl:variable name="producte" select="//producte[@codi=$codi_producte]"/>

                    <tr>
                        <td><xsl:value-of select="$producte"/></td>
                        <td><xsl:value-of select="."/></td>
                        <td><xsl:value-of select="format-number($producte/@preu, '#.00 €')"/></td>
                        <td><xsl:value-of select="format-number(./text() * $producte/@preu, '#.00 €')"/></td>
                    </tr>
                </xsl:for-each>

                <xsl:variable name="total">
                    <xsl:for-each select="unitats">
                        <xsl:variable name="codi_producte" select="@codi"/>
                        <xsl:variable name="producte" select="//producte[@codi=$codi_producte]"/>
                        <parcial>
                            <xsl:value-of select="number(.) * $producte/@preu"/>
                        </parcial>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="totalRows" select="count(unitats)"/>
                <xsl:variable name="emptyRows" select="12 - $totalRows"/>

                <xsl:if test="$emptyRows &gt; 0">
                    <xsl:for-each select="1 to $emptyRows">
                        <tr>
                            <td>&#160;</td>
                            <td>&#160;</td>
                            <td>&#160;</td>
                            <td>&#160;</td>
                        </tr>
                    </xsl:for-each>
                </xsl:if>

                <tr>
                    <td colspan="3" class="total">Total:</td>
                    <td>
                        <xsl:value-of select="format-number(sum($total/parcial), '#.00 €')"/>
                    </td>
                </tr>

                <tr>
                    <td colspan="3" class="total">IVA (21%):</td>
                    <td>
                        <xsl:value-of select="format-number(sum($total/parcial) * 0.21, '#.00 €')"/>
                    </td>
                </tr>

                <tr>
                    <td colspan="3" class="total">Total + IVA:</td>
                    <td>
                        <xsl:value-of select="format-number(sum($total/parcial) * 1.21, '#.00 €')"/>
                    </td>
                </tr>
            </table>

            <table class="invoice-bottom">
                <tr>
                    <td>
                        <div class="customer-signature">
                            <div class="titol">Firma del Cliente:</div>
                            <div class="signature"><xsl:value-of select="concat(substring($client/nom, 1, 1), '.', substring-after($client/nom, ','))"/></div>
                        </div>
                    </td>

                    <td>
                        <div class="payment-method">
                            <div class="titol">Método de Pago:</div>
                            <div class="method">
                                <xsl:choose>
                                    <xsl:when test="position() mod 4 = 0">
                                        <img src="../img/efectovo.png" alt="Efectivo"/>
                                    </xsl:when>
                                    <xsl:when test="position() mod 4 = 1">
                                        <img src="../img/mastercard.png" alt="Mastercard"/>
                                    </xsl:when>
                                    <xsl:when test="position() mod 4 = 2">
                                        <img src="../img/visa.png" alt="VISA"/>
                                    </xsl:when>
                                    <xsl:when test="position() mod 4 = 3">
                                        <img src="../img/paypal.png" alt="PayPal"/>
                                    </xsl:when>
                                </xsl:choose>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </xsl:template>
</xsl:stylesheet>
