---Criação de tabela------
create table cliente (
	idcliente integer not null,
	nome varchar(50) not null,
	cpf char(11),
	rg varchar(15),
	data_nascimento date,
	genero char(1),
	profissao varchar(30),
	nacionalidade varchar(30),
	logradouro varchar(30),
	numero varchar(10),
	complemento varchar(30),
	bairro varchar(30),
	municipio varchar(30),
	uf varchar(30),
	observacoes text,

	-- primary key 
	constraint pk_cln_idcliente primary key (idcliente) --pk(chave primaria)_cln(tabela de cliente)_idcliente(coluna)	
);
----Inserção de dados na tabela ---------
insert into cliente (idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values (1, 'Manoel', '88828383821', '32323', '2001-01-30', 'M', 'Estudante', 'brasileira', 'Rua Joaquim Nabuco', '23', 'Casa', 'Cidade Nova', 'Porto União', 'SC');

insert into cliente (idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values (2, 'Geraldo', '12343299929', '56565', '1987-01-04', 'M', 'Engenheiro', 'brasileira', 'Rua das Limas', '200', 'Ap', 'Centro', 'Poro União', 'SC');

insert into cliente (idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values (3, 'Carlos', '87732323227', '55463', '1967-10-01', 'M', 'Pedreiro', 'Brasileira', 'Rua das Laranjeiras', '300', 'Apart.', 'Cto.', 'Canoinhas', 'SC');

insert into cliente (idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values (4, 'Adriana', '12321222122', '98777', '1989-09-10', 'F', 'Jornalista', 'Brasileira', 'Rua das Limas', '240', 'Casa', 'São Pedro', 'Porto Vitória', 'PR');

insert into cliente (idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values (5, 'Amanda', '99982838828', '28382', '1991-03-04', 'F', 'Jorn.', 'Italiana', 'Av. Central', '100', null, 'São Pedro', 'General Carneiro', 'PR');

insert into cliente (idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values (6, 'Ângelo', '99982828181', '12323', '2000-01-01', 'M', 'Professor', 'Brasileiro', 'Av. Beira Mar', '300', null, 'Ctr.', 'São Paulo', 'SP');

insert into cliente (idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values (7, 'Anderson', null, null, null, 'M', 'Prof.', 'Italiano', 'Av. Brasil', '100', 'Apartamento', 'Santa Rosa', 'Rio de Janeiro', 'SP');

insert into cliente (idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values (8, 'Camila', '9998282828', null, '2001-10-10', 'F', 'Professora', 'Norte americana', 'Rua Central', '4333', null, 'Centro', 'Uberlândia', 'MG');

insert into cliente (idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values (9, 'Cristiano', null, null, null, 'M', 'Estudante', 'Alemã', 'Rua do Centro', '877', 'Casa', 'Centro', 'Porto Alegre', 'RS');

insert into cliente (idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values (10, 'Fabricio', '8828282828', '32323', null, 'M', 'Estudante', 'Brasileiro', null, null, null, null, 'Porto União', 'SC');

insert into cliente (idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values (11, 'Fernanda', null, null, null, 'F', null, 'Brasileira', null, null, null, null, 'Porto União', 'SC');

insert into cliente (idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values (12, 'Gilmar', '88881818181', '888', '2000-02-10', 'M', 'Estud.', null, 'Rua das Laranjeiras', '200', null, 'C. Nova', 'Canoinhas', 'SC');

insert into cliente (idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values (13, 'Diego', '1010191919', '111939', null, 'M', 'Professor', 'Alemão', 'Rua Central', '455', 'Casa', 'Cidade N.', 'São Paulo', 'SP');

insert into cliente (idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values (14, 'Jeferson', null, null, '1983-07-01', 'M', null, 'Brasileiro', null, null, null, null, 'União da Vitória', 'PR');

insert into cliente (idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values (15, 'Jessica', null, null, null, 'F', 'Estudante', null, null, null, null, null, 'União da Vitória', 'PR');

----Consultas simples-----------

select nome, data_nascimento from cliente;

select data_nascimento as "Data de nascimento" from cliente;

select 'CPF: ' || cpf || ' RG: ' || rg as "CPF e RG" from cliente;

select * from cliente; 

select nome, data_nascimento from cliente where data_nascimento > '200-01-01';

select nome from cliente where nome like 'C%';

select nome from cliente where nome like '%c%';

select nome, data_nascimento from cliente where data_nascimento between '1990-01-01' and '1998-01-01'

select nome, rg from cliente where rg is null;

select nome from cliente order by nome;

select nome from cliente order by desc;

update cliente set nome = 'Teste' where idcliente = 1;

update cliente set nome = 'Adriano' where idclie;

select nome, genero, profissao from cliente;

select * from cliente where nome like '%r%';

select * from cliente where nome like '%a';

select * from cliente where bairro like 'Centro';

select * from cliente where complemento like 'A%';

select * from cliente where genero like 'F';

select * from cliente where cpf is null;

select nome, profissao from cliente order by profissao asc;

select * from cliente where nacionalidade like 'Brasileira';

select * from cliente where numero is not null;

select * from cliente where uf like 'SC';

select * from cliente where data_nascimento between '2000-01-01' and '2002-01-01';

select 'Nome: ' || nome || ' Logradouro: ' || logradouro || ' Número: ' || numero || ' Complemento: ' || complemento || ' Bairro: ' || bairro || ' Município: ' || municipio || ' UF: ' || uf as "Dados dos clientes" from cliente;

insert into cliente (idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values (16, 'Maicon', '12349596421', '1234', '1965-10-10', 'F', 'Empresário', null, null, null, null, null, 'Florianópolis', 'PR');

insert into cliente (idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values (17, 'Getúlio', null, '4631', null, 'F', 'Estudante', 'Brasileira', 'Rua Central', '343', 'Apartamento', 'Centro', 'Curitiba', 'SC');

insert into cliente (idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values (18, 'Sandra', null, null, null, 'M', 'Professor', 'Italiana', null, '12', 'Bloco A', null, null, null);

update cliente set cpf = '45390569432', genero = 'M', nacionalidade = 'Brasileira', uf = 'SC' where idcliente = 16;
update cliente set data_nascimento = '1978-04-01', genero = 'M' where idcliente = 17;
update cliente set genero = 'F', profissao = 'Professora', numero = '123' where idcliente = 18;

delete from cliente where idcliente = 16;
delete from cliente where idcliente = 18;

-----Criação de mais tabelas------
create table profissao (
	idprofissao integer not null,
	nome varchar(30) not null,

	constraint pk_prf_idprofissao primary key (idprofissao),
	constraint un_prf_nome unique (nome)
);

insert into profissao (idprofissao, nome) values (1, 'Estudante');
insert into profissao (idprofissao, nome) values (2, 'Engenheiro');
insert into profissao (idprofissao, nome) values (3, 'Pedreiro');
insert into profissao (idprofissao, nome) values (4, 'Jornalista');
insert into profissao (idprofissao, nome) values (5, 'Professor');

select * from profissao;

create table nacionalidade (
	idnacionalidade integer not null,
	nome varchar(30) not null,

	constraint pk_ncn_idnacionalidade primary key (idnacionalidade),
	constraint un_ncn_nome unique (nome)
);	

insert into nacionalidade (idnacionalidade, nome) values (1, 'Brasileira');
insert into nacionalidade (idnacionalidade, nome) values (2, 'Italiana');
insert into nacionalidade (idnacionalidade, nome) values (3, 'Norte-americana');
insert into nacionalidade (idnacionalidade, nome) values (4, 'Alemã');

select * from nacionalidade;

create table complemento (
	idcomplemento integer not null,
	nome varchar(30) not null,

	constraint pk_cpl_idcomplemento primary key (idcomplemento),
	constraint un_cpl_nome unique (nome)
);

insert into complemento (idcomplemento, nome) values (1, 'Casa');
insert into complemento (idcomplemento, nome) values (2, 'Apartamento');

select * from complemento;

create table bairro(
	idbairro integer not null,
	nome varchar(30) not null,

	constraint pk_brr_idbairro primary key (idbairro),
	constraint un_brr_nome unique (nome)
);

insert into bairro (idbairro, nome) values (1, 'Cidade Nova');
insert into bairro (idbairro, nome) values (2, 'Centro');
insert into bairro (idbairro, nome) values (3, 'São Pedro');
insert into bairro (idbairro, nome) values (4, 'Santa Rosa');

select * from bairro;

alter table cliente rename column profissao to idprofissao;
alter table cliente alter column idprofissao type integer;
alter table cliente drop idprofissao;
alter table cliente add idprofissao integer;
alter table cliente add constraint fk_cln_idprofissao foreign key (idprofissao) references profissao (idprofissao);

update cliente set idprofissao = 1 where idcliente in (1, 9, 10, 12, 15, 17);
update cliente set idprofissao = 2 where idcliente = 2;
update cliente set idprofissao = 3 where idcliente = 3;
update cliente set idprofissao = 4 where idcliente in (4, 5);
update cliente set idprofissao = 5 where idcliente in (6, 7, 8, 13);


alter table cliente drop nacionalidade;
alter table cliente add idnacionalidade integer;
alter table cliente add constraint fk_cln_idnacionalidade foreign key (idnacionalidade) references nacionalidade (idnacionalidade);
update cliente set idnacionalidade = 1 where idcliente in (1, 2, 3, 4, 6, 10, 11, 14, 17);
update cliente set idnacionalidade = 2 where idcliente in (5,7);
update cliente set idnacionalidade = 3 where idcliente = 8;
update cliente set idnacionalidade = 4 where idcliente in (9, 13);

alter table cliente drop complemento;
alter table cliente add idcomplemento integer;
alter table cliente add constraint fk_cln_idcliente foreign key (idcomplemento) references complemento (idcomplemento);
update cliente set idcomplemento = 1 where idcliente in (9, 13, 1, 4);
update cliente set idcomplemento = 2 where idcliente in (7, 17, 2, 3);

alter table cliente drop bairro;
alter table cliente add idbairro integer;
alter table cliente add constraint fk_cln_idbairro foreign key (idbairro) references bairro (idbairro);

update cliente set idbairro = 1 where idcliente in (13, 1, 12);
update cliente set idbairro = 2 where idcliente in (8, 9, 17, 2, 3, 6);
update cliente set idbairro = 3 where idcliente in (5, 4);
update cliente set idbairro = 4 where idcliente = 7; 

create table uf (
	iduf integer not null,
	nome varchar(30) not null,
	sigla char(2) not null,

	constraint pk_ufd_idunidade_federacao primary key (iduf),
	constraint un_ufd_nome unique (nome),
	constraint un_ufd_sigla unique (sigla)
);

insert into uf (iduf, nome, sigla) values (1, 'Santa Catarina', 'SC');
insert into uf (iduf, nome, sigla) values (2, 'Paraná', 'PR');
insert into uf (iduf, nome, sigla) values (3, 'São Paulo', 'SP');
insert into uf (iduf, nome, sigla) values (4, 'Minas Gerais', 'MG');
insert into uf (iduf, nome, sigla) values (5, 'Rio Grande do Sul', 'RS');
insert into uf (iduf, nome, sigla) values (6, 'Rio de Janeiro', 'RJ');

create table municipio (
	idmunicipio integer not null,
	nome varchar(30),
	iduf integer not null,

	constraint pk_mnc_municipio primary key (idmunicipio),
	constraint un_mnc_nome unique (nome),
	constraint fk_mnc_iduf foreign key (iduf) references uf (iduf)
);

insert into municipio (idmunicipio, nome, iduf) values (1, 'Porto União', 1);
insert into municipio (idmunicipio, nome, iduf) values (2, 'Canoinhas', 1);
insert into municipio (idmunicipio, nome, iduf) values (3, 'Porto Vitória', 2);
insert into municipio (idmunicipio, nome, iduf) values (4, 'General Carneiro', 2);
insert into municipio (idmunicipio, nome, iduf) values (5, 'São Paulo', 3);
insert into municipio (idmunicipio, nome, iduf) values (6, 'Rio de Janeiro', 6);
insert into municipio (idmunicipio, nome, iduf) values (7, 'Uberlândia', 4);
insert into municipio (idmunicipio, nome, iduf) values (8, 'Porto Alegre', 5);
insert into municipio (idmunicipio, nome, iduf) values (9, 'União da Vitória', 2);

alter table cliente drop municipio;
alter table cliente add idmunicipio integer;
alter table cliente add constraint fk_cln_idmunicipio foreign key (idmunicipio) references municipio (idmunicipio);

update cliente set idmunicipio = 1 where idcliente in (11, 10, 2, 1);
update cliente set idmunicipio = 2 where idcliente in (3, 12);
update cliente set idmunicipio = 3 where idcliente = 4;
update cliente set idmunicipio = 4 where idcliente = 5;
update cliente set idmunicipio = 5 where idcliente in (6, 13);
update cliente set idmunicipio = 6 where idcliente = 7;
update cliente set idmunicipio = 7 where idcliente = 8;
update cliente set idmunicipio = 8 where idcliente = 9;
update cliente set idmunicipio = 9 where idcliente in (15, 14);


create table Pedido(
	idPedido integer not null,
	idCliente integer not null,
	idTransportadora integer,
	idVendedor integer not null,
	Data_Pedido date not null,
	Valor numeric(10,2) not null,

	constraint pk_pdd_idpedido primary key (idpedido),
	constraint fk_pdd_idcliente foreign key (idcliente) references cliente (idcliente),
	constraint fk_pdd_idtransportadora foreign key (idtransportadora) references transportadora (idtransportadora),
	constraint fk_pdd_idvendedor foreign key (idvendedor) references vendedor (idvendedor)
);

	Insert into pedido (idpedido, idcliente, idtransportadora, idvendedor, Data_Pedido, Valor)
	values (1, 1, 1, 1, '2008-04-01', 1300);
	Insert into pedido (idpedido, idcliente, idtransportadora, idvendedor, Data_Pedido, Valor)
	values (2, 1, 1, 1, '2008-04-01', 500);
	Insert into pedido (idpedido, idcliente, idtransportadora, idvendedor, Data_Pedido, Valor)
	values (3, 11, 2, 5, '2008-04-02', 300);
	Insert into pedido (idpedido, idcliente, idtransportadora, idvendedor, Data_Pedido, Valor)
	values (4, 8, 1, 7, '2008-04-05', 1000);
	Insert into pedido (idpedido, idcliente, idtransportadora, idvendedor, Data_Pedido, Valor)
	values (5, 9, 2, 6, '2008-04-06', 200);
	Insert into pedido (idpedido, idcliente, idtransportadora, idvendedor, Data_Pedido, Valor)
	values (6, 10, 1, 6, '2008-04-06', 1985);
	Insert into pedido (idpedido, idcliente, idtransportadora, idvendedor, Data_Pedido, Valor)
	values (7, 3, 1, 7, '2008-04-06', 800);
	Insert into pedido (idpedido, idcliente, idtransportadora, idvendedor, Data_Pedido, Valor)
	values (8, 3, null, 7, '2008-04-06', 175);
	Insert into pedido (idpedido, idcliente, idtransportadora, idvendedor, Data_Pedido, Valor)
	values (9, 12, null, 8, '2008-04-07', 1300);
	Insert into pedido (idpedido, idcliente, idtransportadora, idvendedor, Data_Pedido, Valor)
	values (10, 6, 1, 7, '2008-04-10', 200);
	Insert into pedido (idpedido, idcliente, idtransportadora, idvendedor, Data_Pedido, Valor)
	values (11, 15, 2, 1, '2008-04-15', 300);
	Insert into pedido (idpedido, idcliente, idtransportadora, idvendedor, Data_Pedido, Valor)
	values (12, 15, 2, 5, '2008-04-20', 500);
	Insert into pedido (idpedido, idcliente, idtransportadora, idvendedor, Data_Pedido, Valor)
	values (13, 10, 1, 7, '2008-04-20', 350);
	Insert into pedido (idpedido, idcliente, idtransportadora, idvendedor, Data_Pedido, Valor)
	values (14, 2, 1, 5, '2008-04-23', 300);
	Insert into pedido (idpedido, idcliente, idtransportadora, idvendedor, Data_Pedido, Valor)
	values (15, 11, null, 5, '2008-04-25', 200);

create table Pedido_Produto(
	idPedido integer not null,
	idProduto integer not null,
	Quantidade integer not null,
	Valor_Unitario Numeric(10,2) not null,

	constraint pk_pdd_idpedidoproduto primary key (idpedido, idproduto),
	constraint fk_pdd_idpedido foreign key (idpedido) references pedido (idpedido),
	constraint fk_pdd_idproduto foreign key (idproduto) references produto (idproduto)
);

	Insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
	values (1, 1, 1, 800);
	Insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
	values (1, 2, 1, 500);
	Insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
	values (2, 2, 1, 500);
	Insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
	values (3, 4, 2, 150);
	Insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
	values (4, 1, 1, 800);
	Insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
	values (4, 3, 1, 200);
	Insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
	values (5, 3, 1, 200);
	Insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
	values (6, 1, 2, 800);
	Insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
	values (6, 7, 1, 35);
	Insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
	values (6, 5, 1, 200);
	Insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
	values (6, 4, 1, 150);
	Insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
	values (7, 1, 1, 800);
	Insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
	values (8, 7, 5, 35);
	Insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
	values (9, 1, 1, 800);
	Insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
	values (9, 2, 1, 500);
	Insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
	values (10, 5, 1, 200);
	Insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
	values (11, 5, 1, 200);
	Insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
	values (11, 6, 1, 100);
	Insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
	values (12, 2, 1, 500);
	Insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
	values (13, 3, 1, 200);
	Insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
	values (13, 4, 1, 150);
	Insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
	values (14, 6, 3, 100);
	Insert into pedido_produto (idpedido, idproduto, quantidade, valor_unitario)
	values (15, 3, 1, 200);

create table Fornecedor (
	idfornecedor integer not null,
	Nome varchar(50) not null,

	constraint pk_fnd_idfornecedor primary key (idfornecedor),
	constraint un_fnd_nome unique (nome)
);

insert into Fornecedor (idfornecedor, nome) values (1, 'Cap. Computadores');
insert into Fornecedor (idfornecedor, nome) values (2, 'AA. Computadores');
insert into Fornecedor (idfornecedor, nome) values (3, 'BB. Máquinas');

create table Vendedor (
	idvendedor integer not null,
	Nome varchar(50) not null,

	constraint pk_vdd_idvendedor primary key (idvendedor),
	constraint un_vdd_nome unique (nome)
);

insert into Vendedor (idvendedor, nome) values (1, 'André');
insert into Vendedor (idvendedor, nome) values (2, 'Alisson');
insert into Vendedor (idvendedor, nome) values (3, 'José');
insert into Vendedor (idvendedor, nome) values (4, 'Ailton');
insert into Vendedor (idvendedor, nome) values (5, 'Maria');
insert into Vendedor (idvendedor, nome) values (6, 'Suelem');
insert into Vendedor (idvendedor, nome) values (7, 'Aline');
insert into Vendedor (idvendedor, nome) values (8, 'Silvana');

create table Transportadora (
	idtransportadora integer not null,
	idmunicipio integer,
	Nome varchar(50) not null,
	Logradouro varchar(50),
	Numero varchar(10),

	constraint pk_tpd_idtransportadora primary key (idtransportadora),
	constraint un_tpd_nome unique (nome),
	constraint fk_tpd_idmunicipio foreign key (idmunicipio) references municipio (idmunicipio)
);

insert into Transportadora (idtransportadora, idmunicipio, nome, logradouro, numero) values (1, 2, 'BS. Transportes', 'Rua das Limas', '01');
insert into Transportadora (idtransportadora, idmunicipio, nome, logradouro, numero) values (2, 5, 'União Transportes', null, null);

create table Produto (
	idproduto integer not null,
	idfornecedor integer not null,
	Nome varchar(50) not null,
	Valor numeric(10,2) not null,

	constraint pk_pdt_idproduto primary key (idproduto),
	constraint fk_pdt_idfornecedor foreign key (idfornecedor) references fornecedor (idfornecedor)
);

insert into Produto (idproduto, idfornecedor, nome, valor) values (1, 1, 'Microcomputador', 800);
insert into Produto (idproduto, idfornecedor, nome, valor) values (2, 1, 'Monitor', 500);
insert into Produto (idproduto, idfornecedor, nome, valor) values (3, 2, 'Placa mãe', 200);
insert into Produto (idproduto, idfornecedor, nome, valor) values (4, 2, 'HD', 150);
insert into Produto (idproduto, idfornecedor, nome, valor) values (5, 2, 'Placa de vídeo', 200);
insert into Produto (idproduto, idfornecedor, nome, valor) values (6, 3, 'Memória RAM', 100);
insert into Produto (idproduto, idfornecedor, nome, valor) values (7, 1, 'Gabinete', 35);
