-- Jake Gordon, Oct 2017
--
-- Determine group size per month. 2 common approaches shown.
--
-- Count the number of distinct individuals who were EVER in each
-- group in each month.  For example, if there are 10 individuals
-- who were always in the group, a visiting immigrant male present
-- at the beginning of the month, and another male present at the
-- end (the two males never overlapped), then the number of distinct
-- individuals in the group this month is 12.

SELECT grp
     , rnkdate(date) AS month
     , COUNT(DISTINCT sname) AS num_indivs
  FROM members
  --WHERE grp = 1.000
  GROUP BY grp, rnkdate(date)
  --ORDER BY grp, month
  ;

-- OR....
--
-- Count the number of individuals in the group each day, and
-- average that number.
WITH daily_counts AS (SELECT grp
                           , date
                           , COUNT(*) as num_indivs
                        FROM members
                        --WHERE grp = 1.000
                        GROUP BY grp, date)

SELECT grp
     , rnkdate(date) AS month
     , -- Cast num_indivs as a non-integer, so we can have a
       -- non-integer result. Result type matches input type.
       AVG(num_indivs::numeric(6,3)) as avg_indivs
       -- numeric(x,y)= number is at most x digits long, with
       -- y mandatory digits after the decimal place.
  FROM daily_counts
  GROUP BY grp, rankdate(date)
  --ORDER BY xxxx
  ;
