---------------------------------------
--recibo
---------------------------------------
create table recibo(
  id integer not null primary key,
  ativo integer default 1,
  tsinsert timestamp,
  tsupdate timestamp,
  numero varchar(20),
  data date,
  valor numeric(5,2),
  vias integer default 1,
  lkpagador integer,
  lkemitente integer,
  referente varchar(255),
  obs varchar(255),
  foreign key(lkpagador) references recibo_pessoa(id),
  foreign key(lkemitente) references recibo_pessoa(id)
);

create generator recibo_id;

SET TERM ^ ;

CREATE TRIGGER tr_recibo_insert FOR recibo
  ACTIVE BEFORE INSERT POSITION 0 AS
BEGIN
  if (new.id is NULL) then new.id = gen_id(recibo_id,1);
  new.tsinsert = current_timestamp;
  --new.tsupdate = new.tsinsert;
END^

CREATE TRIGGER tr_recibo_update FOR recibo
  ACTIVE BEFORE UPDATE POSITION 0 AS
BEGIN
  new.tsupdate = current_timestamp;
END^

SET TERM ; ^
