(: ---------------------- XQuery ---------------------- :)

(: Fecha en la que se prestó el juego Hollow Knight :)

(:
for $x in doc("videojuegos.xml")/ejemplo_videojuegos/prestamos/prestamo[codigo_prestamo = "V_2"]/fecha_prestamo
return <fecha>{data($x)}</fecha>
:)

(: ------------- XQuery embebida en HTML -------------- :)

(: Videojuegos que están disponibles para PC :)

(:
<html>
 <body>
 <h1>Videojuegos para PC</h1>
   <table border = "1" cellpadding="10">
     <thead align="center">
     <th>Título</th>
     <th>Desarrollador</th>
     <th>País de origen</th>
     <th>Año</th>
     <th>Géneros</th>
     <th>Plataformas</th>
     </thead>
     <tbody>
     {
       for $x in doc("videojuegos.xml")/ejemplo_videojuegos/videojuegos/videojuego
       return
       if($x/plataformas/plataforma[@maquina="PC"])
       then
       <tr align="center">
         <td>{data($x/titulo)}</td>
         <td>{data($x/desarrollador)}</td>
         <td>{data($x/pais_origen)}</td>
         <td>{data($x/anio)}</td>
         <td>{data($x/generos/genero/@nombre)}</td>
         <td>{data($x/plataformas/plataforma/@maquina)}</td>
       </tr>
     }
     </tbody>
   </table>
 </body>
</html>
:)