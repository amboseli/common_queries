--A query to select interactions only between individuals from a specific list of individuals.
--2019-Oct-10

SELECT a.*
  FROM actor_actees a
  WHERE actor in (select sname from subject_list)
    and actee in (select sname from subject_list)
