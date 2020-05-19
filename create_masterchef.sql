Create table chefs
(
	Id_chef number(4)	constraint chefs_idchef_pk primary key,
	Nombre varchar2(30)	constraint chefs_nombre_nn not null,
	Estrellas number(1)	constraint chefs_estrellas_nn not null constraint chefs_estrellas_ck check (estrellas between 1 and 5)

);

Create table recetas
(
	Id_receta	number(4) 	constraint recetas_idreceta_pk primary key,
	Nombre	varchar2(30)	constraint recetas_nombre_nn not null,
	Calorias	number(4)	constraint recetas_calorias_nn not null,
	Comensales	number(2)	constraint recetas_comensales_nn not null,
	Categoria	varchar2(10)	constraint recetas_categoria_nn not null
);

Create table ingredientes
(
	Id_ing		number(4)	constraint ingredientes_iding_pk primary key,
	Nombre	varchar2(30)	constraint ingredientes_nombre_nn not null,
	Tipo		varchar2(10)	constraint ingredientes_tipo_nn not null
);

Create table contiene
(
	Id_receta	number(4),
	Id_ingrediente	number(4),
	Cantidad	number(5)	constraint contiene_cantidad_nn not null,
	Unidad		varchar(10)	constraint contiene_unidad_nn not null,

	Constraint contiene_pk primary key (id_receta, id_ingrediente),
	Constraint contiene_receta_fk foreign key (id_receta) references recetas(id_receta),
	Constraint contiene_ingrediente_fk foreign key (id_ingrediente) references ingredientes(id_ing)
);

Create table autoria
(
	Id_chef 	number(4),
	Id_receta 	number(4),

	Constraint autoria_pk primary key (id_chef, id_receta),
	Constraint autoria_chef_fk foreign key (id_chef) references chefs(id_chef),
	Constraint autoria_receta_fk foreign key (id_receta) references recetas(id_receta)

);

Create table usuarios
(
	User_id 	number(4) constraint usuarios_userid_pk primary key,
	Nombre 	varchar2(30) constraint usuarios_nombre_nn not null
);

Create table evaluacion
(
	User_id	number(4),
	Id_receta	number(4),
	Estrellas	number(1)	constraint evaluacion_estrellas_nn not null constraint evaluacion_estrellas_ck check (estrellas between 1 and 5),

	Constraint evaluacion_pk primary key (user_id, id_receta),
	Constraint evaluacion_usuario_fk foreign key (user_id) references usuarios(user_id),
	Constraint evaluacion_receta_fk foreign key (id_receta) references recetas(id_receta)
);
