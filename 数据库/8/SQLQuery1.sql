--1
declare @i int,@sum int
set @i=1
set @sum=0
while @i<=100
begin
	set @sum = @sum+@i
	set @i=@i+1
end
print @sum
go
--2.1
create proc proc_2_1
@sno char(7)='0611101'
as
begin
	select SC.Sno,Sname,Cno,Grade from Student join SC on Student.Sno=SC.Sno
	where SC.Sno=@sno
end
execute proc_2_1
execute proc_2_1 '0611102'
go
--2.2
create proc proc_2_2
@sdept nvarchar(20)
as
begin
	select count(Ssex) from Student
	where Sdept=@sdept and Ssex='男'
end
execute proc_2_2 '计算机系'
go
--2.3
create proc proc_2_3
@sname nchar(5)
as
begin
	select COUNT(cno) from SC join Student on SC.Sno=Student.Sno
	where Sname=@sname
	group by SC.Sno
end
execute proc_2_3 '李勇'
go
--2.4
create proc proc_2_4
@sname nchar(5)
as
begin
	delete from SC where Sno in
	(select Sno from Student where Sname=@sname)
end
execute proc_2_4 '李勇'
go
--2.5
create proc proc_2_5
@cno char(6), @semster tinyint
as
begin
	update Course set Semster=@semster where Cno=@cno
end
execute proc_2_5 'C001', 8
go
--2.6
create proc proc_2_6
@sno char(7), @sname nchar(5), @ssex nchar(1)
as
begin
	insert into Student(sno,sname,ssex)
	values(@sno,@sname,@ssex)
end
execute proc_2_6 '0611107', '张三', '男'
go
--2.7
create proc proc_2_7
@cno char(6)
as
begin
	
	if @cno is null
		return 1
	else
	begin
		select AVG(Grade)as 平均值 from SC where Cno=@cno
		return 2
	end
end
declare @return_num int,@return_avg int
execute @return_num=proc_2_7  @avg=@return_avg output
select @return_num 返回值,@return_avg 平均值
go
--3.1.1
create trigger tri_3_1_1 on Student
for insert
as
begin
	if exists (select * from inserted where Sage>45 or Sage<15)
	begin
		print '学生的年龄在15~45之间'
		rollback transaction
	end
end
go
--3.1.2
create trigger tri_3_1_2 on Student
instead of insert
as
begin
	if exists (select * from inserted where Sage>45 or Sage<15)
	begin
		print '学生的年龄在15~45之间'
		rollback transaction
	end
end
go
--test 3.1
insert into Student(Sage)
values(1)
go
--3.2
create trigger tri_3_2 on Student
for insert
as
begin
	if  exists (select * from inserted 
	where Sdept not in ('计算机系' ,'信息管理系' ,'数学系','通信工程系'))
	begin
		print '学生所在系的取值范围为{计算机系，信息管理系，数学系，通信工程系}'
		rollback transaction
	end
end
go
--test 3.2
insert into Student(Sno,Sname,Sdept)
values('132',11,112)
go
--3.3
create trigger s_log on course after insert
as
if  not exists (select sum(Ccredit) from inserted
having sum(Ccredit) between 20 and 30
)
begin rollback transaction
print'总学分不符合要求'
end
go
--test3.3
insert into Course
values('B01','数据库',31,4)
go
--3.4
create trigger tri_3_4 on SC
for insert
as
begin
	if exists (select count(SC.Cno) from SC join inserted on SC.Sno=inserted.Sno group by SC.Sno having count(SC.Cno)>6)
	begin
		print '学生每学期选课门数不能超过6门'
		rollback transaction
	end
end
go
--test3.4
insert into SC(Sno,Cno)
values('123123','C993')
go

--3.5
create trigger tri_3_5 on Student
for update
as
begin
declare @old_sno int
declare @new_sno int
select @old_sno=Sno from deleted
select @new_sno=Sno from inserted
if update(Sno)
update SC set Sno=@new_sno where Sno=@old_sno
end
go

--3.6
create trigger tri_3_6 on Student
for delete
as
begin
declare @del_sno int
select @del_sno=Sno from deleted
delete from SC where Sno=@del_sno
end
go

--test3.6
delete from Student where Sno='0611102'
go

--3.7
create trigger tri_3_7 on SC
for update
as
begin
if update(grade)
print'不能修改grade列'
rollback
end
go

--test3.7
update SC set Grade='100' where Sno='0611102'

--3.8
create trigger std_trriger on database
after Drop_table
as
begin
print'您无法执行删除操作'
rollback transaction
end
go

--test3.8
Drop Table sc
go