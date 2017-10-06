-- Jake Gordon, Oct 2017
--
-- Get ranks of adult males from the ALM (all males) ranks in the RANKS
-- table.
--
-- Adulthood for males is determined by whether or not they've attained
-- adult rank. The date that this occurred for each male is recorded in
-- the RANKDATES table.

SELECT ranks.*
  FROM ranks
  JOIN rankdates
    ON rankdates.sname = ranks.sname
       AND rankdates.ranked <= ranks.rnkdate
  --WHERE xxx
  --ORDER BY xxx
  ;

--
-- Keep ranks for ALL males, but add a column that indicates who are
-- adults.
--
-- Because of the LEFT JOIN and the "ranked <= rnkdate" in the "ON"
-- clause, non-adult individuals will have a NULL "rankdate" column.
-- Even if an individual does have a "ranked" in RANKDATES, it will
-- only join for months that are on or after the "ranked" date.

SELECT ranks.*
     , rankdates.ranked
  FROM ranks
  LEFT JOIN rankdates
    ON rankdates.sname = ranks.sname
       AND rankdates.ranked <= ranks.rnkdate
  --WHERE xxx
  --ORDER BY xxx
  ;
