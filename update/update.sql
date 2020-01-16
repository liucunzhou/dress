alter table dr_dress add weigh int not null default 0;
alter table dr_dress add sku varchar(100) not null default '';
alter table dr_dress add rent_price decimal(10,2) not null default '0.00';
alter table dr_dress add sale_price decimal(10,2) not null default '0.00';

create table dr_rent(
   `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY  KEY,
   `operate_id` int not null default 0,
   `customer_id` int not null default 0,
   `status` varchar(100) not null default 'init',
   `visit_date` int not null default 0,
   `rent_date` int not null default 0,
   `back_date` int not null default 0,
   `createtime` int not null default 0,
   `updatetime` int not null default 0,
   `deletetime` int not null default 0
);

alter table dr_rent add realname varchar(100) not null default '';
alter table dr_rent add mobile varchar(20) not null default '';
alter table dr_rent add totals decimal(10,2) not null default '0.00';


create table dr_rent_goods(
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY  KEY,
  `rent_id` int not null default 0,
  `goods_type` varchar(100) not null default 'goods',
  `gogds_id` int not null default 0
)

create table dr_rent_payment(
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY  KEY,
  `operate_id` int not null default 0,
  `rent_id` int not null default 0,
  `payment_id` int not null default 0,
  `pay_type` varchar(64) not null default 'full',
  `pay_money` decimal(10,2) not null default '0.00',
  `createtime` int not null default 0,
  `updatetime` int not null default 0
)

