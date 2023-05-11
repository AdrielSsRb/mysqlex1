use classicmodels;
show tables;

/* A */

select lastName, count(customerNumber) as total from employees as ep
inner join customers as cs on cs.salesRepEmployeeNumber =  ep.employeeNumber
group by lastName
having total > 0;

/*B*/

select  cs.customerNumber as numero_cliente, cs.customerName as nome_cliente, sum(odd.priceEach) as total_de_compras 
from customers as cs
inner join orders as od on od.customerNumber = cs.customerNumber
inner join orderdetails as odd on od.orderNumber = odd.orderNumber
group by cs.customerNumber, cs.customerName
order by cs.customerName asc;

/*C*/

select  cs.customerNumber as numero_cliente, cs.customerName as nome_cliente, avg(odd.priceEach) as media_de_compras 
from customers as cs
inner join orders as od on od.customerNumber = cs.customerNumber
inner join orderdetails as odd on od.orderNumber = odd.orderNumber
group by cs.customerNumber, cs.customerName
order by cs.customerName asc;

/*D*/

select ofc.officeCode as cod_dep, ofc.addressLine1 as endereço1, count(employeeNumber) as  total_de_funcionarios 
from employees as ep
inner join offices as ofc on ofc.officeCode = ep.officeCode
group by ofc.officeCode, ofc.addressLine1;

/*E*/

select ep.employeeNumber, ep.firstName, count(odd.orderNumber) as vendas from employees as ep
inner join customers as cs on cs.salesRepEmployeeNumber = ep.employeeNumber
inner join orders as od on od.customerNumber = cs.customerNumber
inner join orderdetails as odd on odd.orderNumber = od.orderNumber
group by ep.employeeNumber, ep.firstName
order by ep.firstName;

/*F*/

select  productCode as numero_produto, count(productCode) as quantidade_produtos
from orderdetails 
group by productCode
order by quantidade_produtos desc
limit 5;