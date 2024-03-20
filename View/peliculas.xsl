<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" version="4.0" encoding="UTF-8" indent="yes"/>

<xsl:template match="/peliculas">

<style>

th
{
    padding-top: 15px;
    padding-bottom: 15px;
    padding-left: 20px;
    padding-right: 20px;
    text-align: center;
}

td
{
	padding-left: 15px;
	padding-right: 15px;
	text-align: center;
}


.lista
{
    padding-right: 15px;
    text-align: left;
}

</style>

<html>

    <head>

    </head>

    <body style="text-align: center">

        <h1>PELÍCULAS</h1>

        <table style="margin: 0 auto; background-color: black">
        
            <tr style="background-color: #65F069">
            
                <th>Título</th>
                <th>Título original</th>
                <th>Nacionalidad</th>
                <th>Idioma</th>
                <th>Año de producción</th>
                <th>Director</th>
                <th>Intérpretes</th>
               
            </tr>

            <xsl:for-each select="pelicula">
            
                <tr style="background-color: #C2F3C4">
                
                    <td><xsl:value-of select="titulo"/></td>

                    <td><xsl:value-of select="tit.ori"/></td>

                    <td>
                    
                    <ul class="lista">
                
                        <xsl:for-each select="nacionalidades/nacionalidad">

                        <li><xsl:value-of select="current()"/></li>

                        </xsl:for-each>

                    </ul>

                    </td>

                    <td>
                    
                    <ul class="lista">
                
                        <xsl:for-each select="idiomas/idioma">

                        <li><xsl:value-of select="current()"/></li>

                        </xsl:for-each>

                    </ul>

                    </td>

                    <td><xsl:value-of select="anio.produccion"/></td>

                    <td>
                    
                    <ul class="lista">
                
                        <xsl:for-each select="directores/director">

                        <li><xsl:value-of select="current()"/></li>

                        </xsl:for-each>

                    </ul>

                    </td>

                    <td>
                    
                    <ul class="lista">
                
                        <xsl:for-each select="interpretes/interprete">

                        <li><xsl:value-of select="current()"/></li>

                        </xsl:for-each>

                    </ul>
                                        
                    </td>

                </tr>
                
            </xsl:for-each>

        </table>

    </body>

</html>

</xsl:template>

</xsl:stylesheet>