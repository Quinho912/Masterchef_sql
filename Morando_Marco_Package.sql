create or replace package Marco_Morando is
procedure mejores_recetas;
procedure peores_recetas;
procedure recetas_seguntipo(v_tipo varchar2);
procedure receta_categoria;
procedure recetas_del_chef(v_nomchef varchar2);
procedure nuevo_ingrediente(v_nombre varchar2,v_tipo varchar2);
function recetas_disponibles_marco (idch number) return number;
procedure cambio_telf_marco (nomres in varchar2, telf  in number);
end Marco_Morando;



create or replace package body Marco_Morando as

procedure mejores_recetas 
is
v_estrellas evaluacion.estrellas%type;
cursor c2(var_estrellas evaluacion.estrellas%type) is
select distinct recetas.id_receta, recetas.nombre, recetas.calorias,
recetas.comensales, recetas.categoria, chefs.nombre as chef
from evaluacion
join recetas on evaluacion.id_receta = recetas.id_receta
join autoria on evaluacion.id_receta = autoria.id_receta
join chefs on autoria.id_chef = chefs.id_chef
where evaluacion.estrellas = var_estrellas;
begin
select max(estrellas) into v_estrellas
from evaluacion;
dbms_output.put_line('-------------------------LAS MEJORES RECETAS-------------------------');
dbms_output.put_line(' Id receta - Nombre receta - Calorias - Comensales - Categoria - Chef');
dbms_output.put_line('---------------------------------------------------------------------');
for c2_datos in c2(v_estrellas) loop
dbms_output.put_line(Lpad(c2_datos.id_receta,10) || ' - '
||Rpad(c2_datos.nombre,13) || ' - ' || Lpad(c2_datos.calorias,8) || ' - '
||Lpad(c2_datos.comensales,10) || ' - ' || Rpad(c2_datos.categoria,9) || ' - '
|| c2_datos.chef);
end loop;
end;

procedure peores_recetas
is
cursor c1 is
select recetas.id_receta,evaluacion.estrellas, recetas.nombre, chefs.nombre as chef
from evaluacion join recetas on evaluacion.id_receta = recetas.id_receta
join autoria on evaluacion.id_receta = autoria.id_receta
join chefs on autoria.id_chef = chefs.id_chef
order by evaluacion.estrellas;
cursor c2(n_id contiene.id_receta%type) is
select ingredientes.nombre
from ingredientes join contiene on contiene.id_ingrediente = ingredientes.id_ing
where contiene.id_receta = n_id;
i number(4):=1;
c1_datos c1%rowtype;
begin
dbms_output.put_line('--------------LAS PEORES RECETAS-------------');
open c1;
loop
fetch c1 into c1_datos;
exit when i >3;
dbms_output.put_line(' Id receta - Nombre receta - Estrellas - Chef');
dbms_output.put_line('---------------------------------------------');
dbms_output.put_line(Lpad(c1_datos.id_receta,10) || ' - '
|| Lpad(c1_datos.nombre,13) || ' - '
|| Lpad(c1_datos.estrellas,9) || ' - '
|| c1_datos.chef);
dbms_output.put_line('ingredientes: ');
for c2_datos in c2(c1_datos.id_receta) loop
dbms_output.put_line(c2_datos.nombre);
end loop;
dbms_output.put_line('');
i := i+1;
end loop;
close c1;
end;
procedure recetas_seguntipo(v_tipo varchar2)
is
  cursor c1 is
  select nombre
  from recetas
  where categoria=v_tipo;
begin
  dbms_output.put_line('CATEGORIA: ');
  dbms_output.put_line(v_tipo);
  dbms_output.put_line('RECETAS: ');
  for c1_datos in c1 loop
   dbms_output.put_line(c1_datos.nombre);
  end loop;
exception
When others then
dbms_output.put_line('Esa categoria no existe o esta mal escrita');
end;
procedure receta_categoria is
  cursor c1 is
  select categoria, nombre, id_receta
  from recetas;
  cursor c2(v_rec contiene.id_receta%type) is
  select ingredientes.nombre, contiene.cantidad, contiene.unidad
  from ingredientes join contiene on ingredientes.id_ing = contiene.id_ingrediente
  where contiene.id_receta = v_rec;
begin
  dbms_output.put_line('Listado de Recetas por Categoria');
  dbms_output.put_line('----------------------------------------------------------------');
  for c1_datos in c1 loop
   dbms_output.put_line('CATEGORIA: '|| c1_datos.categoria || ' RECETA: ' ||c1_datos.nombre);
   dbms_output.put_line('  INGREDIENTES  - CANTIDAD - UNIDAD');
    for c2_datos in c2(c1_datos.id_receta) loop
      dbms_output.put_line(Lpad(c2_datos.nombre,15) ||' - '|| Lpad(c2_datos.cantidad,8) ||' - '|| c2_datos.unidad);
    end loop;
    dbms_output.put_line(' ');
  end loop;
end;
procedure recetas_del_chef(v_nomchef varchar2)
is 
cursor c1(v_tec chefs.nombre%type) 
is select recetas.id_receta, recetas.nombre as nom_receta 
from chefs 
join autoria on chefs.id_chef = autoria.id_chef 
join recetas on autoria.id_receta = recetas.id_receta 
where chefs.nombre = v_tec;

cursor c2(v_id contiene.id_receta%type) 
is select ingredientes.nombre, ingredientes.tipo 
from contiene 
join ingredientes on contiene.id_ingrediente = ingredientes.id_ing 
where contiene.id_receta = v_id;

chef_rec number(2); 
c1_datos c1%rowtype; 
num_receta number(2):=1;
num_ing number(3):=1;

begin
select count(autoria.id_receta) into chef_rec 
from chefs 
join autoria on chefs.id_chef = autoria.id_chef 
where chefs.nombre = v_nomchef;

dbms_output.put_line('  ================================='); 
dbms_output.put_line('|| NOMBRE DEL CHEF - TOTAL RECETAS ||');
dbms_output.put_line('|| '||Lpad(v_nomchef,15)||' - '||Lpad(chef_rec,7)||Lpad(' ||',9));
dbms_output.put_line('  ================================='); 

open c1(v_nomchef); 
loop fetch c1 into c1_datos; 
exit when c1%notfound; 
dbms_output.put_line(num_receta||'º Receta: '||c1_datos.nom_receta); 
dbms_output.put_line('Ingredientes:');
for c2_datos in c2(c1_datos.id_receta) 
loop 
dbms_output.put_line(num_ing||'.- '||c2_datos.nombre||' Tipo: '||c2_datos.tipo); 
num_ing:= num_ing+1;
end loop; 
num_ing:=1;
num_receta := num_receta+1; 
dbms_output.put_line('-------------------------------------'); 
end loop; 
if num_receta>3 
then dbms_output.put_line('Puedes pedir un aumento de salario'); 
end if; 
if num_receta<=3 then 
dbms_output.put_line('tienes que ser mas creativo'); 
end if; 
close c1; 
exception
  when no_data_found then
    dbms_output.put_line('Ese chef no existe!!');
  when others then
    dbms_output.put_line('Vuelve a ejecutar y asegurate de poner bien el nombre del chef!!');
end; 
procedure nuevo_ingrediente(v_nombre varchar2,v_tipo varchar2)
is
  n_ing number(4); 

begin
  select max(id_ing) into n_ing
  from ingredientes;
  n_ing:= n_ing+1;
  
  INSERT INTO ingredientes 
  VALUES(n_ing,v_nombre,v_tipo);
end;
function recetas_disponibles_marco (idch number) return number
as
num_rec number(4);

begin
    select count(*) into num_rec
    from recetas
    join autoria on autoria.id_receta=recetas.id_receta
    where autoria.id_chef= idch;

   return num_rec;
  end;
procedure cambio_telf_marco (nomres in varchar2, telf  in number)
is
begin

  update restaurante set telefono= telf
  where nombre=nomres;
end;
end Marco_Morando;
