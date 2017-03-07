   create table tbl_Registration_date
   (
  Pk_int_registration_date_id int(11) primary key auto_increment,
  Date_date date
  );




 create table tbl_Registration
   (
  Pk_int_registration_id int(11) primary key auto_increment,
  Vchr_first_name varchar(20),
  Vchr_last_name varchar(20),
  Vchr_passwordd varchar(11),
  Int_mobile_number int(10),
  Vchr_gender varchar(11),
  Vchr_age int(3),
  text_address text,
  int_status int(11),
  Vchr_power varchar(5),
  Fk_int_registration_date_id int(11),
  foreign key (Fk_int_registration_date_id) references tbl_Registration_date(Pk_int_registration_date_id)
 );


   create table tbl_product_date
   (
  Pk_int_product_id int(11) primary key auto_increment,
  Date_date date
  );


   create table tbl_product_stock
   (
  Pk_int_product_stock int(11) primary key auto_increment,
  Date_date date
  );


   create table tbl_Categories
   (
  Pk_int_categories_id int(11) primary key auto_increment,
  Vchr_name varchar(20)
  );





 create table tbl_Product
   (
  Pk_int_product_id int(11) primary key auto_increment,
  Vchr_product_name varchar(20),
  Vchr_img_path varchar(20),
  Vchr_colour varchar(20),
  Vchr_camera varchar(20),
  Vchr_sim varchar(20),
  Vchr_wifi varchar(20),
  Vchr_memory_card varchar(20),
  Vchr_os varchar(20),
  Int_Price float,
  Fk_int_product_id int(11),
  Fk_int_product_stock int(11),
  Fk_int_categories_id int(11),
  foreign key (Fk_int_product_id) references tbl_product_date(Pk_int_product_id),
  foreign key (Fk_int_product_stock) references tbl_product_stock(Pk_int_product_stock),
  foreign key (Fk_int_categories_id) references tbl_Categories(Pk_int_categories_id)
);


   create table tbl_order
   (
  pk_int_order_id int(11) primary key auto_increment,
  fk_int_product_id int(11),
  foreign key (Fk_int_product_id) references tbl_Product(Pk_int_product_id),
  Vchr_name varchar(20)
  );
	 


   create table tbl_feedback
   (
  Pk_int_feedback_id int(11) primary key auto_increment,
  fk_int_product_id int(11),
  Vchr_details varchar(20),
  Date_date date
  );