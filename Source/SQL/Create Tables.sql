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

---------------------------------------
--pessoa
---------------------------------------
create table recibo_pessoa(
  id integer not null primary key,
  ativo integer default 1,
  tsinsert timestamp,
  tsupdate timestamp,
  nome varchar(80),
  tagfisica integer,
  cpf varchar(20),
  rg varchar(20),
  cnpj varchar(20),
  ie varchar(20),
  endereco varchar(80),
  complemento varchar(80),
  bairro varchar(50),
  cidade varchar(50),
  estado varchar(3),
  cep varchar(15),
  telefone varchar(80),
  email varchar(80),
  web varchar(80)
);

create generator recibo_pessoa_id;

SET TERM ^ ;

CREATE TRIGGER tr_recibo_pessoa_insert FOR recibo_pessoa
  ACTIVE BEFORE INSERT POSITION 0 AS
BEGIN
  if (new.id is null) then new.id = gen_id(recibo_pessoa_id,1);
  new.tsinsert = current_timestamp;
  --new.tsupdate = new.tsinsert;
END^

CREATE TRIGGER tr_recibo_pessoa_update FOR recibo_pessoa
  ACTIVE BEFORE UPDATE POSITION 0 AS
BEGIN
  new.tsupdate = current_timestamp;
END^

SET TERM ; ^


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

