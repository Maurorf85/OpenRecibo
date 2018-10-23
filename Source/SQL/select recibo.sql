SELECT r.ID, r.ATIVO, r.TSINSERT, r.TSUPDATE, r.NUMERO, r.DATA, r.VALOR, r.VIAS,
       r.LKPAGADOR,   (select p.nome from recibo_pessoa p      where p.id   = r.LKPAGADOR)   as pagador,  
       r.LKEMITENTE,  (select p.nome from recibo_pessoa p      where p.id   = r.LKEMITENTE)  as emitente, 
       r.REFERENTE, r.OBS
FROM RECIBO r order by r.ID desc;