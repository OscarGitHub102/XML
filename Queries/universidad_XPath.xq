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