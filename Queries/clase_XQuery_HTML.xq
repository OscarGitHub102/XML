(: ---------------------- XQuery ---------------------- :)

(: El nombre de todos los alumnos que tengan un equipo asignado, en orden alfabético :)

(:
for $x in doc("clase.xml")/curso/equipos/equipo/alumnos/alumno
order by $x
return <nombre>{data($x)}</nombre>
:)


(: ------------- XQuery embebida en HTML -------------- :)

(: La asignatura de la segunda hora del jueves (consultar archivo "clase.html" en la carpeta Queries) :)

(:
<html>
 <body>
 <h2>La segunda hora del jueves es:</h2>
 {
 for $x in doc("clase.xml")/curso/horario/dia[dia_semana = "Jueves"]/clase[@orden = 2]/asignatura
 return
 <span style="background-color: yellow">{data($x)}</span>
 }
 </body>
</html>
:)
