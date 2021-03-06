--1
create default def_1 as '计算机系'
exec sp_bindefault 'def_1','Student.Sdept'
go
--2
create rule rule_1 as @rule1 between 1 and 7
exec sp_bindrule 'rule_1','Course.Ccredit'
exec sp_unbindrule 'Course.Ccredit'
drop rule rule_1
go
--3
declare cur_1 cursor scroll
	for select Student.Sno,Sname,Sdept,Grade
	from Student,SC,Course
	where student.sno=sc.sno and course.cno=sc.cno and Cname='高等数学'
	order by grade desc
open cur_1
fetch next from cur_1
fetch next from cur_1
fetch last from cur_1
close cur_1
deallocate cur_1
--4
 declare @Sname char(10),@Sage char(4),@Sdept char(20)
 declare c1 cursor for select distinct Sdept from Student
 open c1
 fetch next from c1 into @Sdept
 while @@FETCH_STATUS=0
 begin
 print @Sdept
 declare c2 cursor for select top 2 with ties Sname,Sage from Student where Sdept=@Sdept order by
 Sage desc
 open c2
 fetch next from c2 into @Sname,@Sage if @@fetch_status=0
 print @Sname+@Sage
 
 fetch next from c2 into @Sname,@Sage if @@fetch_status=0
 print @Sname+@Sage
 
 print''
 close c2
 deallocate c2
 fetch next from c1 into @Sdept
 end
 close c1
 deallocate c1