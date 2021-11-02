use quanlybanhang;

create table orderdetail
(
    oID int,
    pID int,
    odQTY int
);
alter table orderdetail add foreign key (oID) references orderp(oID);
alter table orderdetail add foreign key (pID) references product(pID);
alter table orderdetail add primary key (oID, pID);
# Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select orderp.oID, orderp.oDate, p.pPrice
from orderp join product p
order by pPrice;
# Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.cName,p.pName
from orderp join customer c on orderp.oID = c.cID
join orderdetail o on orderp.oID = o.oID
join product p on o.pID = p.pID;
#Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c.cName
from customer c left join orderp o on c.cID = o.cID
left join orderdetail o2 on o.oID = o2.oID
group by c.cName
having sum(odQTY) is null;
# Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán
# của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)

select oID, oDate,odQTY*p.pPrice
from orderdetail join product p on orderdetail.pID = p.pID
join orderp o on orderdetail.oID = o.oID












