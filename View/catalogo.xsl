<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" version="4.0" encoding="UTF-8" indent="yes"/>

<xsl:template match="/catalog">

<html>
  <head>
	<link rel="stylesheet" type="text/css" href="catalogo.css"/>
  </head>
  <body>

  <h2>Colección de discos</h2>
    <table border="1">
      <tr class="header">
        <th>Id</th>
        <th>Title</th>
        <th>Artist</th>
      </tr>

      <xsl:for-each select="cd">
        <tr>
          <td><xsl:value-of select="@id"/></td>
          <td><xsl:value-of select="title"/></td>

          <!-- Estilo a una columna de la tabla -->

          <xsl:element name="td">
            <xsl:attribute name="style">background-color:lightyellow</xsl:attribute>
            <xsl:attribute name="lang">en</xsl:attribute>
            <xsl:value-of select="artist" />
          </xsl:element>		

          <xsl:comment>Generado mediante XSLT</xsl:comment>		

        </tr>
      </xsl:for-each>
    </table>

  <hr class="hr1"/>
  <hr class="hr2"/>

  <h2>Discos ordenados</h2>
    <table border="1">
      <tr class="header">
        <th>Title</th>
        <th>Artist</th>
      </tr>
      <xsl:for-each select="cd">
		<xsl:sort select="artist"/>
      <tr>
        <td><xsl:value-of select="title"/></td>
        <td><xsl:value-of select="artist"/></td>
      </tr>
      </xsl:for-each>
    </table>

  <hr class="hr1"/>
  <hr class="hr2"/>

  <h2>Discos de Bob Dylan (condición XPath)</h2>
    <table border="1">
      <tr class="header">
        <th>Title</th>
        <th>Artist</th>
      </tr>
	  <xsl:for-each select="cd[artist='Bob Dylan']">
      <tr>
        <td><xsl:value-of select="title"/></td>
        <td><xsl:value-of select="artist"/></td>
      </tr>
      </xsl:for-each>
    </table>

  <hr class="hr1"/>
  <hr class="hr2"/>

  <h2>Discos de Bob Dylan (condición if)</h2>
    <table border="1">
      <tr class="header">
        <th>Title</th>
        <th>Artist</th>
      </tr>
	  <xsl:for-each select="cd">

		<xsl:if test="artist='Bob Dylan'">
			<tr>
				<td><xsl:value-of select="title"/></td>
				<td><xsl:value-of select="artist"/></td>
			</tr>
		</xsl:if>
      </xsl:for-each>
    </table>

  <hr class="hr1"/>
  <hr class="hr2"/>

  <h2>Discos baratos</h2>
    <table border="1">
      <tr class="header">
        <th>Title</th>
        <th>Artist</th>
      </tr>
      <xsl:for-each select="cd">
	      <xsl:if test="price &lt; 10">
          <tr>
            <td><xsl:value-of select="title"/></td>
            <td><xsl:value-of select="artist"/></td>
          </tr>
	       </xsl:if>
      </xsl:for-each>
    </table>

  <hr class="hr1"/>
  <hr class="hr2"/>
  
  <h2>Condiciones múltiples</h2>
    <table border="1">
      <tr class="header">
        <th>Title</th>
        <th>Artist</th>
      </tr>
      <xsl:for-each select="cd">
      <tr>
        <td><xsl:value-of select="title"/></td>
        <xsl:choose>
          <xsl:when test="price &gt; 10">
            <td class="alto">
            <xsl:value-of select="artist"/></td>
          </xsl:when>
          <xsl:otherwise>
            <td><xsl:value-of select="artist"/></td>
          </xsl:otherwise>
        </xsl:choose>
      </tr>
      </xsl:for-each>
    </table>

  <hr class="hr1"/>
  <hr class="hr2"/>
	
  <h2>Condiciones múltiples con más ramas</h2>
    <table border="1">
      <tr class="header">
        <th>Title</th>
        <th>Artist</th>
      </tr>
      <xsl:for-each select="cd">
      <tr>
        <td><xsl:value-of select="title"/></td>
        <xsl:choose>
          <xsl:when test="price &gt; 10">
            <td class="alto">
            <xsl:value-of select="artist"/></td>
          </xsl:when>
          <xsl:when test="price &gt; 9">
            <td class="medio">
            <xsl:value-of select="artist"/></td>
          </xsl:when>
          <xsl:otherwise>
            <td class="bajo">
        <xsl:value-of select="artist"/></td>
          </xsl:otherwise>
        </xsl:choose>
      </tr>
      </xsl:for-each>
    </table>	

  <hr class="hr1"/>
  <hr class="hr2"/>
	
	<h2>Artistas de los discos</h2>
    <ul>
    <xsl:for-each select="cd/artist">
      <li>
      <xsl:value-of select="current()"/>
      </li>
    </xsl:for-each>
    </ul>

  <hr class="hr1"/>
  <hr class="hr2"/>

  <h2>Títulos de los discos</h2>
    <table border="1">
      <tr class="header">
        <th>Títulos de todos los discos</th>
      </tr>
		  <tr>
        <td>
		    <xsl:for-each select="cd/title">
          <xsl:if test="position() = 1">
            <xsl:value-of select="current()"/>
          </xsl:if>
		      <xsl:if test="position() &gt; 1">
            - <xsl:value-of select="current()"/>  
          </xsl:if> 
		    </xsl:for-each>
		    </td>
      </tr>
    </table>

  <hr class="hr1"/>
  <hr class="hr2"/>
	
  <h2>Ids de los discos</h2>
    <table border="1">
      <tr class="header">
        <th>Ids de todos los discos</th>
      </tr>
		  <tr>
        <td>
        <xsl:for-each select="cd/@id">
          <xsl:if test="position() = 1">
            <xsl:value-of select="current()"/>
          </xsl:if>
          <xsl:if test="position() &gt; 1">
            - <xsl:value-of select="current()"/>  
          </xsl:if>
        </xsl:for-each>
        </td>
     </tr>
    </table>

  <hr class="hr1"/>
  <hr class="hr2"/>

	<h2>Número total de discos: <xsl:value-of select="count(cd)"/></h2>

  <hr class="hr1"/>
  <hr class="hr2"/>

  <h2 style="color: green">Opción 1</h2>

	<xsl:element name="h2">
		<xsl:element name="a">
			<xsl:attribute name="href">
				<xsl:value-of select="store/www"/>
			</xsl:attribute>
			<xsl:value-of select="store/name"/>
		</xsl:element>
	</xsl:element>

  <hr class="hr1"/>
  <hr class="hr2"/>
		
  <h2 style="color: green">Opción 2</h2>

	<h2><a href="{store/www}"><xsl:value-of select="store/name"/></a></h2>

  <hr class="hr1"/>
  <hr class="hr2"/>
	
  <h2 style="color: green">Opción 3</h2>

	<xsl:variable name="link" select="store/www" />
	<h2><a href="{$link}"><xsl:value-of select="store/name"/></a></h2>
	
	</body>
  </html>
 </xsl:template>
</xsl:stylesheet>