<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:output method="html" version="4.0" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">

    <style>
    
    .unordered
    {

      list-style-type: disc ;

    }

    #cuerpo
    {

      background-color: lightblue;

    }
    
    </style>

    <html>

      <head>
      
      </head>

      <body id="cuerpo">
        
        <h1>PAÍSES</h1>

          <ol>
          
            <xsl:for-each select="paises/pais">
		                
              <li>
                 
                <xsl:value-of select="nombre"/>

                <ul>
                 
                  <li>
                  
                    <p>Capital: <xsl:value-of select="capital"/></p>
                  
                  </li>

                  <li>
                  
                    <p>Continente: <xsl:value-of select="continente"/></p>

                  </li>

                  <li>
                  
                    <p>Idioma: <xsl:value-of select="idioma"/></p>
                  
                  </li>

                  <li>
                  
                    <p>Líder político: <xsl:value-of select="lider_politico"/></p>

                  </li>

                  <li>
                  
                    <p>Ciudades:</p>
                  
                  </li>
            
                  <ol>
                  
                    <xsl:for-each select="ciudades/ciudad">

                      <li>
                      
                        <p><xsl:value-of select="@nombre"/> (<xsl:value-of select="@gentilicio"/>, <xsl:value-of select="@huso_horario"/>)</p>

                        <ul>
                        
                          <li>

                            <p>Superficie: <xsl:value-of select="superficie/@km"/> km²</p>

                          </li>

                          <li>

                            <p>Población: <xsl:value-of select="poblacion/@millones"/> millones</p>

                          </li>

                          <li>

                            <p>Monumentos: </p>

                            <ul>
                            
                              <xsl:for-each select="monumentos/monumento">

                                <li class="unordered">
                                
                                  <xsl:value-of select="current()"/>

                                </li>

                              </xsl:for-each>

                              <br/>
                            
                            </ul>

                          </li>

                        </ul>

                      </li>

                      </xsl:for-each>
                  
                  </ol>

                 
                </ul>
      
              </li>
	                    
            </xsl:for-each>
          
          </ol>

      </body>
    
    </html>

  </xsl:template>

</xsl:stylesheet>