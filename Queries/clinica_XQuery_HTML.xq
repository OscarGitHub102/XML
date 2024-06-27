(: ---------------------- XQuery ---------------------- :)

(: El nombre del paciente con nif 77665544 :)

(:
for $x in doc("clinica.xml")/clinica/cita/paciente[@nif = "77665544A"]
return <paciente>{$x/@nombre}</paciente>
:)

(: ------------- XQuery embebida en HTML -------------- :)

(: El nombre de los pacientes del médico Juan (consultar archivo "clinica.html" en la carpeta Queries) :)

(:
<html>
 <body>
 <h1>Citas de Juan</h1>
 <ol>
 {
 for $x in doc("clinica.xml")/clinica/cita
 where $x/medico[@nombre = "Juan"]
 return
 <li>{data($x/paciente/@nombre)}</li>
 }
 </ol>
 </body>
</html>
:)
