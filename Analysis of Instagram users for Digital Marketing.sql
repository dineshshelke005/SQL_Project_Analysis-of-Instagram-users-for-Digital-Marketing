# Analysis of Instagram users for Digital Marketing

use ig_clone 

-- Q.2 5 OLDEST USERS

SELECT * FROM users
ORDER BY created_at ASC
LIMIT 5


-- Q.3  users who never posted a photo

SELECT * FROM users
LEFT OUTER JOIN photos
ON users.id = photos.user_id
WHERE photos.user_id IS NULL



-- Q4. who got most likes 

SELECT photo_id , COUNT(*) as count
FROM likes
GROUP BY photo_id
ORDER BY count DESC
LIMIT 1


select * from photos 
where ( id = 145)

SELECT * FROM users
LEFT OUTER JOIN photos
ON users.id = photos.user_id
WHERE (photos.id = 145)


-- Q.5 how many times the avarage user posts?

SELECT AVG(num_photos) AS avg_photos_per_user
FROM (
  SELECT user_id, COUNT(*) AS num_photos
  FROM photos
  GROUP BY user_id
) AS photo_counts


-- Q.6 5 most used hashtags 
 
 
SELECT tag_name, COUNT(*) AS tag_count
FROM tags
GROUP BY tag_name
ORDER BY tag_count DESC
LIMIT 5


-- Q.7 users who liked each photo on site ( bots )


SELECT user_id
FROM (
  SELECT user_id, COUNT(*) AS num_likes
  FROM likes
  GROUP BY user_id
) AS like_counts
WHERE num_likes = (SELECT COUNT(*) FROM photos)


-- Q.8 users who created instagram id in may and top 5 newest joinees from it 

SELECT *
FROM users
WHERE EXTRACT(MONTH FROM created_at) = 5
order by created_at asc

SELECT *
FROM users
WHERE EXTRACT(MONTH FROM created_at) = 5
order by created_at desc
limit 5

-- Q.9 users name starts with c and ends with any number and posted and liked photos 

SELECT Users.id, Users.username
FROM Users
JOIN Photos ON Users.id = Photos.user_id
JOIN Likes ON Photos.id = Likes.photo_id
WHERE Users.username LIKE 'C%' AND Users.username REGEXP '[0-9]$' AND Likes.user_id = Users.id
GROUP BY Users.id, Users.username


-- Q.10 top 30 usernames who posted photos in the range of 3-5


SELECT users.username, COUNT(*) AS photo_count
FROM photos 
JOIN users  ON photos.user_id = users.id
GROUP BY photos.user_id, users.username
HAVING COUNT(*) BETWEEN 3 AND 5
ORDER BY photo_count DESC
LIMIT 30
