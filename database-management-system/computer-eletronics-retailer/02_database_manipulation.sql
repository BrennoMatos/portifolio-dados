-- Relacionamento com joins
	
select 
	cln.nome as cliente,
	prf.nome as profissao
from
	cliente as cln
left outer join
	profissao as prf on cln.idprofissao = prf.idprofissao;

select 
	cln.nome as cliente,
	prf.nome as profissao
from
	cliente as cln
inner join
	profissao as prf on cln.idprofissao = prf.idprofissao;

select 
	cln.nome as cliente,
	cln.logradouro,
	cln.numero,
	prf.nome as profissao,
	nld.nome as nacionalidade,
	cpt.nome as complemento,
	bai.nome as bairro,
	mnc.nome as municipio,
	uf.nome as estado,
	uf.sigla
from
	cliente as cln
left outer join
	profissao as prf on cln.idprofissao = prf.idprofissao
left outer join 
	nacionalidade as nld on cln.idnacionalidade = nld.idnacionalidade
left outer join 
	complemento as cpt on cln.idcomplemento = cpt.idcomplemento
left outer join 
	bairro as bai on cln.idbairro = bai.idbairro
left outer join 
	municipio as mnc on cln.idmunicipio = mnc.idmunicipio
left outer join 
	uf on mnc.iduf = uf.iduf;

select 
	pdt.nome as produto,
	pdt.valor,
	fnc.nome as fornecedor
from 
	produto as pdt
left outer join
	fornecedor as fnc on pdt.idproduto = fnc.idfornecedor;

select 
	tpt.nome as transportadora,
	mnc.nome as municipio
from 
	transportadora as tpt
left outer join
	municipio as mnc on tpt.idtransportadora = mnc.idmunicipio;

select 
	pdd.data_pedido,
	pdd.valor,
	cln.nome as cliente,
	tpt.nome as transportadora,
	vdd.nome as vendedor
from 
	pedido as pdd
left outer join
	cliente as cln on pdd.idcliente = cln.idcliente
left outer join
	transportadora as tpt on pdd.idtransportadora = tpt.idtransportadora
left outer join
	vendedor as vdd on pdd.idvendedor = vdd.idvendedor;

select 
	pdd.data_pedido,
	pdd.valor,
	cln.nome as cliente,
	tpt.nome as transportadora,
	vdd.nome as vendedor
from 
	pedido as pdd
left outer join
	cliente as cln on pdd.idcliente = cln.idcliente
left outer join
	transportadora as tpt on pdd.idtransportadora = tpt.idtransportadora
left outer join
	vendedor as vdd on pdd.idvendedor = vdd.idvendedor;

select  
	pdt.nome as produto,
	pdp.quantidade,
	pdp.valor_unitario
from
	pedido_produto as pdp
left outer join 
	produto pdt on pdp.idproduto = pdt.idproduto;

select 
	cln.nome,
	pdd.data_pedido as pedido
from 
	cliente cln
inner join
	pedido pdd on pdd.idcliente = cln.idcliente
order by 
	cln.nome;
	
select 
	cln.nome,
	pdd.data_pedido as pedido
from 
	cliente cln
left outer join
	pedido pdd on pdd.idcliente = cln.idcliente
order by 
	cln.nome;

select 
	mnc.nome,
	count(cln.idcliente) as quantidade_cliente
from 
	cliente cln
left outer join
	municipio mnc on cln.idmunicipio = mnc.idmunicipio
group by
	mnc.nome;

select 
	fnc.nome as fornecedor,
	count(pdt.idproduto) as quantidade_produto
from 
	produto pdt
left outer join
	fornecedor fnc on pdt.idfornecedor = fnc.idfornecedor
group by
	fnc.nome;

select 
	cln.nome as cliente,
	sum(pdd.valor) as valor_total_pedido
from 
	pedido pdd
left outer join
	cliente cln on pdd.idcliente = cln.idcliente
group by
	cln.nome;

select 
	vdd.nome as vendedor,
	sum(pdd.valor) as valor_total_pedido
from 
	pedido pdd
left outer join
	vendedor vdd on pdd.idvendedor = vdd.idvendedor
group by
	vdd.nome;

select 
	tpt.nome as transportadora,
	sum(pdd.valor) as valor_total_pedido
from 
	pedido pdd
left outer join
	transportadora tpt on pdd.idtransportadora = tpt.idtransportadora
group by
	tpt.nome;

select 
	cln.nome as cliente,
	count(idpedido) as quantidade_pedido
from 
	pedido pdd
left outer join
	cliente cln on pdd.idcliente = cln.idcliente
group by
	cln.nome;

select 
	pdt.nome as produto,
	sum(pdp.quantidade) as quantidade_pedido
from 
	pedido_produto pdp
left outer join
	produto pdt on pdp.idproduto = pdt.idproduto
group by
	pdt.nome;

select 
	pdd.data_pedido as data_pedido,
	sum(valor_unitario) as valor_total
from 
	pedido_produto pdp
left outer join
	pedido pdd on pdp.idpedido = pdd.idpedido
group by
	pdd.data_pedido;

select 
	pdd.data_pedido as data_pedido,
	count(pdp.quantidade) as quantidade_pedido
from 
	pedido_produto pdp
left outer join
	pedido pdd on pdp.idpedido = pdd.idpedido
group by
	pdd.data_pedido;

--- Comandos adicionais

select 
	data_pedido,
	extract(day from data_pedido),
	extract(month from data_pedido),
	extract(year from data_pedido)
from
	pedido;

select nome, substring(nome from 1 for 5), substring(nome, 2) from cliente;

select nome, upper(nome) from cliente;

select nome, cpf, coalesce(cpf, 'Não informado') from cliente;

select 
	case sigla
		when 'PR' then 'Paraná'
		when 'SC' then 'Santa Catarina'
	else 'Outros'
	end as uf
from 
	uf;

select 
	nome as cliente,
	coalesce(extract(month from data_nascimento), 0) as mes_nascimento
from 
	cliente;

select 
	nome as cliente,
	case coalesce(extract(month from data_nascimento), 0)
		when 1 then 'Janeiro'
		when 2 then 'Fevereiro'
		when 3 then 'Março'
		when 4 then 'Abril'
		when 5 then 'Maio'
		when 6 then 'Junho'
		when 7 then 'Julho'
		when 8 then 'Agosto'
		when 9 then 'Setembro'
		when 10 then 'Outubro'
		when 11 then 'Novembro'
		when 12 then 'Dezembro'
	else 'Não informado'
	end as mes_nascimento
from 
	cliente;

select 
	nome as cliente,
	coalesce(extract(year from data_nascimento), 0) as ano_nascimento
from 
	cliente;

select nome as municipio, substring(nome from 5 for 5) from municipio;

select upper(nome) from municipio;

select
	nome as cliente,
	case genero
		when 'M' then 'Masculino'
		when 'F' then 'Feminino'
	else 'Não informado'
	end as genero
from
	cliente;

select
	nome as produto,
	valor,
	case 
		when valor > 500 then 'Acima de 500'
	else 
		'Abaixo de 500'
	end as faixa
from
	produto;

-- Subconsultas

-- Selecionar a data do pedido e o valor onde o valor seja maior que a média dos
-- valores de todos os pedidos

select 
	data_pedido,
	valor
from
	pedido
where 
	valor > (select avg(valor) from pedido);

select 
	nome as cliente
from 
	cliente 
where
	idmunicipio = 1 
and 
	idcliente != 1;

select
	data_pedido,
	valor
from
	pedido
where
	valor < (select avg(valor) from pedido);

select
	pdd.data_pedido,
	pdd.valor,
	cln.nome as cliente,
	vdd.nome as vendedor,
	(select sum(quantidade) from pedido_produto pdp where pdp.idpedido = pdd.idpedido)
from 
	pedido pdd
left outer join 
	cliente cln on pdd.idcliente = cln.idcliente
left outer join
	vendedor vdd on pdd.idvendedor = vdd.idvendedor
where 
	(select sum(quantidade) from pedido_produto pdp where pdp.idpedido = pdd.idpedido) >= 2;


Select 
	nome as cliente
from
	cliente
where 
	idmunicipio = 2;

select 
	cln.nome as cliente,
	idmunicipio
from 
	cliente cln 
where 
	idmunicipio in (select idmunicipio from transportadora);

update pedido 
set 
	valor = valor + (valor * 0.05)
where 
	(select sum(valor_unitario) from pedido_produto pdp where pdp.idpedido = pedido.idpedido) > (select avg(valor_unitario) from pedido_produto);

select 
	cln.nome as nome,
	(select count(idpedido) from pedido pdd where pdd.idcliente = cln.idcliente) as quantidade
from 
	cliente cln;

select 
	cln.nome as nome,
	count(idpedido) as quantidade
from
	pedido pdd
left outer join
	cliente cln on pdd.idcliente = cln.idcliente
group by
	cln.nome;

-- Views

create view cliente_profissao as 
select
	cln.nome as cliente,
	cln.cpf,
	prf.nome as profissao
from
	cliente cln
left outer join
	profissao prf on cln.idprofissao = prf.idprofissao;

create view cliente_dados as
select 
	cln.nome as cliente,
	prf.nome as profissao,
	ncn.nome as nacionalidade,
	cpl.nome as complemento,
	mnc.nome as municipio,
	uf.nome as unidade_federacao,
	brr.nome as bairro,
	cln.cpf,
	cln.rg,
	cln.data_nascimento,
	case cln.genero
		when 'M' then 'Masculino'
		when 'F' then 'Feminino'
	else 'Outros'
	end as genero,
	cln.logradouro,
	cln.numero,
	cln.observacoes
from 
	cliente cln
left outer join
	profissao prf on cln.idprofissao = prf.idprofissao
left outer join
	nacionalidade ncn on cln.idnacionalidade = ncn.idnacionalidade
left outer join
	complemento cpl on cln.idcomplemento = cpl.idcomplemento
left outer join
	municipio mnc on cln.idmunicipio = mnc.idmunicipio
left outer join
	uf on mnc.iduf = uf.iduf
left outer join
	bairro brr on cln.idbairro = brr.idbairro;

create view municipio_dados as 
select 
	mnc.nome as municipio,
	uf.sigla
from 
	municipio mnc
left outer join
	uf on mnc.iduf = uf.iduf;

create view produto_dados as
select 
	pdt.nome as produto,
	pdt.valor,
	fnd.nome as fornecedor
from
	produto pdt
left outer join
	fornecedor fnd on pdt.idfornecedor = fnd.idfornecedor;

create view transportadora_dados as 
select 
	 tpd.nome as transportadora,
	 tpd.logradouro,
	 tpd.numero,
	 uf.nome as unidade_federacao,
	 uf.sigla
from 
	 transportadora tpd
left outer join
	municipio mnc on tpd.idmunicipio = mnc.idmunicipio
left outer join
	uf on mnc.iduf = uf.iduf;

create view pedido_dados as 
select 
	pdd.data_pedido,
	pdd.valor,
	tpd.nome as transportadora,
	cln.nome as cliente,
	vdd.nome as vendedor
from
	pedido pdd
left outer join 
	transportadora tpd on pdd.idtransportadora = tpd.idtransportadora
left outer join
	cliente cln on pdd.idcliente = cln.idcliente
left outer join 
	vendedor vdd on pdd.idvendedor = vdd.idvendedor;

---Campos autoincremento

--Tabela cliente
select max(idcliente) + 1 from cliente;
create sequence cliente_id_seq minvalue 18;
alter table cliente alter idcliente set default nextval('cliente_id_seq');
alter sequence cliente_id_seq owned by cliente.idcliente;

--Tabela complemento
select max(idcomplemento) + 1 from complemento;
create sequence complemento_id_seq minvalue 3;
alter table complemento alter idcomplemento set default nextval('complemento_id_seq');
alter sequence complemento_id_seq owned by complemento.idcomplemento;

--Tabela fornecedor
select max(idfornecedor) + 1 from fornecedor;
create sequence fornecedor_id_seq minvalue 4;
alter table fornecedor alter idfornecedor set default nextval('fornecedor_id_seq');
alter sequence fornecedor_id_seq owned by fornecedor.idfornecedor;

--Tabela municipio
select max(idmunicipio) + 1 from municipio;
create sequence municipio_id_seq minvalue 10;
alter table municipio alter idmunicipio set default nextval('municipio_id_seq');
alter sequence municipio_id_seq owned by municipio.idmunicipio;

--Tabela nacionalidade
select max(idnacionalidade) + 1 from nacionalidade;
create sequence nacionalidade_id_seq minvalue 5;
alter table nacionalidade alter idnacionalidade set default nextval('nacionalidade_id_seq');
alter sequence nacionalidade_id_seq owned by nacionalidade.idnacionalidade;

--Tabela pedido
select max(idpedido) + 1 from pedido;
create sequence pedido_id_seq minvalue 16;
alter table pedido alter idpedido set default nextval('pedido_id_seq');
alter sequence pedido_id_seq owned by pedido.idpedido;

--Tabela profissão
select max(idprofissao) + 1 from profissao;
create sequence profissao_id_seq minvalue 6;
alter table profissao alter idprofissao set default nextval('profissao_id_seq');
alter sequence profissao_id_seq owned by profissao.idprofissao;

--Tabela transportadora
select max(idtransportadora) + 1 from transportadora;
create sequence transportadora_id_seq minvalue 3;
alter table transportadora alter idtransportadora set default nextval('transportadora_id_seq');
alter sequence transportadora_id_seq owned by transportadora.idtransportadora;

--Tabela uf
select max(iduf) + 1 from uf;
create sequence uf_id_seq minvalue 7;
alter table uf alter iduf set default nextval('uf_id_seq');
alter sequence uf_id_seq owned by uf.iduf;

--Tabela vendedor
select max(idvendedor) + 1 from vendedor;
create sequence vendedor_id_seq minvalue 9;
alter table vendedor alter idvendedor set default nextval('vendedor_id_seq');
alter sequence vendedor_id_seq owned by vendedor.idvendedor;

--Tabela produto
select max(idproduto) + 1 from produto;
create sequence produto_id_seq minvalue 8;
alter table produto alter idproduto set default nextval('produto_id_seq');
alter sequence produto_id_seq owned by produto.idproduto;

---Campos default
alter table pedido alter column data_pedido set default current_date;
alter table pedido alter column valor set default 0;
insert into pedido (idcliente, idvendedor) values (1,1);
insert into pedido (idcliente, idvendedor, data_pedido, valor) 
values (1, 1, '2022-10-10', 234);

alter table pedido_produto alter column quantidade set default 1;
alter table pedido_produto alter column valor_unitario set default 0;
insert into pedido_produto (idpedido, idproduto) values (1, 3);
insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario) 
values (1, 4, 5, 100);

alter table produto alter column valor set default 0;
insert into produto (nome, idfornecedor) values ('Teste sequência', 1);
insert into produto (nome, idfornecedor, valor) values ('Teste sequência', 1, 50);

--Indices
create index idx_cln_nome on cliente (nome);
create index idx_pdd_data_pedido on pedido (data_pedido);
create index idx_pdt_nome on produto (nome);

--- Funções 
select concat('R$ ', valor) from pedido;

CREATE OR REPLACE FUNCTION formata_moeda(valor numeric) 
RETURNS TEXT AS $$
BEGIN
    RETURN 'R$ ' || TO_CHAR(valor, 'FM999G999G999D00');
END;
$$ LANGUAGE plpgsql;

SELECT valor, formata_moeda(valor) FROM pedido;
select valor, formata_moeda(valor) from produto;

create function get_nome_by_id(idc integer) returns varchar(50) language plpgsql as
$$
declare r varchar(50);
begin
	select nome into r from cliente where idcliente = idc; 
	return r;
end;
$$;

select data_pedido, valor, idcliente, get_nome_by_id(idcliente) from pedido;

create or replace function get_valor_pedido(idpdd integer) returns varchar(20) language plpgsql as
$$
begin
	return (select formata_moeda(pdd.valor) from pedido pdd where pdd.idpedido = idpdd); 
end;
$$;

select idpedido, get_valor_pedido(idpedido) from pedido;

create or replace function get_maior_pedido() returns integer language plpgsql as
$$
begin
	return (select idpedido from pedido where valor = (select max(valor) from pedido)); 
end;
$$;

select get_maior_pedido();

---Stored procedures
create procedure insere_bairro(nome_bairro varchar(30)) language sql as
$$
	insert into bairro (nome) values (nome_bairro);
$$;

call insere_bairro('Teste procedure');

select * from bairro;

create procedure reajusta_produto(idp integer, percentual float) language sql as
$$
	update produto set valor = valor + ((valor * percentual) / 100) where idproduto = idp;
$$;

call reajusta_produto(1, 10);
select * from produto;

create procedure apagar_produto(idp integer) language sql as
$$
	delete from produto where idproduto = idp;
$$;

call apagar_produto(9);

---Triggers
create table bairro_auditoria(
	idbairro integer not null,
	data_criacao timestamp not null
);

create function bairro_log() returns trigger language plpgsql as 
$$
begin 
	insert into bairro_auditoria (idbairro, data_criacao) values (new.idbairro, current_timestamp);
	return new;
end;
$$;

create trigger log_bairro_trigger after insert on bairro for each row execute procedure bairro_log(); 

call insere_bairro ('Teste 10');
call insere_bairro ('Teste 20');
call insere_bairro ('Teste 30');

create table PEDIDOS_APAGADOS(
	idpedido integer not null,
	idcliente integer not null,
	idtransportadora integer,
	idvendedor integer not null,
	data_pedido date not null,
	valor float not null,
	data_apagado date not null
);

create function pedido_log() returns trigger language plpgsql as 
$$
begin 
	insert into PEDIDOS_APAGADOS (idpedido, idcliente, idtransportadora, idvendedor, data_pedido, valor, data_apagado) 
	values (old.idpedido, old.idcliente, old.idtransportadora, old.idvendedor, old.data_pedido, old.valor, current_date);
	return new;
end;
$$;

create trigger log_pedido_trigger after delete on pedido for each row execute procedure pedido_log();

delete from pedido where idpedido = 17;
select * from pedidos_apagados;

--- Dominios

--- Ids
create domain idcurto as smallint;
create domain idmedio as integer;
create domain idlongo as bigint;

--- Caracteres 
create domain sigla as char(3);
create domain codigo as varchar(10);
create domain nome_curto as varchar(15);
create domain nome_medio as varchar(50);
create domain nome_longo as varchar(70);
create domain documento as varchar(15);
create domain tipo as char(1);
create domain texto as text;


--- Data e hora
create domain data as date;
create domain hora as time;
create domain data_hora timestamp;

--- Numéricos
create domain moeda as numeric(10,2);
create domain float_curto as numeric(6,2);
create domain float_medio as numeric(10,2);
create domain float_longo as numeric(15,2);
create domain quantidade as smallint;
