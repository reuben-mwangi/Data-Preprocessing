create table events(
  event_type integer not null,
  value integer not null,
  time timestamp not null,
  unique (event_type ,time)
  );
  
  insert into events values
(2,   5,  '2015-05-09 12:42:00'),
(4, -42,  '2015-05-09 13:19:57'),
(2,   2,  '2015-05-09 14:48:39'),
(2,   7,  '2015-05-09 13:54:39'),
(3,  16,  '2015-05-09 13:19:57'),
(3,  20,  '2015-05-09 15:01:09') 

SELECT e1.event_type, (e1.value - e2.value) AS value FROM
events e1
JOIN
events e2
ON
e1.event_type = e2.event_type
AND
e1.time = (SELECT time FROM events temp1 WHERE
           temp1.event_type=e1.event_type ORDER BY time DESC LIMIT 1)
AND
e2.time = (SELECT time FROM events temp2 WHERE
           temp2.event_type=e2.event_type ORDER BY time DESC LIMIT 1 OFFSET 1)
