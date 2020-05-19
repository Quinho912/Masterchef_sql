--TRIGGERS: ya que no se pueden añadir en un package los paso en un script--
--7--

drop table auditoria;
create table auditoria(
estado varchar2 (20),
nombre varchar2 (30),
usuario varchar2 (20),
fecha date,
hora varchar2 (10)
);

create or replace trigger log_auditoria
before insert or update or delete of nombre on ingredientes
for each row

begin
   if inserting then
    insert into auditoria
    values('alta', :new.nombre , (select user from dual), sysdate, (select to_char(current_timestamp,'HH-MI-SS') from dual));
  end if;

  if deleting then
    insert into auditoria
    values('baja',:old.nombre, (select user from dual), sysdate, (select to_char(current_timestamp,'HH-MI-SS') from dual));
  end if;

  if updating then
    insert into auditoria
    values('modificacion',:old.nombre, (select user from dual), sysdate, (select to_char(current_timestamp,'HH-MI-SS') from dual));
  end if;

end;
/

--9--

create or replace trigger block_evaluacion
before insert or update of id_receta on evaluacion
for each row
declare
id_rec number(4);

begin
SELECT count(recetas.id_receta) into id_rec
      FROM recetas
      join autoria on autoria.id_receta=recetas.id_receta
      join chefs on chefs.id_chef=autoria.id_chef
      where chefs.nombre='Antone' and :new.id_receta=recetas.id_receta;

   if inserting then
    if id_rec >0 then
      raise_application_error(-20001, 'No puedes modificar la evaluacion de las recetas del chef Antone');
    end if;
  end if;

  if updating then
   if id_rec >0 then
      raise_application_error(-20001, 'No puedes modificar la evaluacion de las recetas del chef Antone');    
    end if;
   end if;
end;
/

-- 10 --
create table restaurante(
id_rest number(4),
nombre varchar2(20),
id_chef number(4),
telefono number(10)
);

insert into restaurante
values (1,'Ratatouille',1,640702245);

insert into restaurante
values (2,'Pasion de la carne',3,648342245);

insert into restaurante
values (3,'Pollos Copacabana',4,640712345);

insert into restaurante
values (4,'Rincon del vegano',2,645602245);

insert into restaurante
values (5,'Chefsito',1,641202245);

--FUNCION
--La funcion está implementado en el package, pero esta seria la consulta para ejecutar esta función--

  select nombre, recetas_disponibles (1) from restaurante
  where id_chef=1;

--PROCEDIMIENTO
--El procedimiento está implementado en el package, pero esta seria la consulta para ejecutarlo--

set serveroutput on
declare
v_name restaurante.nombre%type;
v_telf restaurante.telefono%type;
begin
v_name:='Chefsito';
v_telf:=699999990;

cambio_telf(v_name,v_telf);
dbms_output.put_line(v_name||' cambio de telefono al: '||v_telf);
end;
/

--TRIGGER

drop table audi_rest;

create table audi_rest(
estado varchar2 (20),
nombre varchar2 (30),
usuario varchar2 (20),
fecha date,
hora varchar2 (10)

);


create or replace trigger log_audi_rest
before insert or update or delete of nombre on restaurante
for each row
begin

   if inserting then
    insert into audi_rest
    values('añadido', :new.nombre , (select user from dual), sysdate, (select to_char(current_timestamp,'HH24-MI-SS') from dual));
  end if;

  if deleting then
    insert into audi_rest
    values('eliminado',:old.nombre, (select user from dual), sysdate, (select to_char(current_timestamp,'HH24-MI-SS') from dual));
  end if;

  if updating then
    insert into audi_rest
    values('modificado',:old.nombre||' a '||:new.nombre, (select user from dual), sysdate, (select to_char(current_timestamp,'HH24-MI-SS') from dual));
  end if;
end;

/

--Esta es la consulta realizada para verificar el funcionamiento del Trigger--
begin
INSERT INTO restaurante VALUES
  (6,'Ajayu',2,225185098);

update restaurante
  set nombre = 'La sanguijuela'
  where id_rest = 6;

delete from restaurante
  where id_rest = 6;
end;
 /
