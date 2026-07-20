--
-- PostgreSQL database dump
--

\restrict SKUopg89ToZ6iUbZXjIZtR2fkMs1Pi57rooFBqpohEhdnlqZmWazWHMo36Ngjhd

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

-- Started on 2026-07-20 17:23:42

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 5199 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 957 (class 1247 OID 17273)
-- Name: codigo; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.codigo AS character varying(10);


ALTER DOMAIN public.codigo OWNER TO postgres;

--
-- TOC entry 969 (class 1247 OID 17281)
-- Name: data; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.data AS date;


ALTER DOMAIN public.data OWNER TO postgres;

--
-- TOC entry 975 (class 1247 OID 17285)
-- Name: data_hora; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.data_hora AS timestamp without time zone;


ALTER DOMAIN public.data_hora OWNER TO postgres;

--
-- TOC entry 990 (class 1247 OID 17300)
-- Name: documento; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.documento AS character varying(15);


ALTER DOMAIN public.documento OWNER TO postgres;

--
-- TOC entry 981 (class 1247 OID 17289)
-- Name: float_curto; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.float_curto AS numeric(6,2);


ALTER DOMAIN public.float_curto OWNER TO postgres;

--
-- TOC entry 987 (class 1247 OID 17293)
-- Name: float_long; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.float_long AS numeric(15,2);


ALTER DOMAIN public.float_long OWNER TO postgres;

--
-- TOC entry 984 (class 1247 OID 17291)
-- Name: float_medio; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.float_medio AS numeric(10,2);


ALTER DOMAIN public.float_medio OWNER TO postgres;

--
-- TOC entry 972 (class 1247 OID 17283)
-- Name: hora; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.hora AS time without time zone;


ALTER DOMAIN public.hora OWNER TO postgres;

--
-- TOC entry 945 (class 1247 OID 17265)
-- Name: idcurto; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.idcurto AS smallint;


ALTER DOMAIN public.idcurto OWNER TO postgres;

--
-- TOC entry 951 (class 1247 OID 17269)
-- Name: idlongo; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.idlongo AS bigint;


ALTER DOMAIN public.idlongo OWNER TO postgres;

--
-- TOC entry 948 (class 1247 OID 17267)
-- Name: idmedio; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.idmedio AS integer;


ALTER DOMAIN public.idmedio OWNER TO postgres;

--
-- TOC entry 978 (class 1247 OID 17287)
-- Name: moeda; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.moeda AS numeric(10,2);


ALTER DOMAIN public.moeda OWNER TO postgres;

--
-- TOC entry 960 (class 1247 OID 17275)
-- Name: nome_curto; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.nome_curto AS character varying(15);


ALTER DOMAIN public.nome_curto OWNER TO postgres;

--
-- TOC entry 966 (class 1247 OID 17279)
-- Name: nome_longo; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.nome_longo AS character varying(70);


ALTER DOMAIN public.nome_longo OWNER TO postgres;

--
-- TOC entry 963 (class 1247 OID 17277)
-- Name: nome_medio; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.nome_medio AS character varying(50);


ALTER DOMAIN public.nome_medio OWNER TO postgres;

--
-- TOC entry 999 (class 1247 OID 17306)
-- Name: quantidade; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.quantidade AS smallint;


ALTER DOMAIN public.quantidade OWNER TO postgres;

--
-- TOC entry 954 (class 1247 OID 17271)
-- Name: sigla; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.sigla AS character(3);


ALTER DOMAIN public.sigla OWNER TO postgres;

--
-- TOC entry 996 (class 1247 OID 17304)
-- Name: texto; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.texto AS text;


ALTER DOMAIN public.texto OWNER TO postgres;

--
-- TOC entry 993 (class 1247 OID 17302)
-- Name: tipo; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.tipo AS character(1);


ALTER DOMAIN public.tipo OWNER TO postgres;

--
-- TOC entry 260 (class 1255 OID 17242)
-- Name: apagar_produto(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.apagar_produto(IN idp integer)
    LANGUAGE sql
    AS $$
	delete from produto where idproduto = idp;
$$;


ALTER PROCEDURE public.apagar_produto(IN idp integer) OWNER TO postgres;

--
-- TOC entry 262 (class 1255 OID 17248)
-- Name: bairro_log(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.bairro_log() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin 
	--- old 4 -> new 6
	insert into bairro_auditoria (idbairro, data_criacao) values (new.idbairro, current_timestamp);
	return new;
end;
$$;


ALTER FUNCTION public.bairro_log() OWNER TO postgres;

--
-- TOC entry 264 (class 1255 OID 17506)
-- Name: formata_moeda(numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.formata_moeda(valor numeric) RETURNS text
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN 'R$ ' || TO_CHAR(valor, 'FM999G999G999D00');
END;
$_$;


ALTER FUNCTION public.formata_moeda(valor numeric) OWNER TO postgres;

--
-- TOC entry 257 (class 1255 OID 17238)
-- Name: get_maior_pedido(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_maior_pedido() RETURNS integer
    LANGUAGE plpgsql
    AS $$
begin
	return (select idpedido from pedido where valor = (select max(valor) from pedido)); 
end;
$$;


ALTER FUNCTION public.get_maior_pedido() OWNER TO postgres;

--
-- TOC entry 256 (class 1255 OID 17212)
-- Name: get_nome_by_id(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_nome_by_id(idc integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
declare r varchar(50);
begin
	select nome into r from cliente where idcliente = idc; 
	return r;
end;
$$;


ALTER FUNCTION public.get_nome_by_id(idc integer) OWNER TO postgres;

--
-- TOC entry 261 (class 1255 OID 17235)
-- Name: get_valor_pedido(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_valor_pedido(idpdd integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
begin
	return (select formata_moeda(pdd.valor) from pedido pdd where pdd.idpedido = idpdd); 
end;
$$;


ALTER FUNCTION public.get_valor_pedido(idpdd integer) OWNER TO postgres;

--
-- TOC entry 258 (class 1255 OID 17239)
-- Name: insere_bairro(character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.insere_bairro(IN nome_bairro character varying)
    LANGUAGE sql
    AS $$
	insert into bairro (nome) values (nome_bairro);
$$;


ALTER PROCEDURE public.insere_bairro(IN nome_bairro character varying) OWNER TO postgres;

--
-- TOC entry 263 (class 1255 OID 17262)
-- Name: pedido_log(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.pedido_log() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin 
	insert into PEDIDOS_APAGADOS (idpedido, idcliente, idtransportadora, idvendedor, data_pedido, valor, data_apagado) 
	values (old.idpedido, old.idcliente, old.idtransportadora, old.idvendedor, old.data_pedido, old.valor, current_date);
	return new;
end;
$$;


ALTER FUNCTION public.pedido_log() OWNER TO postgres;

--
-- TOC entry 259 (class 1255 OID 17240)
-- Name: reajusta_produto(integer, double precision); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.reajusta_produto(IN idp integer, IN percentual double precision)
    LANGUAGE sql
    AS $$
	update produto set valor = valor + ((valor * percentual) / 100) where idproduto = idp;
$$;


ALTER PROCEDURE public.reajusta_produto(IN idp integer, IN percentual double precision) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 223 (class 1259 OID 16684)
-- Name: bairro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bairro (
    idbairro integer NOT NULL,
    nome public.nome_medio NOT NULL
);


ALTER TABLE public.bairro OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 17243)
-- Name: bairro_auditoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bairro_auditoria (
    idbairro integer NOT NULL,
    data_criacao public.data_hora NOT NULL
);


ALTER TABLE public.bairro_auditoria OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 17170)
-- Name: bairro_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bairro_id_seq
    START WITH 5
    INCREMENT BY 1
    MINVALUE 5
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bairro_id_seq OWNER TO postgres;

--
-- TOC entry 5201 (class 0 OID 0)
-- Dependencies: 234
-- Name: bairro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bairro_id_seq OWNED BY public.bairro.idbairro;


--
-- TOC entry 219 (class 1259 OID 16630)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    idcliente integer NOT NULL,
    nome public.nome_longo NOT NULL,
    cpf public.documento,
    rg public.documento,
    data_nascimento date,
    genero public.tipo,
    logradouro public.nome_medio,
    numero public.nome_curto,
    uf public.sigla,
    observacoes text,
    idprofissao integer,
    idnacionalidade integer,
    idcomplemento integer,
    idbairro integer,
    idmunicipio integer
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16675)
-- Name: complemento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.complemento (
    idcomplemento integer NOT NULL,
    nome public.nome_medio NOT NULL
);


ALTER TABLE public.complemento OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16806)
-- Name: municipio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.municipio (
    idmunicipio integer NOT NULL,
    nome public.nome_medio,
    iduf integer NOT NULL
);


ALTER TABLE public.municipio OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16666)
-- Name: nacionalidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nacionalidade (
    idnacionalidade integer NOT NULL,
    nome public.nome_medio NOT NULL
);


ALTER TABLE public.nacionalidade OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16657)
-- Name: profissao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profissao (
    idprofissao integer NOT NULL,
    nome public.nome_medio NOT NULL
);


ALTER TABLE public.profissao OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16794)
-- Name: uf; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.uf (
    iduf integer NOT NULL,
    nome public.nome_medio NOT NULL,
    sigla public.sigla NOT NULL
);


ALTER TABLE public.uf OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 17424)
-- Name: cliente_dados; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.cliente_dados AS
 SELECT cln.nome AS cliente,
    prf.nome AS profissao,
    ncn.nome AS nacionalidade,
    cpl.nome AS complemento,
    mnc.nome AS municipio,
    uf.nome AS unidade_federacao,
    brr.nome AS bairro,
    cln.cpf,
    cln.rg,
    cln.data_nascimento,
        CASE cln.genero
            WHEN 'M'::bpchar THEN 'Masculino'::text
            WHEN 'F'::bpchar THEN 'Feminino'::text
            ELSE 'Outros'::text
        END AS genero,
    cln.logradouro,
    cln.numero,
    cln.observacoes
   FROM ((((((public.cliente cln
     LEFT JOIN public.profissao prf ON ((cln.idprofissao = prf.idprofissao)))
     LEFT JOIN public.nacionalidade ncn ON ((cln.idnacionalidade = ncn.idnacionalidade)))
     LEFT JOIN public.complemento cpl ON ((cln.idcomplemento = cpl.idcomplemento)))
     LEFT JOIN public.municipio mnc ON ((cln.idmunicipio = mnc.idmunicipio)))
     LEFT JOIN public.uf ON ((mnc.iduf = uf.iduf)))
     LEFT JOIN public.bairro brr ON ((cln.idbairro = brr.idbairro)));


ALTER VIEW public.cliente_dados OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 17174)
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_id_seq
    START WITH 18
    INCREMENT BY 1
    MINVALUE 18
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cliente_id_seq OWNER TO postgres;

--
-- TOC entry 5210 (class 0 OID 0)
-- Dependencies: 235
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.idcliente;


--
-- TOC entry 248 (class 1259 OID 17403)
-- Name: cliente_profissao; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.cliente_profissao AS
 SELECT cln.nome AS cliente,
    cln.cpf,
    prf.nome AS profissao
   FROM (public.cliente cln
     LEFT JOIN public.profissao prf ON ((cln.idprofissao = prf.idprofissao)));


ALTER VIEW public.cliente_profissao OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 17176)
-- Name: complemento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.complemento_id_seq
    START WITH 3
    INCREMENT BY 1
    MINVALUE 3
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.complemento_id_seq OWNER TO postgres;

--
-- TOC entry 5212 (class 0 OID 0)
-- Dependencies: 236
-- Name: complemento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.complemento_id_seq OWNED BY public.complemento.idcomplemento;


--
-- TOC entry 253 (class 1259 OID 17454)
-- Name: conta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conta (
    idconta integer NOT NULL,
    cliente public.nome_medio NOT NULL,
    saldo public.moeda DEFAULT 0 NOT NULL
);


ALTER TABLE public.conta OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 17453)
-- Name: conta_idconta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conta_idconta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.conta_idconta_seq OWNER TO postgres;

--
-- TOC entry 5214 (class 0 OID 0)
-- Dependencies: 252
-- Name: conta_idconta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.conta_idconta_seq OWNED BY public.conta.idconta;


--
-- TOC entry 233 (class 1259 OID 17162)
-- Name: exemplo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exemplo (
    idexemplo integer NOT NULL,
    nome character varying(50) NOT NULL
);


ALTER TABLE public.exemplo OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 17161)
-- Name: exemplo_idexemplo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exemplo_idexemplo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.exemplo_idexemplo_seq OWNER TO postgres;

--
-- TOC entry 5215 (class 0 OID 0)
-- Dependencies: 232
-- Name: exemplo_idexemplo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exemplo_idexemplo_seq OWNED BY public.exemplo.idexemplo;


--
-- TOC entry 226 (class 1259 OID 16867)
-- Name: fornecedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fornecedor (
    idfornecedor integer NOT NULL,
    nome public.nome_longo NOT NULL
);


ALTER TABLE public.fornecedor OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 17179)
-- Name: fornecedor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fornecedor_id_seq
    START WITH 4
    INCREMENT BY 1
    MINVALUE 4
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fornecedor_id_seq OWNER TO postgres;

--
-- TOC entry 5218 (class 0 OID 0)
-- Dependencies: 237
-- Name: fornecedor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fornecedor_id_seq OWNED BY public.fornecedor.idfornecedor;


--
-- TOC entry 250 (class 1259 OID 17429)
-- Name: municipio_dados; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.municipio_dados AS
 SELECT mnc.nome AS municipio,
    uf.sigla
   FROM (public.municipio mnc
     LEFT JOIN public.uf ON ((mnc.iduf = uf.iduf)));


ALTER VIEW public.municipio_dados OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 17181)
-- Name: municipio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.municipio_id_seq
    START WITH 10
    INCREMENT BY 1
    MINVALUE 10
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.municipio_id_seq OWNER TO postgres;

--
-- TOC entry 5220 (class 0 OID 0)
-- Dependencies: 238
-- Name: municipio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.municipio_id_seq OWNED BY public.municipio.idmunicipio;


--
-- TOC entry 239 (class 1259 OID 17183)
-- Name: nacionalidade_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nacionalidade_id_seq
    START WITH 5
    INCREMENT BY 1
    MINVALUE 5
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.nacionalidade_id_seq OWNER TO postgres;

--
-- TOC entry 5222 (class 0 OID 0)
-- Dependencies: 239
-- Name: nacionalidade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nacionalidade_id_seq OWNED BY public.nacionalidade.idnacionalidade;


--
-- TOC entry 230 (class 1259 OID 16994)
-- Name: pedido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedido (
    idpedido integer NOT NULL,
    idcliente integer NOT NULL,
    idtransportadora integer,
    idvendedor integer NOT NULL,
    data_pedido date DEFAULT CURRENT_DATE NOT NULL,
    valor numeric(10,2) DEFAULT 0 NOT NULL
);


ALTER TABLE public.pedido OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16876)
-- Name: vendedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendedor (
    idvendedor integer NOT NULL,
    nome character varying(50) NOT NULL
);


ALTER TABLE public.vendedor OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 17525)
-- Name: pedido_dados; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.pedido_dados AS
 SELECT p.idpedido,
    c.nome AS nome_cliente,
    v.nome AS vendedor,
    p.data_pedido,
    p.valor
   FROM ((public.pedido p
     JOIN public.cliente c ON ((p.idcliente = c.idcliente)))
     JOIN public.vendedor v ON ((p.idvendedor = v.idvendedor)));


ALTER VIEW public.pedido_dados OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 17185)
-- Name: pedido_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pedido_id_seq
    START WITH 16
    INCREMENT BY 1
    MINVALUE 16
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pedido_id_seq OWNER TO postgres;

--
-- TOC entry 5226 (class 0 OID 0)
-- Dependencies: 240
-- Name: pedido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedido_id_seq OWNED BY public.pedido.idpedido;


--
-- TOC entry 231 (class 1259 OID 17019)
-- Name: pedido_produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedido_produto (
    idpedido integer NOT NULL,
    idproduto integer NOT NULL,
    quantidade public.quantidade DEFAULT 1 NOT NULL,
    valor_unitario numeric(10,2) DEFAULT 0 NOT NULL
);


ALTER TABLE public.pedido_produto OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 17253)
-- Name: pedidos_apagados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos_apagados (
    idpedido integer NOT NULL,
    idcliente integer NOT NULL,
    idtransportadora integer,
    idvendedor integer NOT NULL,
    data_pedido date NOT NULL,
    valor double precision NOT NULL,
    data_apagado date NOT NULL
);


ALTER TABLE public.pedidos_apagados OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16955)
-- Name: produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produto (
    idproduto integer NOT NULL,
    idfornecedor integer NOT NULL,
    nome public.nome_longo NOT NULL,
    valor numeric(10,2) DEFAULT 0 NOT NULL
);


ALTER TABLE public.produto OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 17545)
-- Name: produto_dados; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.produto_dados AS
 SELECT pdt.idproduto,
    fnd.idfornecedor,
    pdt.nome AS produto,
    fnd.nome AS fornecedor,
    pdt.valor
   FROM (public.produto pdt
     LEFT JOIN public.fornecedor fnd ON ((pdt.idfornecedor = fnd.idfornecedor)));


ALTER VIEW public.produto_dados OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 17199)
-- Name: produto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produto_id_seq
    START WITH 8
    INCREMENT BY 1
    MINVALUE 8
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.produto_id_seq OWNER TO postgres;

--
-- TOC entry 5230 (class 0 OID 0)
-- Dependencies: 245
-- Name: produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produto_id_seq OWNED BY public.produto.idproduto;


--
-- TOC entry 241 (class 1259 OID 17187)
-- Name: profissao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profissao_id_seq
    START WITH 6
    INCREMENT BY 1
    MINVALUE 6
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.profissao_id_seq OWNER TO postgres;

--
-- TOC entry 5232 (class 0 OID 0)
-- Dependencies: 241
-- Name: profissao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profissao_id_seq OWNED BY public.profissao.idprofissao;


--
-- TOC entry 228 (class 1259 OID 16941)
-- Name: transportadora; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transportadora (
    idtransportadora integer NOT NULL,
    idmunicipio integer,
    nome character varying(50) NOT NULL,
    logradouro character varying(50),
    numero character varying(10)
);


ALTER TABLE public.transportadora OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 17437)
-- Name: transportadora_dados; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.transportadora_dados AS
 SELECT tpd.nome AS transportadora,
    tpd.logradouro,
    tpd.numero,
    uf.nome AS unidade_federacao,
    uf.sigla
   FROM ((public.transportadora tpd
     LEFT JOIN public.municipio mnc ON ((tpd.idmunicipio = mnc.idmunicipio)))
     LEFT JOIN public.uf ON ((mnc.iduf = uf.iduf)));


ALTER VIEW public.transportadora_dados OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 17189)
-- Name: transportadora_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transportadora_id_seq
    START WITH 3
    INCREMENT BY 1
    MINVALUE 3
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transportadora_id_seq OWNER TO postgres;

--
-- TOC entry 5235 (class 0 OID 0)
-- Dependencies: 242
-- Name: transportadora_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transportadora_id_seq OWNED BY public.transportadora.idtransportadora;


--
-- TOC entry 243 (class 1259 OID 17191)
-- Name: uf_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.uf_id_seq
    START WITH 7
    INCREMENT BY 1
    MINVALUE 7
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.uf_id_seq OWNER TO postgres;

--
-- TOC entry 5237 (class 0 OID 0)
-- Dependencies: 243
-- Name: uf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.uf_id_seq OWNED BY public.uf.iduf;


--
-- TOC entry 244 (class 1259 OID 17193)
-- Name: vendedor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendedor_id_seq
    START WITH 9
    INCREMENT BY 1
    MINVALUE 9
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vendedor_id_seq OWNER TO postgres;

--
-- TOC entry 5239 (class 0 OID 0)
-- Dependencies: 244
-- Name: vendedor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendedor_id_seq OWNED BY public.vendedor.idvendedor;


--
-- TOC entry 4926 (class 2604 OID 17171)
-- Name: bairro idbairro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bairro ALTER COLUMN idbairro SET DEFAULT nextval('public.bairro_id_seq'::regclass);


--
-- TOC entry 4922 (class 2604 OID 17175)
-- Name: cliente idcliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN idcliente SET DEFAULT nextval('public.cliente_id_seq'::regclass);


--
-- TOC entry 4925 (class 2604 OID 17178)
-- Name: complemento idcomplemento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complemento ALTER COLUMN idcomplemento SET DEFAULT nextval('public.complemento_id_seq'::regclass);


--
-- TOC entry 4940 (class 2604 OID 17457)
-- Name: conta idconta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conta ALTER COLUMN idconta SET DEFAULT nextval('public.conta_idconta_seq'::regclass);


--
-- TOC entry 4939 (class 2604 OID 17165)
-- Name: exemplo idexemplo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exemplo ALTER COLUMN idexemplo SET DEFAULT nextval('public.exemplo_idexemplo_seq'::regclass);


--
-- TOC entry 4929 (class 2604 OID 17180)
-- Name: fornecedor idfornecedor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedor ALTER COLUMN idfornecedor SET DEFAULT nextval('public.fornecedor_id_seq'::regclass);


--
-- TOC entry 4928 (class 2604 OID 17182)
-- Name: municipio idmunicipio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipio ALTER COLUMN idmunicipio SET DEFAULT nextval('public.municipio_id_seq'::regclass);


--
-- TOC entry 4924 (class 2604 OID 17184)
-- Name: nacionalidade idnacionalidade; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidade ALTER COLUMN idnacionalidade SET DEFAULT nextval('public.nacionalidade_id_seq'::regclass);


--
-- TOC entry 4934 (class 2604 OID 17186)
-- Name: pedido idpedido; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido ALTER COLUMN idpedido SET DEFAULT nextval('public.pedido_id_seq'::regclass);


--
-- TOC entry 4932 (class 2604 OID 17200)
-- Name: produto idproduto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto ALTER COLUMN idproduto SET DEFAULT nextval('public.produto_id_seq'::regclass);


--
-- TOC entry 4923 (class 2604 OID 17188)
-- Name: profissao idprofissao; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profissao ALTER COLUMN idprofissao SET DEFAULT nextval('public.profissao_id_seq'::regclass);


--
-- TOC entry 4931 (class 2604 OID 17190)
-- Name: transportadora idtransportadora; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportadora ALTER COLUMN idtransportadora SET DEFAULT nextval('public.transportadora_id_seq'::regclass);


--
-- TOC entry 4927 (class 2604 OID 17192)
-- Name: uf iduf; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uf ALTER COLUMN iduf SET DEFAULT nextval('public.uf_id_seq'::regclass);


--
-- TOC entry 4930 (class 2604 OID 17194)
-- Name: vendedor idvendedor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendedor ALTER COLUMN idvendedor SET DEFAULT nextval('public.vendedor_id_seq'::regclass);


--
-- TOC entry 5167 (class 0 OID 16684)
-- Dependencies: 223
-- Data for Name: bairro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bairro (idbairro, nome) FROM stdin;
1	Cidade Nova
2	Centro
3	São Pedro
4	Santa Rosa
5	Teste 1
6	Teste 2
7	Teste procedure
9	Teste 10
10	Teste 20
11	Teste 30
\.


--
-- TOC entry 5190 (class 0 OID 17243)
-- Dependencies: 246
-- Data for Name: bairro_auditoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bairro_auditoria (idbairro, data_criacao) FROM stdin;
9	2026-07-07 12:25:40.590841
10	2026-07-07 12:25:40.590841
11	2026-07-07 12:25:40.590841
\.


--
-- TOC entry 5163 (class 0 OID 16630)
-- Dependencies: 219
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (idcliente, nome, cpf, rg, data_nascimento, genero, logradouro, numero, uf, observacoes, idprofissao, idnacionalidade, idcomplemento, idbairro, idmunicipio) FROM stdin;
11	Fernanda	\N	\N	\N	F	\N	\N	SC 	\N	\N	1	\N	\N	1
10	Fabricio	8828282828	32323	\N	M	\N	\N	SC 	\N	1	1	\N	\N	1
2	Geraldo	12343299929	56565	1987-01-04	M	Rua das Limas	200	SC 	\N	2	1	2	2	1
3	Carlos	87732323227	55463	1967-10-01	M	Rua das Laranjeiras	300	SC 	\N	3	1	2	2	2
12	Gilmar	88881818181	888	2000-02-10	M	Rua das Laranjeiras	200	SC 	\N	1	\N	\N	1	2
4	Adriano	12321222122	98777	1989-09-10	M	Rua das Limas	241	PR 	\N	4	1	1	3	3
5	Amanda	99982838828	28382	1991-03-04	F	Av. Central	100	PR 	\N	4	2	\N	3	4
6	Ângelo	99982828181	12323	2000-01-01	M	Av. Beira Mar	300	SP 	\N	5	1	\N	2	5
13	Diego	1010191919	111939	\N	M	Rua Central	455	SP 	\N	5	4	1	1	5
7	Anderson	\N	\N	\N	M	Av. Brasil	100	RJ 	\N	5	2	2	4	6
8	Camila	9998282828	\N	2001-10-10	F	Rua Central	4333	MG 	\N	5	3	\N	2	7
9	Cristiano	\N	\N	\N	M	Rua do Centro	877	RS 	\N	1	4	1	2	8
14	Jeferson	\N	\N	1983-07-01	M	\N	\N	PR 	\N	\N	1	\N	\N	9
15	Jessica	\N	\N	\N	F	\N	\N	PR 	\N	1	\N	\N	\N	9
1	Manoel	88828383821	32323	2001-01-30	M	Rua Joaquim Nabuco	23	SC 	\N	1	1	1	1	1
17	Getúlio	\N	4631	1978-04-01	M	Rua Central	343	SC 	\N	1	1	2	2	\N
23	Teste permissão	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 5166 (class 0 OID 16675)
-- Dependencies: 222
-- Data for Name: complemento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.complemento (idcomplemento, nome) FROM stdin;
1	Casa
2	Apartamento
\.


--
-- TOC entry 5193 (class 0 OID 17454)
-- Dependencies: 253
-- Data for Name: conta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conta (idconta, cliente, saldo) FROM stdin;
1	Cliente 1	800.00
2	Cliente 2	700.00
\.


--
-- TOC entry 5177 (class 0 OID 17162)
-- Dependencies: 233
-- Data for Name: exemplo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exemplo (idexemplo, nome) FROM stdin;
1	Exemplo 1
2	Exemplo 2
3	Exemplo 3
4	Exemplo 4
5	Exemplo 5
\.


--
-- TOC entry 5170 (class 0 OID 16867)
-- Dependencies: 226
-- Data for Name: fornecedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fornecedor (idfornecedor, nome) FROM stdin;
1	Cap. Computadores
2	AA. Computadores
3	BB. Máquinas
\.


--
-- TOC entry 5169 (class 0 OID 16806)
-- Dependencies: 225
-- Data for Name: municipio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.municipio (idmunicipio, nome, iduf) FROM stdin;
1	Porto União	1
2	Canoinhas	1
3	Porto Vitória	2
4	General Carneiro	2
5	São Paulo	3
6	Rio de Janeiro	6
7	Uberlândia	4
8	Porto Alegre	5
9	União da Vitória	2
\.


--
-- TOC entry 5165 (class 0 OID 16666)
-- Dependencies: 221
-- Data for Name: nacionalidade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nacionalidade (idnacionalidade, nome) FROM stdin;
1	Brasileira
2	Italiana
3	Norte-americana
4	Alemã
\.


--
-- TOC entry 5174 (class 0 OID 16994)
-- Dependencies: 230
-- Data for Name: pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedido (idpedido, idcliente, idtransportadora, idvendedor, data_pedido, valor) FROM stdin;
3	11	2	5	2008-04-02	330.75
5	9	2	6	2008-04-06	220.50
8	3	\N	7	2008-04-06	192.94
10	6	1	7	2008-04-10	220.50
11	15	2	1	2008-04-15	330.75
13	10	1	7	2008-04-20	385.88
14	2	1	5	2008-04-23	330.75
15	11	\N	5	2008-04-25	220.50
2	1	1	1	2008-04-01	607.75
12	15	2	5	2008-04-20	607.75
1	1	1	1	2008-04-01	2370.24
4	8	1	7	2008-04-05	1823.26
6	10	1	6	2008-04-06	3619.18
7	3	1	7	2008-04-06	1458.61
9	12	\N	8	2008-04-07	2370.24
16	3	2	5	2008-04-22	400.15
\.


--
-- TOC entry 5175 (class 0 OID 17019)
-- Dependencies: 231
-- Data for Name: pedido_produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedido_produto (idpedido, idproduto, quantidade, valor_unitario) FROM stdin;
1	1	1	800.00
1	2	1	500.00
2	2	1	500.00
3	4	2	150.00
4	1	1	800.00
4	3	1	200.00
5	3	1	200.00
6	1	2	800.00
6	7	1	35.00
6	5	1	200.00
6	4	1	150.00
7	1	1	800.00
8	7	5	35.00
9	1	1	800.00
9	2	1	500.00
10	5	1	200.00
11	5	1	200.00
11	6	1	100.00
12	2	1	500.00
13	3	1	200.00
13	4	1	150.00
14	6	3	100.00
15	3	1	200.00
1	3	1	0.00
1	4	5	100.00
16	3	2	400.15
\.


--
-- TOC entry 5191 (class 0 OID 17253)
-- Dependencies: 247
-- Data for Name: pedidos_apagados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedidos_apagados (idpedido, idcliente, idtransportadora, idvendedor, data_pedido, valor, data_apagado) FROM stdin;
17	1	\N	1	2022-10-10	234	2026-07-07
\.


--
-- TOC entry 5173 (class 0 OID 16955)
-- Dependencies: 229
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produto (idproduto, idfornecedor, nome, valor) FROM stdin;
2	1	Monitor	500.00
3	2	Placa mãe	200.00
4	2	HD	150.00
5	2	Placa de vídeo	200.00
6	3	Memória RAM	100.00
7	1	Gabinete	35.00
10	1	Teste sequência	50.00
1	1	Microcomputador	880.00
\.


--
-- TOC entry 5164 (class 0 OID 16657)
-- Dependencies: 220
-- Data for Name: profissao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profissao (idprofissao, nome) FROM stdin;
1	Estudante
2	Engenheiro
3	Pedreiro
4	Jornalista
5	Professor
\.


--
-- TOC entry 5172 (class 0 OID 16941)
-- Dependencies: 228
-- Data for Name: transportadora; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transportadora (idtransportadora, idmunicipio, nome, logradouro, numero) FROM stdin;
1	2	BS. Transportes	Rua das Limas	01
2	5	União Transportes	\N	\N
\.


--
-- TOC entry 5168 (class 0 OID 16794)
-- Dependencies: 224
-- Data for Name: uf; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.uf (iduf, nome, sigla) FROM stdin;
1	Santa Catarina	SC 
2	Paraná	PR 
3	São Paulo	SP 
4	Minas Gerais	MG 
5	Rio Grande do Sul	RS 
6	Rio de Janeiro	RJ 
\.


--
-- TOC entry 5171 (class 0 OID 16876)
-- Dependencies: 227
-- Data for Name: vendedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendedor (idvendedor, nome) FROM stdin;
1	André
2	Alisson
3	José
4	Ailton
5	Maria
6	Suelem
7	Aline
8	Silvana
\.


--
-- TOC entry 5241 (class 0 OID 0)
-- Dependencies: 234
-- Name: bairro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bairro_id_seq', 11, true);


--
-- TOC entry 5242 (class 0 OID 0)
-- Dependencies: 235
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_id_seq', 23, true);


--
-- TOC entry 5243 (class 0 OID 0)
-- Dependencies: 236
-- Name: complemento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.complemento_id_seq', 7, true);


--
-- TOC entry 5244 (class 0 OID 0)
-- Dependencies: 252
-- Name: conta_idconta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conta_idconta_seq', 2, true);


--
-- TOC entry 5245 (class 0 OID 0)
-- Dependencies: 232
-- Name: exemplo_idexemplo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exemplo_idexemplo_seq', 5, true);


--
-- TOC entry 5246 (class 0 OID 0)
-- Dependencies: 237
-- Name: fornecedor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fornecedor_id_seq', 4, false);


--
-- TOC entry 5247 (class 0 OID 0)
-- Dependencies: 238
-- Name: municipio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.municipio_id_seq', 10, false);


--
-- TOC entry 5248 (class 0 OID 0)
-- Dependencies: 239
-- Name: nacionalidade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nacionalidade_id_seq', 5, false);


--
-- TOC entry 5249 (class 0 OID 0)
-- Dependencies: 240
-- Name: pedido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedido_id_seq', 17, true);


--
-- TOC entry 5250 (class 0 OID 0)
-- Dependencies: 245
-- Name: produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produto_id_seq', 10, true);


--
-- TOC entry 5251 (class 0 OID 0)
-- Dependencies: 241
-- Name: profissao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profissao_id_seq', 6, false);


--
-- TOC entry 5252 (class 0 OID 0)
-- Dependencies: 242
-- Name: transportadora_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transportadora_id_seq', 3, false);


--
-- TOC entry 5253 (class 0 OID 0)
-- Dependencies: 243
-- Name: uf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.uf_id_seq', 7, false);


--
-- TOC entry 5254 (class 0 OID 0)
-- Dependencies: 244
-- Name: vendedor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendedor_id_seq', 9, false);


--
-- TOC entry 4958 (class 2606 OID 16690)
-- Name: bairro pk_brr_idbairro; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bairro
    ADD CONSTRAINT pk_brr_idbairro PRIMARY KEY (idbairro);


--
-- TOC entry 4944 (class 2606 OID 16638)
-- Name: cliente pk_cln_idcliente; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT pk_cln_idcliente PRIMARY KEY (idcliente);


--
-- TOC entry 4994 (class 2606 OID 17465)
-- Name: conta pk_cnt_idconta; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conta
    ADD CONSTRAINT pk_cnt_idconta PRIMARY KEY (idconta);


--
-- TOC entry 4954 (class 2606 OID 16681)
-- Name: complemento pk_cpl_idcomplemento; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complemento
    ADD CONSTRAINT pk_cpl_idcomplemento PRIMARY KEY (idcomplemento);


--
-- TOC entry 4992 (class 2606 OID 17169)
-- Name: exemplo pk_exemplo_idexemplo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exemplo
    ADD CONSTRAINT pk_exemplo_idexemplo PRIMARY KEY (idexemplo);


--
-- TOC entry 4972 (class 2606 OID 16873)
-- Name: fornecedor pk_fnd_idfornecedor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedor
    ADD CONSTRAINT pk_fnd_idfornecedor PRIMARY KEY (idfornecedor);


--
-- TOC entry 4968 (class 2606 OID 16812)
-- Name: municipio pk_mnc_municipio; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipio
    ADD CONSTRAINT pk_mnc_municipio PRIMARY KEY (idmunicipio);


--
-- TOC entry 4950 (class 2606 OID 16672)
-- Name: nacionalidade pk_ncn_idnacionalidade; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidade
    ADD CONSTRAINT pk_ncn_idnacionalidade PRIMARY KEY (idnacionalidade);


--
-- TOC entry 4988 (class 2606 OID 17003)
-- Name: pedido pk_pdd_idpedido; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pk_pdd_idpedido PRIMARY KEY (idpedido);


--
-- TOC entry 4990 (class 2606 OID 17027)
-- Name: pedido_produto pk_pdd_idpedidoproduto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido_produto
    ADD CONSTRAINT pk_pdd_idpedidoproduto PRIMARY KEY (idpedido, idproduto);


--
-- TOC entry 4985 (class 2606 OID 16963)
-- Name: produto pk_pdt_idproduto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT pk_pdt_idproduto PRIMARY KEY (idproduto);


--
-- TOC entry 4946 (class 2606 OID 16663)
-- Name: profissao pk_prf_idprofissao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profissao
    ADD CONSTRAINT pk_prf_idprofissao PRIMARY KEY (idprofissao);


--
-- TOC entry 4980 (class 2606 OID 16947)
-- Name: transportadora pk_tpd_idtransportadora; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportadora
    ADD CONSTRAINT pk_tpd_idtransportadora PRIMARY KEY (idtransportadora);


--
-- TOC entry 4962 (class 2606 OID 16801)
-- Name: uf pk_ufd_idunidade_federacao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uf
    ADD CONSTRAINT pk_ufd_idunidade_federacao PRIMARY KEY (iduf);


--
-- TOC entry 4976 (class 2606 OID 16882)
-- Name: vendedor pk_vdd_idvendedor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendedor
    ADD CONSTRAINT pk_vdd_idvendedor PRIMARY KEY (idvendedor);


--
-- TOC entry 4960 (class 2606 OID 17295)
-- Name: bairro un_brr_nome; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bairro
    ADD CONSTRAINT un_brr_nome UNIQUE (nome);


--
-- TOC entry 4956 (class 2606 OID 17330)
-- Name: complemento un_cpl_nome; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complemento
    ADD CONSTRAINT un_cpl_nome UNIQUE (nome);


--
-- TOC entry 4974 (class 2606 OID 17335)
-- Name: fornecedor un_fnd_nome; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedor
    ADD CONSTRAINT un_fnd_nome UNIQUE (nome);


--
-- TOC entry 4970 (class 2606 OID 17340)
-- Name: municipio un_mnc_nome; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipio
    ADD CONSTRAINT un_mnc_nome UNIQUE (nome);


--
-- TOC entry 4952 (class 2606 OID 17344)
-- Name: nacionalidade un_ncn_nome; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidade
    ADD CONSTRAINT un_ncn_nome UNIQUE (nome);


--
-- TOC entry 4948 (class 2606 OID 17359)
-- Name: profissao un_prf_nome; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profissao
    ADD CONSTRAINT un_prf_nome UNIQUE (nome);


--
-- TOC entry 4982 (class 2606 OID 16949)
-- Name: transportadora un_tpd_nome; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportadora
    ADD CONSTRAINT un_tpd_nome UNIQUE (nome);


--
-- TOC entry 4964 (class 2606 OID 17364)
-- Name: uf un_ufd_nome; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uf
    ADD CONSTRAINT un_ufd_nome UNIQUE (nome);


--
-- TOC entry 4966 (class 2606 OID 17369)
-- Name: uf un_ufd_sigla; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uf
    ADD CONSTRAINT un_ufd_sigla UNIQUE (sigla);


--
-- TOC entry 4978 (class 2606 OID 16884)
-- Name: vendedor un_vdd_nome; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendedor
    ADD CONSTRAINT un_vdd_nome UNIQUE (nome);


--
-- TOC entry 4942 (class 1259 OID 17327)
-- Name: idx_cln_nome; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cln_nome ON public.cliente USING btree (nome);


--
-- TOC entry 4986 (class 1259 OID 17203)
-- Name: idx_pdd_data_pedido; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pdd_data_pedido ON public.pedido USING btree (data_pedido);


--
-- TOC entry 4983 (class 1259 OID 17354)
-- Name: idx_pdt_nome; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pdt_nome ON public.produto USING btree (nome);


--
-- TOC entry 5008 (class 2620 OID 17249)
-- Name: bairro log_bairro_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER log_bairro_trigger AFTER INSERT ON public.bairro FOR EACH ROW EXECUTE FUNCTION public.bairro_log();


--
-- TOC entry 5009 (class 2620 OID 17263)
-- Name: pedido log_pedido_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER log_pedido_trigger AFTER DELETE ON public.pedido FOR EACH ROW EXECUTE FUNCTION public.pedido_log();


--
-- TOC entry 4995 (class 2606 OID 16711)
-- Name: cliente fk_cln_idbairro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT fk_cln_idbairro FOREIGN KEY (idbairro) REFERENCES public.bairro(idbairro);


--
-- TOC entry 4996 (class 2606 OID 16706)
-- Name: cliente fk_cln_idcliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT fk_cln_idcliente FOREIGN KEY (idcomplemento) REFERENCES public.complemento(idcomplemento);


--
-- TOC entry 4997 (class 2606 OID 16820)
-- Name: cliente fk_cln_idmunicipio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT fk_cln_idmunicipio FOREIGN KEY (idmunicipio) REFERENCES public.municipio(idmunicipio);


--
-- TOC entry 4998 (class 2606 OID 16701)
-- Name: cliente fk_cln_idnacionalidade; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT fk_cln_idnacionalidade FOREIGN KEY (idnacionalidade) REFERENCES public.nacionalidade(idnacionalidade);


--
-- TOC entry 4999 (class 2606 OID 16693)
-- Name: cliente fk_cln_idprofissao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT fk_cln_idprofissao FOREIGN KEY (idprofissao) REFERENCES public.profissao(idprofissao);


--
-- TOC entry 5000 (class 2606 OID 16815)
-- Name: municipio fk_mnc_iduf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipio
    ADD CONSTRAINT fk_mnc_iduf FOREIGN KEY (iduf) REFERENCES public.uf(iduf);


--
-- TOC entry 5003 (class 2606 OID 17004)
-- Name: pedido fk_pdd_idcliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT fk_pdd_idcliente FOREIGN KEY (idcliente) REFERENCES public.cliente(idcliente);


--
-- TOC entry 5006 (class 2606 OID 17028)
-- Name: pedido_produto fk_pdd_idpedido; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido_produto
    ADD CONSTRAINT fk_pdd_idpedido FOREIGN KEY (idpedido) REFERENCES public.pedido(idpedido);


--
-- TOC entry 5007 (class 2606 OID 17033)
-- Name: pedido_produto fk_pdd_idproduto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido_produto
    ADD CONSTRAINT fk_pdd_idproduto FOREIGN KEY (idproduto) REFERENCES public.produto(idproduto);


--
-- TOC entry 5004 (class 2606 OID 17009)
-- Name: pedido fk_pdd_idtransportadora; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT fk_pdd_idtransportadora FOREIGN KEY (idtransportadora) REFERENCES public.transportadora(idtransportadora);


--
-- TOC entry 5005 (class 2606 OID 17014)
-- Name: pedido fk_pdd_idvendedor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT fk_pdd_idvendedor FOREIGN KEY (idvendedor) REFERENCES public.vendedor(idvendedor);


--
-- TOC entry 5002 (class 2606 OID 16964)
-- Name: produto fk_pdt_idfornecedor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT fk_pdt_idfornecedor FOREIGN KEY (idfornecedor) REFERENCES public.fornecedor(idfornecedor);


--
-- TOC entry 5001 (class 2606 OID 16950)
-- Name: transportadora fk_tpd_idmunicipio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportadora
    ADD CONSTRAINT fk_tpd_idmunicipio FOREIGN KEY (idmunicipio) REFERENCES public.municipio(idmunicipio);


--
-- TOC entry 5200 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE bairro; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT ON TABLE public.bairro TO gerente WITH GRANT OPTION;


--
-- TOC entry 5202 (class 0 OID 0)
-- Dependencies: 234
-- Name: SEQUENCE bairro_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.bairro_id_seq TO gerente;


--
-- TOC entry 5203 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE cliente; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT ON TABLE public.cliente TO gerente WITH GRANT OPTION;


--
-- TOC entry 5204 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE complemento; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT ON TABLE public.complemento TO gerente WITH GRANT OPTION;


--
-- TOC entry 5205 (class 0 OID 0)
-- Dependencies: 225
-- Name: TABLE municipio; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT ON TABLE public.municipio TO gerente WITH GRANT OPTION;


--
-- TOC entry 5206 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE nacionalidade; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT ON TABLE public.nacionalidade TO gerente WITH GRANT OPTION;


--
-- TOC entry 5207 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE profissao; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT ON TABLE public.profissao TO gerente WITH GRANT OPTION;


--
-- TOC entry 5208 (class 0 OID 0)
-- Dependencies: 224
-- Name: TABLE uf; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT ON TABLE public.uf TO gerente WITH GRANT OPTION;


--
-- TOC entry 5209 (class 0 OID 0)
-- Dependencies: 249
-- Name: TABLE cliente_dados; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.cliente_dados TO estagiario;


--
-- TOC entry 5211 (class 0 OID 0)
-- Dependencies: 235
-- Name: SEQUENCE cliente_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.cliente_id_seq TO gerente;


--
-- TOC entry 5213 (class 0 OID 0)
-- Dependencies: 236
-- Name: SEQUENCE complemento_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.complemento_id_seq TO gerente;


--
-- TOC entry 5216 (class 0 OID 0)
-- Dependencies: 232
-- Name: SEQUENCE exemplo_idexemplo_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.exemplo_idexemplo_seq TO gerente;


--
-- TOC entry 5217 (class 0 OID 0)
-- Dependencies: 226
-- Name: TABLE fornecedor; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT ON TABLE public.fornecedor TO gerente WITH GRANT OPTION;


--
-- TOC entry 5219 (class 0 OID 0)
-- Dependencies: 237
-- Name: SEQUENCE fornecedor_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.fornecedor_id_seq TO gerente;


--
-- TOC entry 5221 (class 0 OID 0)
-- Dependencies: 238
-- Name: SEQUENCE municipio_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.municipio_id_seq TO gerente;


--
-- TOC entry 5223 (class 0 OID 0)
-- Dependencies: 239
-- Name: SEQUENCE nacionalidade_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.nacionalidade_id_seq TO gerente;


--
-- TOC entry 5224 (class 0 OID 0)
-- Dependencies: 230
-- Name: TABLE pedido; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT ON TABLE public.pedido TO gerente WITH GRANT OPTION;
GRANT SELECT,INSERT ON TABLE public.pedido TO atendente;


--
-- TOC entry 5225 (class 0 OID 0)
-- Dependencies: 227
-- Name: TABLE vendedor; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT ON TABLE public.vendedor TO gerente WITH GRANT OPTION;


--
-- TOC entry 5227 (class 0 OID 0)
-- Dependencies: 240
-- Name: SEQUENCE pedido_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.pedido_id_seq TO gerente;


--
-- TOC entry 5228 (class 0 OID 0)
-- Dependencies: 231
-- Name: TABLE pedido_produto; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT ON TABLE public.pedido_produto TO gerente WITH GRANT OPTION;
GRANT SELECT,INSERT ON TABLE public.pedido_produto TO atendente;


--
-- TOC entry 5229 (class 0 OID 0)
-- Dependencies: 229
-- Name: TABLE produto; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT ON TABLE public.produto TO gerente WITH GRANT OPTION;


--
-- TOC entry 5231 (class 0 OID 0)
-- Dependencies: 245
-- Name: SEQUENCE produto_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.produto_id_seq TO gerente;


--
-- TOC entry 5233 (class 0 OID 0)
-- Dependencies: 241
-- Name: SEQUENCE profissao_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.profissao_id_seq TO gerente;


--
-- TOC entry 5234 (class 0 OID 0)
-- Dependencies: 228
-- Name: TABLE transportadora; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT ON TABLE public.transportadora TO gerente WITH GRANT OPTION;


--
-- TOC entry 5236 (class 0 OID 0)
-- Dependencies: 242
-- Name: SEQUENCE transportadora_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.transportadora_id_seq TO gerente;


--
-- TOC entry 5238 (class 0 OID 0)
-- Dependencies: 243
-- Name: SEQUENCE uf_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.uf_id_seq TO gerente;


--
-- TOC entry 5240 (class 0 OID 0)
-- Dependencies: 244
-- Name: SEQUENCE vendedor_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.vendedor_id_seq TO gerente;


-- Completed on 2026-07-20 17:23:44

--
-- PostgreSQL database dump complete
--

\unrestrict SKUopg89ToZ6iUbZXjIZtR2fkMs1Pi57rooFBqpohEhdnlqZmWazWHMo36Ngjhd

