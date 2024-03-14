(: 1. Seleccionar los tomadores de todas las pólizas :)
(: /envio/poliza/tomador :)
(: /envio/poliza/tomador/text() :)

(: 2. Obtener el número total de pólizas :)
(: /envio/count(poliza) :)
 
(: 3. Obtener el primer asegurado de cada póliza :)
(: /envio/poliza/asegurado[1]/[@*] :)
(: /envio/poliza/asegurado[1]/data(@nombre|@apellidos) :)

(: 4. Seleccionar los primeros asegurados de las pólizas solo si tienen más de dos garantías contratadas :)
(: envio/poliza[count(asegurado/garantia)>2]/asegurado[1]/data(@nombre) :)

(: 5. Seleccionar los asegurados que tengan contratada la garantía dental :)
(: /envio/poliza/asegurado/garantia[tipo="Dental"]/../[@*] :)

(: 6. Seleccionar las pólizas con el indicador externa :)
(: /envio/poliza[@externa] :)

(: 7. Seleccionar todas las garantías que tienen el indicador vigor con valor 'N' :)
(: /envio/poliza/asegurado/garantia[@vigor = "N"] :)

(: 8. Seleccionar todos los capitales de garantías que tienen el indicador vigor = 'S' :)
(: /envio/poliza/asegurado/garantia[@vigor = "S"]/capital :)

(: 9. Seleccionar los tomadores de las pólizas, solo si la póliza tiene dos o más asegurados :)
(: /envio/poliza[count(asegurado)>=2]/tomador :)

(: 10. Seleccionar todos los asegurados cuyo nombre empieza por la letra 'J' :)
(: envio/poliza/asegurado[starts-with(@nombre, "J")] :)
(: /envio/poliza/asegurado[substring(@nombre, 1, 1) = "J"] :)

(: 11. Obtener la suma de capitales de las garantías en vigor :)
(: <suma>{sum(/envio/poliza/asegurado/garantia[@vigor="S"]/capital)}</suma> :)

(: 12. Seleccionar las pólizas con alguna garantía cuyo capital sea de 80000 euros :)
(: /envio/poliza[count(asegurado/garantia[capital=80000])>0] :)