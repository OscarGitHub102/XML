(: ---------------------- XQuery ---------------------- :)

(: 1. Los discos ordenados por artista :)

(:
<ordenados>
{
  for $x in doc("cdcatalog")/catalog/cd
  order by $x/artist
  return <cd>{data($x)}</cd>
}
</ordenados>
:)

(: 2. Los discos de Bob Dylan poniendo el filtro en XPath :)

(:
for $x in doc("cdcatalog")/catalog/cd[artist = "Bob Dylan"]
return <cd>{data($x)}</cd>
:)

(: 3. Los discos de Bob Dylan poniendo el filtro en XQuery :)

(:
for $x in doc("cdcatalog")/catalog/cd
where $x/artist = "Bob Dylan"
return <cd>{data($x)}</cd>
:)

(: 4. Los títulos de los discos con el formato <discoBarato> (menos de 9 euros), 
<discoNormal> (menos de 10 euros) y <discoCaro> (el resto) :)

(:
for $x in doc("cdcatalog")/catalog/cd
order by $x/price
return
if ($x/price < 9)
then <discoBarato>{data($x/title)}</discoBarato>
else if ($x/price < 10)
then <discoNormal>{data($x/title)}</discoNormal>
else <discoCaro>{data($x/title)}</discoCaro>
:)

(: 5. Los ID de los discos :)

(:
<ids>
{
  for $x in doc("cdcatalog")/catalog/cd/@id
  return <id>{data($x)}</id>
}
</ids>
:)

(: ------------- XQuery embebida en HTML -------------- :)

(: 1. Los datos de todos los discos en formato de tabla (consultar archivo "cdcatalog1.html" en la carpeta Queries) :)

(:
<html>
 <body>
 <h1>DISCOS</h1>
   <table border="1">
     <thead>
     <th>Título</th>
     <th>Artista</th>
     <th>País</th>
     <th>Compañía</th>
     <th>Precio</th>
     <th>Año</th>
     </thead>
     <tbody>
     {
       for $x in doc("cdcatalog.xml")/catalog/cd
       order by $x
       return 
       <tr>
         <td>{data($x/title)}</td>
         <td>{data($x/artist)}</td>
         <td>{data($x/country)}</td>
         <td>{data($x/company)}</td>
         <td>{data($x/price)}</td>
         <td>{data($x/year)}</td>
       </tr>
     }
     </tbody>
   </table>
 </body>
</html>
:)

(: 2. Los títulos de los discos de Bob Dylan en formato de lista HTML (consultar archivo "cdcatalog2.html" en la carpeta Queries) :)

(:
<html>
 <body>
 <h1>Discos de Bob Dylan</h1>
   <ul>
   {
     for $x in doc("cdcatalog.xml")/catalog/cd
     where $x/artist = "Bob Dylan"
     return
     <li>{data($x/title)}</li>
   }
   </ul>
 </body>
</html>
:)

(: 3. Los discos mostrados con tres colores según su rango de precios, 
distinguiendo menos de 9, entre 9 y 10, y mayor de 10 (consultar archivo "cdcatalog3.html" en la carpeta Queries) :)

(:
<html>
 <body>
 <h1>Discos por rango de precios</h1>
 <h2>Color verde: Precio menor a 9€</h2>
 <h2>Color naranja: Precio entre 9€ y 10€</h2>
 <h2>Color rojo: Precio mayor a 10€</h2>
   <ul>
   {
     for $x in doc("cdcatalog.xml")/catalog/cd
     return
     if($x/price < 9)
     then<li style="color: green">{data($x/title)}</li>
     else if($x/price > 9 and $x/price < 10)
     then<li style="color: orange">{data($x/title)}</li>
     else if($x/price > 10)
     then<li style="color: red">{data($x/title)}</li>
   }
   </ul>
 </body>
</html>
:)

(: 4. Generar un enlace HTML (<a>) con la URL y el nombre de la tienda (consultar archivo "cdcatalog4.html" en la carpeta Queries) :)

(:
<html>
  <body>
  <h1><a href="http://www.madridrock.es">Madrid Rock</a></h1>
  </body>
</html>
:)
