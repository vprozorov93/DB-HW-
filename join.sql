-- 1
select title, count(singer) from genre g 
left join singergenge sg on g.id = sg.genre 
group by title

-- 2
select count(s.id) from song s 
left join album a on s.id_album = a.id 
where 2018 <= a.year_of_creation and a.year_of_creation <= 2020

-- 3
select a.title, ROUND(AVG(s.duration),2) from album a 
left join song s on a.id = s.id_album 
group by a.title 

-- 4
-- не верно
-- select s.singer_name from singer s 
-- left join albumsinger a_s on s.id = a_s.singer 
-- left join album a on a_s.album = a.id
-- where a.year_of_creation != 1787

-- верно
SELECT DISTINCT s.alias FROM singer s 
WHERE s.alias NOT IN (
SELECT DISTINCT s.alias FROM singer s 
LEFT JOIN albumsinger a_s ON s.id  = a_s.singer 
LEFT JOIN album a ON a.id  = a_s.album  
WHERE a.year_of_creation  = 2019
)
ORDER BY s.alias;


-- 5
select distinct c.title from singer s
left join albumsinger a_s on s.id = a_s.singer
left join song sg on a_s.album = sg.id_album 
left join songcollection sc on sg.id = sc.song
left join collection c on sc.collection = c.id
where s.alias = 'ATL'

-- 6
-- так
-- select a.title  from album a 
-- left join albumsinger a_s on a.id = a_s.album 
-- where a_s.singer in (
-- select s.id from singer s 
-- left join singergenge sg on s.id = sg.singer 
-- left join genre g on sg.genre = g.id 
-- group by s.id
-- having count(g.title) > 1)

-- или так
select a.title from singer s 
left join singergenge sg on s.id = sg.singer 
left join genre g on sg.genre = g.id
left join albumsinger a_s on s.id = a_s.singer 
left join album a on a_s.album = a.id 
group by a.title
having count(g.title) > 1

-- 7
select s.title from song s 
full join songcollection s2 on s2.song = s.id
group by s.title, s2.song
having s2.song is NULL

-- 8
select s2.alias from song s 
left join albumsinger a on s.id_album = a.album 
left join singer s2 on a.singer = s2.id
where s.duration = (
	select min(duration) from song)

-- 9
select a.title from	(select id_album ida, count(title) ct from song 
							group by song.id_album) foo
left join album a on foo.ida = a.id
where foo.ct = (select min(foo.ct) from (select id_album ida, count(title) ct from song 
										group by song.id_album) foo)
group by a.title

-- или так
-- SELECT album.title Album, COUNT(song.title) Track_count FROM album 
-- JOIN song ON album.id = song.id_album 
-- GROUP BY album.title
-- HAVING COUNT(song.title) = ( 
-- SELECT COUNT(song.title) FROM album
-- JOIN song ON album.id = song.id_album 
-- GROUP BY album.title
-- ORDER BY COUNT(song.title) DESC
-- LIMIT 1);

