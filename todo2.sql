-- building upon the first todo assignment from yesterday.

hellodb=# INSERT INTO todos(title, details, priority, created_at) VALUES('prepare lunches', 'healthy foods for the week', 2, current_timestamp);
INSERT 0 1
hellodb=# INSERT INTO todos(title, details, priority, created_at) VALUES('call mom', 'talk with mom on the phone', 2, current_timestamp);
INSERT 0 1

-- Write INSERT statements to insert 20 todos into the todos table, with a combination of priorities, created times, and completed times, with not all having a completed time.

hellodb=# SELECT * FROM todos;
 id |      title       |                   details                    | priority |         created_at         |        completed_at
----+------------------+----------------------------------------------+----------+----------------------------+----------------------------
  1 | wash car         | wash with car soap                           |        1 | 2017-09-06 12:29:54.091646 | 2017-09-06 12:29:54.091646
  2 | wash dog         | wash dog with flea soap                      |        2 | 2017-09-06 12:31:04.803435 | 2017-09-06 12:31:04.803435
  3 | review backend   | go over backend stuff                        |        3 | 2017-09-06 12:32:41.871612 | 2017-09-06 12:32:41.871612
  4 | include frontend | incorporate more frontend into backend stuff |        4 | 2017-09-06 12:33:27.072006 | 2017-09-06 12:33:27.072006
  5 | do dishes        | wash dishes                                  |        5 | 2017-09-06 12:34:45.117322 | 2017-09-06 12:34:45.117322
  6 | grocery shop     | buy health food                              |        6 | 2017-09-06 12:45:01.029775 | 2017-09-06 12:45:01.029775
  7 | buy drinks       | get kombucha                                 |        7 | 2017-09-06 12:49:20.981908 | 2017-09-06 12:49:20.981908
  8 | sweep            | sweep dirty floor                            |        8 | 2017-09-06 12:50:22.771997 | 2017-09-06 12:50:22.771997
  9 | do laundry       | wash clothes                                 |        9 | 2017-09-06 12:50:47.803415 | 2017-09-06 12:50:47.803415
 10 | wipe sink        | wipe sink with clorox wipes                  |        3 | 2017-09-06 12:54:21.862607 |
 11 | buy coffee       | get that organic coffee                      |        3 | 2017-09-06 12:56:26.602642 |
 12 | buy tea          | get that organic tea                         |        3 | 2017-09-06 12:56:44.026615 |
 13 | buy candy        | I want candy 80s song                        |        3 | 2017-09-06 12:57:11.681016 |
 14 | buy music        | get to iTunes for music therapy              |        3 | 2017-09-06 12:57:36.944628 |
 15 | eat breakfast    | always eat breakfast                         |        3 | 2017-09-06 13:00:34.38442  |
 16 | clean bathroom   | sterilize bathroom                           |        3 | 2017-09-06 13:01:31.972228 |
 17 | mop floors       | use clorox                                   |        2 | 2017-09-06 13:02:13.634786 |
 18 | prepare lunches  | healthy foods for the week                   |        2 | 2017-09-06 13:02:55.274886 |
 19 | prepare lunches  | healthy foods for the week                   |        2 | 2017-09-06 13:03:59.525588 |
 20 | call mom         | talk with mom on the phone                   |        2 | 2017-09-06 13:04:22.03714  |
(20 rows)


hellodb=# SELECT todos WHERE priority = 3 AND completed_at = NULL;
ERROR:  column "todos" does not exist
LINE 1: SELECT todos WHERE priority = 3 AND completed_at = NULL;
               ^
hellodb=# SELECT FROM todos WHERE priority = 3 AND completed_at = NULL;
--
(0 rows)


hellodb=# SELECT FROM todos WHERE priority = 3 AND completed_at IS NULL;
--
(7 rows)


hellodb=# SELECT FROM todos WHERE completed_at IS NULL ORDER BY priority DESC;
--
(11 rows)

-- Write a SELECT statement to find all incomplete todos with priority 3.

hellodb=# SELECT * FROM todos WHERE priority = 3 AND completed_at IS NULL;
 id |     title      |             details             | priority |         created_at         | completed_at
----+----------------+---------------------------------+----------+----------------------------+--------------
 10 | wipe sink      | wipe sink with clorox wipes     |        3 | 2017-09-06 12:54:21.862607 |
 11 | buy coffee     | get that organic coffee         |        3 | 2017-09-06 12:56:26.602642 |
 12 | buy tea        | get that organic tea            |        3 | 2017-09-06 12:56:44.026615 |
 13 | buy candy      | I want candy 80s song           |        3 | 2017-09-06 12:57:11.681016 |
 14 | buy music      | get to iTunes for music therapy |        3 | 2017-09-06 12:57:36.944628 |
 15 | eat breakfast  | always eat breakfast            |        3 | 2017-09-06 13:00:34.38442  |
 16 | clean bathroom | sterilize bathroom              |        3 | 2017-09-06 13:01:31.972228 |
(7 rows)

-- Write a SELECT statement to find the number of incomplete todos by priority.

hellodb=# SELECT FROM todos WHERE completed_at IS NULL ORDER BY priority DESC;
--
(11 rows)

hellodb=# SELECT FROM todos WHERE priority IS 1;
ERROR:  syntax error at or near "1"
LINE 1: SELECT FROM todos WHERE priority IS 1;
                                            ^
hellodb=# SELECT * FROM todos WHERE pdate BETWEEN datetime('now', '-30 days') AND datetime('now', 'localtime');
ERROR:  column "pdate" does not exist
LINE 1: SELECT * FROM todos WHERE pdate BETWEEN datetime('now', '-30...
                                  ^
hellodb=# SELECT * FROM todos whERE DATEADD(DAY, -30, GETDATE());
ERROR:  column "day" does not exist
LINE 1: SELECT * FROM todos whERE DATEADD(DAY, -30, GETDATE());
                                          ^
hellodb=# SELECT * FROM todos WHERE date between current_date and current_date - interval '30 day';
ERROR:  column "date" does not exist
LINE 1: SELECT * FROM todos WHERE date between current_date and curr...

-- Write a SELECT statement to find the number of todos by priority created in the last 30 days.
                          ^
hellodb=# SELECT * FROM todos WHERE completed_at IS NULL ORDER BY PRIORITY, created_at DESC;
 id |      title      |             details             | priority |         created_at         | completed_at
----+-----------------+---------------------------------+----------+----------------------------+--------------
 20 | call mom        | talk with mom on the phone      |        2 | 2017-09-06 13:04:22.03714  |
 19 | prepare lunches | healthy foods for the week      |        2 | 2017-09-06 13:03:59.525588 |
 18 | prepare lunches | healthy foods for the week      |        2 | 2017-09-06 13:02:55.274886 |
 17 | mop floors      | use clorox                      |        2 | 2017-09-06 13:02:13.634786 |
 16 | clean bathroom  | sterilize bathroom              |        3 | 2017-09-06 13:01:31.972228 |
 15 | eat breakfast   | always eat breakfast            |        3 | 2017-09-06 13:00:34.38442  |
 14 | buy music       | get to iTunes for music therapy |        3 | 2017-09-06 12:57:36.944628 |
 13 | buy candy       | I want candy 80s song           |        3 | 2017-09-06 12:57:11.681016 |
 12 | buy tea         | get that organic tea            |        3 | 2017-09-06 12:56:44.026615 |
 11 | buy coffee      | get that organic coffee         |        3 | 2017-09-06 12:56:26.602642 |
 10 | wipe sink       | wipe sink with clorox wipes     |        3 | 2017-09-06 12:54:21.862607 |
(11 rows)


-- Write a SELECT statement to find the next todo you should work on. This is the todo with the highest priority that was created first.

hellodb=# SELECT * FROM todos WHERE priority = 1 ORDER BY created_at LIMIT 1;
 id |  title   |      details       | priority |         created_at         |        completed_at
----+----------+--------------------+----------+----------------------------+----------------------------
  1 | wash car | wash with car soap |        1 | 2017-09-06 12:29:54.091646 | 2017-09-06 12:29:54.091646
(1 row)
