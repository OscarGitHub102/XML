(: ---------------------- XQuery ---------------------- :)

(: 1. Hacer un conteo de todos los monumentos bajo la etiqueta <contador_monumentos> :)
(:
for $x in doc("paises_Proyecto.xml")/paises
return <contador_monumentos>{count($x/pais/ciudades/ciudad/monumentos/monumento)}</contador_monumentos>
:)

(: 2. Mostrar las ciudades cuyo huso horario sea GMT +1 bajo la etiqueta <ciudad> :)
(:
for $x in doc("paises_Proyecto.xml")/paises/pais/ciudades/ciudad
where $x/@huso_horario = "GMT +1"
return <ciudad>{data($x/@nombre)}</ciudad>
:)

(: ------------- XQuery embebida en HTML -------------- :)


(: 1. Tabla que muestre las ciudades y su tamaño ordenado por este:)
(:
<html>
  <body>
    <h1>Superficie</h1>
    <table border = "1" style="text-align: center">
      <thead>
        <th>Ciudad</th>
        <th>Superficie</th>
      </thead>
      <tbody>
      {
        for $x in doc("paises_Proyecto.xml")/paises/pais/ciudades/ciudad
        order by xs:decimal($x/superficie/@km)
        return
        <tr>
          <td>{data($x/@nombre)}</td>
          <td>{data($x/superficie/@km)}</td>
        </tr>
      }
      </tbody>
    </table>
  </body>
</html>
:)

(: 2. Las ciudades mostradas con tres colores según su rango de población, distinguiendo menos de 1 millón, entre 1 y 3 millones, y mayor de 3 millones:)
(:
<html>
  <body>
    <h1 style="text-decoration: underline">Ciudades</h1>
    <h2><em style="color: green">Verde</em>: Menos de 1 millón de habitantes</h2>
    <h2><em style="color: orange">Naranja</em>: Entre 1 y 3 millones de habitantes</h2>
    <h2><em style="color: red">Rojo</em>: Más de 3 millones de habitantes</h2>
    <ul>
      {
        for $x in doc("paises_Proyecto.xml")/paises/pais/ciudades/ciudad
        return
        if($x/poblacion/@millones < 1)
          then <li style="color: green">{data($x/@nombre)}</li>
          else if ($x/poblacion/@millones < 3)
            then <li style="color: orange">{data($x/@nombre)}</li>
            else
              <li style="color: red">{data($x/@nombre)}</li>
      }
    </ul>
  </body>
</html>
:)

(: 3. Listado de todos los líderes políticos poor orden alfabético y tachar los que no sean europeos:)
(:
<html>
  <body>
    <h1>Líderes Políticos</h1>
    <ol>
      {
        for $x in doc("paises_Proyecto.xml")/paises/pais
        order by $x/lider_politico
        return
        if($x/continente = "Europa")
          then <li>{data($x/lider_politico)}</li>
          else
           <li style="text-decoration: line-through;" >{data($x/lider_politico)}</li>
      }
    </ol>
  </body>
</html>
:)