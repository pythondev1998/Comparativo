WITH UnnestPhones AS (
    SELECT 
        t.ID,
        p.phoneNumber,
        p.relationDate,
        p.address,
        p.uploadDate,
        ROW_NUMBER() OVER (PARTITION BY t.ID ORDER BY p.uploadDate DESC) AS phone_index
    FROM 
        your_table_name t, UNNEST(t.entityPhones) AS p
),
LimitedPhones AS (
    SELECT
        ID,
        phoneNumber,
        relationDate,
        address,
        uploadDate,
        phone_index
    FROM UnnestPhones
    WHERE phone_index <= 10
)
SELECT 
    ID,
    MAX(CASE WHEN phone_index = 1 THEN phoneNumber END) AS phoneNumber_1,
    MAX(CASE WHEN phone_index = 1 THEN relationDate END) AS relationDate_1,
    MAX(CASE WHEN phone_index = 1 THEN address END) AS address_1,
    MAX(CASE WHEN phone_index = 1 THEN uploadDate END) AS uploadDate_1,
    MAX(CASE WHEN phone_index = 2 THEN phoneNumber END) AS phoneNumber_2,
    MAX(CASE WHEN phone_index = 2 THEN relationDate END) AS relationDate_2,
    MAX(CASE WHEN phone_index = 2 THEN address END) AS address_2,
    MAX(CASE WHEN phone_index = 2 THEN uploadDate END) AS uploadDate_2,
    MAX(CASE WHEN phone_index = 3 THEN phoneNumber END) AS phoneNumber_3,
    MAX(CASE WHEN phone_index = 3 THEN relationDate END) AS relationDate_3,
    MAX(CASE WHEN phone_index = 3 THEN address END) AS address_3,
    MAX(CASE WHEN phone_index = 3 THEN uploadDate END) AS uploadDate_3,
    MAX(CASE WHEN phone_index = 4 THEN phoneNumber END) AS phoneNumber_4,
    MAX(CASE WHEN phone_index = 4 THEN relationDate END) AS relationDate_4,
    MAX(CASE WHEN phone_index = 4 THEN address END) AS address_4,
    MAX(CASE WHEN phone_index = 4 THEN uploadDate END) AS uploadDate_4,
    MAX(CASE WHEN phone_index = 5 THEN phoneNumber END) AS phoneNumber_5,
    MAX(CASE WHEN phone_index = 5 THEN relationDate END) AS relationDate_5,
    MAX(CASE WHEN phone_index = 5 THEN address END) AS address_5,
    MAX(CASE WHEN phone_index = 5 THEN uploadDate END) AS uploadDate_5,
    MAX(CASE WHEN phone_index = 6 THEN phoneNumber END) AS phoneNumber_6,
    MAX(CASE WHEN phone_index = 6 THEN relationDate END) AS relationDate_6,
    MAX(CASE WHEN phone_index = 6 THEN address END) AS address_6,
    MAX(CASE WHEN phone_index = 6 THEN uploadDate END) AS uploadDate_6,
    MAX(CASE WHEN phone_index = 7 THEN phoneNumber END) AS phoneNumber_7,
    MAX(CASE WHEN phone_index = 7 THEN relationDate END) AS relationDate_7,
    MAX(CASE WHEN phone_index = 7 THEN address END) AS address_7,
    MAX(CASE WHEN phone_index = 7 THEN uploadDate END) AS uploadDate_7,
    MAX(CASE WHEN phone_index = 8 THEN phoneNumber END) AS phoneNumber_8,
    MAX(CASE WHEN phone_index = 8 THEN relationDate END) AS relationDate_8,
    MAX(CASE WHEN phone_index = 8 THEN address END) AS address_8,
    MAX(CASE WHEN phone_index = 8 THEN uploadDate END) AS uploadDate_8,
    MAX(CASE WHEN phone_index = 9 THEN phoneNumber END) AS phoneNumber_9,
    MAX(CASE WHEN phone_index = 9 THEN relationDate END) AS relationDate_9,
    MAX(CASE WHEN phone_index = 9 THEN address END) AS address_9,
    MAX(CASE WHEN phone_index = 9 THEN uploadDate END) AS uploadDate_9,
    MAX(CASE WHEN phone_index = 10 THEN phoneNumber END) AS phoneNumber_10,
    MAX(CASE WHEN phone_index = 10 THEN relationDate END) AS relationDate_10,
    MAX(CASE WHEN phone_index = 10 THEN address END) AS address_10,
    MAX(CASE WHEN phone_index = 10 THEN uploadDate END) AS uploadDate_10
FROM 
    LimitedPhones
GROUP BY 
    ID;
