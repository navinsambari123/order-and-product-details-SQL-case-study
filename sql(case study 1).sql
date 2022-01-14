#fetch data from database
select * from tr_orderdetails;

#1)). find the maximum quantity sold in trnsaction?

select max(Quantity),count(*) from tr_orderdetails;

#2)).Find the unique product in all the transactions

select distinct ProductID,quantity from tr_orderdetails
where Quantity=3
order by ProductID asc,Quantity desc;

#3))..find the unique properties

select distinct (PropertyID),Quantity from tr_orderdetails
order by PropertyID asc;

#4))...find the product category that has maximum products

select ProductCategory, count(*) as count from tr_products
group by ProductCategory
order  by 2 desc;

select * from tr_products;

#5)))...find the top 5 ProductID that did maximum sales in terms of quantity

select ProductID, Price as count from tr_products
group by ProductID
order  by 2 desc;

#6)))....find the state where most stores are present

select * from tr_propertyinfo;
select PropertyState,count(*) as count from tr_propertyinfo
group by PropertyState
order  by 2 desc;

#7))).....find the top 5 product ids that did maximum sales in term of quantity

select ProductID ,sum(Quantity) as total from tr_orderdetails
group by ProductID 
order by ProductID desc;

#8)))...find the top 5 propertyids that did maximum sales in term of quantity

select PropertyID ,sum(Quantity) as total from tr_orderdetails
group by PropertyID
order by 2 desc
limit 5;


#9))..find the top 5 productname that did maximum sales in terms of quantity

select o.*,p.ProductName,p.ProductCategory,p.Price from tr_orderdetails as o left join tr_products as p  on o.ProductID=p.ProductID;

select p.ProductName,sum(o.Quantity) as total_quantity from tr_orderdetails as o left join tr_products as p  on o.ProductID=p.ProductID
group by p.ProductName
order by 2 desc;

#10))).....find the top 5 product that did maximum sales

  #quantity * price =sales
  select p.ProductName,sum(p.Price*o.Quantity) as sale from tr_orderdetails as o left join tr_products as p  on o.ProductID=p.ProductID
  group by p.ProductName
  order by sale desc;

#11))).....find the top 5 cities that did maximum sales

select pi.PropertyCity ,sum(p.Price*o.Quantity) as sale from tr_orderdetails as o 
left join tr_products as p  on o.ProductID=p.ProductID
left join tr_propertyinfo as pi on o.PropertyID=pi.`Prop ID`
  group by pi.PropertyCity
  order by sale desc
  limit 5;
  
  

 






