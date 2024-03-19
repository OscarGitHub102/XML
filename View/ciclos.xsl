<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" version="4.0" encoding="UTF-8" indent="yes"/>

<xsl:template match="/ies">

<html>

    <head>

        <style>

            th, td
            {
                padding-left: 15px;
                padding-right: 15px;
                padding-top: 10px;
                padding-bottom: 10px;
                text-align: center;
            }

        </style>

    </head>

    <body>    

        <table style="background-color: black">
        
        <tr style="background-color: #CB6BF2">
        
            <th>Nombre</th>
            <th>Nivel educativo</th>
            <th>Decreto</th>
            <th>Alumnos</th>
        
        </tr>

        <xsl:for-each select="ciclos/ciclo">
        
        <tr style="background-color: #EDA7E7">
        
            <td style="font-style: italic"><xsl:value-of select="nombre"/></td>
            
            <td>Grado <xsl:value-of select="grado"/></td>

            <td>
            <a href="{decreto/@enlace}">Ver Decreto <xsl:value-of select="decreto/@año"/></a>
            </td>

            <xsl:choose>
            <xsl:when test="alumnos/@numero &gt; 30">
            <td style="color: red; font-weight: bold">
                <xsl:value-of select="alumnos/@numero"/>
            </td>
            </xsl:when>
            <xsl:when test="alumnos/@numero &gt; 25">
            <td style="color: green; font-weight: bold">
                <xsl:value-of select="alumnos/@numero"/>
            </td>
            </xsl:when>
            <xsl:otherwise>
            <td style="color: black; font-weight: bold">
                <xsl:value-of select="alumnos/@numero"/>
            </td>
            </xsl:otherwise>
            </xsl:choose>

        </tr>
            
        </xsl:for-each>

        </table>

    </body>

</html>

</xsl:template>

</xsl:stylesheet>