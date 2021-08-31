--mysql, oracle : SQL
create table tbl_board(
	idx int not null auto_increment,
	title varchar(100) not null,
	contents varchar(2000) not null,
	count int default 0,
	writer varchar(100) not null,
	indate datetime default now(),
	primary key(idx)
);

insert into tbl_board(title, contents, writer) values('스프링게시판','스프링게시판','관리자');
insert into tbl_board(title, contents, writer) values('스프링게시판','스프링게시판','백은서');

select * from tbl_board;