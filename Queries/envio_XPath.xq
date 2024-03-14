(: 1. Seleccionar los primeros asegurados de las pólizas solo si tienen más de una garantía contratada :)
(: /envio/poliza/asegurado[1][count(garantia)>1]/data(@nombre) :)
s
s
(: 2. Seleccionar los asegurados que tengan contratada la garantía dental :)
(: /envio/poliza/asegurado/garantia[tipo="Dental"]/../[@*] :)

(: 3. Seleccionar todos los capitales de garantías que tienen el indicador vigor = 'S' :)
(: /envio/poliza/asegurado/garantia[@vigor = "S"]/capital :)

(: 4. Seleccionar los tomadores de las pólizas, solo si la póliza tiene dos o más asegurados :)
(: /envio/poliza[count(asegurado)>=2]/tomador :)

(: 5. Seleccionar todos los asegurados cuyo nombre empieza por la letra 'J' :)
(: /envio/poliza/asegurado[starts-with(@nombre, "J")] :)
(: /envio/poliza/asegurado[substring(@nombre, 1, 1) = "J"] :)

(: 6. Obtener la suma de capitales de las garantías en vigor :)
(: <suma>{sum(/envio/poliza/asegurado/garantia[@vigor="S"]/capital)}</suma> :)

(: 7. Seleccionar las pólizas con alguna garantía cuyo capital sea de 80000 euros :)
(: /envio/poliza[count(asegurado/garantia[capital=80000])>0] :)