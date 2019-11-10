
CREATE TABLE classification_totals AS
SELECT classification, count(*) as total
FROM data_qf2 
GROUP BY classification
;

/*
select count(distinct classification)
from data_qf2
/*
SELECT distinct --classification, 
    substr(classification,1,per1-1) as pt_1, substr(classification,per1+1) as pt_rest
 FROM 
         --returns position of 1st period 
           (SELECT *, instr(classification, '-') AS per1 
                FROM data_qf
              )
              */