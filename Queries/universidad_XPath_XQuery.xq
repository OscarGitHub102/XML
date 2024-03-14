(: ---------------------- XPath ---------------------- :)

(: 1. Selecciona todos los hermanos de departamento a partir del primero, siguiendo el orden en el documento :)
(: //departamento[position() > 1] :)

(: 2. Selecciona el nombre del padre del empleado Ana Solevita :)
(: //departamento/empleado[nombre="Ana Solevita"]/../nombre :)
 
(: 3. Selecciona los descendientes del departamento que ocupa la posición 3 en el documento :)
(: //departamento[3] :)

(: 4. Obtener los departamentos con más de 3 empleados :)
(: //departamento[count(empleado)>3] :)

(: 5. Devolver el nombre de los departamentos de tipo A y con 3 o más empleados :)
(: //departamento[@tipo='A'][count(empleado)>=3]/nombre :)

(: ---------------------- XQuery ---------------------- :)

(: 1. Obtener los nombres de los empleados de los departamentos tipo A, cuyo puesto es profesor :)
(:
for $prof in /universidad/departamento[@tipo='A']/empleado
where $prof/puesto='Profesor'
return $prof/nombre
:)

(: 2. Devolver el nombre del departamento encerrado entre las etiquetas tipo A si es de este tipo y de tipo B para cualquier otro :)
(:
for $dep in /universidad/departamento
return
if ($dep/@tipo='A')
then <tipoA>{data($dep/nombre)}</tipoA>
else <tipoB>{data($dep/nombre)}</tipoB>
:)

(: 3. Obtener los nombres de los departamentos y los empleados que tiene entre etiquetas :)
(:
for $dep in /universidad/departamento
let $nom:=$dep/empleado
return <depart>{data($dep/nombre)}<num_empleados>{count($nom)}</num_empleados></depart>
:)

(: 4. Obtener los nombres de los departamentos, los empleados que tiene y la media del salario entre etiquetas :)
(:
for $dep in /universidad/departamento
let $emp:=$dep/empleado
let $sal:=$dep/empleado/@salario
return 
<depart>{data($dep/nombre)}<num_empleados>{count($emp)}</num_empleados><media_sal>{avg($sal)}</media_sal></depart>
:)