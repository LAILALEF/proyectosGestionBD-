
create table cliente(
dni int primary key,
nombre varchar (45),
apellido varchar(45),
direccion varchar(45),
telefono int,
email varchar(45)
);
create table proveedor(
idproveedor int primary key,
nombre varchar(45),
apellido varchar(45),
direccion varchar(45),
telefono int ,
email varchar (45)
);
create table categoria(
idcategoria int primary key, 
nombre varchar(45)
);
create table venta (
idventa int primary key, 
cantidad float, 
total float, 
fecha_compra date,
fk_dni int, 
foreign key (fk_dni) references cliente
);
create table producto(
idproducto int primary key, 
nombre varchar(45),
precio int,
cantidad int, 
fecha_ingreso date, 
fk_idproveedor int, 
fk_idcategoria int, 
foreign key (fk_idproveedor) references  proveedor,
foreign key (fk_idcategoria) references  categoria);

create table producto_has_venta (
fk_idventa int ,
fk_idproducto int,
foreign key (fk_idventa)references  venta, 
foreign key (fk_idproducto)references  producto
);

insert into cliente(dni,nombre , apellido,direccion,telefono,email)
values('1234567', 'KARLOS', 'SANCHO', 'C/SALAMANCA N01', '600400500', 'K.SANCHO@GMAIL.COM'),
      ('1234566', 'LOUIS', 'MAN', 'C/MADRID N02', '600400501', 'L.MAN@GMAIL.COM'),
      ('1234565', 'MARIA', 'JOUSI', 'C/TOLEDO N03', '600400502', 'M.JOUSI@GMAIL.COM'),
      ('1234564', 'XAVI', 'ROOK', 'C/LINDO N04', '600400503', 'X.ROOK@GMAIL.COM'),
      ('1234563', 'MOHA', 'SOL', 'C/PALOMA N05', '600400504', 'M.SOL@GMAIL.COM'),
      ('1234562', 'MELA', 'SODRI', 'C/LONDON N06', '600400505', 'M.SODRI@GMAIL.COM'),
      ('1234561', 'DIANA', 'DIABLO', 'C/CANARIAS N07', '600400506', 'D.DIABLO@GMAIL.COM'),
      ('1234560', 'PABLO', 'TERIS', 'C/LION N08', '600400507', 'P.TERIS@GMAIL.COM'),
      ('1234559', 'ALFREDO', 'KIMON', 'C/PARIS N09', '600400508', 'M.SOL@GMAIL.COM'),
      ('1234558', 'ADILSON', 'SHISHI', 'C/SORIA N10', '600400509', 'A.SHISHI@GMAIL.COM');

select*from cliente;

insert into proveedor(idproveedor,nombre , apellido,direccion,telefono,email)
values ('012', 'SEBA', 'KONO', 'C/BARCELONA N20', '601400500', 'S.KONO@GMAIL.COM'),
       ('013', 'LAMIS', 'PEDRO', 'C/MARSEILLE N21', '602400501', 'P.MARS@GMAIL.COM'),
       ('014', 'SIMBA', 'KONAN', 'C/VALLICAS N22', '603400502', 'S.KONAN@GMAIL.COM'),
      ('015', 'RONA', 'RAOUL', 'C/BAJO N23', '604400503', 'R.RAOUL@GMAIL.COM'),
      ('016', 'MASHA', 'JESI', 'C/GRANADA N24', '605400504', 'M.JESI@GMAIL.COM'),
      ('017', 'ILYAS', 'MIRI', 'C/VALENCIA N25', '606400505', 'I.MIRI@GMAIL.COM'),
      ('018', 'DAVID', 'DONA', 'C/CHAMARTIN N26', '607400506', 'D.DONA@GMAIL.COM'),
      ('019', 'PEDRO', 'SANCHIZ', 'C/GIRONA N27', '608400507', 'P.TERIS@GMAIL.COM'),
      ('020', 'TERIZA', 'KARLOS', 'C/TETOUAN N28', '609400508', 'T.KARLOS@GMAIL.COM'),
      ('021', 'SHEYLA', 'JOLI', 'C/LARIOJA N29', '610400509', 'S.JOLI@GMAIL.COM');
SELECT*FROM PROVEEDOR;

insert into categoria(idcategoria,nombre)
values ('1010','CHANEL'),
        ('1020','DIOR'),
		('1030','TOM FORD'),
		('1040','CREED'),
		('1050','GUERLIN'),
		('1060','YSL'),
		('1070','HERMES'),
		('1080','ARMANI'),
		('1090','JEAN PAUL GAULTIER'),
		('1100','BVLGARI');
SELECT*FROM CATEGORIA;

insert into venta(idventa,cantidad,total,fecha_compra,fk_dni)
values ('2100','100','500.00','2024-01-02','1234567'),
       ('2101','50','250.00','2024-01-03','1234561'),
	   ('2201','125','900.00','2024-02-15','1234560'),
	   ('2301','150','800.00','2024-02-20','1234566'),
	   ('2401','80','350.00','2024-03-01','1234565'),
	   ('2501','40','450.00','2024-03-15','1234564'),
	   ('2601','20','950.00','2024-05-15','1234563'),
	   ('2701','200','800.00','2024-04-20','1234562'),
	   ('2801','170','740.00','2024-04-30','1234558'),
	   ('2901','300','2000.00','2024-05-20','1234559');

select*from venta;

insert into producto(idproducto,nombre,precio,cantidad,fecha_ingreso,fk_idproveedor,fk_idcategoria)
values ('80','j adore','60','16','2024-02-01','013','1020'),
	   ('70','Black Orchid','50','25','2024-03-01','013','1030'),
       ('60','Aventus','90','10','2024-04-01','014','1040'),
	   ('50','jicky','70','40','2024-05-02','015','1050'),
		('40',' libre','65','15','2024-10-15','016','1060'),
		('30','Kelly Calèche ','100','30','2024-12-01','017','1070'),
		('20','Si','70','45','2024-10-07','018','1080'),
		('10','le male','85','45','2024-09-15','019','1090'),
		('91','omnia','75','25','2024-11-01','020','1100');

select*from producto;
insert into producto_has_venta(fk_idventa,fk_idproducto)
values ('2100','90'),
       ('2101','80'),
       ('2201','70'),
	    ('2301','60'),
		('2401','50'),
		('2501','40'),
		('2601','30'),
		('2701','20'),
		('2801','10'),
		('2901','91');
select*from producto_has_venta;

