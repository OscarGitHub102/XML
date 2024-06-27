(: ---------------------- XQuery ---------------------- :)

(: 1. Listar año y título de todos los libros, ordenados por el año :)

(:
for $ano in doc("libros.xml")/bib/libro
let $algo:=$ano/@año order by $algo
return
concat($algo," - ", $ano/titulo)
:)

(: 2. Listar año y título de los libros publicados por Addison-Wesley después del 
año 1992 :)

(:
for $a in doc("libros.xml")/bib/libro[editorial='Addison-Wesley']
let $b:=$a[@año>1992]
return
concat($b/@año," - ", $b/titulo)
:)

(: 3. Listar año y título de los libros que tienen más de un autor :)

(:
for $a in doc("libros.xml")/bib/libro
let $b:=$a/autor
where count($b)>1
return
concat($a/@año," - ",$a/titulo)
:)

(: 4. Listar año y título de los libros que tienen no tienen autor :)

(:
for $a in doc("libros.xml")/bib/libro
let $b:=$a/autor
where count($b)<1
return
concat($a/@año," - ",$a/titulo)
:)

(: 5. Mostrar los apellidos de los autores que aparecen en el documento, sin 
repeticiones, ordenados alfabéticamente :)

(:
for $a in distinct-values(doc("libros.xml")/bib/libro/autor/apellido)
order by $a
return $a
:)

(: 6. Por cada libro, listar agrupado en un elemento <result> su título y autores :)

(:
for $a in doc("libros.xml")/bib/libro
return
<result>{$a/autor},{$a/titulo}</result>
:)

(: 7. Por cada libro, obtener su título y el número de autores, agrupados en un 
elemento <libro> :)

(:
for $a in doc("libros.xml")/bib/libro
return
<result>{$a/titulo},{count($a/autor)}</result>
:)

(: ------------- XQuery embebida en HTML -------------- :)

(: Generar un documento html con un encabezado que diga “Listado de 
libros” seguido de una tabla de 3 columnas, en la que se muestre el título, 
editorial y precio de cada libro (consultar archivo "libros.html" en la carpeta Queries) :)

(:
for $a in doc("libros.xml")/bib
return
<html>
  <head>
    <title>Listado libros</title>
  </head>
  <body>
    <table border="1" cellpadding="10">
    <tr align="center">
      <td>TÍTULO</td>
      <td>EDITORIAL</td>
      <td>PRECIO</td>
    </tr>
    {
      for $b in $a/libro
      return
      <tr align="center">
        <td>{$b/titulo} </td>
        <td>{$b/editorial} </td>
        <td>{$b/precio} </td>
      </tr>
    }
    </table>
  </body>
</html>
:)
