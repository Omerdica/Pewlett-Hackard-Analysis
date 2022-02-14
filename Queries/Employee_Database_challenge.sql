SELECT e.emp_no,
		e.first_name,
		e.last_name,
		ti.title,
		ti.from_date,
		ti.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS ti
ON(e.emp_no = ti.emp_no)
WHERE(e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY (e.emp_no) DESC;

SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no ,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles AS rt
WHERE(rt.to_date = '9999-01-01')
ORDER BY rt.emp_no, rt.title DESC;

SELECT COUNT (title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT DESC;

SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON(e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON(de.emp_no = ti.emp_no)
WHERE(e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND(de.to_date = '9999-01-01');

SELECT COUNT (title), title
INTO new_mentorship_eligibilty_count
FROM mentorship_eligibilty 
GROUP BY title
ORDER BY COUNT DESC;


SELECT e.hire_date,
e.first_name,
e.last_name,
ti.title
INTO mentorship_eligibilty_2
FROM mentorship_eligibilty as me
INNER JOIN titles as ti
ON(me.emp_no = ti.emp_no)
INNER JOIN employees as e
ON(e.emp_no = me.emp_no)
GROUP BY e.hire_date, e.first_name, e.last_name, ti.title
ORDER BY e.hire_date DESC;

SELECT COUNT (title), title
INTO new_mentorship_eligibilty_count_2
FROM mentorship_eligibilty_2
GROUP BY title
ORDER BY COUNT DESC;