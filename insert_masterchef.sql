insert into chefs
(id_chef, nombre, estrellas)
values
(1, 'Antone', 3);

insert into chefs
(id_chef, nombre, estrellas)
values
(2, 'Maria', 4);

insert into chefs
(id_chef, nombre, estrellas)
values
(3, 'Juan', 5);

insert into chefs
(id_chef, nombre, estrellas)
values
(4, 'Pedro', 2);

insert into recetas
(id_receta, nombre, calorias, comensales, categoria)
values
(1, 'Omelet', 100, 4, 'Huevos');

insert into recetas
(id_receta, nombre, calorias, comensales, categoria)
values
(2, 'Guisado', 400, 2, 'Carnes');

insert into recetas
(id_receta, nombre, calorias, comensales, categoria)
values
(3, 'Paella', 500, 4, 'Arroces');

insert into recetas
(id_receta, nombre, calorias, comensales, categoria)
values
(5, 'Sopa tomate', 150, 4, 'Sopas');

insert into recetas
(id_receta, nombre, calorias, comensales, categoria)
values
(6, 'Crepes', 270, 4, 'Postres');

insert into recetas
(id_receta, nombre, calorias, comensales, categoria)
values
(4, 'Carne tierna', 400, 3, 'Carnes');

insert into recetas
(id_receta, nombre, calorias, comensales, categoria)
values
(7, 'Carne porcina especial', 300, 4, 'Carnes');

insert into recetas
(id_receta, nombre, calorias, comensales, categoria)
values
(8, 'Asado', 400, 3, 'Carnes');

insert into recetas
(id_receta, nombre, calorias, comensales, categoria)
values
(9, 'Helado', 330, 4, 'Postres');

insert into ingredientes
(id_ing, nombre, tipo)
values
(1, 'tomate', 'vegetal');

insert into ingredientes
(id_ing, nombre, tipo)
values
(2, 'huevo', 'huevo');

insert into ingredientes
(id_ing, nombre, tipo)
values
(3, 'leche', 'lacteo');

insert into ingredientes
(id_ing, nombre, tipo)
values
(4, 'carne vacuna', 'vacuno');

insert into ingredientes
(id_ing, nombre, tipo)
values
(5, 'queso', 'lacteo');

insert into ingredientes
(id_ing, nombre, tipo)
values
(6, 'pollo', 'ave');

insert into ingredientes
(id_ing, nombre, tipo)
values
(7, 'carne porcina', 'porcino');

insert into ingredientes
(id_ing, nombre, tipo)
values
(8, 'arroz', 'arroz');

insert into ingredientes
(id_ing, nombre, tipo)
values
(9, 'fetuccini', 'pasta');

insert into ingredientes
(id_ing, nombre, tipo)
values
(10, 'nata liquida', 'lacteo');

insert into ingredientes
(id_ing, nombre, tipo)
values
(11, 'nata p/montar', 'lacteo');

insert into ingredientes
(id_ing, nombre, tipo)
values
(12, 'azucar blanco', 'azucar');

insert into ingredientes
(id_ing, nombre, tipo)
values
(13, 'azucar moreno', 'azucar');

insert into ingredientes
(id_ing, nombre, tipo)
values
(14, 'vainilla', 'vegetal');

insert into usuarios
(user_id, nombre)
values
(1, 'Pere');

insert into usuarios
(user_id, nombre)
values
(2, 'Marcela');

insert into usuarios
(user_id, nombre)
values
(4, 'Franca');

insert into usuarios
(user_id, nombre)
values
(3, 'Ali');

insert into usuarios
(user_id, nombre)
values
(5, 'John');

insert into evaluacion
(user_id, id_receta, estrellas)
values
(1, 1, 4);

insert into evaluacion
(user_id, id_receta, estrellas)
values
(1, 2, 2);

insert into evaluacion
(user_id, id_receta, estrellas)
values
(2, 1, 4);

insert into evaluacion
(user_id, id_receta, estrellas)
values
(2, 3, 5);

insert into evaluacion
(user_id, id_receta, estrellas)
values
(4, 4, 5);

insert into evaluacion
(user_id, id_receta, estrellas)
values
(5, 4, 5);

insert into evaluacion
(user_id, id_receta, estrellas)
values
(3, 8, 3);

insert into autoria
(id_chef, id_receta)
values
(1, 1);

insert into autoria
(id_chef, id_receta)
values
(1, 2);

insert into autoria
(id_chef, id_receta)
values
(2, 3);

insert into autoria
(id_chef, id_receta)
values
(3, 4);

insert into autoria
(id_chef, id_receta)
values
(4, 5);

insert into autoria
(id_chef, id_receta)
values
(4, 6);

insert into autoria
(id_chef, id_receta)
values
(1, 7);

insert into autoria
(id_chef, id_receta)
values
(1, 8);

insert into autoria
(id_chef, id_receta)
values
(2, 9);

insert into contiene
(id_receta, id_ingrediente, cantidad, unidad)
values
(1, 2, 200, 'gr');

insert into contiene
(id_receta, id_ingrediente, cantidad, unidad)
values
(1, 3, 100, 'ml');

insert into contiene
(id_receta, id_ingrediente, cantidad, unidad)
values
(2, 4, 50, 'gr');

insert into contiene
(id_receta, id_ingrediente, cantidad, unidad)
values
(2, 1, 70, 'gr');

insert into contiene
(id_receta, id_ingrediente, cantidad, unidad)
values
(3, 6, 100, 'ml');

insert into contiene
(id_receta, id_ingrediente, cantidad, unidad)
values
(3, 1, 150, 'ml');

insert into contiene
(id_receta, id_ingrediente, cantidad, unidad)
values
(5, 1, 200, 'gr');

insert into contiene
(id_receta, id_ingrediente, cantidad, unidad)
values
(5, 3, 100, 'gr');

insert into contiene
(id_receta, id_ingrediente, cantidad, unidad)
values
(6, 3, 50, 'ml');

insert into contiene
(id_receta, id_ingrediente, cantidad, unidad)
values
(6, 2, 100, 'gr');

insert into contiene
(id_receta, id_ingrediente, cantidad, unidad)
values
(4, 4, 10, 'gr');

insert into contiene
(id_receta, id_ingrediente, cantidad, unidad)
values
(4, 3, 100, 'gr');

insert into contiene
(id_receta, id_ingrediente, cantidad, unidad)
values
(7, 7, 200, 'gr');

insert into contiene
(id_receta, id_ingrediente, cantidad, unidad)
values
(8, 4, 400, 'gr');

insert into contiene
(id_receta, id_ingrediente, cantidad, unidad)
values
(8, 1, 100, 'gr');

insert into contiene
(id_receta, id_ingrediente, cantidad, unidad)
values
(7, 1, 50, 'gr');

insert into contiene
(id_receta, id_ingrediente, cantidad, unidad)
values
(9, 14, 1, 'unidad');

insert into contiene
(id_receta, id_ingrediente, cantidad, unidad)
values
(9, 11, 500, 'ml');

insert into contiene
(id_receta, id_ingrediente, cantidad, unidad)
values
(9, 12, 200, 'gr');

insert into contiene
(id_receta, id_ingrediente, cantidad, unidad)
values
(3, 8, 500, 'gr');
