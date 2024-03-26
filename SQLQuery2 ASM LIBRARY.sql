create database library
go

use library
go

create table authors
(
    author_id nchar(10) primary key,
    first_name nvarchar(50) not null,
    last_name nvarchar(50) not null
)
select * from authors

insert into authors (author_id, first_name, last_name)
values 
    ('1', 'Nam', 'Cao'),
    ('2', 'Nguyen', 'Du')
go
SELECT * FROM authors;


create table categories
(
    category_id nchar(10) primary key,
    category_name nvarchar(50) not null
)
go

insert into categories (category_id, category_name)
values 
    ('1', 'Truyen Ngan'),
    ('2', 'Truyen Tho')
go

select * from categories

create table books
(
    book_id nchar(10) primary key,
    book_name nvarchar(100) not null,
    title nvarchar(100) not null,
    author_id nchar(10) not null,
    category_id nchar(10) not null,
    quantity int not null,
    foreign key (author_id) references authors(author_id),
    foreign key (category_id) references categories(category_id)
)
go

insert into books (book_id, book_name, title, author_id, category_id, quantity)
values 
    ('1', 'Chi Pheo', 'Truyen Ngan', '1', '1', 10),
    ('2', 'Truyen Kieu', 'Truyen Tho', '2', '2', 5)
go

select * from books

create table member_cards
(
    card_id nchar(10) primary key,
    member_name nvarchar(100) not null,
    address varchar(100) not null,
    phone_number varchar(20) not null,
    email varchar(100) null
)
go

insert into member_cards (card_id, member_name, address, phone_number, email)
values 
    ('2001', 'Pham Le Truong', 'Quang Ninh', '0823369604', 'truong111@gmail.com'),
    ('2004', 'Tran Manh Hien', 'Ha Noi', '0001112222', 'hientran111@gmail.com')
go

select * from member_cards

create table borrowings
(
    borrow_id nchar(10) primary key,
    book_id nchar(10) not null,
    card_id nchar(10) not null,
    borrow_date date not null,
    return_date date not null,
    foreign key (book_id) references books(book_id),
    foreign key (card_id) references member_cards(card_id)
)
go


insert into borrowings (borrow_id, book_id, card_id, borrow_date, return_date)
values 
    ('1', '1', '2001', '2024-01-01', '2024-02-02'),
    ('2', '2', '2004', '2024-01-01', '2024-02-02')

	Select * from borrowings 

create table returns
(
    return_id nchar(10) primary key,
    borrow_id nchar(10) not null,
    return_date date not null,
    foreign key (borrow_id) references borrowings(borrow_id)
)
go

insert into returns (return_id, borrow_id, return_date)
values 
    ('1', '1', '2024-02-02'),
    ('2', '2', '2024-02-02')
go

select * from returns 

create table users
(
user_id nchar (10) primary key,
username nvarchar(50) not null,
password nvarchar(50) not null
)
go

insert into users 
(
user_id ,
username,
password
)
values 
('1', 'phamletruong', '12345'),
('2','tranmanhhien','56789')
go 



create table students
(
    student_id nchar(10) primary key,
    student_name nvarchar(100) not null,
    student_code nvarchar(10) not null
)
go

insert into students (student_id, student_name, student_code)
values 
    ('1001', 'Pham Le Truong', 'SV001'),
    ('1002', 'Tran Manh Hien', 'SV002')
go
select * from students

alter table member_cards
add student_id nchar(10) null,
    foreign key (student_id) references students(student_id)
go

update member_cards
set student_id = '1001'
where card_id = '2001'

update member_cards
set student_id = '1002'
where card_id = '2004'

create table book_authors
(
    book_id nchar(10) not null,
    author_id nchar(10) not null,
    primary key (book_id, author_id),
    foreign key (book_id) references books(book_id),
    foreign key (author_id) references authors(author_id)
)
go

insert into book_authors (book_id, author_id)
values 
    ('1', '1'),
    ('2', '2')
go

select * from book_authors

DROP TABLE book_descriptions;
create table book_descriptions
(
    
    
    book_id nchar(10) primary key,
	description text
    foreign key (book_id) references books (book_id)
)
go

insert into book_descriptions (book_id, description)
values 
    ('1', 'Cuoc song cua nguoi nong dan ngheo trong xa hoi Viet Nam cu'),
    ('2', 'Doan truong tan thanh')
go

select * from book_descriptions

ALTER TABLE borrowings
DROP CONSTRAINT FK__borrowing__card___6D0D32F4

ALTER TABLE borrowings
ALTER COLUMN card_id nvarchar(100)


ALTER TABLE borrowings
ADD CONSTRAINT FK__borrowing__card___6D0D32F4 FOREIGN KEY (card_id) REFERENCES member_cards(card_id)

ALTER TABLE member_cards
DROP CONSTRAINT PK__member_c__BDF201DD7B43A6EA

ALTER TABLE member_cards
ALTER COLUMN card_id nvarchar(100) not null

ALTER TABLE member_cards
ADD CONSTRAINT PK_member_cards PRIMARY KEY (card_id)

select username from users
select * from students


