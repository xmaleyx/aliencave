1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select e.employee_name, s.monthly_salary 
from employees e 
inner join employee_salary es on es.employee_id = e.id
inner join salary s on es.salary_id = s.id;


--2. Вывести всех работников у которых ЗП меньше 2000.
select e.employee_name, s.monthly_salary 
from employees e 
inner join employee_salary es on es.employee_id = e.id
inner join salary s on salary_id = s.id
where monthly_salary < 2000;

--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select e.employee_name, s.monthly_salary
from employee_salary es 
left join employees e on es.employee_id = e.id
left join salary s on es.salary_id = s.id 
where e.employee_name is null;


--4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select e.employee_name, s.monthly_salary
from employee_salary es 
left join employees e on es.employee_id = e.id
left join salary s on es.salary_id = s.id 
where e.employee_name is null and s.monthly_salary < 2000;

--5. Найти всех работников кому не начислена ЗП.
select e.employee_name, es.salary_id 
from employees e 
full join employee_salary es on es.employee_id = e.id
where es.salary_id is null;


--6. Вывести всех работников с названиями их должности.
select e.employee_name, re.role_id, r.role_name 
from employees e 
join roles_employee re on employee_id = e.id
join roles r on re.role_id = r.id;

--7. Вывести имена и должность только Java разработчиков.
select e.employee_name, r.role_name 
from employees e 
join roles_employee re on employee_id = e.id
join roles r on re.role_id = r.id 
where r.role_name like '%Java%';

--8. Вывести имена и должность только Python разработчиков.

select e.employee_name, r.role_name
from employees e
inner join roles_employee on employee_id = e.id
inner join roles r on role_id = r.id 
where r.role_name like '%Python%';

--9. Вывести имена и должность всех QA инженеров.

select e.employee_name, r.role_name 
from employees e 
join roles_employee re on employee_id = e.id
join roles r on re.role_id = r.id 
where r.role_name like '%QA%';

--10. Вывести имена и должность ручных QA инженеров.

select e.employee_name, r.role_name 
from employees e 
join roles_employee re on employee_id = e.id
join roles r on re.role_id = r.id 
where r.role_name like '%Manual%';

--11. Вывести имена и должность автоматизаторов QA

select e.employee_name, r.role_name 
from employees e 
join roles_employee re on employee_id = e.id
join roles r on re.role_id = r.id 
where r.role_name like '%Automation%';

--12. Вывести имена и зарплаты Junior специалистов

select e.employee_name, s.monthly_salary, r.role_name 
from employees e
join employee_salary es on employee_id = e.id
join salary s on s.id = es.id
join roles_employee re on re.employee_id = e.id
join roles r on role_id = r.id 
where r.role_name like 'Junior%';


--13. Вывести имена и зарплаты Middle специалистов
select e.employee_name, s.monthly_salary, r.role_name 
from employees e
join employee_salary es on employee_id = e.id
join salary s on s.id = es.id
join roles_employee re on re.employee_id = e.id
join roles r on role_id = r.id 
where r.role_name like 'Middle%';

--14. Вывести имена и зарплаты Senior специалистов

select e.employee_name, s.monthly_salary, r.role_name 
from employees e
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.id
join roles_employee re on re.employee_id = e.id
join roles r on re.role_id = r.id 
where r.role_name like 'Senior%';

--15. Вывести зарплаты Java разработчиков

select s.monthly_salary, r.role_name 
from salary s 
join roles_employee re on role_id = s.id
join roles r on r.id = re.id 
where r.role_name like '%Java %';

--16. Вывести зарплаты Python разработчиков

select s.monthly_salary, r.role_name 
from salary s 
join roles_employee re on role_id = s.id
join roles r on r.id = re.id 
where r.role_name like '%Python%';

--17. Вывести имена и зарплаты Junior Python разработчиков

select e.employee_name, s.monthly_salary, r.role_name 
from employees e
join employee_salary es on employee_id = e.id
join salary s on s.id = es.id
join roles_employee re on re.employee_id = e.id
join roles r on role_id = r.id 
where r.role_name like 'Junior Python%';

--18. Вывести имена и зарплаты Middle JS разработчиков

select e.employee_name, s.monthly_salary, r.role_name 
from employees e
join employee_salary es on employee_id = e.id
join salary s on s.id = es.id
join roles_employee re on re.employee_id = e.id
join roles r on role_id = r.id 
where r.role_name like 'Middle JavaScript%';

--19. Вывести имена и зарплаты Senior Java разработчиков

select e.employee_name, s.monthly_salary, r.role_name 
from employees e
join employee_salary es on employee_id = e.id
join salary s on s.id = es.id
join roles_employee re on re.employee_id = e.id
join roles r on role_id = r.id 
where r.role_name like 'Senior Java %';

--20. Вывести зарплаты Junior QA инженеров

select s.monthly_salary, r.role_name 
from salary s 
join roles_employee re on role_id = s.id
join roles r on r.id = re.id 
where r.role_name like '%Junior%' and r.role_name like '%QA%';

--21. Вывести среднюю зарплату всех Junior специалистов

select avg(s.monthly_salary) as avg_salary from salary s 
left join employee_salary es on s.id = es.salary_id 
left join employees e on es.employee_id = e.id 
left join roles_employee re on e.id = re.employee_id 
left join roles r on re.role_id = r.id 
where r.role_name like '%Junior%';

--22. Вывести сумму зарплат JS разработчиков

select sum(s.monthly_salary) as sum_js 
from salary s 
left join employee_salary es on s.id = es.salary_id
left join employees e on es.employee_id = e.id
left join roles_employee re on e.id = re.employee_id 
left join roles r on re.role_id = r.id 
where r.role_name like '%JavaScript%';



--23. Вывести минимальную ЗП QA инженеров

select min(s.monthly_salary) as min_salaryQAEng
from salary s 
left join employee_salary es on es.salary_id = s.id 
left join employees e on e.id = es.employee_id
left join roles_employee re on re.employee_id = e.id
left join roles r on r.id = re.role_id
where r.role_name like '%QA engineer%';

--24. Вывести максимальную ЗП QA инженеров

select max(s.monthly_salary) as max_salaryQAEng
from salary s 
left join employee_salary es on es.salary_id = s.id 
left join employees e on e.id = es.employee_id
left join roles_employee re on re.employee_id = e.id
left join roles r on r.id = re.role_id
where r.role_name like '%QA engineer%'

--25. Вывести количество QA инженеров

select count(r.role_name) as QA_Enginier
from roles r 
left join roles_employee re on re.role_id = r.id 
where r.role_name like '%QA engineer%';

--26. Вывести количество Middle специалистов.

select count(r.role_name) as QA_Enginier
from roles r 
left join roles_employee re on re.role_id = r.id 
where r.role_name like '%Middle%';

--27. Вывести количество разработчиков

select count(r.role_name) as developers
from roles r 
left join roles_employee re on re.role_id = r.id 
where r.role_name like '%developer%';

--28. Вывести фонд (сумму) зарплаты разработчиков.

select sum(s.monthly_salary) as sum_dev_salary
from salary s 
left join employee_salary es on es.salary_id = s.id 
left join employees e on e.id = es.employee_id
left join roles_employee re on re.role_id = e.id
left join roles r on r.id = re.role_id 
where r.role_name like '%developer%';

--29. Вывести имена, должности и ЗП всех специалистов по возрастанию

select e.employee_name, s.monthly_salary, r.role_name 
from employees e
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id
left join roles_employee re on re.employee_id = e.id
join roles r on r.id = re.role_id
order by e.employee_name, s.monthly_salary, r.role_name; 



--30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300

select e.employee_name, s.monthly_salary, r.role_name 
from employees e
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id
left join roles_employee re on re.employee_id = e.id
join roles r on r.id = re.role_id
where s.monthly_salary between '1700' and '2300'
order by e.employee_name, s.monthly_salary, r.role_name;

--31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

select e.employee_name, s.monthly_salary, r.role_name 
from employees e
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id
left join roles_employee re on re.employee_id = e.id
join roles r on r.id = re.role_id
where s.monthly_salary < 2300
order by e.employee_name, s.monthly_salary, r.role_name;

--32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1300, 2200

select e.employee_name, s.monthly_salary, r.role_name 
from employees e
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id
left join roles_employee re on re.employee_id = e.id
join roles r on r.id = re.role_id
where s.monthly_salary in(1100, 1300, 2200)
order by e.employee_name, s.monthly_salary, r.role_name;