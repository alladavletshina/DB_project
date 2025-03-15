WITH RECURSIVE employeeManager as (
	select 
		e.employeeid as EmployeeID,
		e.name as EmployeeName,
		e.managerid,
		e.departmentid,
		e.roleid
	from employees e
	join Roles r on e.roleid = r.roleid
	where r.RoleName = 'Менеджер'
	
	union all

	select 
		e.employeeid as EmployeeID, 
		e.name as EmployeeName,
		e.managerid,
		e.departmentid,
		e.roleid
	from employees e
	join employeeManager em on e.managerid = em.employeeid
)

select
	em.EmployeeID as EmployeeID,
	em.EmployeeName as EmployeeName,
	em.ManagerID as ManagerID,
	d.DepartmentName as DepartmentName,
	r.RoleName as RoleName,
	STRING_AGG(distinct p.ProjectName, ', ' ORDER BY p.ProjectName) AS ProjectNames,
	STRING_AGG(distinct t.TaskName, ', ' ORDER BY t.TaskName) AS TaskNames,
	count(distinct e.employeeid) as TotalSubordinates
	
from employeeManager em
left join departments d on em.departmentid = d.DepartmentID
left join Roles r on em.roleid = r.roleid
left join Projects p on p.DepartmentID = em.DepartmentID
left join tasks t on em.employeeid = t.AssignedTo
left join employees e on em.employeeid = e.ManagerID
group by em.EmployeeID, em.EmployeeName, em.ManagerID, d.DepartmentName, r.RoleName, p.ProjectName
having count(distinct e.employeeid) > 0
order by EmployeeName;