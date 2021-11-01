-- Display all column for a given table
SELECT
	*
FROM
	information_schema.columns
WHERE
	table_name = 'person';