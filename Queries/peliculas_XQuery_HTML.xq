(: ---------------------- XQuery ---------------------- :)

(: El actor principal (intérprete 1) de cada película :)
(:
for $x in doc("peliculas.xml")/peliculas/pelicula/interpretes/interprete[@numero = 1]
return <interprete>{data($x)}</interprete>
:)

(: ------------- XQuery embebida en HTML -------------- :)

(: Diferenciar películas por el número de intérpretes (con colores) :)

(:
<html>
 <body>
 <h2>Películas</h2>
 <ul>
 {
 for $x in doc("peliculas.xml")/peliculas/pelicula
 return
 if(count($x/interpretes/interprete) = 2 )
 then<li style="color: green">{data($x/titulo)}</li>
 else if(count($x/interpretes/interprete) = 3 )
 then<li style="color: purple">{data($x/titulo)}</li>
 else if(count($x/interpretes/interprete) = 4 )
 then<li style="color: blue">{data($x/titulo)}</li>
 }
 </ul>
 </body>
</html>
:)