-- Jake Gordon, Oct 2017
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
--
-- See all groomings where the groomer and groomee are kin.
--
-- Maternal siblings
SELECT actor_actees.*
  FROM actor_actees
  JOIN maternities AS actor_mat
    ON actor_mat.child = actor_actees.actor
  JOIN maternities AS actee_mat
    ON actee_mat.child = actor_actees.actee
  WHERE actor_actees.act = 'G'
    AND actor_mat.mom = actee_mat.mom
  --ORDER BY xxx
  ;

-- Paternal siblings
SELECT actor_actees.*
  FROM actor_actees
  JOIN dad_data AS actor_daddata
    ON actor_daddata.kid = actor_actees.actor
  JOIN dad_data AS actee_daddata
    ON actee_daddata.kid = actor_actees.actee
  WHERE actor_actees.act = 'G'
    AND actor_daddata.dad_consensus = actee_daddata.dad_consensus
  --ORDER BY xxx
  ;

-- Maternal or paternal siblings
SELECT actor_actees.*
  FROM actor_actees
  JOIN parents AS actor_parents
    ON actor_parents.kid = actor_actees.actor
  JOIN parents AS actee_parents
    ON actee_parents.kid = actor_actees.actee
  WHERE actor_actees.act = 'G'
    AND (actor_parents.mom = actee_parents.mom
         OR actor_parents.dad = actee_parents.dad)
  --ORDER BY xxx
  ;
