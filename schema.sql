create database serviagro;
use serviagro;

create table usuario(
	id int not null auto_increment primary key,
	nombre varchar(50),
	apellido varchar(50),
	nom_us varchar(50),
	email varchar(255),
	contrasenia varchar(60),
	imagen varchar(255),
	es_act boolean not null default 1,
	es_adm boolean not null default 0,
	creado_el datetime
);

insert into usuario(nombre,apellido,email,contrasenia,es_act,es_adm,creado_el) value ("Administrador", "","admin","90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad",1,1,NOW());

create table categoria(
	id int not null auto_increment primary key,
	imagen varchar(255),
	nombre varchar(50),
	descripcion text,
	creado_el datetime
);

create table producto(
	id int not null auto_increment primary key,
	imagen varchar(255),
	cod_barra varchar(50),
	nombre varchar(50),
	descripcion text,
	min_invent int default 10,
	prec_ent float,
	prec_sal float,
	unidad varchar(255),
	presentacion varchar(255),
	id_usuario int,
	id_categoria int,
	creado_el datetime,
	es_act boolean default 1,
	foreign key (id_categoria) references categoria(id),
	foreign key (id_usuario) references usuario(id)
);


create table persona(
	id int not null auto_increment primary key,
	imagen varchar(255),
	nombre varchar(255),
	apellido varchar(50),
	compania varchar(50),
	direc_1 varchar(50),
	direc_2 varchar(50),
	telef1 varchar(50),
	telef2 varchar(50),
	email1 varchar(50),
	email2 varchar(50),
	genero int,
	creado_el datetime
);


create table tipo_operac(
	id int not null auto_increment primary key,
	nombre varchar(50)
);

insert into tipo_operac (nombre) value ("entrada");
insert into tipo_operac (nombre) value ("salida");

create table caja(
	id int not null auto_increment primary key,
	creado_el datetime
);


create table venta(
	id int not null auto_increment primary key,
	id_persona int ,
	id_usuario int ,
	tipo_operac_id int default 2,
	id_caja int,

	total double,
	efectivo double,
	descuento double,

	foreign key (id_caja) references caja(id),
	foreign key (tipo_operac_id) references tipo_operac(id),
	foreign key (id_usuario) references usuario(id),
	foreign key (id_persona) references persona(id),
	creado_el date
);

create table operacion(
	id int not null auto_increment primary key,
	id_producto int,
	cant float,
	tipo_operac_id int,
	id_venta int,
	creado_el datetime,
	foreign key (id_producto) references producto(id),
	foreign key (tipo_operac_id) references tipo_operac(id),
	foreign key (id_venta) references venta(id)
);

create table configuracion(
	id int not null auto_increment primary key,
	corto varchar(255) unique,
	nombre varchar(255) unique,
	genero int,
	val varchar(255)
);
insert into configuracion(corto,nombre,genero,val) value("title","Titulo del Sistema",2,"Serviagro");
insert into configuracion(corto,nombre,genero,val) value("use_image_product","Utilizar Imagenes en los productos",1,0);
insert into configuracion(corto,nombre,genero,val) value("active_clients","Activar clientes",1,0);
insert into configuracion(corto,nombre,genero,val) value("active_providers","Activar proveedores",1,0);
insert into configuracion(corto,nombre,genero,val) value("active_categories","Activar categorias",1,0);
insert into configuracion(corto,nombre,genero,val) value("active_reports_word","Activar reportes en Word",1,0);
insert into configuracion(corto,nombre,genero,val) value("active_reports_excel","Activar reportes en Excel",1,0);
insert into configuracion(corto,nombre,genero,val) value("active_reports_pdf","Activar reportes en PDF",1,0);
