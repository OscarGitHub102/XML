(: ---------------------- XQuery ---------------------- :)

(: Los pasos para cocinar una Tortilla francesa :)

(:
for $x in doc("recetas.xml")/recetas/receta[nombre = "Tortilla francesa"]/preparacion/paso
return <paso>{data($x)}</paso>
:)

(: ------------- XQuery embebida en HTML -------------- :)

(: Subrayar las que lleven sal y tachar las que no (consultar archivo "recetas.html" en la carpeta Queries) :)

(:
<html>
 <body>
 <h2>Recetas</h2>
 <ul>
 {
 for $x in doc("recetas.xml")/recetas/receta
 return
 if($x/ingredientes/ingrediente/nombre = "Sal")
 then<li style="text-decoration: underline">{data($x/nombre)}</li>
 else
 <li style="text-decoration: line-through">{data($x/nombre)}</li>
 }
 </ul>
 </body>
</html>
:)
