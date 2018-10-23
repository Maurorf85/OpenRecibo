---------------------------------------
--referente
---------------------------------------
create table recibo_referente(
  id integer not null primary key,
  ativo integer default 1,
  tsinsert timestamp,
  tsupdate timestamp,
  referente varchar(255)
);

create generator recibo_referente_id;

SET TERM ^ ;

CREATE TRIGGER tr_recibo_referente_insert FOR recibo_referente
  ACTIVE BEFORE INSERT POSITION 0 AS
BEGIN
  if (new.id is NULL) then new.id = gen_id(recibo_referente_id,1);
  new.tsinsert = current_timestamp;
  --new.tsupdate = new.tsinsert;
END^

CREATE TRIGGER tr_recibo_referente_update FOR recibo_referente
  ACTIVE BEFORE UPDATE POSITION 0 AS
BEGIN
  new.tsupdate = current_timestamp;
END^

SET TERM ; ^
