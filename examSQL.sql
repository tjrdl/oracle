SELECT
    substr(email,
           instr(email, '@') + 1) AS domain,
    COUNT(*)                      AS ea,
    SUM(count(*))
    OVER()                        AS sum_domain,
    COUNT(email) / SUM(count(*))
                   OVER() * 100   AS "%"
FROM
    professor
GROUP BY
    substr(email,
           instr(email, '@') + 1)
ORDER BY
    domain ASC;