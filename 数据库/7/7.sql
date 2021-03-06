/*1.1*/
create view stu as select Student.Sno, Sname, Cname, Grade
from Student join SC on Student.Sno = SC.Sno join Course on SC.Cno = Course.Cno
go
/*1.2*/
create view countSC as 
select Sno, COUNT(Cno) 选课门数 from SC group by Sno
go
/*1.3*/
create view sumCredit as
select Sno, SUM(Ccredit) 总学分 from SC join Course on SC.Cno=Course.Cno
where Grade>=60
group by Sno
/*2.1*/
select Sname, Cname, Grade from stu
where Grade>=90
go
/*2.2*/
select Sno, 选课门数 from countSC
where 选课门数>3
go
/*2.3*/
select Sname, 选课门数 from Student join countSC on Student.Sno=countSC.Sno
where Sdept = '计算机系' and 选课门数>3
go
/*2.4*/
select Student.Sno, Sname, Sdept,总学分 from sumCredit join Student on sumCredit.Sno=Student.Sno
where 总学分>10
go
/*2.5*/
select Sname, Sage, Sdept, 总学分 from sumCredit join Student on sumCredit.Sno=Student.Sno
where 总学分>10 and Sage>=20
go
/*3*/
create view xinxi as
select Sno, Sname, Sdept from Student
where Sdept='信息管理系'
go
/*4.1*/
update xinxi set Sdept='软件工程系' where Sdept='信息管理系'
go
/*4.2*/
insert into xinxi values('301','大华','物联网系')
go
/*4.3*/
delete from xinxi where Sno='301'
go
/*5.1*/
create nonclustered index Ix_Sdept on Student (Sdept DESC)
go
/*5.2*/
create unique nonclustered index Ix_Sno on Student (Sno) include(Sname)
go
/*5.3*/
create nonclustered index Ix_sc on SC(Grade) where Grade>85
go
/*5.4*/
create nonclustered index Ix_Sno_Cno on SC (Sno,Cno)
go
/*5.5*/
alter index Ix_Sdept on Student disable
go
/*5.6*/
drop index Ix_Sdept on Student
go