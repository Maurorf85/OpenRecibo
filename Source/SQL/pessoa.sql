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
