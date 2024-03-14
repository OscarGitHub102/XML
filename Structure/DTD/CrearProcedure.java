/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ad.jpaspring.sentencias;

import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Component
public class CrearProcedure {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @PostConstruct
    public void CrearProcedure() {/*
         jdbcTemplate.execute("DROP PROCEDURE IF EXISTS BORRAR_PROFESOR");

        // Cambiar delimitador para crear el procedimiento
        String sqlCreate = """
                    
                    CREATE PROCEDURE BORRAR_PROFESOR(IN PROFPARM INT)
                    BEGIN
                        DECLARE jefeSuper INT;
                        DECLARE jefeMedium INT;
                        DECLARE v_numpro INT DEFAULT 0;
                        DECLARE v_fin_cursor INT DEFAULT 0;
                        DECLARE existe BOOLEAN DEFAULT FALSE;
                        
                        DECLARE c1 CURSOR FOR SELECT NUMPRO FROM PROFESORES;
                        DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_fin_cursor = 1;
                        
                        SELECT JEFPRO INTO jefeMedium FROM PROFESORES WHERE numpro = PROFPARM;
                        SELECT numpro INTO jefeSuper FROM PROFESORES WHERE jefpro IS NULL;
                        
                        OPEN c1;
                        read_loop: LOOP
                            FETCH c1 INTO v_numpro;
                            IF v_fin_cursor = 1 THEN
                                LEAVE read_loop;
                            END IF;
                            
                            IF v_numpro = PROFPARM THEN
                                SET existe = TRUE;
                            END IF;
                            
                            IF PROFPARM = jefeSuper THEN
                                CLOSE c1;
                                LEAVE read_loop;
                            ELSE
                                UPDATE PROFESORES SET JEFPRO = jefeMedium WHERE NUMPRO = PROFPARM;
                                UPDATE CURSOS SET NUMPRO = jefeMedium WHERE NUMPRO = PROFPARM;
                                DELETE FROM PROFESORES WHERE NUMPRO = PROFPARM;
                            END IF;
                        END LOOP;
                        CLOSE c1;
                    END ;
                    """;
        jdbcTemplate.execute(sqlCreate);

        // Ejecutar el SQL de creación de procedimiento aquí puede no funcionar directamente en JdbcTemplate
        // Podrías necesitar ejecutar este SQL directamente en tu base de datos o adaptar este código.*/
    }

    public void eliminarProfesorPorId(Integer profesorId) {
        jdbcTemplate.update("CALL BORRAR_PROFESOR(?)", profesorId);
    }
}

