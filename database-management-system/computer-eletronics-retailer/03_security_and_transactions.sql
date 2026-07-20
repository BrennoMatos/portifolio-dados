---Usuários e permissões 
create role gerente;
create role estagiario;

grant select, insert on bairro, cliente, complemento, fornecedor, municipio, nacionalidade, pedido, pedido_produto, produto, profissao, transportadora, uf, vendedor to gerente with grant option;
grant select on cliente_dados, pedido_dados to estagiario;
grant all on all sequences in schema public to gerente;

create role maria login password '123' in role gerente;
create role pedro login password '321' in role estagiario;

create role atendente;

grant select, insert on pedido, pedido_produto to atendente;

create role joao login password '135' in role atendente;

---Transações
create table conta (
	idconta serial not null,
	cliente nome_medio not null,
	saldo moeda not null default 0,

	constraint pk_cnt_idconta primary key (idconta)
)

insert into conta (cliente, saldo) values ('Cliente 1', 1000);
insert into conta (cliente, saldo) values ('Cliente 2', 500);

select * from conta;

update conta  set saldo = saldo - 100 where idconta = 1;
update conta  set saldo = saldo + 100 where idconta = 2;

begin;
update conta  set saldo = saldo - 100 where idconta = 1;
update conta  set saldo = saldo + 100 where idconta = 2;
rollback;

begin;
update conta  set saldo = saldo - 100 where idconta = 1;
update conta  set saldo = saldo + 100 where idconta = 2;
commit;