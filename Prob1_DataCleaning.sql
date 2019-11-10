CREATE TABLE  data_qf2 AS

SELECT * 
FROM data_qf q 
WHERE q.OBJECT_NUMBER IN (
    SELECT object_number 
    FROM 
    (
            SELECT object_number, pt_1, substr(pt_rest,1,per2-1) as pt_2, substr(pt_rest,per2+1) as pt_rest
            FROM
            (
                --returns position of 2nd period
                SELECT object_number, pt_1, pt_rest,  instr(pt_rest, '.') as per2
                FROM
                (
                    -- 
                    SELECT object_number, substr(object_number,1,per1-1) as pt_1, substr(object_number,per1+1) as pt_rest
                    FROM
                    ( 
                     --returns position of 1st period 
                       SELECT *, instr(object_number, '.') AS per1 
                         FROM data_qf
                           -- Test on subset
                            -- WHERE object_number IN ( '00.12.10', 'x.451.2a–f',
                            --                 'JP931', 'JP3575.1, .2',
                            --                 '02.18.959a, b', 1980.264.5')
                     )
                )
            )
    )
        WHERE NOT pt_1 GLOB '*[^0-9]*' AND pt_1 LIKE '_%' 
            AND NOT pt_2 GLOB '*[^0-9]*' AND pt_2 LIKE '_%'
            AND NOT pt_rest GLOB '*[^0-9]*' AND pt_rest LIKE '_%'
            AND NOT substr(pt_1,1,1)= '0' 
            AND NOT substr(pt_2,1,1)= '0' 
            AND NOT substr(pt_rest,1,1)= '0' 
    )