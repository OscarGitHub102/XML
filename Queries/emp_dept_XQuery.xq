(: 1. Devolver los nombres de los empleados, los directores entre etiqueta director y el 
resto entre emple :)
(:
for $emp in doc("emp.xml")/empleados/empleado
order by $emp/apellido
return
if ($emp/oficio='DIRECTOR')
then
<DIRECTOR>{$emp/apellido/text()}</DIRECTOR>
else
<EMPLE>{data($emp/apellido)}</EMPLE>
:)

(: 2. Devolver el nombre de los oficios que empiezan por P :)
(:
for $ofi in doc("emp.xml")/empleados/empleado/oficio
where starts-with(data($ofi), 'P')
return $ofi
:)

(: 3. Obtener el nombre de los oficios y los empleados de cada uno de ellos :)
(:
for $ofi in distinct-values(doc("emp.xml")/empleados/empleado/oficio)
let $cu:=count(doc("emp.xml")/empleados/empleado[oficio=$ofi])
return concat($ofi,' = ',$cu)
:)

(: 4. Obtener el número de empleados que tiene cada departamento y la media del salario 
redondeada :)
(:
for $dep in distinct-values(doc("emp.xml")/empleados/empleado/dept_no)
let $cu:=count(doc("emp.xml")/empleados/empleado[dept_no=$dep])
let $sala:=round(avg(doc("emp.xml")/empleados/empleado[dept_no=$dep]/salario))
order by $dep
return concat('Departamento: ', $dep, '. Número de empleados = ' ,$cu, '. Media del salario = ', $sala)
:)

(: 5. Visualizar por cada empleado su apellido, su número de departamento y el nombre del 
departamento. :)
(: for $emp in doc("emp.xml")/empleados/empleado, $dept in doc ("dept.xml")/departamentos/departamento
let $dep:= $emp/dept_no
where $dept/dept_no=$dep
return <res>{$emp/apellido, $dep, $dept/dnombre}</res> :)

(: 6. Obtener por cada departamento, el nombre del departamento, el número de 
empleados y la media de los salarios :)
(:
for $dep in doc("dept.xml")/departamentos/departamento
let $d:=$dep/dept_no
let $tot:=sum(doc("emp.xml")/empleados/empleado[dept_no=$d]/salario)
let $cu:=count(doc("emp.xml")/empleados/empleado[dept_no=$d]/emp_no)
return 
<resul>{$dep/dnombre}<sumasalario>{$tot}</sumasalario><totalemple>{$cu}</totalemple
></resul>
:)

(: 7. Convertir la salida de la consulta anterior, de manera que el total salario y el total 
empleados sean atributos de cada departamento :)
(:
for $dep in doc("dept.xml")/departamentos/departamento
let $d:=$dep/dept_no
let $tot:=sum(doc("emp.xml")/empleados/empleado[dept_no=$d]/salario)
let $cu:=count(doc("emp.xml")/empleados/empleado[dept_no=$d]/emp_no)
return concat('<departamento sumasalario="',$tot,'" totalemp="',$cu,'">', 
data($dep/dnombre),'</departamento>')
:)

(: 8. Obtener por cada departamento el nombre del empleado que más gana :)
(:
for $emp in doc("emp.xml")/empleados/empleado
let $d:=$emp/dept_no, $nom:=$emp/apellido, $sal:=$emp/salario
let $ndep:=(doc("dept.xml")/departamentos/departamento[dept_no=$d]/dnombre)
let $salmax:=max(doc("emp.xml")/empleados/empleado[dept_no=$d]/salario)
return 
if ($sal=$salmax)
then 
<depar>{data($ndep)}<salmax>{data($sal)}</salmax><emple>{data($nom)}</emple></depar>
:)