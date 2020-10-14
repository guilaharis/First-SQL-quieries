#1. Брой на потребители.
Select count(id) from users;

#2. Най-стария потребител.
select username, birthdate from users 
order by birthdate asc;

#3. Най-младия потребител.
select username, birthdate from users
order by birthdate desc;

#4. Колко юзъра са регистрирани с мейли от abv и колко от gmail и колко с различни от
#двата.
select count(email) from users
where email like '%abv%';

select count(email) from users
where email like '%gmail%';

select count(email) from users
where email not like '%abv%' 
or '%gmail%';

#5. Кои юзъри са banned.
select username, isbanned from users
where isbanned = 1;

#6. Изкарайте всички потребители от базата като ги наредите по име в азбучен ред и
#дата на раждане(от най-младия към най-възрастния).
Select username, birthdate from users
order by username asc, birthdate desc; 

#7. Изкарайте всички потребители от базата, на които потребителското име започва с
#a.
Select username from users
where username like 'a%';

#8. Изкарайте всички потребители от базата, които съдържат а username името си.
Select username from users
where username like '%a%'; 

#9. Изкарайте всички потребители от базата, чието име се състои от 2 имена.
Select username from users
where username like '% %'; 

#10. Регистрирайте 1 юзър през UI-а и го забранете след това от базата.
Update users
set isbanned = 1
where username = 'kivota'; 

#11. Брой на всички постове.
Select count(id) from posts; 

#12. Брой на всички постове групирани по статуса на post-a.
select count(postStatus)
from posts
group by postStatus; 

#13. Намерете поста/овете с най-къс caption.
select * from posts
where caption like '_'; 

#14. Покажете поста с най-дълъг caption.
select length(caption), caption from posts
order by length(caption) desc;

#15. Кой потребител има най-много постове. Използвайте join заявка.
select count(posts.id), users.username
from posts
left join users
on posts.userId=users.Id
group by username
order by count(posts.id) desc;

#16. Кои потребители имат най-малко постове. Използвайте join заявка.
select count(posts.id), users.username
from posts
left join users
on posts.userId=users.Id
group by username
order by count(posts.id) asc;

#17. Колко потребителя с по 1 пост имаме. Използвайте join заявка, having clause и
#вложени заявки.


#18. Колко потребителя с по малко от 5 поста имаме. Използвайте join заявка, having
#clause и вложени заявки.


#19. Кои са постовете с най-много коментари. Използвайте вложена заявка и where
#clause


#20. Покажете най-стария пост. Може да използвате order или с aggregate function.
select * from posts
order by createdat asc;

select min(createdAt) from posts;

#21. Покажете най-новия пост. Може с order или с aggregate function.
select * from posts
order by createdat desc;

select max(createdat) from posts; 

#22. Покажете всички постове с празен caption.
Select min(caption) from posts; 

#23. Създайте потребител през UI-а, добавете му public пост през базата и проверете
#дали се е създал през UI-а
insert into posts (id, caption, coverurl, poststatus, userid)
values ('3000', 'hi there','https://images-na.ssl-images-amazon.com/images/I/718ZFmocadL._AC_SL1500_.jpg', 'public', '325'); 

#24. Покажете всички постове и коментарите им ако имат такива.
select id, caption, commentscount from posts;

#25. Покажете само постове с коментари и самите коментари.
select posts.id, comments.content
from posts
inner join comments
on posts.id=comments.postid; 

#26. Покажете името на потребителя с най-много коментари. Използвайте join клауза.
select users.username, posts.commentscount
from users
inner join posts
on users.id=posts.userid
order by commentscount desc;

#27. Покажете всички коментари, към кой пост принадлежат и кой ги е направил.
#Използвайте join клауза.
select comments.content, posts.caption, users.username
from comments
left join posts
on comments.userid=posts.userid
left join users
on posts.userId=users.id;

#28. Кои потребители са like-нали най-много постове.
select users.username, count(users_liked_posts.postsId)
from users
right join users_liked_posts
on users.id=users_liked_posts.usersId
group by usersId
order by count(users_liked_posts.postsId) desc;



#29. Кои потребители не са like-вали постове.
select users.username, users_liked_posts.postsid
from users 
left join users_liked_posts
on users.id=users_liked_posts.usersId
order by postsId asc;  

#30. Кои постове имат like-ове. Покажете id на поста и caption
Select posts.id, posts.caption, users_liked_posts.postsid
from posts
inner join users_liked_posts
on posts.userid=users_liked_posts.usersid; 

#31. Кои постове имат най-много like-ове. Покажете id на поста и caption.
Select posts.id, posts.caption, users_liked_posts.postsid
from posts
inner join users_liked_posts
on posts.userid=users_liked_posts.usersid
order by postsid desc; 

#32. Покажете всички потребители, които не follow-ват никого.
select users.id, users_followers_users.usersId_2
from users
left join users_followers_users
on users.id=users_followers_users.usersId_1
order by usersId_2 asc; 

#33. Покажете всички потребители, които не са follow-нати от никого
select users.id, users_followers_users.usersId_2
from users
left join users_followers_users
on users.id=users_followers_users.usersId_1
order by usersId_2 asc;

#34. Регистрирайте потребител през UI. Follow-нете някой съществуващ потребител и
#проверете дали записа го има в базата.
select users.id, users.username, users_followers_users.usersId_2
from users
left join users_followers_users
on users.id=users_followers_users.usersId_1
order by id desc;





















