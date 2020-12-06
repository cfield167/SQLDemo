/* Connor Field*/
/* SQL Demo 4 */

/* PROBLEM 1 BEGIN */
SELECT empno, empfname FROM emp WHERE bossno IS NULL;
/* PROBLEM 1 END */

/* PROBLEM 2 BEGIN */
SELECT wrk.empno, wrk.empfname, wrk.bossno AS mgrno, boss.empfname AS mgrfname FROM emp wrk, emp boss WHERE wrk.bossno = boss.empno ORDER BY empfname;
/* PROBLEM 2 END */

/* PROBLEM 3 BEGIN */
SELECT deptname FROM dept NATURAL JOIN emp WHERE deptname IN (SELECT deptname FROM emp WHERE emp.empno!=dept.empno GROUP BY deptname HAVING AVG(empsalary)>25000);
/* PROBLEM 3 END */

/* PROBLEM 4 BEGIN */
SELECT empno, empfname FROM emp WHERE bossno IN (SELECT bossno FROM emp WHERE empfname = 'Andrew');
/* PROBLEM 4 END */

/* PROBLEM 5 BEGIN */
SELECT empno, empfname, empsalary FROM emp WHERE empsalary IN (SELECT MAX(empsalary) FROM emp GROUP BY bossno HAVING MAX(empsalary) AND bossno IN (SELECT bossno FROM emp WHERE empfname = 'Andrew'));
/* PROBLEM 5 END */

/* PROBLEM 6 BEGIN */
SELECT empno, empfname FROM emp WHERE empno IN (SELECT bossno FROM emp) AND empno NOT IN (SELECT empno FROM dept);
/* PROBLEM 6 END */

/* PROBLEM 7 BEGIN */
SELECT prodid, proddesc, prodprice FROM product WHERE prodid IN (SELECT subprodid FROM assembly WHERE prodid = (SELECT prodid FROM product WHERE proddesc = 'Animal photography kit')) AND prodprice = (SELECT MAX(prodprice) FROM product WHERE prodid IN (SELECT subprodid FROM assembly WHERE prodid = (SELECT prodid FROM product WHERE proddesc = 'Animal photography kit')));
/* PROBLEM 7 END */