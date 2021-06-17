create table photoboard{
id int primary key,
name varchar(10) not null,
password varchar(10),
email varchar(50),
subject varchar(50) not null,
content text not null,
inputdate varchar(50) not null,
masterid int default 0,
readcount int default 0,
replaynum int default 0,
filename varchar(50), 
filesize int default 0,
like_cnt int default 0,
product_name varchar(40)
}


create table like_save{
id int,
userid varchar(60)
}