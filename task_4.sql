-- task_4.sql

SELECT 
    COLUMN_NAME AS 'Field',
    COLUMN_TYPE AS 'Type',
    IS_NULLABLE AS 'Null',
    COLUMN_KEY AS 'Key',
    COLUMN_DEFAULT AS 'Default',
    EXTRA AS 'Extra'
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_SCHEMA = DATABASE()  -- current database passed as argument
    AND TABLE_NAME = 'Books';  -- Capital B to match checker requirement

