create database ql_sinhvien
use ql_sinhvien
create table khoa(
makhoa int primary key,
tenkhoa nvarchar(100),
diachi nvarchar(200)
)
select *from khoa 
create table lop(
malop char(20) primary key,
tenlop char(30),
khoahoc char(20),
makhoa int,
constraint fk_lop_khoa foreign key (makhoa) references khoa(makhoa))
create table sinhvien(
masv char(10) primary key,
hovaten nvarchar(50),
tuoi int check (tuoi between 18 and 22),
malop char(20),
makhoa int,
taikhoan char(50) unique,
sdt char(10) unique,
namnhaphoc int default(2023),
constraint fk_sv_lop foreign key (malop) references lop(malop),
constraint fk_sv_khoa foreign key(makhoa)references khoa(makhoa))
select *from lop
select *from khoa
select *from sinhvien
insert into khoa values 
(1,N'cong nghe thong tin',N'301'),
(2,N'ngon ngu anh',N'308'),
(3,N'cong nghe thuc pham',N'309'),
(4,N'phu ho',N'302')
insert into lop values
('k23.it01','k23.it01','2023-2027',1),
('k23.nna02','k23.nna02','2023-2027',1),
('k23.tt03','k23.tt03','2023-2027',1),
('k23.ph04','k23.ph04','2023-2027',1)
insert into sinhvien (masv,hovaten,tuoi,malop,makhoa,taikhoan,sdt) values 
('230001',N'nguyen thi lanh',19,'k23.it01',1,'it.230001ntu.vn','0887787779'),
('230002',N'nguyen thi lan',20,'k23.nna02',1,'it.230002ntu.vn','0887737779'),
('230003',N'nguyen thi anh',21,'k23.tt03',1,'it.230003ntu.vn','0887487779')
select * from sinhvien
delete sinhvien
update sinhvien set hovaten=N'nguyen thi lan' where masv='230002'
select *from sinhvien where makhoa=1

select*from sinhvien where tuoi>=20

select*from khoa where tenkhoa like N'cong nghe%'

select*from lop where makhoa=1

select masv,hovaten,tuoi,sdt,namnhaphoc from sinhvien where (tuoi between 19 and 22) and namnhaphoc=2023

select masv+''+hovaten as 'mã sv h? và tên',tuoi,malop,makhoa,namnhaphoc from sinhvien 
select makhoa,count(*) as 'so sv khoa cntt' from sinhvien where makhoa=1 group by (makhoa)
select makhoa,count(*) as 'so sv khoa cntt' from sinhvien group by (makhoa)
select makhoa,count(*) as 'so lop' from lop group by (makhoa) having makhoa>=v