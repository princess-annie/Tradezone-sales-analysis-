--
-- PostgreSQL database dump
--

\restrict 7TIDLyIYho7kkH03IKUedf4hyjMUImRjrotKEeXebA1jy5BSp4ConvznfXshnSi

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

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

ALTER TABLE IF EXISTS ONLY public.reviews DROP CONSTRAINT IF EXISTS reviews_product_id_fkey;
ALTER TABLE IF EXISTS ONLY public.reviews DROP CONSTRAINT IF EXISTS reviews_customer_id_fkey;
ALTER TABLE IF EXISTS ONLY public.products DROP CONSTRAINT IF EXISTS products_seller_id_fkey;
ALTER TABLE IF EXISTS ONLY public.payments DROP CONSTRAINT IF EXISTS payments_order_id_fkey;
ALTER TABLE IF EXISTS ONLY public.orders DROP CONSTRAINT IF EXISTS orders_seller_id_fkey;
ALTER TABLE IF EXISTS ONLY public.orders DROP CONSTRAINT IF EXISTS orders_customer_id_fkey;
ALTER TABLE IF EXISTS ONLY public.order_items DROP CONSTRAINT IF EXISTS order_items_product_id_fkey;
ALTER TABLE IF EXISTS ONLY public.order_items DROP CONSTRAINT IF EXISTS order_items_order_id_fkey;
ALTER TABLE IF EXISTS ONLY public.sellers DROP CONSTRAINT IF EXISTS sellers_pkey;
ALTER TABLE IF EXISTS ONLY public.reviews DROP CONSTRAINT IF EXISTS reviews_pkey;
ALTER TABLE IF EXISTS ONLY public.products DROP CONSTRAINT IF EXISTS products_pkey;
ALTER TABLE IF EXISTS ONLY public.payments DROP CONSTRAINT IF EXISTS payments_pkey;
ALTER TABLE IF EXISTS ONLY public.orders DROP CONSTRAINT IF EXISTS orders_pkey;
ALTER TABLE IF EXISTS ONLY public.order_items DROP CONSTRAINT IF EXISTS order_items_pkey;
ALTER TABLE IF EXISTS ONLY public.customers DROP CONSTRAINT IF EXISTS customers_pkey;
ALTER TABLE IF EXISTS public.order_items ALTER COLUMN item_id DROP DEFAULT;
DROP TABLE IF EXISTS public.sellers;
DROP TABLE IF EXISTS public.reviews;
DROP TABLE IF EXISTS public.products;
DROP TABLE IF EXISTS public.payments;
DROP TABLE IF EXISTS public.orders;
DROP SEQUENCE IF EXISTS public.order_items_item_id_seq;
DROP TABLE IF EXISTS public.order_items;
DROP TABLE IF EXISTS public.customers;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customer_id character varying(10) NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(100),
    city character varying(50),
    state character varying(50),
    signup_date date,
    account_status character varying(20)
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    item_id integer NOT NULL,
    order_id character varying(12),
    product_id character varying(10),
    quantity integer,
    unit_price numeric(12,2),
    line_total numeric(14,2)
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- Name: order_items_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_items_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_items_item_id_seq OWNER TO postgres;

--
-- Name: order_items_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_items_item_id_seq OWNED BY public.order_items.item_id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id character varying(12) NOT NULL,
    customer_id character varying(10),
    seller_id character varying(10),
    order_date date,
    delivery_date date,
    order_status character varying(20),
    total_amount numeric(14,2),
    status_verification character varying(30) DEFAULT 'Verified'::character varying
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    payment_id character varying(12) NOT NULL,
    order_id character varying(12),
    payment_method character varying(30),
    amount numeric(14,2),
    payment_date timestamp without time zone
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_id character varying(10) NOT NULL,
    product_name character varying(200) NOT NULL,
    category character varying(50),
    unit_price numeric(12,2),
    seller_id character varying(10)
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    review_id character varying(12) NOT NULL,
    product_id character varying(10),
    customer_id character varying(10),
    order_id character varying(12),
    rating integer,
    review_date date
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- Name: sellers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sellers (
    seller_id character varying(10) NOT NULL,
    seller_name character varying(100) NOT NULL,
    onboarding_date date,
    product_category character varying(50),
    city character varying(50),
    state character varying(50),
    account_status character varying(20)
);


ALTER TABLE public.sellers OWNER TO postgres;

--
-- Name: order_items item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items ALTER COLUMN item_id SET DEFAULT nextval('public.order_items_item_id_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customer_id, first_name, last_name, email, city, state, signup_date, account_status) FROM stdin;
CUST0167	Dayo	Abubakar	dayo.abubakar885@gmail.com	Kano	Kano	2024-03-26	Inactive
CUST0182	Funmi	Oluwole	funmi.oluwole989@gmail.com	Lagos	Lagos	2023-07-18	Active
CUST0183	Chukwu	Oluwole	chukwu.oluwole797@gmail.com	Ibadan	Oyo	2023-06-15	Active
CUST0184	Ngozi	Babangida	ngozi.babangida896@gmail.com	Ibadan	Oyo	2024-06-12	Active
CUST0185	Bisi	Nwosu	bisi.nwosu461@gmail.com	Lagos	Lagos	2024-03-23	Active
CUST0186	Oluwaseun	Obi	oluwaseun.obi953@yahoo.com	Portharcourt	Rivers	2024-05-29	Active
CUST0187	Fatima	Ibrahim	fatima.ibrahim29@gmail.com	Ibadan	Oyo	2024-10-27	Active
CUST0188	Sade	Babangida	sade.babangida713@gmail.com	Lagos	Lagos	2024-04-25	Active
CUST0189	Emeka	Nwosu	emeka.nwosu221@gmail.com	Ibadan	Oyo	2024-09-15	Active
CUST0193	Segun	Taiwo	segun.taiwo520@gmail.com	Lagos	Lagos	2023-01-21	Active
CUST0195	Amaka	Fagbemi	amaka.fagbemi753@gmail.com	Kano	Kano	2023-12-27	Active
CUST0196	Lola	Nnamdi	lola.nnamdi713@gmail.com	Portharcourt	Rivers	2023-05-19	Inactive
CUST0197	Yemi	Adeleke	yemi.adeleke811@yahoo.com	Lagos	Lagos	2023-11-14	Active
CUST0198	Ngozi	Adeyemi	ngozi.adeyemi293@gmail.com	Abuja	FCT	2024-11-02	Active
CUST0199	Aisha	Chukwu	aisha.chukwu762@gmail.com	Portharcourt	Rivers	2023-12-14	Active
CUST0200	Fatima	Lawal	fatima.lawal274@gmail.com	Kano	Kano	2023-03-22	Active
CUST0201	Ibrahim	Bello	ibrahim.bello82@gmail.com	Abuja	FCT	2024-04-01	Active
CUST0202	Chukwu	Obi	chukwu.obi458@yahoo.com	Lagos	Lagos	2023-12-28	Active
CUST0204	Emeka	Eze	emeka.eze870@gmail.com	Lagos	Lagos	2023-02-05	Active
CUST0207	Emeka	Okonkwo	emeka.okonkwo512@gmail.com	Ibadan	Oyo	2023-05-01	Active
CUST0209	Oluwaseun	Nnamdi	oluwaseun.nnamdi90@gmail.com	Abuja	FCT	2023-11-24	Active
CUST0210	Sade	Oluwole	sade.oluwole872@yahoo.com	Abuja	FCT	2024-10-15	Active
CUST0211	Amaka	Adeyemi	amaka.adeyemi812@yahoo.com	Abuja	FCT	2023-01-27	Active
CUST0212	Tobi	Eze	tobi.eze627@gmail.com	Abuja	FCT	2024-02-12	Active
CUST0213	Uche	Adegoke	uche.adegoke844@gmail.com	Abuja	FCT	2023-11-21	Active
CUST0214	Segun	Obi	segun.obi132@gmail.com	Abuja	FCT	2024-10-17	Active
CUST0215	Blessing	Adeleke	blessing.adeleke852@yahoo.com	Abuja	FCT	2023-06-18	Active
CUST0218	Oluwaseun	Okorie	oluwaseun.okorie346@gmail.com	Kano	Kano	2023-01-30	Active
CUST0223	Sade	Chukwu	sade.chukwu885@gmail.com	Lagos	Lagos	2023-06-13	Active
CUST0225	Segun	Nnamdi	segun.nnamdi990@yahoo.com	Ibadan	Oyo	2023-02-19	Inactive
CUST0441	Ada	Eze	ada.eze759@yahoo.com	Lagos	Lagos	2023-07-07	Active
CUST0226	Obinna	Babangida	obinna.babangida293@gmail.com	Kano	Kano	2024-03-17	Active
CUST0227	Uche	Chukwu	uche.chukwu375@yahoo.com	Port-Harcourt	Rivers	2024-07-29	Active
CUST0228	Musa	Lawal	musa.lawal462@gmail.com	Lagos	Lagos	2024-09-30	Active
CUST0229	Amaka	Chukwu	amaka.chukwu383@gmail.com	Lagos	Lagos	2024-01-10	Active
CUST0230	Musa	Lawal	musa.lawal42@yahoo.com	Kano	Kano	2023-12-08	Active
CUST0231	Oluwaseun	Lawal	oluwaseun.lawal144@gmail.com	Lagos	Lagos	2023-06-16	Active
CUST0233	Emeka	Obi	emeka.obi340@gmail.com	Abuja	FCT	2024-08-20	Active
CUST0234	Kola	Fagbemi	kola.fagbemi592@yahoo.com	Kano	Kano	2024-05-06	Active
CUST0235	Lola	Ibrahim	lola.ibrahim33@gmail.com	Lagos	Lagos	2023-07-15	Inactive
CUST0236	Aisha	Adeyemi	aisha.adeyemi421@gmail.com	Abuja	FCT	2024-04-27	Active
CUST0238	Tobi	Abubakar	tobi.abubakar560@gmail.com	Abuja	FCT	2024-11-28	Active
CUST0239	Yemi	Ibrahim	yemi.ibrahim286@gmail.com	Kano	Kano	2023-11-01	Active
CUST0240	Ada	Abubakar	ada.abubakar492@gmail.com	Kano	Kano	2023-10-08	Active
CUST0242	Chukwu	Nwosu	chukwu.nwosu766@gmail.com	Lagos	Lagos	2024-07-05	Active
CUST0243	Tunde	Bello	tunde.bello631@gmail.com	Kano	Kano	2023-02-21	Active
CUST0244	Ngozi	Bello	ngozi.bello424@gmail.com	Kano	Kano	2024-11-28	Active
CUST0245	Blessing	Okonkwo	blessing.okonkwo417@gmail.com	Ibadan	Oyo	2024-05-02	Active
CUST0247	Titi	Adeleke	titi.adeleke936@gmail.com	Abuja	FCT	2023-06-30	Active
CUST0248	Musa	Babangida	musa.babangida191@gmail.com	Ibadan	Oyo	2023-10-24	Active
CUST0249	Dayo	Bello	dayo.bello951@gmail.com	Lagos	Lagos	2024-10-18	Active
CUST0250	Tunde	Lawal	tunde.lawal480@yahoo.com	Ibadan	Oyo	2023-12-05	Active
CUST0251	Gbenga	Okonkwo	gbenga.okonkwo15@gmail.com	Kano	Kano	2024-08-04	Active
CUST0252	Nkechi	Chukwu	nkechi.chukwu847@gmail.com	Lagos	Lagos	2024-02-15	Active
CUST0177	Titi	Lawal	titi.lawal96@gmail.com	Port-Harcourt	Rivers	2024-01-06	Inactive
CUST0257	Chioma	Adeyemi	chioma.adeyemi781@yahoo.com	Port-Harcourt	Rivers	2023-03-25	Active
CUST0258	Chidi	Fagbemi	chidi.fagbemi115@yahoo.com	Port-Harcourt	Rivers	2024-06-01	Active
CUST0259	Ibrahim	Lawal	ibrahim.lawal453@yahoo.com	Lagos	Lagos	2024-08-20	Active
CUST0260	Ngozi	Nnamdi	ngozi.nnamdi136@gmail.com	Abuja	FCT	2023-03-01	Active
CUST0550	Blessing	Lawal	blessing.lawal293@yahoo.com	Ibadan	Oyo	2024-06-06	Active
CUST0262	Tobi	Adeleke	tobi.adeleke958@gmail.com	Portharcourt	Rivers	2024-04-28	Inactive
CUST0264	Nkechi	Taiwo	nkechi.taiwo137@gmail.com	Ibadan	Oyo	2023-07-02	Active
CUST0266	Obinna	Ibrahim	obinna.ibrahim254@gmail.com	Abuja	FCT	2023-07-13	Active
CUST0267	Lola	Adegoke	lola.adegoke630@gmail.com	Lagos	Lagos	2023-01-17	Active
CUST0268	Ngozi	Nnamdi	ngozi.nnamdi613@gmail.com	Lagos	Lagos	2023-09-08	Active
CUST0269	Tobi	Adeyemi	tobi.adeyemi773@gmail.com	Abuja	FCT	2024-05-30	Active
CUST0273	Aisha	Eze	aisha.eze308@gmail.com	Kano	Kano	2024-04-29	Active
CUST0274	Gbenga	Eze	gbenga.eze826@gmail.com	Lagos	Lagos	2024-02-27	Active
CUST0275	Musa	Ibrahim	musa.ibrahim262@yahoo.com	Abuja	FCT	2024-04-05	Active
CUST0276	Obinna	Adeyemi	obinna.adeyemi53@yahoo.com	Abuja	FCT	2024-09-09	Inactive
CUST0277	Uche	Fagbemi	uche.fagbemi742@gmail.com	Lagos	Lagos	2023-08-02	Active
CUST0278	Blessing	Okafor	blessing.okafor217@gmail.com	Lagos	Lagos	2023-05-01	Active
CUST0279	Gbenga	Okorie	gbenga.okorie721@yahoo.com	Ibadan	Oyo	2024-07-19	Active
CUST0280	Tobi	Obi	tobi.obi316@yahoo.com	Abuja	FCT	2024-05-24	Active
CUST0282	Blessing	Fagbemi	blessing.fagbemi594@gmail.com	Lagos	Lagos	2023-07-20	Active
CUST0283	Funmi	Babangida	funmi.babangida564@gmail.com	Kano	Kano	2023-09-21	Active
CUST0284	Femi	Babangida	femi.babangida472@yahoo.com	Ibadan	Oyo	2023-06-23	Active
CUST0286	Emeka	Adegoke	emeka.adegoke141@gmail.com	Lagos	Lagos	2023-06-04	Inactive
CUST0287	Ngozi	Okorie	ngozi.okorie654@gmail.com	Abuja	FCT	2024-05-09	Active
CUST0288	Tobi	Adegoke	tobi.adegoke13@yahoo.com	Lagos	Lagos	2024-07-02	Active
CUST0502	Segun	Musa	segun.musa971@yahoo.com	Lagos	Lagos	2024-07-04	Active
CUST0503	Lola	Adeyemi	lola.adeyemi886@gmail.com	Lagos	Lagos	2023-07-30	Active
CUST0509	Musa	Taiwo	musa.taiwo303@gmail.com	Lagos	Lagos	2024-11-24	Active
CUST0526	Segun	Nwosu	segun.nwosu855@gmail.com	Lagos	Lagos	2024-08-06	Active
CUST0529	Chidi	Lawal	chidi.lawal659@yahoo.com	Lagos	Lagos	2023-06-11	Active
CUST0289	Gbenga	Adegoke	gbenga.adegoke826@gmail.com	Abuja	FCT	2023-04-09	Active
CUST0290	Segun	Nwosu	segun.nwosu835@gmail.com	Lagos	Lagos	2023-03-22	Active
CUST0291	Funmi	Ibrahim	funmi.ibrahim308@gmail.com	Abuja	FCT	2024-10-31	Active
CUST0292	Musa	Chukwu	musa.chukwu566@gmail.com	Lagos	Lagos	2023-06-25	Active
CUST0293	Ibrahim	Fagbemi	ibrahim.fagbemi879@gmail.com	Kano	Kano	2023-02-13	Active
CUST0294	Blessing	Musa	blessing.musa701@gmail.com	Lagos	Lagos	2024-07-31	Active
CUST0295	Ibrahim	Okafor	ibrahim.okafor985@yahoo.com	Ibadan	Oyo	2024-02-12	Active
CUST0297	Gbenga	Musa	gbenga.musa513@gmail.com	Lagos	Lagos	2023-04-11	Active
CUST0164	Femi	Bello	femi.bello544@gmail.com	Lagos	Lagos	2023-12-24	Active
CUST0176	Gbenga	Musa	gbenga.musa318@gmail.com	Lagos	Lagos	2023-12-03	Active
CUST0194	Musa	Obi	musa.obi260@gmail.com	Lagos	Lagos	2023-03-11	Active
CUST0203	Chioma	Adeleke	chioma.adeleke77@gmail.com	Lagos	Lagos	2024-06-09	Active
CUST0216	Segun	Oluwole	segun.oluwole867@yahoo.com	Lagos	Lagos	2024-07-18	Active
CUST0217	Tobi	Musa	tobi.musa515@gmail.com	Lagos	Lagos	2024-08-17	Active
CUST0263	Tunde	Adegoke	tunde.adegoke384@gmail.com	Lagos	Lagos	2024-01-22	Active
CUST0285	Oluwaseun	Taiwo	oluwaseun.taiwo658@gmail.com	Lagos	Lagos	2023-03-18	Active
CUST0296	Funmi	Fagbemi	funmi.fagbemi855@gmail.com	Lagos	Lagos	2024-07-07	Active
CUST0320	Gbenga	Bello	gbenga.bello24@gmail.com	Lagos	Lagos	2024-11-24	Active
CUST0352	Chidi	Ibrahim	chidi.ibrahim567@gmail.com	Lagos	Lagos	2023-10-19	Active
CUST0366	Ada	Obi	ada.obi393@gmail.com	Lagos	Lagos	2023-02-06	Active
CUST0417	Chidi	Adegoke	chidi.adegoke207@gmail.com	Lagos	Lagos	2024-09-01	Active
CUST0427	Oluwaseun	Adeyemi	oluwaseun.adeyemi858@yahoo.com	Lagos	Lagos	2023-02-21	Active
CUST0445	Ayo	Nnamdi	ayo.nnamdi147@gmail.com	Lagos	Lagos	2023-03-24	Active
CUST0452	Funmi	Eze	funmi.eze217@gmail.com	Lagos	Lagos	2023-06-23	Active
CUST0464	Musa	Babangida	musa.babangida820@gmail.com	Lagos	Lagos	2023-06-20	Active
CUST0467	Aisha	Nnamdi	aisha.nnamdi48@yahoo.com	Lagos	Lagos	2023-01-13	Active
CUST0490	Chioma	Oluwole	chioma.oluwole710@gmail.com	Lagos	Lagos	2024-02-01	Active
CUST0491	Tobi	Adeleke	tobi.adeleke14@gmail.com	Lagos	Lagos	2024-03-29	Active
CUST0501	Segun	Obi	segun.obi527@gmail.com	Lagos	Lagos	2023-02-14	Active
CUST0348	Amaka	Bello	amaka.bello321@gmail.com	Port-Harcourt	Rivers	2024-01-27	Active
CUST0350	Femi	Eze	femi.eze942@gmail.com	Port-Harcourt	Rivers	2023-08-11	Active
CUST0460	Amaka	Nwosu	amaka.nwosu660@yahoo.com	Port-Harcourt	Rivers	2023-10-31	Active
CUST0484	Blessing	Taiwo	blessing.taiwo648@yahoo.com	Port-Harcourt	Rivers	2023-10-25	Active
CUST0487	Segun	Bello	segun.bello26@gmail.com	Port-Harcourt	Rivers	2023-02-27	Active
CUST0492	Femi	Obi	femi.obi774@gmail.com	Port-Harcourt	Rivers	2023-07-21	Active
CUST0507	Ayo	Adeleke	ayo.adeleke718@gmail.com	Port-Harcourt	Rivers	2024-05-29	Active
CUST0564	Tunde	Adeleke	tunde.adeleke539@gmail.com	Port-Harcourt	Rivers	2024-07-07	Inactive
CUST0569	Chioma	Ibrahim	chioma.ibrahim569@gmail.com	Port-Harcourt	Rivers	2023-05-30	Active
CUST0571	Sade	Nwosu	sade.nwosu576@gmail.com	Port-Harcourt	Rivers	2023-04-12	Active
CUST0575	Chukwu	Musa	chukwu.musa391@gmail.com	Port-Harcourt	Rivers	2023-05-29	Active
CUST0578	Segun	Nnamdi	segun.nnamdi424@yahoo.com	Port-Harcourt	Rivers	2023-05-09	Active
CUST0598	Tobi	Lawal	tobi.lawal126@yahoo.com	Port-Harcourt	Rivers	2023-07-23	Active
CUST0603	Uche	Obi	uche.obi825@gmail.com	Port-Harcourt	Rivers	2023-01-22	Active
CUST0604	Kola	Adeleke	kola.adeleke497@gmail.com	Port-Harcourt	Rivers	2024-07-09	Active
CUST0614	Obinna	Oluwole	obinna.oluwole80@gmail.com	Port-Harcourt	Rivers	2023-04-10	Active
CUST0616	Uche	Fagbemi	uche.fagbemi367@gmail.com	Port-Harcourt	Rivers	2024-03-13	Active
CUST0624	Titi	Abubakar	titi.abubakar812@gmail.com	Port-Harcourt	Rivers	2024-08-13	Active
CUST0531	Bisi	Adegoke	bisi.adegoke23@yahoo.com	Lagos	Lagos	2024-08-29	Active
CUST0589	Chidi	Adegoke	chidi.adegoke641@yahoo.com	Lagos	Lagos	2024-09-19	Active
CUST0592	Tobi	Okafor	tobi.okafor191@gmail.com	Lagos	Lagos	2023-05-09	Active
CUST0606	Tunde	Nnamdi	tunde.nnamdi303@gmail.com	Lagos	Lagos	2024-04-09	Inactive
CUST0612	Blessing	Adeyemi	blessing.adeyemi672@gmail.com	Lagos	Lagos	2023-03-23	Active
CUST0637	Segun	Nwosu	segun.nwosu562@gmail.com	Lagos	Lagos	2023-05-25	Active
CUST0642	Blessing	Lawal	blessing.lawal313@gmail.com	Lagos	Lagos	2023-06-10	Inactive
CUST0675	Ayo	Okorie	ayo.okorie363@gmail.com	Lagos	Lagos	2024-05-23	Active
CUST0695	Ngozi	Musa	ngozi.musa437@gmail.com	Lagos	Lagos	2024-08-29	Active
CUST0724	Nkechi	Nwosu	nkechi.nwosu15@gmail.com	Lagos	Lagos	2024-08-28	Active
CUST0761	Chioma	Eze	chioma.eze702@gmail.com	Lagos	Lagos	2024-05-24	Active
CUST0775	Chukwu	Fagbemi	chukwu.fagbemi766@gmail.com	Lagos	Lagos	2024-04-19	Active
CUST0782	Fatima	Nnamdi	fatima.nnamdi498@gmail.com	Lagos	Lagos	2024-04-26	Active
CUST0804	Ada	Adeleke	ada.adeleke843@gmail.com	Lagos	Lagos	2023-11-08	Active
CUST0809	Aisha	Obi	aisha.obi50@yahoo.com	Lagos	Lagos	2023-03-20	Active
CUST0810	Amaka	Okorie	amaka.okorie771@yahoo.com	Lagos	Lagos	2023-11-20	Active
CUST0813	Yemi	Taiwo	yemi.taiwo629@gmail.com	Lagos	Lagos	2024-06-28	Active
CUST0830	Dayo	Chukwu	dayo.chukwu126@yahoo.com	Lagos	Lagos	2024-05-26	Active
CUST0845	Ada	Bello	ada.bello708@gmail.com	Lagos	Lagos	2024-05-29	Active
CUST0854	Obinna	Musa	uche.nnamdi178@gmail.com	Lagos	Lagos	2023-07-28	Active
CUST0075	Aisha	Babangida	aisha.babangida109@gmail.com	Lagos	Lagos	2024-04-15	Active
CUST0077	Ibrahim	Ibrahim	ibrahim.ibrahim851@gmail.com	Kano	Kano	2024-04-06	Active
CUST0078	Lola	Chukwu	lola.chukwu345@yahoo.com	Kano	Kano	2023-07-06	Active
CUST0080	Titi	Adegoke	titi.adegoke501@gmail.com	Lagos	Lagos	2024-05-02	Active
CUST0081	Emeka	Musa	emeka.musa302@yahoo.com	Abuja	FCT	2023-11-10	Active
CUST0082	Segun	Obi	segun.obi436@gmail.com	Abuja	FCT	2023-12-27	Active
CUST0104	Ada	Bello	ada.bello30@gmail.com	Ibadan	Oyo	2023-09-03	Active
CUST0016	Amaka	Oluwole	amaka.oluwole862@gmail.com	Abuja	FCT	2023-06-06	Active
CUST0017	Uche	Lawal	uche.lawal941@yahoo.com	Abuja	FCT	2023-01-20	Active
CUST0018	Obinna	Oluwole	obinna.oluwole246@yahoo.com	Ibadan	Oyo	2023-03-22	Active
CUST0019	Uche	Taiwo	uche.taiwo785@yahoo.com	Port-Harcourt	Rivers	2024-07-16	Active
CUST0020	Aisha	Adeyemi	aisha.adeyemi952@gmail.com	Ibadan	Oyo	2023-07-25	Active
CUST0022	Tobi	Ibrahim	tobi.ibrahim603@yahoo.com	Lagos	Lagos	2024-10-08	Inactive
CUST0023	Nkechi	Abubakar	nkechi.abubakar73@gmail.com	Ibadan	Oyo	2024-05-12	Active
CUST0025	Fatima	Adegoke	fatima.adegoke421@gmail.com	Kano	Kano	2024-11-20	Active
CUST0026	Titi	Abubakar	titi.abubakar820@gmail.com	Lagos	Lagos	2023-07-14	Active
CUST0027	Kola	Nnamdi	kola.nnamdi256@gmail.com	Abuja	FCT	2024-07-17	Active
CUST0028	Blessing	Ibrahim	blessing.ibrahim171@gmail.com	Ibadan	Oyo	2024-02-15	Active
CUST0029	Musa	Nwosu	musa.nwosu949@gmail.com	Abuja	FCT	2024-03-09	Active
CUST0030	Sade	Adeyemi	sade.adeyemi992@yahoo.com	Lagos	Lagos	2023-03-04	Active
CUST0031	Ada	Lawal	ada.lawal942@gmail.com	Lagos	Lagos	2024-06-04	Active
CUST0032	Chidi	Ibrahim	chidi.ibrahim414@yahoo.com	Lagos	Lagos	2023-09-10	Active
CUST0033	Aisha	Fagbemi	aisha.fagbemi579@gmail.com	Kano	Kano	2023-07-29	Active
CUST0034	Musa	Eze	musa.eze688@gmail.com	Lagos	Lagos	2023-03-16	Inactive
CUST0035	Amaka	Musa	amaka.musa551@yahoo.com	Ibadan	Oyo	2023-12-24	Active
CUST0036	Bisi	Nnamdi	bisi.nnamdi854@gmail.com	Abuja	FCT	2024-10-31	Active
CUST0037	Amaka	Eze	amaka.eze271@yahoo.com	Ibadan	Oyo	2024-07-20	Active
CUST0038	Gbenga	Abubakar	gbenga.abubakar209@gmail.com	Kano	Kano	2024-06-01	Active
CUST0039	Aisha	Nwosu	aisha.nwosu46@yahoo.com	Lagos	Lagos	2024-10-14	Active
CUST0041	Tunde	Adegoke	tunde.adegoke131@yahoo.com	Kano	Kano	2023-02-10	Active
CUST0042	Lola	Bello	lola.bello363@gmail.com	Kano	Kano	2024-02-21	Active
CUST0043	Funmi	Okonkwo	funmi.okonkwo820@gmail.com	Ibadan	Oyo	2023-01-26	Active
CUST0044	Aisha	Ibrahim	aisha.ibrahim274@yahoo.com	Portharcourt	Rivers	2024-01-27	Active
CUST0046	Ibrahim	Nwosu	ibrahim.nwosu886@yahoo.com	Lagos	Lagos	2023-12-26	Active
CUST0047	Obinna	Taiwo	obinna.taiwo340@gmail.com	Kano	Kano	2023-09-25	Active
CUST0048	Dayo	Adegoke	dayo.adegoke354@gmail.com	Lagos	Lagos	2024-09-12	Active
CUST0049	Ayo	Adeyemi	ayo.adeyemi261@yahoo.com	Abuja	FCT	2024-06-16	Active
CUST0050	Chidi	Abubakar	chidi.abubakar639@gmail.com	Abuja	FCT	2023-11-04	Active
CUST0051	Gbenga	Oluwole	gbenga.oluwole568@yahoo.com	Lagos	Lagos	2024-01-24	Active
CUST0052	Sade	Chukwu	sade.chukwu562@gmail.com	Kano	Kano	2023-08-04	Active
CUST0067	Aisha	Eze	aisha.eze888@gmail.com	Lagos	Lagos	2024-01-24	Active
CUST0068	Uche	Chukwu	uche.chukwu285@gmail.com	Lagos	Lagos	2023-09-16	Active
CUST0069	Tobi	Adeleke	tobi.adeleke975@gmail.com	Lagos	Lagos	2024-10-29	Inactive
CUST0070	Yemi	Okafor	yemi.okafor637@yahoo.com	Ibadan	Oyo	2024-11-16	Active
CUST0071	Kola	Obi	kola.obi172@gmail.com	Abuja	FCT	2023-04-28	Active
CUST0072	Amaka	Fagbemi	amaka.fagbemi27@gmail.com	Ibadan	Oyo	2024-01-20	Active
CUST0073	Gbenga	Ibrahim	gbenga.ibrahim105@gmail.com	Lagos	Lagos	2024-12-01	Active
CUST0084	Yemi	Babangida	yemi.babangida284@gmail.com	Lagos	Lagos	2024-06-21	Active
CUST0086	Tobi	Oluwole	tobi.oluwole715@gmail.com	Ibadan	Oyo	2024-05-17	Active
CUST0087	Ada	Babangida	ada.babangida452@gmail.com	Kano	Kano	2023-09-16	Active
CUST0088	Chidi	Chukwu	chidi.chukwu504@yahoo.com	Lagos	Lagos	2023-02-24	Active
CUST0089	Chidi	Ibrahim	chidi.ibrahim122@gmail.com	Ibadan	Oyo	2024-09-02	Active
CUST0090	Musa	Nnamdi	musa.nnamdi931@gmail.com	Port-Harcourt	Rivers	2024-03-15	Active
CUST0091	Titi	Bello	titi.bello971@gmail.com	Lagos	Lagos	2023-09-28	Active
CUST0092	Tobi	Musa	tobi.musa161@yahoo.com	Lagos	Lagos	2024-08-31	Active
CUST0094	Chioma	Adeyemi	chioma.adeyemi436@yahoo.com	Kano	Kano	2023-06-02	Active
CUST0095	Bisi	Oluwole	bisi.oluwole610@gmail.com	Lagos	Lagos	2023-10-23	Active
CUST0096	Gbenga	Chukwu	gbenga.chukwu966@yahoo.com	Kano	Kano	2024-03-24	Active
CUST0097	Titi	Abubakar	titi.abubakar619@yahoo.com	Ibadan	Oyo	2024-11-21	Active
CUST0098	Lola	Nwosu	lola.nwosu591@yahoo.com	Ibadan	Oyo	2024-04-26	Active
CUST0099	Bisi	Fagbemi	bisi.fagbemi447@gmail.com	Ibadan	Oyo	2023-04-04	Active
CUST0100	Lola	Bello	lola.bello879@yahoo.com	Lagos	Lagos	2024-05-22	Active
CUST0101	Tobi	Adeleke	tobi.adeleke466@yahoo.com	Portharcourt	Rivers	2023-04-29	Active
CUST0102	Obinna	Okafor	obinna.okafor674@gmail.com	Ibadan	Oyo	2023-02-25	Active
CUST0103	Ada	Nnamdi	ada.nnamdi779@yahoo.com	Kano	Kano	2023-05-15	Active
CUST0105	Tobi	Adegoke	tobi.adegoke96@yahoo.com	Kano	Kano	2023-04-27	Active
CUST0106	Tunde	Babangida	tunde.babangida956@gmail.com	Kano	Kano	2023-10-07	Active
CUST0107	Funmi	Nnamdi	funmi.nnamdi565@yahoo.com	Ibadan	Oyo	2024-09-05	Active
CUST0108	Kola	Adegoke	kola.adegoke349@gmail.com	Ibadan	Oyo	2023-01-03	Active
CUST0109	Ayo	Babangida	ayo.babangida887@yahoo.com	Port-Harcourt	Rivers	2023-12-20	Active
CUST0110	Blessing	Abubakar	blessing.abubakar891@yahoo.com	Abuja	FCT	2024-08-08	Active
CUST0241	Musa	Obi	musa.obi978@gmail.com	Ibadan	Oyo	2023-02-13	Active
CUST0168	Chioma	Nwosu	chioma.nwosu606@yahoo.com	Kano	Kano	2023-11-14	Active
CUST0169	Obinna	Oluwole	obinna.oluwole79@gmail.com	Lagos	Lagos	2023-04-03	Active
CUST0170	Ayo	Taiwo	ayo.taiwo978@gmail.com	Abuja	FCT	2024-04-05	Active
CUST0171	Ada	Lawal	ada.lawal155@gmail.com	Lagos	Lagos	2023-12-18	Active
CUST0172	Bisi	Adeleke	bisi.adeleke254@gmail.com	Abuja	FCT	2024-06-20	Active
CUST0173	Blessing	Oluwole	blessing.oluwole397@gmail.com	Abuja	FCT	2024-09-04	Inactive
CUST0174	Amaka	Taiwo	amaka.taiwo695@gmail.com	Lagos	Lagos	2024-11-03	Active
CUST0175	Ibrahim	Musa	ibrahim.musa597@gmail.com	Ibadan	Oyo	2023-11-14	Active
CUST0178	Yemi	Abubakar	yemi.abubakar971@gmail.com	Lagos	Lagos	2023-05-21	Active
CUST0180	Dayo	Eze	dayo.eze612@gmail.com	Ibadan	Oyo	2024-10-01	Active
CUST0181	Ngozi	Adegoke	ngozi.adegoke374@gmail.com	Portharcourt	Rivers	2024-03-30	Active
CUST0112	Ada	Adeleke	ada.adeleke130@gmail.com	Ibadan	Oyo	2023-04-13	Active
CUST0113	Blessing	Nnamdi	blessing.nnamdi16@gmail.com	Lagos	Lagos	2024-11-01	Active
CUST0114	Kola	Abubakar	kola.abubakar639@gmail.com	Abuja	FCT	2023-12-03	Active
CUST0115	Femi	Babangida	femi.babangida894@gmail.com	Ibadan	Oyo	2023-08-29	Active
CUST0116	Titi	Musa	titi.musa445@gmail.com	Ibadan	Oyo	2023-04-13	Active
CUST0117	Ngozi	Abubakar	ngozi.abubakar816@yahoo.com	Ibadan	Oyo	2024-03-17	Active
CUST0118	Chioma	Okonkwo	chioma.okonkwo175@yahoo.com	Kano	Kano	2024-01-27	Active
CUST0380	Kola	Okonkwo	kola.okonkwo32@gmail.com	Kano	Kano	2024-07-23	Active
CUST0300	Chidi	Okorie	chidi.okorie303@gmail.com	Kano	Kano	2023-03-26	Active
CUST0302	Uche	Nwosu	uche.nwosu105@yahoo.com	Abuja	FCT	2024-04-04	Active
CUST0303	Chidi	Obi	chidi.obi568@yahoo.com	Lagos	Lagos	2023-11-29	Active
CUST0304	Musa	Musa	musa.musa743@gmail.com	Lagos	Lagos	2023-09-06	Active
CUST0305	Bisi	Eze	bisi.eze276@gmail.com	Kano	Kano	2023-03-06	Active
CUST0306	Ada	Musa	ada.musa370@yahoo.com	Abuja	FCT	2024-10-02	Active
CUST0307	Tunde	Oluwole	tunde.oluwole7@gmail.com	Abuja	FCT	2024-09-27	Active
CUST0308	Aisha	Okorie	aisha.okorie140@gmail.com	Abuja	FCT	2023-07-25	Active
CUST0309	Ibrahim	Oluwole	ibrahim.oluwole753@gmail.com	Ibadan	Oyo	2024-08-12	Active
CUST0310	Obinna	Chukwu	obinna.chukwu374@yahoo.com	Abuja	FCT	2024-08-29	Active
CUST0311	Tobi	Okafor	tobi.okafor976@gmail.com	Kano	Kano	2023-08-03	Active
CUST0314	Nkechi	Adegoke	nkechi.adegoke557@yahoo.com	Ibadan	Oyo	2024-07-03	Active
CUST0315	Funmi	Obi	funmi.obi171@gmail.com	Lagos	Lagos	2024-10-22	Active
CUST0316	Ibrahim	Adegoke	ibrahim.adegoke109@yahoo.com	Ibadan	Oyo	2024-06-06	Active
CUST0317	Musa	Nnamdi	musa.nnamdi791@gmail.com	Abuja	FCT	2023-06-04	Active
CUST0318	Sade	Adegoke	sade.adegoke943@gmail.com	Abuja	FCT	2023-05-26	Active
CUST0319	Yemi	Lawal	yemi.lawal495@gmail.com	Abuja	FCT	2024-04-08	Active
CUST0321	Bisi	Taiwo	bisi.taiwo164@gmail.com	Lagos	Lagos	2024-04-18	Active
CUST0322	Bisi	Adegoke	bisi.adegoke406@yahoo.com	Kano	Kano	2023-07-22	Active
CUST0323	Gbenga	Adeyemi	gbenga.adeyemi211@yahoo.com	Abuja	FCT	2023-03-06	Active
CUST0324	Yemi	Nnamdi	yemi.nnamdi117@yahoo.com	Abuja	FCT	2024-06-24	Active
CUST0325	Dayo	Chukwu	dayo.chukwu602@yahoo.com	Kano	Kano	2024-04-13	Active
CUST0327	Segun	Chukwu	segun.chukwu429@gmail.com	Kano	Kano	2024-03-09	Active
CUST0328	Ada	Oluwole	ada.oluwole144@yahoo.com	Kano	Kano	2024-09-26	Inactive
CUST0329	Ada	Eze	ada.eze200@gmail.com	Ibadan	Oyo	2024-06-01	Active
CUST0330	Aisha	Nnamdi	aisha.nnamdi501@yahoo.com	Kano	Kano	2023-08-14	Active
CUST0331	Sade	Okonkwo	sade.okonkwo800@gmail.com	Lagos	Lagos	2024-05-22	Active
CUST0332	Kola	Taiwo	kola.taiwo844@gmail.com	Kano	Kano	2023-02-12	Active
CUST0333	Aisha	Bello	aisha.bello754@gmail.com	Abuja	FCT	2023-11-01	Active
CUST0334	Fatima	Musa	fatima.musa450@gmail.com	Abuja	FCT	2023-08-31	Active
CUST0335	Dayo	Adegoke	dayo.adegoke170@gmail.com	Ibadan	Oyo	2023-07-31	Active
CUST0336	Dayo	Taiwo	dayo.taiwo173@gmail.com	Abuja	FCT	2023-10-24	Active
CUST0261	Musa	Nwosu	musa.nwosu837@yahoo.com	Port-Harcourt	Rivers	2023-03-16	Inactive
CUST0345	Fatima	Okonkwo	fatima.okonkwo54@gmail.com	Lagos	Lagos	2023-08-28	Active
CUST0347	Ibrahim	Bello	ibrahim.bello881@gmail.com	Lagos	Lagos	2023-03-14	Active
CUST0351	Amaka	Fagbemi	amaka.fagbemi748@gmail.com	Lagos	Lagos	2023-11-19	Active
CUST0353	Nkechi	Oluwole	nkechi.oluwole211@gmail.com	Lagos	Lagos	2024-02-06	Active
CUST0354	Chioma	Ibrahim	chioma.ibrahim507@gmail.com	Port-Harcourt	Rivers	2024-10-15	Active
CUST0355	Emeka	Obi	emeka.obi957@gmail.com	Ibadan	Oyo	2024-08-05	Active
CUST0357	Musa	Lawal	musa.lawal294@gmail.com	Ibadan	Oyo	2024-03-01	Active
CUST0358	Tobi	Taiwo	tobi.taiwo631@yahoo.com	Lagos	Lagos	2023-03-22	Active
CUST0359	Tunde	Taiwo	tunde.taiwo335@gmail.com	Ibadan	Oyo	2024-10-27	Active
CUST0360	Aisha	Ibrahim	aisha.ibrahim60@yahoo.com	Lagos	Lagos	2023-04-29	Active
CUST0361	Lola	Okonkwo	lola.okonkwo123@yahoo.com	Lagos	Lagos	2023-01-12	Active
CUST0362	Chioma	Nwosu	chioma.nwosu171@gmail.com	Abuja	FCT	2023-10-03	Active
CUST0363	Emeka	Abubakar	emeka.abubakar827@gmail.com	Port-Harcourt	Rivers	2023-09-27	Active
CUST0313	Chioma	Chukwu	chioma.chukwu76@gmail.com	Port-Harcourt	Rivers	2024-08-19	Active
CUST0253	Ada	Abubakar	ada.abubakar959@yahoo.com	Ibadan	Oyo	2023-08-30	Active
CUST0254	Sade	Fagbemi	sade.fagbemi741@gmail.com	Ibadan	Oyo	2024-01-04	Active
CUST0255	Chukwu	Oluwole	chukwu.oluwole164@gmail.com	Kano	Kano	2023-11-15	Active
CUST0256	Funmi	Ibrahim	funmi.ibrahim981@yahoo.com	Abuja	FCT	2024-09-12	Active
CUST0364	Ada	Nnamdi	ada.nnamdi524@gmail.com	Kano	Kano	2024-08-03	Active
CUST0365	Amaka	Fagbemi	amaka.fagbemi691@gmail.com	Lagos	Lagos	2024-06-05	Inactive
CUST0368	Amaka	Lawal	amaka.lawal690@gmail.com	Kano	Kano	2024-06-12	Active
CUST0369	Chukwu	Oluwole	chukwu.oluwole793@gmail.com	Lagos	Lagos	2024-07-20	Active
CUST0370	Ayo	Oluwole	ayo.oluwole758@gmail.com	Lagos	Lagos	2024-08-28	Active
CUST0377	Bisi	Nnamdi	bisi.nnamdi478@gmail.com	Lagos	Lagos	2024-01-02	Active
CUST0378	Chukwu	Nwosu	chukwu.nwosu873@yahoo.com	Abuja	FCT	2023-11-08	Active
CUST0379	Nkechi	Abubakar	nkechi.abubakar152@yahoo.com	Lagos	Lagos	2023-12-31	Active
CUST0385	Yemi	Okonkwo	yemi.okonkwo282@yahoo.com	Lagos	Lagos	2023-02-05	Active
CUST0386	Sade	Babangida	sade.babangida422@gmail.com	Lagos	Lagos	2023-03-31	Active
CUST0387	Femi	Lawal	femi.lawal256@gmail.com	Abuja	FCT	2023-01-20	Active
CUST0388	Chioma	Babangida	chioma.babangida353@gmail.com	Abuja	FCT	2024-02-02	Active
CUST0389	Funmi	Okafor	funmi.okafor918@gmail.com	Lagos	Lagos	2024-04-28	Active
CUST0390	Bisi	Bello	bisi.bello254@gmail.com	Ibadan	Oyo	2023-02-27	Active
CUST0391	Chioma	Chukwu	chioma.chukwu364@gmail.com	Kano	Kano	2023-06-27	Active
CUST0393	Yemi	Babangida	yemi.babangida556@gmail.com	Lagos	Lagos	2023-04-03	Inactive
CUST0394	Segun	Babangida	segun.babangida1@gmail.com	Lagos	Lagos	2023-05-14	Active
CUST0395	Nkechi	Abubakar	nkechi.abubakar61@yahoo.com	Ibadan	Oyo	2023-05-26	Active
CUST0396	Fatima	Chukwu	fatima.chukwu601@yahoo.com	Ibadan	Oyo	2023-05-20	Active
CUST0398	Obinna	Okonkwo	obinna.okonkwo388@gmail.com	Kano	Kano	2023-05-11	Active
CUST0399	Ayo	Chukwu	ayo.chukwu872@gmail.com	Ibadan	Oyo	2023-02-03	Active
CUST0400	Dayo	Ibrahim	dayo.ibrahim655@gmail.com	Ibadan	Oyo	2023-05-25	Active
CUST0401	Ibrahim	Okonkwo	ibrahim.okonkwo652@gmail.com	Lagos	Lagos	2024-11-17	Active
CUST0402	Kola	Adeyemi	kola.adeyemi256@gmail.com	Abuja	FCT	2023-04-21	Active
CUST0403	Titi	Adegoke	titi.adegoke993@yahoo.com	Abuja	FCT	2024-01-23	Active
CUST0404	Ada	Fagbemi	ada.fagbemi667@gmail.com	Lagos	Lagos	2024-04-07	Inactive
CUST0405	Ibrahim	Nwosu	ibrahim.nwosu975@yahoo.com	Lagos	Lagos	2024-01-20	Active
CUST0406	Oluwaseun	Musa	oluwaseun.musa347@gmail.com	Abuja	FCT	2024-05-09	Active
CUST0407	Bisi	Okorie	bisi.okorie912@gmail.com	Ibadan	Oyo	2023-12-06	Active
CUST0408	Tobi	Taiwo	tobi.taiwo272@gmail.com	Abuja	FCT	2023-04-09	Inactive
CUST0409	Fatima	Okafor	fatima.okafor438@yahoo.com	Lagos	Lagos	2024-10-02	Active
CUST0410	Yemi	Okonkwo	yemi.okonkwo654@yahoo.com	Lagos	Lagos	2023-04-29	Active
CUST0411	Oluwaseun	Nwosu	oluwaseun.nwosu94@gmail.com	Abuja	FCT	2024-01-15	Active
CUST0412	Ngozi	Nwosu	ngozi.nwosu451@gmail.com	Lagos	Lagos	2023-10-03	Active
CUST0413	Lola	Bello	lola.bello88@gmail.com	Port-Harcourt	Rivers	2024-02-28	Active
CUST0414	Ngozi	Chukwu	ngozi.chukwu839@gmail.com	Lagos	Lagos	2024-05-01	Active
CUST0415	Chidi	Chukwu	chidi.chukwu925@gmail.com	Abuja	FCT	2024-08-07	Active
CUST0416	Uche	Nnamdi	uche.nnamdi178@gmail.com	Lagos	Lagos	2023-08-05	Active
CUST0418	Chidi	Musa	chidi.musa398@gmail.com	Ibadan	Oyo	2023-10-10	Active
CUST0419	Dayo	Fagbemi	dayo.fagbemi536@gmail.com	Port-Harcourt	Rivers	2023-06-03	Active
CUST0420	Amaka	Bello	amaka.bello577@gmail.com	Kano	Kano	2024-07-02	Active
CUST0421	Femi	Babangida	femi.babangida586@gmail.com	Lagos	Lagos	2023-10-10	Active
CUST0422	Gbenga	Chukwu	gbenga.chukwu40@gmail.com	Kano	Kano	2023-09-01	Inactive
CUST0341	Chukwu	Obi	chukwu.obi871@yahoo.com	Port-Harcourt	Rivers	2023-08-12	Active
CUST0429	Chukwu	Okonkwo	chukwu.okonkwo984@gmail.com	Abuja	FCT	2023-12-25	Active
CUST0431	Femi	Ibrahim	femi.ibrahim694@yahoo.com	Ibadan	Oyo	2024-06-09	Inactive
CUST0432	Tunde	Okonkwo	tunde.okonkwo616@gmail.com	Abuja	FCT	2024-09-14	Active
CUST0433	Gbenga	Nwosu	gbenga.nwosu434@gmail.com	Portharcourt	Rivers	2024-04-15	Active
CUST0435	Dayo	Okorie	dayo.okorie290@yahoo.com	Kano	Kano	2023-03-07	Active
CUST0436	Nkechi	Nwosu	nkechi.nwosu268@gmail.com	Kano	Kano	2024-10-29	Active
CUST0437	Funmi	Adeleke	funmi.adeleke825@gmail.com	Abuja	FCT	2024-02-18	Active
CUST0438	Femi	Babangida	femi.babangida303@yahoo.com	Port-Harcourt	Rivers	2024-02-02	Active
CUST0439	Ayo	Adeyemi	ayo.adeyemi352@gmail.com	Portharcourt	Rivers	2024-07-01	Active
CUST0442	Funmi	Obi	funmi.obi229@gmail.com	Kano	Kano	2023-12-06	Active
CUST0443	Amaka	Babangida	amaka.babangida55@gmail.com	Abuja	FCT	2024-09-27	Inactive
CUST0444	Nkechi	Chukwu	nkechi.chukwu543@yahoo.com	Abuja	FCT	2023-06-04	Active
CUST0446	Ibrahim	Adeleke	ibrahim.adeleke5@gmail.com	Ibadan	Oyo	2023-06-22	Active
CUST0447	Uche	Musa	uche.musa133@gmail.com	Abuja	FCT	2024-02-18	Active
CUST0448	Ngozi	Taiwo	ngozi.taiwo205@gmail.com	Abuja	FCT	2023-11-26	Active
CUST0449	Emeka	Ibrahim	emeka.ibrahim232@gmail.com	Lagos	Lagos	2023-05-13	Active
CUST0450	Bisi	Musa	bisi.musa844@yahoo.com	Kano	Kano	2024-04-11	Active
CUST0451	Lola	Eze	lola.eze351@gmail.com	Abuja	FCT	2023-07-12	Active
CUST0453	Ngozi	Chukwu	ngozi.chukwu898@gmail.com	Kano	Kano	2024-09-30	Inactive
CUST0454	Femi	Okafor	femi.okafor50@gmail.com	Kano	Kano	2024-01-25	Active
CUST0456	Gbenga	Eze	gbenga.eze429@gmail.com	Kano	Kano	2024-09-24	Active
CUST0459	Chidi	Bello	chidi.bello856@gmail.com	Lagos	Lagos	2023-04-03	Active
CUST0461	Bisi	Adeleke	bisi.adeleke873@yahoo.com	Lagos	Lagos	2023-11-17	Active
CUST0392	Gbenga	Obi	gbenga.obi936@gmail.com	Port-Harcourt	Rivers	2023-12-27	Active
CUST0337	Uche	Adegoke	uche.adegoke941@yahoo.com	Lagos	Lagos	2024-11-02	Active
CUST0338	Gbenga	Abubakar	gbenga.abubakar849@yahoo.com	Lagos	Lagos	2024-02-07	Active
CUST0339	Femi	Adegoke	femi.adegoke385@gmail.com	Kano	Kano	2023-04-06	Active
CUST0340	Oluwaseun	Obi	oluwaseun.obi466@gmail.com	Kano	Kano	2023-01-03	Active
CUST0342	Ibrahim	Oluwole	ibrahim.oluwole346@gmail.com	Abuja	FCT	2024-05-11	Active
CUST0343	Femi	Nnamdi	femi.nnamdi17@yahoo.com	Lagos	Lagos	2024-03-27	Active
CUST0344	Gbenga	Eze	gbenga.eze904@gmail.com	Lagos	Lagos	2023-10-08	Active
CUST0478	Blessing	Chukwu	blessing.chukwu221@gmail.com	Lagos	Lagos	2023-12-13	Active
CUST0479	Femi	Fagbemi	femi.fagbemi127@gmail.com	Lagos	Lagos	2024-11-05	Active
CUST0480	Ada	Okafor	ada.okafor544@gmail.com	Lagos	Lagos	2024-03-19	Active
CUST0481	Uche	Okonkwo	uche.okonkwo709@gmail.com	Ibadan	Oyo	2023-05-12	Active
CUST0482	Musa	Adegoke	musa.adegoke624@gmail.com	Abuja	FCT	2023-10-08	Active
CUST0483	Chukwu	Eze	chukwu.eze142@gmail.com	Ibadan	Oyo	2024-06-08	Active
CUST0500	Ibrahim	Chukwu	ibrahim.chukwu938@gmail.com	Kano	Kano	2023-09-20	Active
CUST0504	Titi	Adegoke	titi.adegoke663@gmail.com	Ibadan	Oyo	2023-06-07	Inactive
CUST0505	Chidi	Adeleke	chidi.adeleke183@gmail.com	Lagos	Lagos	2024-08-11	Active
CUST0506	Chukwu	Chukwu	chukwu.chukwu444@gmail.com	Abuja	FCT	2023-05-02	Active
CUST0508	Sade	Nnamdi	sade.nnamdi391@gmail.com	Kano	Kano	2024-04-30	Active
CUST0510	Emeka	Taiwo	emeka.taiwo896@gmail.com	Kano	Kano	2023-01-06	Active
CUST0511	Chidi	Oluwole	chidi.oluwole216@gmail.com	Abuja	FCT	2023-12-19	Active
CUST0512	Funmi	Okorie	funmi.okorie855@yahoo.com	Lagos	Lagos	2024-11-18	Active
CUST0513	Blessing	Taiwo	blessing.taiwo473@gmail.com	Ibadan	Oyo	2024-11-18	Inactive
CUST0514	Ayo	Babangida	ayo.babangida975@gmail.com	Lagos	Lagos	2024-11-02	Active
CUST0515	Oluwaseun	Adeyemi	oluwaseun.adeyemi326@gmail.com	Kano	Kano	2024-11-06	Active
CUST0517	Fatima	Eze	fatima.eze696@gmail.com	Lagos	Lagos	2024-04-18	Active
CUST0518	Amaka	Okonkwo	amaka.okonkwo662@gmail.com	Abuja	FCT	2023-05-24	Active
CUST0520	Uche	Fagbemi	uche.fagbemi218@gmail.com	Kano	Kano	2024-07-10	Active
CUST0521	Tunde	Obi	tunde.obi402@yahoo.com	Kano	Kano	2023-10-25	Active
CUST0522	Segun	Okafor	segun.okafor679@yahoo.com	Abuja	FCT	2024-09-20	Active
CUST0523	Bisi	Fagbemi	bisi.fagbemi972@gmail.com	Abuja	FCT	2023-05-30	Active
CUST0524	Ngozi	Ibrahim	ngozi.ibrahim780@gmail.com	Ibadan	Oyo	2024-01-14	Active
CUST0525	Chioma	Obi	chioma.obi398@gmail.com	Abuja	FCT	2023-02-17	Inactive
CUST0430	Gbenga	Musa	gbenga.musa292@yahoo.com	Port-Harcourt	Rivers	2024-08-08	Active
CUST0457	Ada	Adeyemi	ada.adeyemi624@yahoo.com	Port-Harcourt	Rivers	2024-06-19	Active
CUST0458	Sade	Okonkwo	sade.okonkwo41@gmail.com	Port-Harcourt	Rivers	2024-05-07	Active
CUST0539	Nkechi	Adeleke	nkechi.adeleke715@gmail.com	Abuja	FCT	2024-05-08	Active
CUST0540	Chioma	Fagbemi	chioma.fagbemi101@gmail.com	Abuja	FCT	2023-08-27	Active
CUST0542	Musa	Adeyemi	musa.adeyemi705@gmail.com	Abuja	FCT	2023-04-20	Active
CUST0543	Tobi	Adegoke	tobi.adegoke579@gmail.com	Lagos	Lagos	2024-11-27	Active
CUST0544	Chioma	Taiwo	chioma.taiwo495@yahoo.com	Abuja	FCT	2024-05-10	Active
CUST0545	Uche	Chukwu	uche.chukwu754@yahoo.com	Kano	Kano	2023-05-02	Active
CUST0553	Obinna	Taiwo	obinna.taiwo937@gmail.com	Lagos	Lagos	2023-10-11	Active
CUST0554	Musa	Fagbemi	musa.fagbemi5@yahoo.com	Abuja	FCT	2023-04-20	Active
CUST0555	Amaka	Lawal	amaka.lawal980@yahoo.com	Lagos	Lagos	2024-08-11	Active
CUST0556	Ayo	Babangida	ayo.babangida789@yahoo.com	Ibadan	Oyo	2024-04-14	Active
CUST0557	Kola	Musa	kola.musa392@gmail.com	Abuja	FCT	2024-11-24	Active
CUST0558	Fatima	Lawal	fatima.lawal549@yahoo.com	Abuja	FCT	2023-09-12	Active
CUST0559	Obinna	Abubakar	obinna.abubakar78@gmail.com	Kano	Kano	2023-11-18	Active
CUST0560	Titi	Adeyemi	titi.adeyemi511@gmail.com	Lagos	Lagos	2023-09-05	Active
CUST0561	Obinna	Ibrahim	obinna.ibrahim857@gmail.com	Lagos	Lagos	2023-04-20	Active
CUST0562	Lola	Babangida	lola.babangida629@yahoo.com	Kano	Kano	2023-02-13	Active
CUST0563	Ada	Fagbemi	ada.fagbemi890@yahoo.com	Kano	Kano	2024-06-07	Active
CUST0565	Lola	Okonkwo	lola.okonkwo469@gmail.com	Abuja	FCT	2024-04-16	Active
CUST0566	Yemi	Chukwu	yemi.chukwu595@yahoo.com	Lagos	Lagos	2023-09-23	Active
CUST0567	Ada	Okorie	ada.okorie352@gmail.com	Lagos	Lagos	2023-08-04	Active
CUST0568	Musa	Nwosu	musa.nwosu462@yahoo.com	Abuja	FCT	2024-08-12	Active
CUST0570	Emeka	Okonkwo	emeka.okonkwo432@gmail.com	Abuja	FCT	2024-10-07	Active
CUST0572	Kola	Babangida	kola.babangida860@gmail.com	Lagos	Lagos	2023-12-09	Active
CUST0573	Blessing	Nwosu	blessing.nwosu353@yahoo.com	Kano	Kano	2024-11-26	Active
CUST0574	Femi	Taiwo	femi.taiwo179@gmail.com	Kano	Kano	2023-11-29	Active
CUST0576	Dayo	Fagbemi	dayo.fagbemi415@gmail.com	Abuja	FCT	2023-06-15	Active
CUST0577	Sade	Nwosu	sade.nwosu620@gmail.com	Lagos	Lagos	2024-03-31	Active
CUST0579	Gbenga	Musa	gbenga.musa216@yahoo.com	Ibadan	Oyo	2023-03-07	Active
CUST0580	Emeka	Chukwu	emeka.chukwu537@gmail.com	Abuja	FCT	2023-09-26	Active
CUST0581	Oluwaseun	Chukwu	oluwaseun.chukwu317@yahoo.com	Kano	Kano	2024-03-29	Active
CUST0582	Bisi	Okafor	bisi.okafor36@gmail.com	Abuja	FCT	2023-11-30	Active
CUST0583	Tobi	Nwosu	tobi.nwosu562@gmail.com	Ibadan	Oyo	2024-07-06	Active
CUST0584	Femi	Fagbemi	femi.fagbemi446@gmail.com	Kano	Kano	2023-11-14	Active
CUST0585	Chioma	Musa	chioma.musa453@gmail.com	Abuja	FCT	2023-06-09	Active
CUST0470	Blessing	Okonkwo	blessing.okonkwo518@gmail.com	Lagos	Lagos	2023-06-19	Inactive
CUST0471	Ibrahim	Nwosu	ibrahim.nwosu52@gmail.com	Lagos	Lagos	2024-01-23	Active
CUST0474	Femi	Oluwole	femi.oluwole912@gmail.com	Ibadan	Oyo	2024-11-18	Active
CUST0423	Oluwaseun	Obi	oluwaseun.obi21@gmail.com	Ibadan	Oyo	2023-11-15	Active
CUST0424	Lola	Bello	lola.bello996@gmail.com	Ibadan	Oyo	2024-03-29	Active
CUST0425	Aisha	Okorie	aisha.okorie662@yahoo.com	Lagos	Lagos	2024-02-21	Active
CUST0426	Obinna	Adeleke	obinna.adeleke528@gmail.com	Ibadan	Oyo	2024-06-02	Active
CUST0428	Fatima	Nnamdi	fatima.nnamdi518@gmail.com	Lagos	Lagos	2024-11-28	Inactive
CUST0465	Nkechi	Okonkwo	nkechi.okonkwo107@gmail.com	Port-Harcourt	Rivers	2024-08-05	Active
CUST0591	Chukwu	Okorie	chukwu.okorie464@yahoo.com	Lagos	Lagos	2023-07-12	Active
CUST0594	Chukwu	Adeleke	chukwu.adeleke339@yahoo.com	Ibadan	Oyo	2023-05-30	Inactive
CUST0595	Ada	Okonkwo	ada.okonkwo197@gmail.com	Lagos	Lagos	2024-01-26	Active
CUST0596	Gbenga	Ibrahim	gbenga.ibrahim395@gmail.com	Ibadan	Oyo	2023-02-04	Active
CUST0597	Yemi	Babangida	yemi.babangida399@gmail.com	Abuja	FCT	2023-11-27	Active
CUST0599	Yemi	Bello	yemi.bello242@gmail.com	Ibadan	Oyo	2023-06-21	Active
CUST0600	Funmi	Okafor	funmi.okafor993@yahoo.com	Abuja	FCT	2024-05-01	Active
CUST0601	Chidi	Ibrahim	chidi.ibrahim162@gmail.com	Abuja	FCT	2023-12-13	Active
CUST0602	Femi	Eze	femi.eze719@gmail.com	Lagos	Lagos	2024-05-14	Active
CUST0605	Tobi	Obi	tobi.obi332@gmail.com	Kano	Kano	2024-09-05	Active
CUST0607	Titi	Okonkwo	titi.okonkwo905@yahoo.com	Abuja	FCT	2024-09-27	Active
CUST0608	Tobi	Chukwu	tobi.chukwu195@gmail.com	Kano	Kano	2024-07-18	Active
CUST0609	Femi	Abubakar	femi.abubakar114@yahoo.com	Lagos	Lagos	2023-02-14	Active
CUST0610	Ngozi	Adeyemi	ngozi.adeyemi110@gmail.com	Lagos	Lagos	2024-08-07	Active
CUST0611	Segun	Okorie	segun.okorie719@gmail.com	Kano	Kano	2023-08-15	Active
CUST0613	Tobi	Adegoke	tobi.adegoke842@gmail.com	Lagos	Lagos	2024-09-23	Active
CUST0615	Yemi	Adeyemi	yemi.adeyemi539@gmail.com	Abuja	FCT	2023-07-03	Active
CUST0546	Bisi	Bello	bisi.bello220@gmail.com	Port-Harcourt	Rivers	2024-07-17	Active
CUST0633	Ibrahim	Obi	ibrahim.obi609@gmail.com	Lagos	Lagos	2023-06-23	Active
CUST0635	Titi	Musa	titi.musa116@gmail.com	Lagos	Lagos	2024-09-27	Active
CUST0638	Ayo	Lawal	ayo.lawal45@yahoo.com	Lagos	Lagos	2023-07-25	Active
CUST0639	Chukwu	Okafor	chukwu.okafor69@gmail.com	Lagos	Lagos	2024-11-06	Active
CUST0640	Nkechi	Chukwu	nkechi.chukwu237@gmail.com	Lagos	Lagos	2023-04-12	Active
CUST0641	Tobi	Musa	tobi.musa191@yahoo.com	Ibadan	Oyo	2024-07-28	Active
CUST0643	Femi	Oluwole	femi.oluwole242@gmail.com	Abuja	FCT	2023-10-10	Active
CUST0644	Oluwaseun	Okafor	oluwaseun.okafor967@gmail.com	Ibadan	Oyo	2023-06-05	Active
CUST0645	Chidi	Chukwu	chidi.chukwu534@gmail.com	Kano	Kano	2024-10-02	Active
CUST0646	Tunde	Adegoke	tunde.adegoke994@gmail.com	Lagos	Lagos	2024-04-04	Active
CUST0647	Ayo	Taiwo	ayo.taiwo701@gmail.com	Kano	Kano	2023-11-13	Active
CUST0648	Blessing	Eze	blessing.eze672@gmail.com	Abuja	FCT	2023-11-22	Inactive
CUST0649	Obinna	Eze	obinna.eze745@yahoo.com	Lagos	Lagos	2024-02-28	Active
CUST0650	Blessing	Nwosu	blessing.nwosu156@gmail.com	Abuja	FCT	2023-07-09	Inactive
CUST0651	Dayo	Ibrahim	dayo.ibrahim611@yahoo.com	Kano	Kano	2024-01-03	Inactive
CUST0652	Nkechi	Okorie	nkechi.okorie481@gmail.com	Lagos	Lagos	2024-02-01	Active
CUST0654	Yemi	Adeyemi	yemi.adeyemi68@yahoo.com	Portharcourt	Rivers	2024-03-25	Active
CUST0655	Nkechi	Nnamdi	nkechi.nnamdi909@yahoo.com	Kano	Kano	2023-02-12	Active
CUST0657	Chukwu	Nnamdi	chukwu.nnamdi847@gmail.com	Abuja	FCT	2023-09-09	Active
CUST0658	Ngozi	Taiwo	ngozi.taiwo397@gmail.com	Ibadan	Oyo	2023-02-20	Active
CUST0659	Sade	Oluwole	sade.oluwole473@yahoo.com	Abuja	FCT	2023-02-25	Active
CUST0660	Femi	Nnamdi	femi.nnamdi93@gmail.com	Abuja	FCT	2024-08-22	Active
CUST0661	Ibrahim	Nnamdi	ibrahim.nnamdi26@yahoo.com	Abuja	FCT	2023-07-26	Active
CUST0662	Gbenga	Okonkwo	gbenga.okonkwo736@gmail.com	Lagos	Lagos	2024-04-05	Active
CUST0663	Musa	Lawal	musa.lawal627@gmail.com	Abuja	FCT	2024-01-25	Inactive
CUST0664	Ayo	Eze	ayo.eze167@gmail.com	Ibadan	Oyo	2023-02-22	Active
CUST0666	Ada	Babangida	ada.babangida557@gmail.com	Lagos	Lagos	2024-05-20	Active
CUST0667	Chukwu	Adegoke	chukwu.adegoke453@yahoo.com	Kano	Kano	2023-09-08	Active
CUST0668	Tobi	Adeyemi	tobi.adeyemi51@yahoo.com	Kano	Kano	2023-12-24	Inactive
CUST0669	Obinna	Okorie	obinna.okorie306@gmail.com	Kano	Kano	2023-04-22	Active
CUST0670	Sade	Okorie	sade.okorie677@gmail.com	Lagos	Lagos	2024-07-29	Active
CUST0671	Fatima	Adeleke	fatima.adeleke96@gmail.com	Portharcourt	Rivers	2024-01-24	Active
CUST0672	Chidi	Oluwole	chidi.oluwole483@yahoo.com	Portharcourt	Rivers	2023-10-09	Active
CUST0673	Gbenga	Adeyemi	gbenga.adeyemi627@yahoo.com	Abuja	FCT	2024-10-06	Active
CUST0674	Gbenga	Okorie	gbenga.okorie957@gmail.com	Abuja	FCT	2024-03-13	Active
CUST0676	Chioma	Okonkwo	chioma.okonkwo905@gmail.com	Abuja	FCT	2023-07-18	Inactive
CUST0677	Chioma	Bello	chioma.bello756@gmail.com	Abuja	FCT	2024-02-29	Active
CUST0678	Chioma	Adeyemi	chioma.adeyemi12@gmail.com	Lagos	Lagos	2023-09-18	Active
CUST0679	Tobi	Abubakar	tobi.abubakar786@yahoo.com	Lagos	Lagos	2023-12-16	Active
CUST0680	Emeka	Okonkwo	emeka.okonkwo199@gmail.com	Kano	Kano	2024-11-19	Active
CUST0681	Femi	Eze	femi.eze494@yahoo.com	Portharcourt	Rivers	2024-07-03	Active
CUST0682	Aisha	Adeleke	aisha.adeleke856@gmail.com	Port-Harcourt	Rivers	2024-11-25	Active
CUST0527	Ayo	Musa	ayo.musa530@yahoo.com	Abuja	FCT	2023-08-17	Active
CUST0528	Fatima	Babangida	fatima.babangida812@gmail.com	Portharcourt	Rivers	2024-05-28	Active
CUST0530	Lola	Ibrahim	lola.ibrahim425@gmail.com	Portharcourt	Rivers	2024-05-08	Active
CUST0532	Oluwaseun	Fagbemi	oluwaseun.fagbemi151@yahoo.com	Abuja	FCT	2023-07-04	Active
CUST0533	Ayo	Okafor	ayo.okafor900@gmail.com	Kano	Kano	2023-10-18	Active
CUST0534	Ada	Babangida	ada.babangida175@yahoo.com	Abuja	FCT	2023-05-27	Active
CUST0535	Segun	Nwosu	segun.nwosu172@gmail.com	Kano	Kano	2024-04-09	Active
CUST0536	Musa	Eze	musa.eze112@yahoo.com	Lagos	Lagos	2024-05-31	Active
CUST0537	Bisi	Babangida	bisi.babangida924@gmail.com	Kano	Kano	2024-06-28	Active
CUST0538	Lola	Eze	lola.eze924@gmail.com	Lagos	Lagos	2024-11-25	Active
CUST0683	Ayo	Abubakar	ayo.abubakar819@gmail.com	Lagos	Lagos	2023-03-09	Active
CUST0684	Ibrahim	Chukwu	ibrahim.chukwu642@gmail.com	Port-Harcourt	Rivers	2024-09-12	Active
CUST0685	Chioma	Oluwole	chioma.oluwole723@gmail.com	Lagos	Lagos	2023-10-06	Active
CUST0686	Fatima	Nnamdi	fatima.nnamdi850@gmail.com	Ibadan	Oyo	2023-11-06	Active
CUST0688	Blessing	Babangida	blessing.babangida751@gmail.com	Lagos	Lagos	2023-12-02	Active
CUST0690	Lola	Okorie	lola.okorie893@yahoo.com	Ibadan	Oyo	2023-02-17	Active
CUST0691	Uche	Oluwole	uche.oluwole655@gmail.com	Lagos	Lagos	2023-07-17	Active
CUST0692	Chukwu	Bello	chukwu.bello280@yahoo.com	Lagos	Lagos	2023-01-16	Active
CUST0693	Yemi	Taiwo	yemi.taiwo359@gmail.com	Abuja	FCT	2023-10-18	Active
CUST0699	Gbenga	Abubakar	gbenga.abubakar808@gmail.com	Abuja	FCT	2024-05-14	Inactive
CUST0700	Ada	Nnamdi	ada.nnamdi867@yahoo.com	Lagos	Lagos	2024-09-10	Active
CUST0701	Obinna	Bello	obinna.bello334@gmail.com	Lagos	Lagos	2023-11-06	Active
CUST0702	Funmi	Okorie	funmi.okorie250@gmail.com	Kano	Kano	2024-01-29	Inactive
CUST0617	Tobi	Chukwu	tobi.chukwu517@gmail.com	Port-Harcourt	Rivers	2024-09-06	Active
CUST0717	Tobi	Fagbemi	tobi.fagbemi376@yahoo.com	Abuja	FCT	2024-05-09	Active
CUST0718	Gbenga	Musa	gbenga.musa146@gmail.com	Kano	Kano	2023-10-14	Active
CUST0719	Dayo	Musa	dayo.musa252@gmail.com	Abuja	FCT	2024-11-15	Inactive
CUST0720	Oluwaseun	Abubakar	oluwaseun.abubakar548@gmail.com	Kano	Kano	2024-06-08	Active
CUST0721	Chioma	Oluwole	chioma.oluwole297@yahoo.com	Abuja	FCT	2024-09-03	Active
CUST0722	Ada	Fagbemi	ada.fagbemi174@gmail.com	Lagos	Lagos	2023-10-26	Active
CUST0725	Chioma	Okonkwo	chioma.okonkwo268@gmail.com	Abuja	FCT	2023-07-05	Active
CUST0726	Chidi	Eze	chidi.eze610@gmail.com	Lagos	Lagos	2024-05-22	Active
CUST0728	Amaka	Adeleke	amaka.adeleke172@gmail.com	Port-Harcourt	Rivers	2024-05-02	Active
CUST0729	Lola	Chukwu	lola.chukwu486@yahoo.com	Lagos	Lagos	2024-03-21	Inactive
CUST0730	Ibrahim	Lawal	ibrahim.lawal700@gmail.com	Abuja	FCT	2024-06-28	Active
CUST0731	Femi	Nwosu	femi.nwosu344@yahoo.com	Kano	Kano	2023-09-19	Active
CUST0732	Lola	Ibrahim	lola.ibrahim752@gmail.com	Abuja	FCT	2024-06-16	Active
CUST0733	Emeka	Okafor	emeka.okafor852@yahoo.com	Lagos	Lagos	2024-06-21	Active
CUST0735	Femi	Bello	femi.bello726@gmail.com	Ibadan	Oyo	2024-09-11	Active
CUST0736	Gbenga	Okonkwo	gbenga.okonkwo260@yahoo.com	Ibadan	Oyo	2023-03-19	Active
CUST0738	Kola	Nwosu	kola.nwosu183@gmail.com	Ibadan	Oyo	2023-07-25	Active
CUST0740	Amaka	Adeleke	amaka.adeleke75@yahoo.com	Portharcourt	Rivers	2024-04-01	Inactive
CUST0741	Femi	Okafor	femi.okafor956@yahoo.com	Lagos	Lagos	2023-06-05	Active
CUST0742	Segun	Babangida	segun.babangida490@gmail.com	Kano	Kano	2023-03-13	Active
CUST0743	Gbenga	Babangida	gbenga.babangida125@gmail.com	Abuja	FCT	2024-01-03	Active
CUST0744	Femi	Musa	femi.musa375@gmail.com	Abuja	FCT	2023-03-24	Active
CUST0745	Bisi	Taiwo	bisi.taiwo41@gmail.com	Kano	Kano	2023-11-03	Active
CUST0746	Fatima	Babangida	fatima.babangida87@gmail.com	Kano	Kano	2023-07-14	Active
CUST0747	Ayo	Ibrahim	ayo.ibrahim501@gmail.com	Lagos	Lagos	2024-10-20	Active
CUST0748	Chioma	Nnamdi	chioma.nnamdi990@gmail.com	Ibadan	Oyo	2023-02-27	Active
CUST0749	Yemi	Lawal	yemi.lawal470@gmail.com	Abuja	FCT	2024-07-03	Active
CUST0750	Ngozi	Eze	ngozi.eze501@gmail.com	Ibadan	Oyo	2024-09-25	Inactive
CUST0751	Femi	Adeleke	femi.adeleke927@gmail.com	Lagos	Lagos	2024-04-12	Active
CUST0752	Obinna	Bello	obinna.bello117@gmail.com	Lagos	Lagos	2023-08-14	Inactive
CUST0753	Chioma	Chukwu	chioma.chukwu333@yahoo.com	Abuja	FCT	2024-07-12	Active
CUST0755	Chukwu	Ibrahim	chukwu.ibrahim948@gmail.com	Kano	Kano	2024-10-09	Active
CUST0756	Ada	Musa	ada.musa7@yahoo.com	Lagos	Lagos	2024-10-29	Active
CUST0757	Chioma	Babangida	chioma.babangida709@yahoo.com	Abuja	FCT	2023-10-05	Active
CUST0758	Bisi	Okorie	bisi.okorie709@yahoo.com	Lagos	Lagos	2024-05-26	Active
CUST0759	Chioma	Oluwole	chioma.oluwole357@gmail.com	Kano	Kano	2023-07-16	Active
CUST0760	Nkechi	Taiwo	nkechi.taiwo520@yahoo.com	Kano	Kano	2024-11-06	Active
CUST0762	Ngozi	Obi	ngozi.obi292@yahoo.com	Ibadan	Oyo	2024-09-23	Active
CUST0763	Titi	Adeleke	titi.adeleke948@gmail.com	Lagos	Lagos	2023-01-30	Active
CUST0764	Funmi	Nnamdi	funmi.nnamdi607@gmail.com	Lagos	Lagos	2024-11-24	Active
CUST0766	Ayo	Babangida	ayo.babangida56@gmail.com	Lagos	Lagos	2024-09-16	Active
CUST0767	Chukwu	Adeyemi	chukwu.adeyemi648@gmail.com	Abuja	FCT	2023-12-10	Active
CUST0629	Sade	Chukwu	sade.chukwu152@yahoo.com	Lagos	Lagos	2024-08-08	Active
CUST0618	Tobi	Abubakar	tobi.abubakar866@gmail.com	Ibadan	Oyo	2024-03-16	Active
CUST0619	Ayo	Taiwo	ayo.taiwo220@gmail.com	Kano	Kano	2023-09-18	Active
CUST0620	Musa	Okafor	musa.okafor744@yahoo.com	Abuja	FCT	2023-01-17	Active
CUST0621	Funmi	Adeyemi	funmi.adeyemi877@gmail.com	Lagos	Lagos	2023-10-10	Active
CUST0622	Blessing	Fagbemi	blessing.fagbemi159@yahoo.com	Kano	Kano	2023-06-09	Active
CUST0623	Funmi	Ibrahim	funmi.ibrahim263@gmail.com	Ibadan	Oyo	2024-02-14	Active
CUST0625	Sade	Adeleke	sade.adeleke749@gmail.com	Kano	Kano	2023-02-27	Active
CUST0626	Obinna	Adegoke	obinna.adegoke427@gmail.com	Lagos	Lagos	2023-08-21	Active
CUST0768	Amaka	Nnamdi	amaka.nnamdi470@gmail.com	Lagos	Lagos	2023-08-14	Active
CUST0769	Chioma	Okorie	chioma.okorie928@yahoo.com	Lagos	Lagos	2023-08-24	Active
CUST0770	Yemi	Fagbemi	yemi.fagbemi485@gmail.com	Abuja	FCT	2024-03-14	Active
CUST0771	Aisha	Fagbemi	aisha.fagbemi228@gmail.com	Lagos	Lagos	2023-06-02	Active
CUST0772	Ngozi	Adeleke	ngozi.adeleke482@gmail.com	Abuja	FCT	2024-03-11	Active
CUST0773	Gbenga	Bello	gbenga.bello464@gmail.com	Portharcourt	Rivers	2023-01-13	Active
CUST0774	Tunde	Obi	tunde.obi303@yahoo.com	Ibadan	Oyo	2023-01-17	Active
CUST0776	Chioma	Obi	chioma.obi642@gmail.com	Abuja	FCT	2024-10-04	Inactive
CUST0777	Sade	Adegoke	sade.adegoke771@yahoo.com	Abuja	FCT	2024-07-09	Active
CUST0779	Amaka	Chukwu	amaka.chukwu375@gmail.com	Ibadan	Oyo	2024-01-11	Active
CUST0780	Uche	Adeyemi	uche.adeyemi142@gmail.com	Kano	Kano	2023-04-27	Active
CUST0783	Oluwaseun	Oluwole	oluwaseun.oluwole463@gmail.com	Portharcourt	Rivers	2023-03-09	Active
CUST0734	Titi	Oluwole	Unspecified	Abuja	FCT	2023-04-05	Inactive
CUST0787	Funmi	Lawal	funmi.lawal661@gmail.com	Ibadan	Oyo	2024-11-02	Active
CUST0788	Lola	Lawal	lola.lawal863@gmail.com	Abuja	FCT	2024-08-03	Active
CUST0789	Kola	Ibrahim	kola.ibrahim496@gmail.com	Lagos	Lagos	2023-02-18	Active
CUST0798	Musa	Adeyemi	musa.adeyemi503@gmail.com	Ibadan	Oyo	2023-02-27	Active
CUST0800	Chidi	Adeyemi	chidi.adeyemi746@gmail.com	Ibadan	Oyo	2024-03-01	Active
CUST0803	Kola	Adegoke	kola.adegoke180@gmail.com	Kano	Kano	2023-05-21	Active
CUST0805	Emeka	Okafor	emeka.okafor158@yahoo.com	Abuja	FCT	2024-10-13	Active
CUST0806	Ada	Ibrahim	ada.ibrahim30@yahoo.com	Abuja	FCT	2023-03-10	Active
CUST0807	Ayo	Adegoke	ayo.adegoke890@yahoo.com	Kano	Kano	2023-05-03	Active
CUST0811	Kola	Obi	kola.obi99@gmail.com	Port-Harcourt	Rivers	2023-05-28	Inactive
CUST0817	Tunde	Musa	tunde.musa436@gmail.com	Lagos	Lagos	2023-03-21	Inactive
CUST0819	Ngozi	Musa	ngozi.musa309@gmail.com	Ibadan	Oyo	2023-05-07	Active
CUST0820	Yemi	Okonkwo	yemi.okonkwo687@gmail.com	Kano	Kano	2023-10-12	Active
CUST0821	Nkechi	Lawal	nkechi.lawal800@gmail.com	Abuja	FCT	2024-08-06	Inactive
CUST0822	Gbenga	Adeyemi	gbenga.adeyemi988@yahoo.com	Abuja	FCT	2024-07-04	Inactive
CUST0823	Blessing	Lawal	blessing.lawal872@gmail.com	Ibadan	Oyo	2024-08-26	Active
CUST0824	Fatima	Chukwu	fatima.chukwu435@yahoo.com	Lagos	Lagos	2023-04-26	Active
CUST0825	Amaka	Lawal	amaka.lawal140@gmail.com	Lagos	Lagos	2023-10-23	Active
CUST0826	Ada	Bello	ada.bello395@yahoo.com	Lagos	Lagos	2023-11-16	Active
CUST0827	Aisha	Oluwole	aisha.oluwole876@gmail.com	Lagos	Lagos	2024-05-02	Active
CUST0828	Lola	Babangida	lola.babangida689@yahoo.com	Lagos	Lagos	2024-11-05	Active
CUST0829	Musa	Fagbemi	musa.fagbemi105@gmail.com	Lagos	Lagos	2023-06-22	Inactive
CUST0831	Ayo	Nwosu	ayo.nwosu775@gmail.com	Port-Harcourt	Rivers	2024-02-14	Active
CUST0832	Ada	Lawal	ada.lawal286@yahoo.com	Ibadan	Oyo	2023-05-06	Active
CUST0833	Tunde	Okafor	tunde.okafor102@gmail.com	Lagos	Lagos	2024-05-25	Active
CUST0834	Lola	Abubakar	lola.abubakar157@gmail.com	Abuja	FCT	2023-03-20	Active
CUST0835	Yemi	Oluwole	yemi.oluwole678@gmail.com	Port-Harcourt	Rivers	2024-07-09	Active
CUST0836	Uche	Adeleke	uche.adeleke441@gmail.com	Abuja	FCT	2024-04-05	Active
CUST0837	Ngozi	Adeleke	ngozi.adeleke182@gmail.com	Abuja	FCT	2023-11-07	Active
CUST0838	Tunde	Oluwole	tunde.oluwole733@gmail.com	Abuja	FCT	2024-08-05	Active
CUST0839	Nkechi	Okonkwo	nkechi.okonkwo519@yahoo.com	Abuja	FCT	2024-08-28	Active
CUST0840	Sade	Abubakar	sade.abubakar63@yahoo.com	Port-Harcourt	Rivers	2024-01-11	Active
CUST0841	Oluwaseun	Abubakar	oluwaseun.abubakar390@yahoo.com	Lagos	Lagos	2024-01-01	Active
CUST0842	Funmi	Ibrahim	funmi.ibrahim664@gmail.com	Kano	Kano	2023-03-09	Active
CUST0843	Emeka	Taiwo	emeka.taiwo334@yahoo.com	Lagos	Lagos	2024-03-08	Active
CUST0844	Gbenga	Babangida	gbenga.babangida603@yahoo.com	Lagos	Lagos	2024-08-07	Active
CUST0846	Dayo	Oluwole	dayo.oluwole373@gmail.com	Lagos	Lagos	2024-10-12	Active
CUST0848	Chidi	Fagbemi	chidi.fagbemi98@gmail.com	Kano	Kano	2024-08-03	Active
CUST0849	Fatima	Musa	fatima.musa668@gmail.com	Abuja	FCT	2023-11-04	Active
CUST0850	Musa	Nwosu	musa.nwosu640@gmail.com	Lagos	Lagos	2024-07-14	Active
CUST0851	Blessing	Adegoke	oluwaseun.obi953@yahoo.com	Ibadan	Oyo	2024-06-18	Active
CUST0852	Chukwu	Eze	chioma.nnamdi639@yahoo.com	Lagos	Lagos	2023-06-04	Active
CUST0853	Uche	Oluwole	ayo.nwosu775@gmail.com	Portharcourt	Rivers	2024-02-25	Active
CUST0856	Funmi	Chukwu	ayo.nnamdi147@gmail.com	Kano	Kano	2023-04-27	Active
CUST0857	Emeka	Ibrahim	titi.abubakar619@yahoo.com	Lagos	Lagos	2024-04-20	Active
CUST0858	Aisha	Adegoke	uche.chukwu285@gmail.com	Abuja	FCT	2023-07-26	Active
CUST0704	Lola	Musa	lola.musa758@gmail.com	Lagos	Lagos	2024-05-13	Active
CUST0705	Tobi	Bello	tobi.bello842@gmail.com	Abuja	FCT	2024-02-20	Inactive
CUST0706	Dayo	Chukwu	dayo.chukwu336@gmail.com	Kano	Kano	2023-04-03	Active
CUST0707	Oluwaseun	Okafor	oluwaseun.okafor776@yahoo.com	Ibadan	Oyo	2024-06-28	Active
CUST0708	Lola	Abubakar	lola.abubakar307@gmail.com	Lagos	Lagos	2023-11-08	Active
CUST0714	Ada	Adegoke	ada.adegoke999@gmail.com	Portharcourt	Rivers	2024-10-19	Active
CUST0715	Gbenga	Okorie	gbenga.okorie953@gmail.com	Ibadan	Oyo	2024-06-05	Active
CUST0716	Funmi	Okonkwo	funmi.okonkwo435@gmail.com	Abuja	FCT	2023-08-31	Active
CUST0723	Ada	Musa	ada.musa130@gmail.com	Lagos	Lagos	2023-10-12	Active
CUST0859	Tunde	Okafor	gbenga.obi936@gmail.com	Lagos	Lagos	2023-10-12	Active
CUST0860	Bisi	Adeleke	tunde.ibrahim881@gmail.com	Kano	Kano	2023-01-21	Active
CUST0861	Oluwaseun	Musa	tunde.oluwole733@gmail.com	Lagos	Lagos	2024-09-08	Active
CUST0862	Chidi	Adegoke	amaka.babangida922@yahoo.com	Lagos	Lagos	2024-11-18	Active
CUST0863	Chidi	Chukwu	bisi.nwosu461@gmail.com	Kano	Kano	2023-08-30	Active
CUST0494	Kola	Eze	kola.eze165@gmail.com	Lagos	Lagos	2023-12-05	Active
CUST0864	Titi	Lawal	tunde.oluwole894@gmail.com	Lagos	Lagos	2024-06-18	Active
CUST0865	Ayo	Lawal	uche.obi627@yahoo.com	Kano	Kano	2024-05-23	Active
CUST0349	Lola	Eze	Unspecified	Kano	Kano	2024-10-27	Active
CUST0656	Musa	Okorie	musa.okorie962@gmail.com	Port-Harcourt	Rivers	2024-06-21	Active
CUST0665	Chukwu	Oluwole	chukwu.oluwole642@yahoo.com	Port-Harcourt	Rivers	2023-07-27	Inactive
CUST0687	Uche	Adeyemi	uche.adeyemi936@yahoo.com	Port-Harcourt	Rivers	2024-05-09	Active
CUST0689	Segun	Eze	segun.eze211@gmail.com	Port-Harcourt	Rivers	2024-06-18	Active
CUST0703	Ayo	Adegoke	ayo.adegoke804@gmail.com	Port-Harcourt	Rivers	2023-12-17	Active
CUST0713	Tunde	Oluwole	tunde.oluwole894@gmail.com	Port-Harcourt	Rivers	2023-03-15	Active
CUST0727	Funmi	Nnamdi	funmi.nnamdi744@gmail.com	Port-Harcourt	Rivers	2023-12-20	Inactive
CUST0737	Gbenga	Abubakar	gbenga.abubakar264@yahoo.com	Port-Harcourt	Rivers	2023-03-05	Active
CUST0754	Ayo	Okonkwo	ayo.okonkwo344@yahoo.com	Port-Harcourt	Rivers	2024-03-01	Active
CUST0765	Ibrahim	Ibrahim	ibrahim.ibrahim101@yahoo.com	Port-Harcourt	Rivers	2023-07-24	Active
CUST0778	Chidi	Okorie	chidi.okorie902@gmail.com	Port-Harcourt	Rivers	2024-06-11	Active
CUST0781	Uche	Ibrahim	uche.ibrahim329@gmail.com	Port-Harcourt	Rivers	2024-11-27	Active
CUST0797	Uche	Nwosu	uche.nwosu201@yahoo.com	Port-Harcourt	Rivers	2024-04-01	Active
CUST0808	Bisi	Fagbemi	bisi.fagbemi60@yahoo.com	Port-Harcourt	Rivers	2023-05-19	Active
CUST0045	Obinna	Nnamdi	obinna.nnamdi359@gmail.com	Lagos	Lagos	2023-08-22	Active
CUST0001	Emeka	Nwosu	emeka.nwosu251@yahoo.com	Kano	Kano	2024-11-23	Active
CUST0002	Ngozi	Okafor	ngozi.okafor96@yahoo.com	Kano	Kano	2023-01-28	Active
CUST0003	Ayo	Nwosu	ayo.nwosu829@gmail.com	Lagos	Lagos	2023-06-13	Active
CUST0004	Yemi	Abubakar	yemi.abubakar105@yahoo.com	Lagos	Lagos	2023-12-19	Active
CUST0005	Tobi	Bello	tobi.bello997@gmail.com	Port-Harcourt	Rivers	2023-10-28	Active
CUST0006	Fatima	Fagbemi	fatima.fagbemi197@gmail.com	Ibadan	Oyo	2023-08-22	Active
CUST0007	Nkechi	Bello	nkechi.bello390@yahoo.com	Ibadan	Oyo	2024-01-09	Active
CUST0008	Kola	Musa	kola.musa624@gmail.com	Lagos	Lagos	2023-09-08	Active
CUST0009	Blessing	Taiwo	blessing.taiwo225@gmail.com	Lagos	Lagos	2023-02-27	Active
CUST0709	Blessing	Obi	blessing.obi92@gmail.com	Port-Harcourt	Rivers	2024-06-06	Active
CUST0855	Kola	Oluwole	fatima.okonkwo54@gmail.com	Port-Harcourt	Rivers	2023-09-20	Active
CUST0085	Sade	Ibrahim	Unspecified	Port-Harcourt	Rivers	2024-06-30	Active
CUST0062	Gbenga	Eze	gbenga.eze724@yahoo.com	Lagos	Lagos	2023-12-05	Active
CUST0063	Obinna	Adegoke	obinna.adegoke399@gmail.com	Lagos	Lagos	2023-01-21	Active
CUST0064	Emeka	Obi	emeka.obi306@gmail.com	Abuja	FCT	2024-03-05	Active
CUST0065	Kola	Adegoke	kola.adegoke498@yahoo.com	Abuja	FCT	2024-11-26	Active
CUST0141	Chidi	Babangida	chidi.babangida460@gmail.com	Lagos	Lagos	2023-04-22	Active
CUST0142	Ngozi	Lawal	ngozi.lawal309@gmail.com	Ibadan	Oyo	2023-03-04	Active
CUST0143	Amaka	Babangida	amaka.babangida730@gmail.com	Abuja	FCT	2023-03-24	Active
CUST0144	Kola	Okorie	kola.okorie649@gmail.com	Lagos	Lagos	2024-01-26	Active
CUST0145	Segun	Okorie	segun.okorie441@yahoo.com	Lagos	Lagos	2024-11-01	Active
CUST0147	Ibrahim	Nwosu	ibrahim.nwosu384@gmail.com	Lagos	Lagos	2024-04-30	Inactive
CUST0149	Fatima	Adegoke	fatima.adegoke889@gmail.com	Lagos	Lagos	2023-10-22	Active
CUST0219	Uche	Fagbemi	uche.fagbemi427@gmail.com	Kano	Kano	2024-10-04	Active
CUST0220	Chioma	Chukwu	chioma.chukwu305@gmail.com	Abuja	FCT	2023-06-11	Active
CUST0221	Ibrahim	Okorie	ibrahim.okorie148@gmail.com	Abuja	FCT	2023-12-20	Active
CUST0298	Uche	Okorie	uche.okorie978@gmail.com	Lagos	Lagos	2023-12-01	Inactive
CUST0299	Chukwu	Babangida	chukwu.babangida234@gmail.com	Port-Harcourt	Rivers	2024-03-18	Active
CUST0381	Amaka	Eze	amaka.eze125@yahoo.com	Lagos	Lagos	2023-08-16	Active
CUST0382	Femi	Musa	femi.musa597@gmail.com	Abuja	FCT	2023-03-18	Inactive
CUST0383	Femi	Nnamdi	femi.nnamdi829@yahoo.com	Lagos	Lagos	2023-12-06	Active
CUST0384	Blessing	Fagbemi	blessing.fagbemi444@gmail.com	Lagos	Lagos	2023-01-31	Active
CUST0634	Chioma	Nnamdi	chioma.nnamdi639@yahoo.com	Port-Harcourt	Rivers	2023-08-28	Active
CUST0784	Musa	Okonkwo	musa.okonkwo296@gmail.com	Lagos	Lagos	2023-06-18	Active
CUST0786	Ada	Obi	ada.obi431@gmail.com	Ibadan	Oyo	2023-10-26	Active
CUST0801	Titi	Adegoke	titi.adegoke747@gmail.com	Lagos	Lagos	2024-08-24	Active
CUST0802	Ada	Lawal	ada.lawal344@yahoo.com	Lagos	Lagos	2024-01-20	Active
CUST0265	Titi	Ibrahim	Unspecified	Abuja	FCT	2023-11-02	Active
CUST0024	Oluwaseun	Fagbemi	oluwaseun.fagbemi591@gmail.com	Port-Harcourt	Rivers	2024-02-21	Active
CUST0040	Tobi	Adegoke	tobi.adegoke575@yahoo.com	Port-Harcourt	Rivers	2023-06-02	Active
CUST0057	Funmi	Okonkwo	funmi.okonkwo824@gmail.com	Port-Harcourt	Rivers	2023-02-21	Active
CUST0066	Blessing	Eze	blessing.eze638@gmail.com	Port-Harcourt	Rivers	2024-08-29	Active
CUST0074	Ayo	Adeleke	ayo.adeleke356@gmail.com	Port-Harcourt	Rivers	2023-03-12	Active
CUST0079	Ibrahim	Nwosu	ibrahim.nwosu902@gmail.com	Port-Harcourt	Rivers	2024-07-23	Inactive
CUST0137	Funmi	Eze	funmi.eze806@gmail.com	Port-Harcourt	Rivers	2024-07-21	Active
CUST0138	Funmi	Abubakar	funmi.abubakar793@yahoo.com	Port-Harcourt	Rivers	2023-01-03	Active
CUST0160	Chidi	Chukwu	chidi.chukwu883@gmail.com	Port-Harcourt	Rivers	2024-04-15	Active
CUST0165	Funmi	Bello	funmi.bello150@yahoo.com	Port-Harcourt	Rivers	2023-06-06	Active
CUST0179	Amaka	Lawal	amaka.lawal790@gmail.com	Port-Harcourt	Rivers	2024-06-23	Inactive
CUST0190	Funmi	Oluwole	funmi.oluwole125@yahoo.com	Port-Harcourt	Rivers	2024-09-29	Active
CUST0191	Ada	Okorie	ada.okorie549@yahoo.com	Port-Harcourt	Rivers	2023-09-05	Active
CUST0205	Fatima	Obi	fatima.obi393@gmail.com	Port-Harcourt	Rivers	2023-06-07	Active
CUST0208	Yemi	Okorie	yemi.okorie293@gmail.com	Port-Harcourt	Rivers	2023-07-24	Active
CUST0222	Segun	Taiwo	segun.taiwo109@gmail.com	Port-Harcourt	Rivers	2023-10-01	Active
CUST0224	Yemi	Okonkwo	yemi.okonkwo511@gmail.com	Port-Harcourt	Rivers	2023-11-12	Active
CUST0232	Sade	Fagbemi	sade.fagbemi345@gmail.com	Port-Harcourt	Rivers	2024-05-16	Active
CUST0237	Segun	Adeyemi	segun.adeyemi575@gmail.com	Port-Harcourt	Rivers	2024-06-22	Active
CUST0367	Aisha	Ibrahim	aisha.ibrahim330@yahoo.com	Port-Harcourt	Rivers	2023-11-24	Active
CUST0371	Tobi	Ibrahim	tobi.ibrahim155@yahoo.com	Port-Harcourt	Rivers	2023-08-27	Active
CUST0397	Ada	Abubakar	ada.abubakar179@gmail.com	Port-Harcourt	Rivers	2024-09-20	Active
CUST0021	Femi	Obi	femi.obi449@gmail.com	Ibadan	Oyo	2023-09-11	Active
CUST0053	Chukwu	Adeyemi	chukwu.adeyemi524@gmail.com	Abuja	FCT	2023-06-23	Active
CUST0054	Femi	Okorie	femi.okorie344@yahoo.com	Abuja	FCT	2023-08-29	Active
CUST0055	Tunde	Okafor	tunde.okafor48@yahoo.com	Port-Harcourt	Rivers	2023-03-16	Active
CUST0056	Gbenga	Chukwu	gbenga.chukwu507@gmail.com	Lagos	Lagos	2023-01-06	Active
CUST0058	Chioma	Nnamdi	chioma.nnamdi684@gmail.com	Abuja	FCT	2023-11-21	Active
CUST0059	Titi	Lawal	titi.lawal437@gmail.com	Kano	Kano	2023-06-12	Active
CUST0060	Uche	Ibrahim	uche.ibrahim861@gmail.com	Abuja	FCT	2024-06-17	Active
CUST0061	Chidi	Oluwole	chidi.oluwole241@yahoo.com	Lagos	Lagos	2024-07-07	Active
CUST0153	Nkechi	Eze	nkechi.eze580@gmail.com	Lagos	Lagos	2024-10-10	Active
CUST0154	Yemi	Chukwu	yemi.chukwu430@gmail.com	Port-Harcourt	Rivers	2023-11-16	Active
CUST0192	Dayo	Obi	dayo.obi247@gmail.com	Abuja	FCT	2024-11-15	Active
CUST0271	Segun	Ibrahim	segun.ibrahim424@gmail.com	Ibadan	Oyo	2024-08-28	Active
CUST0272	Aisha	Taiwo	aisha.taiwo508@yahoo.com	Kano	Kano	2024-10-20	Active
CUST0372	Emeka	Chukwu	emeka.chukwu870@gmail.com	Ibadan	Oyo	2023-07-30	Active
CUST0373	Ngozi	Eze	ngozi.eze729@yahoo.com	Abuja	FCT	2023-08-26	Active
CUST0374	Fatima	Nnamdi	fatima.nnamdi998@gmail.com	Portharcourt	Rivers	2024-06-01	Active
CUST0375	Ayo	Adeleke	ayo.adeleke446@gmail.com	Lagos	Lagos	2023-10-26	Active
CUST0376	Musa	Abubakar	musa.abubakar326@gmail.com	Ibadan	Oyo	2023-07-27	Active
CUST0485	Femi	Okonkwo	femi.okonkwo516@gmail.com	Ibadan	Oyo	2023-04-29	Active
CUST0486	Lola	Adegoke	lola.adegoke691@gmail.com	Kano	Kano	2023-10-20	Active
CUST0488	Lola	Nwosu	lola.nwosu150@gmail.com	Ibadan	Oyo	2023-10-30	Active
CUST0489	Chukwu	Bello	chukwu.bello631@gmail.com	Abuja	FCT	2023-08-18	Active
CUST0493	Bisi	Musa	bisi.musa192@gmail.com	Lagos	Lagos	2023-05-03	Active
CUST0495	Blessing	Abubakar	blessing.abubakar612@yahoo.com	Lagos	Lagos	2024-09-22	Active
CUST0496	Ayo	Taiwo	ayo.taiwo367@yahoo.com	Abuja	FCT	2024-06-22	Active
CUST0497	Chioma	Lawal	chioma.lawal164@gmail.com	Abuja	FCT	2023-04-05	Active
CUST0498	Ibrahim	Obi	ibrahim.obi301@yahoo.com	Kano	Kano	2024-06-27	Active
CUST0499	Fatima	Nnamdi	fatima.nnamdi247@gmail.com	Lagos	Lagos	2024-09-28	Active
CUST0586	Uche	Eze	uche.eze353@yahoo.com	Abuja	FCT	2024-05-18	Active
CUST0587	Uche	Adegoke	uche.adegoke818@yahoo.com	Lagos	Lagos	2023-01-08	Active
CUST0588	Tobi	Adegoke	tobi.adegoke405@yahoo.com	Abuja	FCT	2024-10-23	Active
CUST0590	Femi	Taiwo	femi.taiwo829@yahoo.com	Lagos	Lagos	2023-03-12	Active
CUST0593	Chidi	Eze	chidi.eze16@gmail.com	Lagos	Lagos	2023-11-16	Active
CUST0694	Dayo	Abubakar	dayo.abubakar554@gmail.com	Lagos	Lagos	2024-04-27	Active
CUST0696	Dayo	Obi	dayo.obi320@gmail.com	Kano	Kano	2024-11-17	Active
CUST0697	Uche	Nnamdi	uche.nnamdi582@yahoo.com	Ibadan	Oyo	2024-04-24	Active
CUST0698	Gbenga	Nnamdi	gbenga.nnamdi482@yahoo.com	Kano	Kano	2024-09-23	Active
CUST0812	Uche	Babangida	uche.babangida422@gmail.com	Lagos	Lagos	2023-04-15	Active
CUST0814	Amaka	Adegoke	amaka.adegoke472@gmail.com	Portharcourt	Rivers	2023-05-15	Active
CUST0815	Gbenga	Obi	gbenga.obi143@gmail.com	Lagos	Lagos	2024-09-03	Active
CUST0816	Sade	Okafor	sade.okafor763@gmail.com	Lagos	Lagos	2023-05-26	Active
CUST0010	Musa	Nwosu	musa.nwosu68@yahoo.com	Portharcourt	Rivers	2023-11-19	Active
CUST0246	Sade	Abubakar	sade.abubakar293@gmail.com	Port-Harcourt	Rivers	2023-04-02	Active
CUST0270	Titi	Fagbemi	titi.fagbemi327@gmail.com	Port-Harcourt	Rivers	2023-11-25	Active
CUST0281	Ibrahim	Adeyemi	ibrahim.adeyemi380@gmail.com	Port-Harcourt	Rivers	2023-08-15	Active
CUST0301	Femi	Eze	femi.eze758@gmail.com	Port-Harcourt	Rivers	2023-04-04	Inactive
CUST0312	Chidi	Adegoke	chidi.adegoke690@gmail.com	Port-Harcourt	Rivers	2023-09-05	Active
CUST0346	Emeka	Adeyemi	emeka.adeyemi489@yahoo.com	Port-Harcourt	Rivers	2024-06-15	Active
CUST0076	Segun	Nwosu	segun.nwosu631@gmail.com	Lagos	Lagos	2024-05-10	Active
CUST0083	Funmi	Bello	funmi.bello739@yahoo.com	Lagos	Lagos	2024-07-02	Active
CUST0093	Gbenga	Oluwole	gbenga.oluwole720@gmail.com	Lagos	Lagos	2023-08-28	Active
CUST0111	Titi	Babangida	titi.babangida723@gmail.com	Lagos	Lagos	2024-11-10	Active
CUST0011	Blessing	Nnamdi	blessing.nnamdi147@yahoo.com	Abuja	FCT	2024-07-28	Active
CUST0012	Musa	Obi	musa.obi225@gmail.com	Ibadan	Oyo	2024-05-20	Active
CUST0013	Tunde	Okonkwo	tunde.okonkwo812@gmail.com	Ibadan	Oyo	2024-01-30	Active
CUST0014	Tobi	Okafor	tobi.okafor697@gmail.com	Abuja	FCT	2024-07-03	Active
CUST0015	Aisha	Okonkwo	aisha.okonkwo465@yahoo.com	Lagos	Lagos	2023-09-27	Active
CUST0818	Ngozi	Adeyemi	ngozi.adeyemi111@yahoo.com	Port-Harcourt	Rivers	2024-08-30	Inactive
CUST0847	Tobi	Adeyemi	tobi.adeyemi295@yahoo.com	Port-Harcourt	Rivers	2024-08-10	Active
CUST0434	Segun	Okorie	Unspecified	Lagos	Lagos	2024-11-09	Active
CUST0455	Tunde	Adeyemi	Unspecified	Abuja	FCT	2024-03-06	Active
CUST0516	Fatima	Abubakar	Unspecified	Kano	Kano	2023-09-10	Active
CUST0519	Oluwaseun	Musa	Unspecified	Lagos	Lagos	2024-06-03	Active
CUST0541	Oluwaseun	Taiwo	Unspecified	Lagos	Lagos	2023-01-08	Active
CUST0551	Lola	Adeleke	Unspecified	Kano	Kano	2023-06-11	Active
CUST0636	Gbenga	Bello	Unspecified	Lagos	Lagos	2023-08-03	Active
CUST0653	Funmi	Adeleke	Unspecified	Lagos	Lagos	2023-10-04	Active
CUST0785	Tunde	Adeyemi	Unspecified	Lagos	Lagos	2024-03-02	Active
CUST0799	Gbenga	Adegoke	Unspecified	Abuja	FCT	2023-12-20	Active
CUST0356	Uche	Musa	Unspecified	Port-Harcourt	Rivers	2023-08-09	Inactive
CUST0476	Amaka	Bello	Unspecified	Port-Harcourt	Rivers	2023-12-30	Active
CUST0148	Amaka	Obi	amaka.obi832@yahoo.com	Lagos	Lagos	2024-07-29	Active
CUST0159	Titi	Adegoke	titi.adegoke180@yahoo.com	Lagos	Lagos	2023-08-24	Active
CUST0739	Amaka	Eze	amaka.eze554@gmail.com	Kano	Kano	2024-10-20	Active
CUST0119	Ayo	Eze	ayo.eze238@gmail.com	Abuja	FCT	2023-09-19	Active
CUST0120	Lola	Taiwo	lola.taiwo162@yahoo.com	Ibadan	Oyo	2024-08-24	Active
CUST0121	Chukwu	Oluwole	chukwu.oluwole204@gmail.com	Kano	Kano	2023-04-20	Active
CUST0122	Gbenga	Oluwole	gbenga.oluwole23@gmail.com	Kano	Kano	2023-10-09	Inactive
CUST0123	Titi	Babangida	titi.babangida853@gmail.com	Ibadan	Oyo	2023-08-24	Active
CUST0124	Yemi	Okorie	yemi.okorie257@gmail.com	Lagos	Lagos	2024-11-06	Active
CUST0125	Oluwaseun	Adeleke	oluwaseun.adeleke317@gmail.com	Kano	Kano	2024-01-09	Active
CUST0126	Ibrahim	Adegoke	ibrahim.adegoke180@yahoo.com	Ibadan	Oyo	2024-01-10	Active
CUST0127	Kola	Babangida	kola.babangida991@gmail.com	Portharcourt	Rivers	2023-12-13	Active
CUST0128	Tunde	Ibrahim	tunde.ibrahim881@gmail.com	Ibadan	Oyo	2024-02-11	Active
CUST0129	Musa	Okafor	musa.okafor271@gmail.com	Lagos	Lagos	2024-11-19	Active
CUST0130	Obinna	Obi	obinna.obi111@gmail.com	Kano	Kano	2024-09-26	Active
CUST0131	Funmi	Musa	funmi.musa651@gmail.com	Ibadan	Oyo	2023-11-06	Active
CUST0132	Ngozi	Oluwole	ngozi.oluwole505@yahoo.com	Lagos	Lagos	2024-07-04	Active
CUST0133	Titi	Taiwo	titi.taiwo430@gmail.com	Abuja	FCT	2024-02-29	Active
CUST0134	Kola	Adeleke	kola.adeleke707@gmail.com	Kano	Kano	2023-08-30	Active
CUST0135	Fatima	Taiwo	fatima.taiwo924@gmail.com	Ibadan	Oyo	2024-02-12	Active
CUST0136	Obinna	Nnamdi	obinna.nnamdi94@gmail.com	Ibadan	Oyo	2024-09-03	Active
CUST0139	Tobi	Nwosu	tobi.nwosu818@yahoo.com	Ibadan	Oyo	2023-01-27	Active
CUST0140	Funmi	Fagbemi	funmi.fagbemi332@yahoo.com	Port-Harcourt	Rivers	2023-05-10	Active
CUST0150	Segun	Adeyemi	segun.adeyemi159@gmail.com	Lagos	Lagos	2023-04-21	Active
CUST0151	Uche	Nwosu	uche.nwosu588@yahoo.com	Abuja	FCT	2024-07-28	Active
CUST0152	Lola	Nwosu	lola.nwosu30@yahoo.com	Kano	Kano	2023-11-13	Active
CUST0146	Yemi	Adegoke	yemi.adegoke463@gmail.com	Port-Harcourt	Rivers	2024-04-09	Active
CUST0155	Oluwaseun	Adeleke	oluwaseun.adeleke160@yahoo.com	Kano	Kano	2024-11-21	Active
CUST0156	Ada	Okorie	ada.okorie453@gmail.com	Kano	Kano	2024-06-08	Active
CUST0157	Lola	Fagbemi	lola.fagbemi499@gmail.com	Lagos	Lagos	2023-08-14	Active
CUST0158	Yemi	Oluwole	yemi.oluwole969@yahoo.com	Lagos	Lagos	2023-09-19	Active
CUST0161	Ayo	Chukwu	ayo.chukwu727@gmail.com	Kano	Kano	2024-02-19	Inactive
CUST0162	Dayo	Nnamdi	dayo.nnamdi852@gmail.com	Lagos	Lagos	2024-03-23	Active
CUST0163	Musa	Lawal	musa.lawal81@gmail.com	Abuja	FCT	2023-12-14	Active
CUST0166	Uche	Babangida	uche.babangida476@gmail.com	Lagos	Lagos	2024-04-04	Active
CUST0206	Uche	Musa	uche.musa588@yahoo.com	Abuja	FCT	2023-11-18	Active
CUST0326	Ayo	Musa	ayo.musa689@yahoo.com	Ibadan	Oyo	2023-11-09	Active
CUST0440	Lola	Obi	lola.obi520@gmail.com	Ibadan	Oyo	2024-11-04	Active
CUST0462	Uche	Adeleke	uche.adeleke10@gmail.com	Lagos	Lagos	2023-06-24	Active
CUST0463	Kola	Musa	kola.musa382@gmail.com	Ibadan	Oyo	2024-02-15	Active
CUST0466	Uche	Obi	uche.obi627@yahoo.com	Kano	Kano	2023-05-14	Active
CUST0468	Titi	Fagbemi	titi.fagbemi742@gmail.com	Abuja	FCT	2024-11-16	Active
CUST0469	Titi	Ibrahim	titi.ibrahim494@gmail.com	Abuja	FCT	2024-01-30	Active
CUST0628	Funmi	Eze	funmi.eze52@gmail.com	Abuja	FCT	2024-04-01	Active
CUST0472	Chukwu	Fagbemi	chukwu.fagbemi459@yahoo.com	Lagos	Lagos	2023-11-20	Active
CUST0473	Emeka	Bello	emeka.bello414@gmail.com	Port-Harcourt	Rivers	2023-01-01	Active
CUST0475	Ngozi	Ibrahim	ngozi.ibrahim865@gmail.com	Abuja	FCT	2024-09-26	Active
CUST0477	Fatima	Bello	fatima.bello47@gmail.com	Abuja	FCT	2024-02-24	Active
CUST0547	Femi	Okafor	femi.okafor824@yahoo.com	Lagos	Lagos	2024-09-06	Active
CUST0548	Fatima	Musa	fatima.musa624@yahoo.com	Lagos	Lagos	2024-02-15	Active
CUST0549	Dayo	Adeleke	dayo.adeleke969@gmail.com	Lagos	Lagos	2024-05-21	Active
CUST0552	Fatima	Chukwu	fatima.chukwu416@gmail.com	Port-Harcourt	Rivers	2023-03-12	Active
CUST0627	Femi	Chukwu	femi.chukwu56@gmail.com	Ibadan	Oyo	2024-07-06	Active
CUST0630	Chidi	Chukwu	chidi.chukwu514@gmail.com	Abuja	FCT	2023-05-19	Active
CUST0631	Femi	Fagbemi	femi.fagbemi201@gmail.com	Abuja	FCT	2024-06-20	Active
CUST0632	Aisha	Abubakar	aisha.abubakar702@gmail.com	Lagos	Lagos	2024-11-18	Active
CUST0710	Ngozi	Obi	ngozi.obi923@gmail.com	Ibadan	Oyo	2024-07-27	Active
CUST0711	Sade	Okafor	sade.okafor241@gmail.com	Lagos	Lagos	2024-10-02	Active
CUST0712	Aisha	Taiwo	aisha.taiwo217@gmail.com	Abuja	FCT	2023-07-12	Active
CUST0792	Lola	Abubakar	lola.abubakar353@yahoo.com	Port-Harcourt	Rivers	2023-06-16	Active
CUST0790	Bisi	Okorie	bisi.okorie947@yahoo.com	Abuja	FCT	2023-07-06	Active
CUST0791	Amaka	Adeleke	amaka.adeleke325@gmail.com	Lagos	Lagos	2024-01-14	Active
CUST0793	Musa	Babangida	musa.babangida787@yahoo.com	Ibadan	Oyo	2023-11-24	Active
CUST0794	Sade	Babangida	sade.babangida918@yahoo.com	Kano	Kano	2024-08-10	Active
CUST0795	Amaka	Babangida	amaka.babangida922@yahoo.com	Lagos	Lagos	2023-04-30	Active
CUST0796	Funmi	Nnamdi	funmi.nnamdi366@yahoo.com	Kano	Kano	2024-10-18	Active
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (item_id, order_id, product_id, quantity, unit_price, line_total) FROM stdin;
38	ORD00018	PROD0205	1	7224.75	7224.75
4	ORD00002	PROD0247	1	5416.29	5416.29
5	ORD00003	PROD0247	4	5416.29	21665.16
6	ORD00003	PROD0011	1	314229.61	314229.61
7	ORD00003	PROD0196	3	2511.26	7533.78
8	ORD00004	PROD0193	1	9954.82	9954.82
9	ORD00004	PROD0247	3	5416.29	16248.87
11	ORD00006	PROD0037	5	266180.98	1330904.90
12	ORD00006	PROD0210	2	14712.50	29425.00
13	ORD00006	PROD0020	2	293010.61	586021.22
14	ORD00006	PROD0064	4	34644.88	138579.52
15	ORD00006	PROD0198	3	57432.47	172297.41
20	ORD00009	PROD0007	4	290642.30	1162569.20
21	ORD00009	PROD0060	4	10877.79	43511.16
22	ORD00009	PROD0048	5	10843.12	54215.60
28	ORD00012	PROD0036	4	78738.41	314953.64
29	ORD00013	PROD0069	2	39168.98	78337.96
30	ORD00014	PROD0031	2	290316.23	580632.46
31	ORD00015	PROD0086	4	49202.47	196809.88
32	ORD00015	PROD0041	1	14461.31	14461.31
33	ORD00015	PROD0151	3	24271.64	72814.92
34	ORD00015	PROD0044	1	32574.27	32574.27
35	ORD00016	PROD0137	1	2019.05	2019.05
36	ORD00017	PROD0267	3	6230.11	18690.33
37	ORD00018	PROD0185	5	112356.62	561783.10
39	ORD00018	PROD0194	3	24802.59	74407.77
40	ORD00019	PROD0072	5	43142.24	215711.20
41	ORD00019	PROD0014	3	289145.53	867436.59
42	ORD00019	PROD0063	2	35488.70	70977.40
56	ORD00024	PROD0113	1	145706.19	145706.19
57	ORD00024	PROD0132	2	23990.67	47981.34
58	ORD00024	PROD0244	5	1664.99	8324.95
63	ORD00026	PROD0060	4	10877.79	43511.16
64	ORD00026	PROD0189	5	96833.78	484168.90
65	ORD00026	PROD0066	1	36291.81	36291.81
66	ORD00026	PROD0161	3	25829.99	77489.97
67	ORD00027	PROD0065	1	30524.10	30524.10
68	ORD00027	PROD0267	4	6230.11	24920.44
69	ORD00027	PROD0114	1	7586.49	7586.49
70	ORD00028	PROD0075	5	5182.19	25910.95
71	ORD00028	PROD0018	3	120439.60	361318.80
72	ORD00029	PROD0193	3	9954.82	29864.46
73	ORD00029	PROD0031	2	290316.23	580632.46
78	ORD00032	PROD0028	2	316366.34	632732.68
79	ORD00032	PROD0156	5	21374.21	106871.05
80	ORD00032	PROD0235	2	1609.74	3219.48
81	ORD00033	PROD0053	2	43609.38	87218.76
88	ORD00037	PROD0246	4	5399.76	21599.04
89	ORD00037	PROD0141	4	11608.58	46434.32
90	ORD00037	PROD0049	3	27088.42	81265.26
91	ORD00037	PROD0093	5	8480.78	42403.90
92	ORD00037	PROD0197	2	113579.08	227158.16
93	ORD00038	PROD0275	5	10193.83	50969.15
95	ORD00040	PROD0066	5	36291.81	181459.05
97	ORD00042	PROD0151	5	24271.64	121358.20
98	ORD00042	PROD0274	4	7846.95	31387.80
99	ORD00042	PROD0228	3	6170.81	18512.43
100	ORD00042	PROD0072	5	43142.24	215711.20
105	ORD00045	PROD0074	2	13460.87	26921.74
106	ORD00045	PROD0275	1	10193.83	10193.83
110	ORD00047	PROD0034	1	272513.12	272513.12
111	ORD00047	PROD0169	3	41598.42	124795.26
112	ORD00048	PROD0064	1	34644.88	34644.88
113	ORD00048	PROD0090	5	102715.97	513579.85
114	ORD00048	PROD0270	3	907.09	2721.27
115	ORD00048	PROD0157	5	10758.03	53790.15
116	ORD00048	PROD0251	3	5175.86	15527.58
117	ORD00049	PROD0273	5	1784.35	8921.75
130	ORD00056	PROD0230	5	6077.64	30388.20
131	ORD00056	PROD0087	2	12717.02	25434.04
132	ORD00057	PROD0058	3	14691.81	44075.43
134	ORD00059	PROD0019	5	339524.65	1697623.25
135	ORD00059	PROD0238	4	6026.76	24107.04
136	ORD00060	PROD0096	4	179864.29	719457.16
139	ORD00062	PROD0056	2	6299.62	12599.24
140	ORD00062	PROD0225	3	9270.30	27810.90
141	ORD00062	PROD0083	4	160848.97	643395.88
144	ORD00065	PROD0177	5	102403.06	512015.30
148	ORD00068	PROD0258	5	4792.40	23962.00
149	ORD00068	PROD0093	2	8480.78	16961.56
150	ORD00068	PROD0097	2	9141.77	18283.54
153	ORD00070	PROD0219	1	14849.13	14849.13
155	ORD00072	PROD0130	3	1182.88	3548.64
156	ORD00072	PROD0252	3	8223.52	24670.56
158	ORD00074	PROD0055	2	42567.03	85134.06
173	ORD00082	PROD0021	2	34405.68	68811.36
174	ORD00083	PROD0128	5	24463.34	122316.70
175	ORD00083	PROD0108	1	121332.02	121332.02
176	ORD00084	PROD0069	4	39168.98	156675.92
182	ORD00088	PROD0091	2	141135.80	282271.60
183	ORD00088	PROD0097	3	9141.77	27425.31
184	ORD00088	PROD0252	1	8223.52	8223.52
185	ORD00089	PROD0207	1	11561.20	11561.20
187	ORD00091	PROD0007	1	290642.30	290642.30
188	ORD00092	PROD0084	2	37258.14	74516.28
189	ORD00092	PROD0158	2	12650.30	25300.60
190	ORD00092	PROD0170	1	45302.42	45302.42
191	ORD00092	PROD0246	5	5399.76	26998.80
192	ORD00093	PROD0053	4	43609.38	174437.52
193	ORD00093	PROD0262	2	3172.89	6345.78
194	ORD00094	PROD0197	1	113579.08	113579.08
195	ORD00095	PROD0171	1	105588.96	105588.96
197	ORD00097	PROD0147	3	5055.12	15165.36
203	ORD00100	PROD0171	5	105588.96	527944.80
204	ORD00100	PROD0071	4	9870.56	39482.24
205	ORD00100	PROD0126	5	13544.05	67720.25
206	ORD00100	PROD0197	5	113579.08	567895.40
207	ORD00100	PROD0215	4	3385.48	13541.92
208	ORD00101	PROD0113	2	145706.19	291412.38
209	ORD00101	PROD0045	3	15761.34	47284.02
214	ORD00103	PROD0218	1	5238.20	5238.20
215	ORD00103	PROD0191	5	44052.51	220262.55
216	ORD00103	PROD0028	1	316366.34	316366.34
217	ORD00104	PROD0040	1	47715.49	47715.49
230	ORD00110	PROD0104	1	73744.65	73744.65
5788	ORD02716	PROD0205	3	7224.75	21674.25
222	ORD00107	PROD0140	2	2847.84	5695.68
223	ORD00107	PROD0048	2	10843.12	21686.24
224	ORD00107	PROD0268	4	2944.75	11779.00
225	ORD00107	PROD0194	5	24802.59	124012.95
229	ORD00109	PROD0172	1	95695.43	95695.43
235	ORD00114	PROD0048	2	10843.12	21686.24
236	ORD00114	PROD0119	2	47472.78	94945.56
241	ORD00118	PROD0152	2	1904.28	3808.56
242	ORD00119	PROD0243	3	10094.25	30282.75
245	ORD00121	PROD0192	3	94625.99	283877.97
246	ORD00121	PROD0043	1	16739.67	16739.67
247	ORD00121	PROD0212	5	8757.97	43789.85
248	ORD00121	PROD0260	1	5050.94	5050.94
249	ORD00121	PROD0231	2	6206.49	12412.98
251	ORD00123	PROD0204	3	5933.15	17799.45
252	ORD00123	PROD0222	1	2802.33	2802.33
253	ORD00123	PROD0103	3	83304.08	249912.24
254	ORD00123	PROD0206	3	5427.42	16282.26
255	ORD00124	PROD0241	2	1174.07	2348.14
256	ORD00124	PROD0075	3	5182.19	15546.57
257	ORD00125	PROD0243	2	10094.25	20188.50
258	ORD00125	PROD0110	1	23332.73	23332.73
259	ORD00125	PROD0028	4	316366.34	1265465.36
260	ORD00126	PROD0232	4	4469.76	17879.04
266	ORD00130	PROD0002	4	102447.74	409790.96
267	ORD00131	PROD0097	4	9141.77	36567.08
268	ORD00132	PROD0008	3	121518.49	364555.47
269	ORD00132	PROD0190	1	22778.54	22778.54
275	ORD00136	PROD0279	4	962.48	3849.92
276	ORD00136	PROD0052	5	23501.69	117508.45
278	ORD00138	PROD0203	3	3538.98	10616.94
279	ORD00138	PROD0004	2	39811.79	79623.58
280	ORD00139	PROD0003	1	49538.31	49538.31
281	ORD00139	PROD0213	1	2985.64	2985.64
289	ORD00144	PROD0275	2	10193.83	20387.66
291	ORD00146	PROD0145	3	22657.06	67971.18
293	ORD00148	PROD0231	1	6206.49	6206.49
294	ORD00148	PROD0083	2	160848.97	321697.94
295	ORD00148	PROD0093	5	8480.78	42403.90
296	ORD00148	PROD0153	5	10840.50	54202.50
297	ORD00149	PROD0082	3	54346.36	163039.08
298	ORD00149	PROD0268	1	2944.75	2944.75
299	ORD00150	PROD0016	1	256280.50	256280.50
300	ORD00150	PROD0168	2	100026.32	200052.64
301	ORD00150	PROD0071	3	9870.56	29611.68
302	ORD00150	PROD0113	3	145706.19	437118.57
304	ORD00152	PROD0160	2	12278.28	24556.56
305	ORD00152	PROD0085	4	89243.32	356973.28
308	ORD00154	PROD0210	3	14712.50	44137.50
309	ORD00155	PROD0166	4	101932.80	407731.20
310	ORD00156	PROD0161	1	25829.99	25829.99
311	ORD00157	PROD0034	5	272513.12	1362565.60
312	ORD00157	PROD0198	2	57432.47	114864.94
313	ORD00157	PROD0146	1	9207.08	9207.08
314	ORD00157	PROD0109	5	70228.44	351142.20
317	ORD00159	PROD0232	2	4469.76	8939.52
319	ORD00161	PROD0009	1	198883.60	198883.60
321	ORD00163	PROD0063	5	35488.70	177443.50
322	ORD00163	PROD0192	1	94625.99	94625.99
326	ORD00165	PROD0195	3	24091.13	72273.39
327	ORD00166	PROD0212	5	8757.97	43789.85
328	ORD00166	PROD0229	2	4112.45	8224.90
329	ORD00166	PROD0063	5	35488.70	177443.50
330	ORD00166	PROD0268	4	2944.75	11779.00
338	ORD00170	PROD0104	4	73744.65	294978.60
339	ORD00170	PROD0205	2	7224.75	14449.50
353	ORD00179	PROD0088	5	73744.65	368723.25
334	ORD00169	PROD0271	3	1989.71	5969.13
335	ORD00169	PROD0264	4	4118.15	16472.60
336	ORD00169	PROD0161	2	25829.99	51659.98
337	ORD00170	PROD0263	3	8199.23	24597.69
340	ORD00170	PROD0097	3	9141.77	27425.31
341	ORD00170	PROD0036	5	78738.41	393692.05
343	ORD00172	PROD0109	2	70228.44	140456.88
344	ORD00173	PROD0196	4	2511.26	10045.04
347	ORD00175	PROD0034	5	272513.12	1362565.60
348	ORD00176	PROD0138	2	15463.10	30926.20
349	ORD00176	PROD0254	2	9824.37	19648.74
350	ORD00176	PROD0106	3	137481.28	412443.84
352	ORD00178	PROD0234	2	6463.53	12927.06
354	ORD00179	PROD0005	1	85978.02	85978.02
355	ORD00179	PROD0181	4	63768.87	255075.48
356	ORD00179	PROD0243	2	10094.25	20188.50
360	ORD00181	PROD0250	3	4620.81	13862.43
365	ORD00183	PROD0185	1	112356.62	112356.62
366	ORD00183	PROD0106	3	137481.28	412443.84
367	ORD00183	PROD0046	5	5762.47	28812.35
368	ORD00183	PROD0100	4	110269.71	441078.84
369	ORD00183	PROD0194	5	24802.59	124012.95
370	ORD00184	PROD0022	5	222156.94	1110784.70
376	ORD00186	PROD0021	2	34405.68	68811.36
377	ORD00187	PROD0001	1	279610.57	279610.57
380	ORD00190	PROD0155	3	17522.15	52566.45
381	ORD00190	PROD0160	5	12278.28	61391.40
382	ORD00190	PROD0089	2	45090.58	90181.16
383	ORD00190	PROD0224	2	607.93	1215.86
384	ORD00191	PROD0193	1	9954.82	9954.82
385	ORD00191	PROD0224	2	607.93	1215.86
386	ORD00192	PROD0211	1	8250.11	8250.11
387	ORD00192	PROD0237	5	7201.43	36007.15
391	ORD00194	PROD0266	4	408.26	1633.04
393	ORD00196	PROD0028	5	316366.34	1581831.70
394	ORD00196	PROD0105	2	162358.65	324717.30
395	ORD00197	PROD0103	1	83304.08	83304.08
396	ORD00197	PROD0059	2	35594.97	71189.94
397	ORD00197	PROD0035	5	190414.55	952072.75
398	ORD00198	PROD0228	1	6170.81	6170.81
399	ORD00198	PROD0201	3	10976.40	32929.20
400	ORD00198	PROD0029	4	149660.33	598641.32
402	ORD00200	PROD0262	5	3172.89	15864.45
405	ORD00202	PROD0006	1	308912.61	308912.61
406	ORD00202	PROD0156	5	21374.21	106871.05
413	ORD00205	PROD0093	3	8480.78	25442.34
414	ORD00205	PROD0260	5	5050.94	25254.70
415	ORD00205	PROD0270	5	907.09	4535.45
416	ORD00205	PROD0133	3	23616.92	70850.76
417	ORD00205	PROD0067	5	11627.77	58138.85
418	ORD00206	PROD0244	2	1664.99	3329.98
419	ORD00206	PROD0166	2	101932.80	203865.60
424	ORD00208	PROD0101	4	114695.41	458781.64
425	ORD00208	PROD0130	4	1182.88	4731.52
427	ORD00210	PROD0037	2	266180.98	532361.96
428	ORD00210	PROD0175	5	102750.60	513753.00
430	ORD00212	PROD0153	4	10840.50	43362.00
431	ORD00212	PROD0052	2	23501.69	47003.38
432	ORD00212	PROD0061	1	6821.26	6821.26
439	ORD00215	PROD0031	1	290316.23	290316.23
440	ORD00215	PROD0072	2	43142.24	86284.48
441	ORD00215	PROD0105	4	162358.65	649434.60
442	ORD00215	PROD0169	1	41598.42	41598.42
443	ORD00216	PROD0042	2	44258.35	88516.70
444	ORD00216	PROD0246	3	5399.76	16199.28
449	ORD00220	PROD0122	2	16203.67	32407.34
450	ORD00220	PROD0119	4	47472.78	189891.12
451	ORD00220	PROD0048	5	10843.12	54215.60
452	ORD00220	PROD0006	5	308912.61	1544563.05
459	ORD00223	PROD0150	3	12003.33	36009.99
460	ORD00223	PROD0126	3	13544.05	40632.15
461	ORD00223	PROD0270	5	907.09	4535.45
464	ORD00225	PROD0121	4	17176.67	68706.68
465	ORD00226	PROD0197	3	113579.08	340737.24
468	ORD00228	PROD0278	3	6353.37	19060.11
472	ORD00230	PROD0148	5	3628.18	18140.90
473	ORD00231	PROD0122	3	16203.67	48611.01
474	ORD00231	PROD0068	3	43176.46	129529.38
475	ORD00231	PROD0008	1	121518.49	121518.49
476	ORD00232	PROD0186	3	17418.14	52254.42
477	ORD00232	PROD0138	5	15463.10	77315.50
480	ORD00234	PROD0161	3	25829.99	77489.97
481	ORD00234	PROD0033	3	245627.48	736882.44
482	ORD00234	PROD0226	3	7172.97	21518.91
483	ORD00234	PROD0093	4	8480.78	33923.12
488	ORD00238	PROD0213	1	2985.64	2985.64
489	ORD00239	PROD0209	3	2728.52	8185.56
490	ORD00240	PROD0109	3	70228.44	210685.32
498	ORD00243	PROD0186	2	17418.14	34836.28
500	ORD00245	PROD0065	2	30524.10	61048.20
501	ORD00245	PROD0276	4	6563.88	26255.52
502	ORD00246	PROD0076	2	27116.85	54233.70
503	ORD00246	PROD0254	2	9824.37	19648.74
504	ORD00247	PROD0241	1	1174.07	1174.07
505	ORD00247	PROD0052	4	23501.69	94006.76
506	ORD00247	PROD0065	1	30524.10	30524.10
514	ORD00252	PROD0050	2	26917.21	53834.42
517	ORD00254	PROD0143	1	13171.72	13171.72
518	ORD00254	PROD0161	3	25829.99	77489.97
533	ORD00259	PROD0020	3	293010.61	879031.83
534	ORD00259	PROD0222	2	2802.33	5604.66
535	ORD00259	PROD0052	5	23501.69	117508.45
536	ORD00259	PROD0267	1	6230.11	6230.11
537	ORD00260	PROD0136	2	8175.35	16350.70
538	ORD00260	PROD0241	4	1174.07	4696.28
539	ORD00261	PROD0110	5	23332.73	116663.65
540	ORD00261	PROD0002	5	102447.74	512238.70
541	ORD00261	PROD0223	2	7785.89	15571.78
542	ORD00261	PROD0035	2	190414.55	380829.10
543	ORD00261	PROD0252	1	8223.52	8223.52
551	ORD00266	PROD0227	4	9871.34	39485.36
552	ORD00267	PROD0024	4	321716.92	1286867.68
553	ORD00267	PROD0158	4	12650.30	50601.20
554	ORD00268	PROD0169	1	41598.42	41598.42
555	ORD00268	PROD0067	4	11627.77	46511.08
556	ORD00268	PROD0277	1	9657.13	9657.13
557	ORD00268	PROD0011	3	314229.61	942688.83
559	ORD00270	PROD0111	5	2676.03	13380.15
561	ORD00272	PROD0068	1	43176.46	43176.46
562	ORD00272	PROD0139	1	14201.82	14201.82
563	ORD00273	PROD0049	3	27088.42	81265.26
564	ORD00273	PROD0201	4	10976.40	43905.60
565	ORD00273	PROD0100	5	110269.71	551348.55
566	ORD00273	PROD0160	1	12278.28	12278.28
567	ORD00274	PROD0048	2	10843.12	21686.24
568	ORD00275	PROD0009	4	198883.60	795534.40
569	ORD00276	PROD0119	4	47472.78	189891.12
570	ORD00277	PROD0049	1	27088.42	27088.42
571	ORD00277	PROD0087	2	12717.02	25434.04
572	ORD00277	PROD0107	4	97418.23	389672.92
573	ORD00277	PROD0251	5	5175.86	25879.30
574	ORD00277	PROD0128	4	24463.34	97853.36
575	ORD00278	PROD0160	3	12278.28	36834.84
584	ORD00281	PROD0269	4	2989.48	11957.92
585	ORD00282	PROD0151	5	24271.64	121358.20
586	ORD00282	PROD0139	3	14201.82	42605.46
590	ORD00284	PROD0214	2	12483.89	24967.78
591	ORD00285	PROD0276	3	6563.88	19691.64
592	ORD00285	PROD0235	1	1609.74	1609.74
593	ORD00286	PROD0177	3	102403.06	307209.18
594	ORD00286	PROD0008	4	121518.49	486073.96
595	ORD00286	PROD0099	5	130788.21	653941.05
596	ORD00286	PROD0141	3	11608.58	34825.74
601	ORD00289	PROD0001	3	279610.57	838831.71
604	ORD00291	PROD0268	3	2944.75	8834.25
608	ORD00293	PROD0178	5	87684.88	438424.40
609	ORD00293	PROD0218	5	5238.20	26191.00
610	ORD00293	PROD0110	2	23332.73	46665.46
611	ORD00294	PROD0159	3	17483.90	52451.70
614	ORD00296	PROD0242	2	5755.30	11510.60
615	ORD00296	PROD0233	4	10621.64	42486.56
616	ORD00296	PROD0252	5	8223.52	41117.60
617	ORD00297	PROD0032	1	246601.80	246601.80
618	ORD00297	PROD0161	5	25829.99	129149.95
619	ORD00298	PROD0087	4	12717.02	50868.08
620	ORD00298	PROD0188	4	51993.13	207972.52
621	ORD00298	PROD0265	1	11740.65	11740.65
622	ORD00298	PROD0008	1	121518.49	121518.49
624	ORD00300	PROD0180	1	60582.65	60582.65
625	ORD00301	PROD0096	2	179864.29	359728.58
626	ORD00301	PROD0163	1	18374.63	18374.63
627	ORD00301	PROD0011	2	314229.61	628459.22
628	ORD00302	PROD0195	3	24091.13	72273.39
629	ORD00303	PROD0091	3	141135.80	423407.40
630	ORD00303	PROD0152	1	1904.28	1904.28
631	ORD00303	PROD0133	4	23616.92	94467.68
632	ORD00303	PROD0226	3	7172.97	21518.91
635	ORD00305	PROD0258	5	4792.40	23962.00
637	ORD00307	PROD0194	5	24802.59	124012.95
688	ORD00331	PROD0205	3	7224.75	21674.25
646	ORD00312	PROD0269	1	2989.48	2989.48
647	ORD00312	PROD0102	1	45021.16	45021.16
648	ORD00312	PROD0072	3	43142.24	129426.72
649	ORD00312	PROD0067	2	11627.77	23255.54
650	ORD00312	PROD0171	3	105588.96	316766.88
651	ORD00313	PROD0105	4	162358.65	649434.60
652	ORD00314	PROD0202	4	12764.12	51056.48
653	ORD00314	PROD0109	4	70228.44	280913.76
657	ORD00317	PROD0189	5	96833.78	484168.90
658	ORD00317	PROD0186	1	17418.14	17418.14
659	ORD00317	PROD0175	5	102750.60	513753.00
673	ORD00324	PROD0251	4	5175.86	20703.44
674	ORD00325	PROD0013	3	337113.25	1011339.75
675	ORD00325	PROD0278	2	6353.37	12706.74
681	ORD00329	PROD0155	2	17522.15	35044.30
682	ORD00329	PROD0217	3	7092.62	21277.86
683	ORD00329	PROD0206	1	5427.42	5427.42
684	ORD00329	PROD0012	4	248709.70	994838.80
685	ORD00330	PROD0125	3	22153.16	66459.48
686	ORD00330	PROD0026	5	34248.48	171242.40
687	ORD00331	PROD0024	2	321716.92	643433.84
690	ORD00333	PROD0114	5	7586.49	37932.45
691	ORD00333	PROD0033	4	245627.48	982509.92
692	ORD00333	PROD0148	5	3628.18	18140.90
694	ORD00335	PROD0207	1	11561.20	11561.20
700	ORD00337	PROD0252	4	8223.52	32894.08
701	ORD00337	PROD0121	5	17176.67	85883.35
702	ORD00338	PROD0092	4	140982.24	563928.96
703	ORD00338	PROD0082	5	54346.36	271731.80
719	ORD00345	PROD0228	2	6170.81	12341.62
723	ORD00347	PROD0276	4	6563.88	26255.52
724	ORD00347	PROD0062	4	22431.17	89724.68
725	ORD00347	PROD0274	1	7846.95	7846.95
726	ORD00347	PROD0013	3	337113.25	1011339.75
727	ORD00348	PROD0220	1	11275.57	11275.57
728	ORD00348	PROD0064	2	34644.88	69289.76
736	ORD00351	PROD0014	3	289145.53	867436.59
737	ORD00351	PROD0114	5	7586.49	37932.45
740	ORD00353	PROD0156	3	21374.21	64122.63
741	ORD00353	PROD0076	5	27116.85	135584.25
742	ORD00353	PROD0007	5	290642.30	1453211.50
743	ORD00353	PROD0133	4	23616.92	94467.68
763	ORD00360	PROD0027	4	26206.57	104826.28
764	ORD00360	PROD0164	1	6702.72	6702.72
765	ORD00360	PROD0038	4	88262.22	353048.88
766	ORD00360	PROD0101	1	114695.41	114695.41
767	ORD00361	PROD0221	4	13121.51	52486.04
768	ORD00361	PROD0058	2	14691.81	29383.62
770	ORD00363	PROD0141	5	11608.58	58042.90
779	ORD00367	PROD0214	2	12483.89	24967.78
780	ORD00367	PROD0138	3	15463.10	46389.30
781	ORD00368	PROD0162	4	2672.21	10688.84
782	ORD00368	PROD0231	5	6206.49	31032.45
783	ORD00368	PROD0158	4	12650.30	50601.20
784	ORD00369	PROD0072	3	43142.24	129426.72
785	ORD00369	PROD0234	1	6463.53	6463.53
791	ORD00372	PROD0193	1	9954.82	9954.82
796	ORD00374	PROD0134	3	19220.41	57661.23
797	ORD00374	PROD0272	1	11096.23	11096.23
802	ORD00376	PROD0211	4	8250.11	33000.44
815	ORD00383	PROD0093	1	8480.78	8480.78
817	ORD00385	PROD0112	4	35280.59	141122.36
818	ORD00385	PROD0182	1	33297.75	33297.75
819	ORD00385	PROD0014	4	289145.53	1156582.12
820	ORD00385	PROD0071	1	9870.56	9870.56
821	ORD00386	PROD0106	4	137481.28	549925.12
825	ORD00389	PROD0052	3	23501.69	70505.07
826	ORD00389	PROD0182	3	33297.75	99893.25
827	ORD00390	PROD0200	1	29196.20	29196.20
828	ORD00390	PROD0242	3	5755.30	17265.90
829	ORD00391	PROD0066	2	36291.81	72583.62
830	ORD00391	PROD0266	2	408.26	816.52
835	ORD00393	PROD0105	3	162358.65	487075.95
836	ORD00394	PROD0241	1	1174.07	1174.07
837	ORD00395	PROD0087	1	12717.02	12717.02
838	ORD00395	PROD0081	3	110991.10	332973.30
839	ORD00395	PROD0052	2	23501.69	47003.38
872	ORD00409	PROD0240	1	10219.29	10219.29
873	ORD00409	PROD0165	1	22136.37	22136.37
874	ORD00409	PROD0070	3	25905.43	77716.29
875	ORD00409	PROD0154	5	19738.96	98694.80
882	ORD00412	PROD0168	1	100026.32	100026.32
883	ORD00413	PROD0153	5	10840.50	54202.50
884	ORD00413	PROD0064	5	34644.88	173224.40
888	ORD00416	PROD0142	3	8820.60	26461.80
889	ORD00416	PROD0129	4	5323.48	21293.92
890	ORD00416	PROD0261	3	8607.87	25823.61
904	ORD00423	PROD0089	3	45090.58	135271.74
905	ORD00423	PROD0256	3	1625.49	4876.47
906	ORD00423	PROD0046	5	5762.47	28812.35
916	ORD00427	PROD0273	2	1784.35	3568.70
917	ORD00427	PROD0182	4	33297.75	133191.00
918	ORD00427	PROD0204	1	5933.15	5933.15
922	ORD00431	PROD0096	5	179864.29	899321.45
926	ORD00433	PROD0050	4	26917.21	107668.84
927	ORD00433	PROD0260	5	5050.94	25254.70
938	ORD00437	PROD0074	5	13460.87	67304.35
939	ORD00437	PROD0277	1	9657.13	9657.13
940	ORD00437	PROD0162	3	2672.21	8016.63
941	ORD00437	PROD0004	5	39811.79	199058.95
948	ORD00441	PROD0011	5	314229.61	1571148.05
949	ORD00441	PROD0032	1	246601.80	246601.80
960	ORD00447	PROD0207	1	11561.20	11561.20
964	ORD00450	PROD0194	4	24802.59	99210.36
965	ORD00450	PROD0043	1	16739.67	16739.67
1035	ORD00479	PROD0245	3	5638.01	16914.03
1036	ORD00479	PROD0088	4	73744.65	294978.60
970	ORD00453	PROD0223	2	7785.89	15571.78
971	ORD00453	PROD0261	5	8607.87	43039.35
972	ORD00453	PROD0269	3	2989.48	8968.44
973	ORD00454	PROD0038	2	88262.22	176524.44
974	ORD00454	PROD0105	5	162358.65	811793.25
975	ORD00454	PROD0254	5	9824.37	49121.85
976	ORD00455	PROD0170	3	45302.42	135907.26
977	ORD00455	PROD0091	4	141135.80	564543.20
978	ORD00455	PROD0200	1	29196.20	29196.20
979	ORD00455	PROD0117	2	31515.40	63030.80
980	ORD00456	PROD0159	3	17483.90	52451.70
981	ORD00456	PROD0105	4	162358.65	649434.60
982	ORD00457	PROD0250	4	4620.81	18483.24
983	ORD00457	PROD0130	1	1182.88	1182.88
984	ORD00457	PROD0006	4	308912.61	1235650.44
985	ORD00458	PROD0132	3	23990.67	71972.01
986	ORD00458	PROD0204	3	5933.15	17799.45
987	ORD00458	PROD0146	5	9207.08	46035.40
988	ORD00458	PROD0275	3	10193.83	30581.49
992	ORD00460	PROD0124	4	17164.25	68657.00
993	ORD00460	PROD0224	2	607.93	1215.86
994	ORD00460	PROD0190	4	22778.54	91114.16
999	ORD00463	PROD0226	1	7172.97	7172.97
1008	ORD00468	PROD0185	2	112356.62	224713.24
1009	ORD00468	PROD0115	3	2277.24	6831.72
1011	ORD00470	PROD0065	4	30524.10	122096.40
1012	ORD00470	PROD0181	4	63768.87	255075.48
1013	ORD00470	PROD0107	4	97418.23	389672.92
1014	ORD00470	PROD0208	4	9010.85	36043.40
1015	ORD00470	PROD0216	4	3485.44	13941.76
1016	ORD00471	PROD0187	5	28776.04	143880.20
1017	ORD00471	PROD0238	4	6026.76	24107.04
1018	ORD00472	PROD0154	1	19738.96	19738.96
1019	ORD00472	PROD0212	2	8757.97	17515.94
1030	ORD00477	PROD0052	5	23501.69	117508.45
1031	ORD00478	PROD0241	2	1174.07	2348.14
1032	ORD00478	PROD0144	1	801.07	801.07
1033	ORD00479	PROD0243	1	10094.25	10094.25
1034	ORD00479	PROD0195	5	24091.13	120455.65
1039	ORD00481	PROD0101	5	114695.41	573477.05
1040	ORD00481	PROD0165	4	22136.37	88545.48
1041	ORD00481	PROD0150	1	12003.33	12003.33
1042	ORD00481	PROD0043	5	16739.67	83698.35
1043	ORD00481	PROD0182	5	33297.75	166488.75
1044	ORD00482	PROD0013	1	337113.25	337113.25
1045	ORD00482	PROD0251	2	5175.86	10351.72
1046	ORD00482	PROD0164	3	6702.72	20108.16
1047	ORD00482	PROD0086	3	49202.47	147607.41
1050	ORD00484	PROD0193	3	9954.82	29864.46
1051	ORD00484	PROD0172	5	95695.43	478477.15
1061	ORD00490	PROD0272	2	11096.23	22192.46
1069	ORD00493	PROD0272	3	11096.23	33288.69
1070	ORD00493	PROD0004	2	39811.79	79623.58
1071	ORD00493	PROD0129	1	5323.48	5323.48
1072	ORD00494	PROD0229	1	4112.45	4112.45
1073	ORD00494	PROD0007	3	290642.30	871926.90
1076	ORD00496	PROD0088	1	73744.65	73744.65
1077	ORD00497	PROD0238	2	6026.76	12053.52
1078	ORD00497	PROD0232	2	4469.76	8939.52
1079	ORD00498	PROD0077	4	20510.26	82041.04
1081	ORD00500	PROD0143	2	13171.72	26343.44
1082	ORD00501	PROD0031	1	290316.23	290316.23
1083	ORD00501	PROD0181	1	63768.87	63768.87
1084	ORD00502	PROD0111	3	2676.03	8028.09
1085	ORD00502	PROD0214	2	12483.89	24967.78
1086	ORD00502	PROD0252	3	8223.52	24670.56
1087	ORD00502	PROD0007	3	290642.30	871926.90
1089	ORD00504	PROD0168	2	100026.32	200052.64
1090	ORD00505	PROD0100	5	110269.71	551348.55
1091	ORD00505	PROD0066	2	36291.81	72583.62
1092	ORD00505	PROD0165	5	22136.37	110681.85
1093	ORD00506	PROD0049	4	27088.42	108353.68
1099	ORD00509	PROD0161	2	25829.99	51659.98
1100	ORD00509	PROD0275	2	10193.83	20387.66
1102	ORD00511	PROD0216	1	3485.44	3485.44
1105	ORD00513	PROD0009	1	198883.60	198883.60
1106	ORD00514	PROD0223	4	7785.89	31143.56
1107	ORD00514	PROD0166	2	101932.80	203865.60
1110	ORD00516	PROD0121	3	17176.67	51530.01
1111	ORD00516	PROD0048	1	10843.12	10843.12
1112	ORD00516	PROD0185	4	112356.62	449426.48
1113	ORD00516	PROD0183	3	26053.15	78159.45
1114	ORD00517	PROD0080	4	14845.55	59382.20
1115	ORD00517	PROD0046	2	5762.47	11524.94
1116	ORD00517	PROD0107	1	97418.23	97418.23
1117	ORD00518	PROD0027	4	26206.57	104826.28
1118	ORD00518	PROD0116	1	20859.43	20859.43
1127	ORD00522	PROD0132	3	23990.67	71972.01
1128	ORD00522	PROD0172	3	95695.43	287086.29
1129	ORD00522	PROD0101	4	114695.41	458781.64
1130	ORD00523	PROD0208	2	9010.85	18021.70
1131	ORD00523	PROD0105	1	162358.65	162358.65
1132	ORD00524	PROD0110	4	23332.73	93330.92
1133	ORD00524	PROD0156	1	21374.21	21374.21
1134	ORD00524	PROD0185	2	112356.62	224713.24
1135	ORD00525	PROD0171	4	105588.96	422355.84
1136	ORD00525	PROD0106	3	137481.28	412443.84
1137	ORD00525	PROD0256	4	1625.49	6501.96
1141	ORD00527	PROD0050	4	26917.21	107668.84
1142	ORD00527	PROD0028	3	316366.34	949099.02
1143	ORD00527	PROD0189	1	96833.78	96833.78
1144	ORD00527	PROD0111	3	2676.03	8028.09
1145	ORD00527	PROD0098	4	54814.26	219257.04
1149	ORD00529	PROD0079	2	13912.80	27825.60
1150	ORD00530	PROD0007	1	290642.30	290642.30
1151	ORD00530	PROD0023	3	276589.43	829768.29
1157	ORD00534	PROD0178	2	87684.88	175369.76
1158	ORD00534	PROD0150	4	12003.33	48013.32
1159	ORD00535	PROD0184	4	48414.15	193656.60
1163	ORD00538	PROD0117	3	31515.40	94546.20
1164	ORD00538	PROD0172	3	95695.43	287086.29
1165	ORD00538	PROD0251	5	5175.86	25879.30
1166	ORD00538	PROD0060	4	10877.79	43511.16
1172	ORD00541	PROD0016	3	256280.50	768841.50
1173	ORD00542	PROD0217	3	7092.62	21277.86
1174	ORD00542	PROD0184	4	48414.15	193656.60
1175	ORD00542	PROD0207	3	11561.20	34683.60
1176	ORD00542	PROD0006	2	308912.61	617825.22
1177	ORD00542	PROD0154	3	19738.96	59216.88
1182	ORD00545	PROD0233	5	10621.64	53108.20
1183	ORD00545	PROD0195	4	24091.13	96364.52
1184	ORD00545	PROD0173	1	39177.27	39177.27
1185	ORD00545	PROD0124	3	17164.25	51492.75
1186	ORD00546	PROD0066	5	36291.81	181459.05
1188	ORD00548	PROD0232	3	4469.76	13409.28
1189	ORD00549	PROD0040	2	47715.49	95430.98
1195	ORD00552	PROD0221	3	13121.51	39364.53
1196	ORD00552	PROD0011	5	314229.61	1571148.05
1197	ORD00552	PROD0269	1	2989.48	2989.48
1199	ORD00554	PROD0083	1	160848.97	160848.97
1203	ORD00557	PROD0137	5	2019.05	10095.25
1210	ORD00561	PROD0192	4	94625.99	378503.96
1213	ORD00563	PROD0044	2	32574.27	65148.54
1219	ORD00567	PROD0143	5	13171.72	65858.60
1220	ORD00567	PROD0136	4	8175.35	32701.40
1223	ORD00570	PROD0201	4	10976.40	43905.60
1224	ORD00571	PROD0193	5	9954.82	49774.10
1229	ORD00573	PROD0028	3	316366.34	949099.02
1230	ORD00573	PROD0022	1	222156.94	222156.94
1231	ORD00573	PROD0036	5	78738.41	393692.05
1234	ORD00575	PROD0137	5	2019.05	10095.25
1239	ORD00578	PROD0223	4	7785.89	31143.56
1240	ORD00578	PROD0198	2	57432.47	114864.94
1242	ORD00580	PROD0269	1	2989.48	2989.48
1243	ORD00580	PROD0176	4	30789.84	123159.36
1244	ORD00580	PROD0165	5	22136.37	110681.85
1245	ORD00581	PROD0194	2	24802.59	49605.18
1246	ORD00581	PROD0087	2	12717.02	25434.04
1247	ORD00581	PROD0207	3	11561.20	34683.60
1250	ORD00583	PROD0252	4	8223.52	32894.08
1251	ORD00584	PROD0134	4	19220.41	76881.64
1255	ORD00586	PROD0096	2	179864.29	359728.58
1256	ORD00587	PROD0121	1	17176.67	17176.67
1257	ORD00587	PROD0009	1	198883.60	198883.60
1258	ORD00587	PROD0101	3	114695.41	344086.23
1259	ORD00587	PROD0040	2	47715.49	95430.98
1273	ORD00593	PROD0060	4	10877.79	43511.16
1274	ORD00593	PROD0212	3	8757.97	26273.91
1275	ORD00593	PROD0196	3	2511.26	7533.78
1278	ORD00595	PROD0105	4	162358.65	649434.60
1287	ORD00598	PROD0267	3	6230.11	18690.33
1288	ORD00599	PROD0265	5	11740.65	58703.25
1289	ORD00600	PROD0260	2	5050.94	10101.88
1290	ORD00600	PROD0035	4	190414.55	761658.20
1292	ORD00602	PROD0100	5	110269.71	551348.55
1293	ORD00602	PROD0215	5	3385.48	16927.40
1294	ORD00602	PROD0214	3	12483.89	37451.67
1295	ORD00602	PROD0078	2	18117.48	36234.96
1296	ORD00602	PROD0219	1	14849.13	14849.13
1297	ORD00603	PROD0041	3	14461.31	43383.93
1298	ORD00603	PROD0236	5	7038.57	35192.85
1309	ORD00608	PROD0161	1	25829.99	25829.99
1310	ORD00609	PROD0250	4	4620.81	18483.24
1312	ORD00611	PROD0220	4	11275.57	45102.28
1317	ORD00615	PROD0270	5	907.09	4535.45
1318	ORD00615	PROD0037	3	266180.98	798542.94
1319	ORD00616	PROD0255	3	7571.15	22713.45
1320	ORD00616	PROD0115	1	2277.24	2277.24
1321	ORD00617	PROD0206	4	5427.42	21709.68
1323	ORD00619	PROD0038	3	88262.22	264786.66
1324	ORD00620	PROD0155	4	17522.15	70088.60
1325	ORD00620	PROD0108	1	121332.02	121332.02
1326	ORD00621	PROD0255	4	7571.15	30284.60
1329	ORD00624	PROD0254	2	9824.37	19648.74
1330	ORD00624	PROD0143	2	13171.72	26343.44
1331	ORD00625	PROD0002	1	102447.74	102447.74
1332	ORD00626	PROD0259	5	7869.35	39346.75
1333	ORD00626	PROD0141	4	11608.58	46434.32
1336	ORD00628	PROD0033	4	245627.48	982509.92
1337	ORD00628	PROD0243	4	10094.25	40377.00
1339	ORD00630	PROD0021	4	34405.68	137622.72
1340	ORD00630	PROD0114	2	7586.49	15172.98
1348	ORD00635	PROD0186	3	17418.14	52254.42
1349	ORD00635	PROD0050	5	26917.21	134586.05
1350	ORD00635	PROD0148	5	3628.18	18140.90
1356	ORD00637	PROD0181	2	63768.87	127537.74
1357	ORD00637	PROD0091	5	141135.80	705679.00
1358	ORD00637	PROD0199	3	28468.05	85404.15
1359	ORD00638	PROD0274	4	7846.95	31387.80
1360	ORD00638	PROD0100	3	110269.71	330809.13
1361	ORD00639	PROD0098	5	54814.26	274071.30
1369	ORD00643	PROD0151	1	24271.64	24271.64
1370	ORD00643	PROD0020	3	293010.61	879031.83
1371	ORD00643	PROD0055	2	42567.03	85134.06
1384	ORD00648	PROD0049	5	27088.42	135442.10
1385	ORD00649	PROD0127	1	8700.29	8700.29
1389	ORD00652	PROD0199	5	28468.05	142340.25
1390	ORD00652	PROD0099	3	130788.21	392364.63
1391	ORD00653	PROD0064	4	34644.88	138579.52
1394	ORD00655	PROD0128	1	24463.34	24463.34
1402	ORD00658	PROD0002	4	102447.74	409790.96
1404	ORD00660	PROD0272	3	11096.23	33288.69
1405	ORD00660	PROD0034	3	272513.12	817539.36
1406	ORD00660	PROD0233	2	10621.64	21243.28
1409	ORD00663	PROD0265	1	11740.65	11740.65
1410	ORD00663	PROD0159	5	17483.90	87419.50
1411	ORD00663	PROD0207	1	11561.20	11561.20
1412	ORD00663	PROD0011	2	314229.61	628459.22
1415	ORD00665	PROD0096	3	179864.29	539592.87
1416	ORD00665	PROD0056	4	6299.62	25198.48
1417	ORD00666	PROD0183	4	26053.15	104212.60
1418	ORD00666	PROD0050	5	26917.21	134586.05
1419	ORD00666	PROD0195	2	24091.13	48182.26
1420	ORD00667	PROD0117	4	31515.40	126061.60
1421	ORD00668	PROD0023	4	276589.43	1106357.72
1422	ORD00668	PROD0105	4	162358.65	649434.60
1423	ORD00669	PROD0112	1	35280.59	35280.59
1424	ORD00669	PROD0190	3	22778.54	68335.62
1425	ORD00669	PROD0050	1	26917.21	26917.21
1430	ORD00671	PROD0004	2	39811.79	79623.58
1431	ORD00671	PROD0251	4	5175.86	20703.44
1437	ORD00675	PROD0154	4	19738.96	78955.84
1438	ORD00676	PROD0273	2	1784.35	3568.70
1439	ORD00677	PROD0213	1	2985.64	2985.64
1440	ORD00678	PROD0272	5	11096.23	55481.15
1441	ORD00678	PROD0169	5	41598.42	207992.10
1442	ORD00678	PROD0232	5	4469.76	22348.80
1443	ORD00678	PROD0081	2	110991.10	221982.20
1447	ORD00681	PROD0058	1	14691.81	14691.81
1448	ORD00681	PROD0246	5	5399.76	26998.80
1449	ORD00681	PROD0203	2	3538.98	7077.96
1450	ORD00681	PROD0070	5	25905.43	129527.15
1458	ORD00685	PROD0013	3	337113.25	1011339.75
1459	ORD00685	PROD0016	2	256280.50	512561.00
1460	ORD00685	PROD0043	5	16739.67	83698.35
1470	ORD00692	PROD0188	2	51993.13	103986.26
1471	ORD00692	PROD0159	5	17483.90	87419.50
1485	ORD00698	PROD0054	3	31709.48	95128.44
1486	ORD00698	PROD0159	1	17483.90	17483.90
1487	ORD00699	PROD0192	3	94625.99	283877.97
1495	ORD00704	PROD0182	1	33297.75	33297.75
1496	ORD00704	PROD0100	4	110269.71	441078.84
1497	ORD00704	PROD0270	2	907.09	1814.18
1498	ORD00704	PROD0132	2	23990.67	47981.34
1499	ORD00704	PROD0162	1	2672.21	2672.21
1502	ORD00706	PROD0021	5	34405.68	172028.40
1503	ORD00706	PROD0209	5	2728.52	13642.60
1504	ORD00706	PROD0018	4	120439.60	481758.40
1505	ORD00706	PROD0040	3	47715.49	143146.47
1506	ORD00706	PROD0043	4	16739.67	66958.68
1578	ORD00740	PROD0088	4	73744.65	294978.60
1579	ORD00740	PROD0104	5	73744.65	368723.25
1590	ORD00745	PROD0088	2	73744.65	147489.30
1516	ORD00710	PROD0270	5	907.09	4535.45
1517	ORD00710	PROD0147	3	5055.12	15165.36
1518	ORD00710	PROD0056	2	6299.62	12599.24
1520	ORD00712	PROD0019	3	339524.65	1018573.95
1525	ORD00716	PROD0109	1	70228.44	70228.44
1527	ORD00718	PROD0074	5	13460.87	67304.35
1528	ORD00718	PROD0108	3	121332.02	363996.06
1529	ORD00719	PROD0230	3	6077.64	18232.92
1530	ORD00719	PROD0100	2	110269.71	220539.42
1531	ORD00719	PROD0176	4	30789.84	123159.36
1532	ORD00720	PROD0192	5	94625.99	473129.95
1533	ORD00721	PROD0025	3	330590.39	991771.17
1534	ORD00721	PROD0260	5	5050.94	25254.70
1535	ORD00722	PROD0232	4	4469.76	17879.04
1536	ORD00722	PROD0131	5	21092.44	105462.20
1537	ORD00722	PROD0085	5	89243.32	446216.60
1541	ORD00726	PROD0012	2	248709.70	497419.40
1542	ORD00726	PROD0243	4	10094.25	40377.00
1550	ORD00730	PROD0076	3	27116.85	81350.55
1551	ORD00730	PROD0223	1	7785.89	7785.89
1552	ORD00731	PROD0111	1	2676.03	2676.03
1553	ORD00731	PROD0008	2	121518.49	243036.98
1554	ORD00731	PROD0247	2	5416.29	10832.58
1555	ORD00731	PROD0219	5	14849.13	74245.65
1556	ORD00732	PROD0077	2	20510.26	41020.52
1564	ORD00735	PROD0143	3	13171.72	39515.16
1565	ORD00735	PROD0042	5	44258.35	221291.75
1566	ORD00736	PROD0268	2	2944.75	5889.50
1567	ORD00736	PROD0101	1	114695.41	114695.41
1568	ORD00736	PROD0227	3	9871.34	29614.02
1569	ORD00736	PROD0211	2	8250.11	16500.22
1570	ORD00737	PROD0030	4	253935.11	1015740.44
1576	ORD00740	PROD0161	4	25829.99	103319.96
1577	ORD00740	PROD0184	1	48414.15	48414.15
1580	ORD00740	PROD0177	1	102403.06	102403.06
1581	ORD00741	PROD0113	4	145706.19	582824.76
1582	ORD00742	PROD0177	1	102403.06	102403.06
1583	ORD00742	PROD0193	2	9954.82	19909.64
1584	ORD00743	PROD0087	5	12717.02	63585.10
1585	ORD00744	PROD0146	2	9207.08	18414.16
1586	ORD00744	PROD0028	4	316366.34	1265465.36
1587	ORD00745	PROD0238	2	6026.76	12053.52
1588	ORD00745	PROD0256	1	1625.49	1625.49
1589	ORD00745	PROD0263	1	8199.23	8199.23
1595	ORD00748	PROD0174	5	110640.11	553200.55
1596	ORD00748	PROD0118	4	12699.55	50798.20
1602	ORD00751	PROD0082	1	54346.36	54346.36
1603	ORD00752	PROD0054	5	31709.48	158547.40
1604	ORD00752	PROD0136	2	8175.35	16350.70
1605	ORD00752	PROD0208	1	9010.85	9010.85
1606	ORD00752	PROD0077	5	20510.26	102551.30
1607	ORD00752	PROD0038	2	88262.22	176524.44
1614	ORD00757	PROD0047	2	5512.81	11025.62
1615	ORD00757	PROD0183	2	26053.15	52106.30
1616	ORD00758	PROD0232	3	4469.76	13409.28
1621	ORD00761	PROD0096	2	179864.29	359728.58
1625	ORD00763	PROD0138	4	15463.10	61852.40
1626	ORD00763	PROD0129	4	5323.48	21293.92
1627	ORD00763	PROD0094	5	117897.53	589487.65
1628	ORD00763	PROD0269	4	2989.48	11957.92
1636	ORD00766	PROD0114	1	7586.49	7586.49
1637	ORD00766	PROD0176	2	30789.84	61579.68
1638	ORD00766	PROD0272	5	11096.23	55481.15
1639	ORD00766	PROD0190	1	22778.54	22778.54
1640	ORD00767	PROD0198	1	57432.47	57432.47
1641	ORD00767	PROD0167	5	22365.17	111825.85
1642	ORD00768	PROD0157	5	10758.03	53790.15
1647	ORD00770	PROD0046	3	5762.47	17287.41
1648	ORD00771	PROD0110	4	23332.73	93330.92
1649	ORD00771	PROD0215	5	3385.48	16927.40
1651	ORD00773	PROD0182	2	33297.75	66595.50
1662	ORD00779	PROD0119	2	47472.78	94945.56
1663	ORD00779	PROD0038	2	88262.22	176524.44
1667	ORD00782	PROD0114	4	7586.49	30345.96
1674	ORD00786	PROD0267	4	6230.11	24920.44
1675	ORD00786	PROD0126	2	13544.05	27088.10
1676	ORD00786	PROD0213	2	2985.64	5971.28
1677	ORD00786	PROD0135	5	2595.60	12978.00
1680	ORD00788	PROD0248	4	4809.30	19237.20
1681	ORD00788	PROD0070	2	25905.43	51810.86
1682	ORD00789	PROD0233	1	10621.64	10621.64
1683	ORD00789	PROD0196	4	2511.26	10045.04
1684	ORD00789	PROD0124	1	17164.25	17164.25
1695	ORD00795	PROD0256	4	1625.49	6501.96
1696	ORD00795	PROD0060	5	10877.79	54388.95
1697	ORD00795	PROD0093	5	8480.78	42403.90
1698	ORD00796	PROD0240	5	10219.29	51096.45
1699	ORD00797	PROD0266	2	408.26	816.52
1700	ORD00798	PROD0028	1	316366.34	316366.34
1701	ORD00798	PROD0097	1	9141.77	9141.77
1702	ORD00798	PROD0089	3	45090.58	135271.74
1709	ORD00801	PROD0084	2	37258.14	74516.28
1710	ORD00802	PROD0179	1	21340.87	21340.87
1711	ORD00802	PROD0013	3	337113.25	1011339.75
1712	ORD00803	PROD0213	5	2985.64	14928.20
1713	ORD00803	PROD0241	4	1174.07	4696.28
1714	ORD00803	PROD0043	1	16739.67	16739.67
1715	ORD00803	PROD0108	5	121332.02	606660.10
1717	ORD00805	PROD0059	5	35594.97	177974.85
1718	ORD00806	PROD0093	1	8480.78	8480.78
1719	ORD00807	PROD0271	2	1989.71	3979.42
1720	ORD00807	PROD0225	5	9270.30	46351.50
1721	ORD00807	PROD0128	2	24463.34	48926.68
1722	ORD00808	PROD0155	5	17522.15	87610.75
1723	ORD00809	PROD0203	5	3538.98	17694.90
1780	ORD00844	PROD0245	3	5638.01	16914.03
1727	ORD00812	PROD0277	4	9657.13	38628.52
1728	ORD00812	PROD0188	3	51993.13	155979.39
1729	ORD00813	PROD0247	1	5416.29	5416.29
1730	ORD00814	PROD0086	5	49202.47	246012.35
1731	ORD00815	PROD0065	3	30524.10	91572.30
1732	ORD00816	PROD0004	1	39811.79	39811.79
1733	ORD00816	PROD0114	2	7586.49	15172.98
1734	ORD00816	PROD0147	1	5055.12	5055.12
1738	ORD00819	PROD0057	5	24240.82	121204.10
1739	ORD00819	PROD0023	1	276589.43	276589.43
1740	ORD00820	PROD0231	4	6206.49	24825.96
1741	ORD00821	PROD0265	3	11740.65	35221.95
1742	ORD00821	PROD0050	4	26917.21	107668.84
1745	ORD00823	PROD0272	3	11096.23	33288.69
1746	ORD00824	PROD0223	2	7785.89	15571.78
1747	ORD00825	PROD0016	2	256280.50	512561.00
1750	ORD00827	PROD0071	4	9870.56	39482.24
1751	ORD00828	PROD0013	1	337113.25	337113.25
1752	ORD00828	PROD0035	1	190414.55	190414.55
1753	ORD00829	PROD0279	5	962.48	4812.40
1754	ORD00829	PROD0035	3	190414.55	571243.65
1755	ORD00830	PROD0257	1	2248.73	2248.73
1760	ORD00833	PROD0090	3	102715.97	308147.91
1763	ORD00835	PROD0110	4	23332.73	93330.92
1781	ORD00844	PROD0026	1	34248.48	34248.48
1782	ORD00845	PROD0217	4	7092.62	28370.48
1783	ORD00845	PROD0058	1	14691.81	14691.81
1784	ORD00845	PROD0182	4	33297.75	133191.00
1785	ORD00846	PROD0115	4	2277.24	9108.96
1786	ORD00846	PROD0171	3	105588.96	316766.88
1790	ORD00849	PROD0174	1	110640.11	110640.11
1793	ORD00851	PROD0117	4	31515.40	126061.60
1794	ORD00851	PROD0022	2	222156.94	444313.88
1797	ORD00853	PROD0128	4	24463.34	97853.36
1798	ORD00853	PROD0184	1	48414.15	48414.15
1799	ORD00853	PROD0084	2	37258.14	74516.28
1800	ORD00853	PROD0105	2	162358.65	324717.30
1801	ORD00854	PROD0165	3	22136.37	66409.11
1802	ORD00854	PROD0262	1	3172.89	3172.89
1803	ORD00854	PROD0049	2	27088.42	54176.84
1804	ORD00854	PROD0206	3	5427.42	16282.26
1805	ORD00855	PROD0220	1	11275.57	11275.57
1806	ORD00855	PROD0163	2	18374.63	36749.26
1807	ORD00856	PROD0248	2	4809.30	9618.60
1808	ORD00856	PROD0034	3	272513.12	817539.36
1809	ORD00856	PROD0265	5	11740.65	58703.25
1810	ORD00857	PROD0237	1	7201.43	7201.43
1811	ORD00857	PROD0075	4	5182.19	20728.76
1812	ORD00857	PROD0050	3	26917.21	80751.63
1813	ORD00857	PROD0140	4	2847.84	11391.36
1822	ORD00862	PROD0276	5	6563.88	32819.40
1823	ORD00863	PROD0264	5	4118.15	20590.75
1834	ORD00868	PROD0095	1	49921.23	49921.23
1835	ORD00868	PROD0215	1	3385.48	3385.48
1836	ORD00868	PROD0173	4	39177.27	156709.08
1837	ORD00868	PROD0149	3	8124.11	24372.33
1838	ORD00869	PROD0096	1	179864.29	179864.29
1849	ORD00874	PROD0140	3	2847.84	8543.52
1850	ORD00874	PROD0229	2	4112.45	8224.90
1851	ORD00874	PROD0070	4	25905.43	103621.72
1852	ORD00874	PROD0210	1	14712.50	14712.50
1853	ORD00875	PROD0246	3	5399.76	16199.28
1855	ORD00877	PROD0258	3	4792.40	14377.20
1856	ORD00877	PROD0167	3	22365.17	67095.51
1857	ORD00877	PROD0130	1	1182.88	1182.88
1858	ORD00878	PROD0101	2	114695.41	229390.82
1859	ORD00878	PROD0040	2	47715.49	95430.98
1860	ORD00878	PROD0058	2	14691.81	29383.62
1864	ORD00880	PROD0276	4	6563.88	26255.52
1865	ORD00880	PROD0195	3	24091.13	72273.39
1866	ORD00880	PROD0087	1	12717.02	12717.02
1867	ORD00880	PROD0038	5	88262.22	441311.10
1869	ORD00882	PROD0137	2	2019.05	4038.10
1870	ORD00882	PROD0118	3	12699.55	38098.65
1871	ORD00882	PROD0170	1	45302.42	45302.42
1873	ORD00884	PROD0185	3	112356.62	337069.86
1874	ORD00885	PROD0244	4	1664.99	6659.96
1875	ORD00885	PROD0112	5	35280.59	176402.95
1876	ORD00886	PROD0258	3	4792.40	14377.20
1877	ORD00886	PROD0263	5	8199.23	40996.15
1880	ORD00888	PROD0193	2	9954.82	19909.64
1884	ORD00890	PROD0256	2	1625.49	3250.98
1885	ORD00890	PROD0016	5	256280.50	1281402.50
1886	ORD00890	PROD0201	5	10976.40	54882.00
1887	ORD00890	PROD0081	1	110991.10	110991.10
1888	ORD00890	PROD0108	5	121332.02	606660.10
1889	ORD00891	PROD0090	1	102715.97	102715.97
1897	ORD00895	PROD0207	1	11561.20	11561.20
1898	ORD00895	PROD0094	3	117897.53	353692.59
1905	ORD00898	PROD0008	3	121518.49	364555.47
1906	ORD00899	PROD0194	5	24802.59	124012.95
1907	ORD00899	PROD0274	5	7846.95	39234.75
1908	ORD00900	PROD0222	5	2802.33	14011.65
1909	ORD00901	PROD0249	3	774.24	2322.72
1910	ORD00901	PROD0038	1	88262.22	88262.22
1911	ORD00902	PROD0122	2	16203.67	32407.34
1912	ORD00903	PROD0096	1	179864.29	179864.29
1913	ORD00903	PROD0195	3	24091.13	72273.39
1915	ORD00905	PROD0149	2	8124.11	16248.22
1916	ORD00905	PROD0047	4	5512.81	22051.24
1917	ORD00906	PROD0075	5	5182.19	25910.95
1918	ORD00906	PROD0144	5	801.07	4005.35
1919	ORD00906	PROD0048	4	10843.12	43372.48
1921	ORD00908	PROD0024	4	321716.92	1286867.68
1922	ORD00908	PROD0164	5	6702.72	33513.60
1923	ORD00909	PROD0010	4	270434.00	1081736.00
1924	ORD00909	PROD0026	2	34248.48	68496.96
1925	ORD00909	PROD0033	3	245627.48	736882.44
1926	ORD00910	PROD0241	2	1174.07	2348.14
1927	ORD00910	PROD0091	5	141135.80	705679.00
1928	ORD00910	PROD0258	5	4792.40	23962.00
1929	ORD00911	PROD0265	2	11740.65	23481.30
1930	ORD00911	PROD0094	3	117897.53	353692.59
2010	ORD00948	PROD0088	5	73744.65	368723.25
1935	ORD00916	PROD0248	3	4809.30	14427.90
1936	ORD00917	PROD0168	2	100026.32	200052.64
1937	ORD00917	PROD0151	5	24271.64	121358.20
1938	ORD00917	PROD0117	5	31515.40	157577.00
1939	ORD00918	PROD0132	3	23990.67	71972.01
1946	ORD00921	PROD0078	4	18117.48	72469.92
1950	ORD00924	PROD0172	1	95695.43	95695.43
1952	ORD00926	PROD0277	3	9657.13	28971.39
1953	ORD00926	PROD0171	1	105588.96	105588.96
1961	ORD00929	PROD0091	2	141135.80	282271.60
1962	ORD00929	PROD0001	4	279610.57	1118442.28
1963	ORD00929	PROD0043	3	16739.67	50219.01
1964	ORD00929	PROD0070	5	25905.43	129527.15
1965	ORD00930	PROD0041	2	14461.31	28922.62
1966	ORD00930	PROD0164	2	6702.72	13405.44
1967	ORD00930	PROD0057	3	24240.82	72722.46
1968	ORD00930	PROD0173	5	39177.27	195886.35
1969	ORD00931	PROD0253	4	8743.34	34973.36
1970	ORD00931	PROD0052	5	23501.69	117508.45
1971	ORD00931	PROD0227	5	9871.34	49356.70
1972	ORD00931	PROD0098	1	54814.26	54814.26
1973	ORD00931	PROD0067	3	11627.77	34883.31
1982	ORD00938	PROD0023	4	276589.43	1106357.72
1983	ORD00938	PROD0124	5	17164.25	85821.25
1987	ORD00940	PROD0179	1	21340.87	21340.87
1988	ORD00941	PROD0055	4	42567.03	170268.12
1996	ORD00944	PROD0228	2	6170.81	12341.62
1997	ORD00945	PROD0234	5	6463.53	32317.65
1998	ORD00945	PROD0172	2	95695.43	191390.86
1999	ORD00945	PROD0279	1	962.48	962.48
2000	ORD00945	PROD0231	2	6206.49	12412.98
2001	ORD00945	PROD0166	5	101932.80	509664.00
2002	ORD00946	PROD0124	4	17164.25	68657.00
2003	ORD00946	PROD0215	3	3385.48	10156.44
2004	ORD00946	PROD0092	3	140982.24	422946.72
2005	ORD00946	PROD0005	5	85978.02	429890.10
2006	ORD00946	PROD0073	2	6732.32	13464.64
2009	ORD00948	PROD0051	1	33329.69	33329.69
2011	ORD00948	PROD0035	5	190414.55	952072.75
2012	ORD00948	PROD0181	4	63768.87	255075.48
2013	ORD00948	PROD0269	1	2989.48	2989.48
2014	ORD00949	PROD0275	3	10193.83	30581.49
2015	ORD00949	PROD0191	5	44052.51	220262.55
2020	ORD00952	PROD0160	1	12278.28	12278.28
2021	ORD00953	PROD0028	2	316366.34	632732.68
2022	ORD00954	PROD0080	1	14845.55	14845.55
2027	ORD00957	PROD0255	1	7571.15	7571.15
2028	ORD00957	PROD0184	2	48414.15	96828.30
2029	ORD00957	PROD0066	3	36291.81	108875.43
2032	ORD00960	PROD0037	1	266180.98	266180.98
2033	ORD00961	PROD0038	2	88262.22	176524.44
2034	ORD00961	PROD0241	5	1174.07	5870.35
2035	ORD00961	PROD0153	5	10840.50	54202.50
2036	ORD00961	PROD0194	2	24802.59	49605.18
2037	ORD00961	PROD0021	1	34405.68	34405.68
2041	ORD00963	PROD0189	4	96833.78	387335.12
2043	ORD00965	PROD0131	1	21092.44	21092.44
2044	ORD00965	PROD0154	4	19738.96	78955.84
2050	ORD00969	PROD0021	4	34405.68	137622.72
2051	ORD00969	PROD0274	5	7846.95	39234.75
2054	ORD00972	PROD0096	2	179864.29	359728.58
2055	ORD00972	PROD0188	2	51993.13	103986.26
2056	ORD00972	PROD0030	2	253935.11	507870.22
2057	ORD00972	PROD0187	3	28776.04	86328.12
2058	ORD00972	PROD0273	2	1784.35	3568.70
2066	ORD00977	PROD0157	1	10758.03	10758.03
2067	ORD00977	PROD0261	3	8607.87	25823.61
2068	ORD00978	PROD0123	1	11097.43	11097.43
2074	ORD00982	PROD0254	2	9824.37	19648.74
2075	ORD00982	PROD0272	2	11096.23	22192.46
2076	ORD00982	PROD0183	1	26053.15	26053.15
2077	ORD00983	PROD0144	2	801.07	1602.14
2078	ORD00984	PROD0256	1	1625.49	1625.49
2079	ORD00984	PROD0025	4	330590.39	1322361.56
2083	ORD00986	PROD0143	1	13171.72	13171.72
2091	ORD00989	PROD0112	1	35280.59	35280.59
2092	ORD00989	PROD0204	4	5933.15	23732.60
2093	ORD00989	PROD0271	2	1989.71	3979.42
2094	ORD00990	PROD0266	1	408.26	408.26
2095	ORD00990	PROD0201	5	10976.40	54882.00
2096	ORD00990	PROD0091	2	141135.80	282271.60
2099	ORD00993	PROD0114	2	7586.49	15172.98
2100	ORD00993	PROD0182	4	33297.75	133191.00
2101	ORD00993	PROD0116	4	20859.43	83437.72
2102	ORD00993	PROD0067	1	11627.77	11627.77
2103	ORD00994	PROD0024	1	321716.92	321716.92
2104	ORD00994	PROD0262	5	3172.89	15864.45
2105	ORD00994	PROD0096	2	179864.29	359728.58
2106	ORD00994	PROD0200	2	29196.20	58392.40
2107	ORD00994	PROD0255	4	7571.15	30284.60
2108	ORD00995	PROD0094	1	117897.53	117897.53
2111	ORD00997	PROD0073	5	6732.32	33661.60
2112	ORD00997	PROD0083	3	160848.97	482546.91
2113	ORD00997	PROD0261	3	8607.87	25823.61
2114	ORD00997	PROD0009	2	198883.60	397767.20
2115	ORD00997	PROD0055	3	42567.03	127701.09
2121	ORD00999	PROD0126	1	13544.05	13544.05
2122	ORD00999	PROD0035	3	190414.55	571243.65
2123	ORD00999	PROD0059	4	35594.97	142379.88
2124	ORD00999	PROD0273	4	1784.35	7137.40
2125	ORD01000	PROD0157	1	10758.03	10758.03
2126	ORD01000	PROD0063	1	35488.70	35488.70
2127	ORD01000	PROD0166	2	101932.80	203865.60
2128	ORD01000	PROD0077	4	20510.26	82041.04
2131	ORD01003	PROD0176	3	30789.84	92369.52
2132	ORD01004	PROD0109	4	70228.44	280913.76
2133	ORD01004	PROD0165	5	22136.37	110681.85
2134	ORD01005	PROD0087	4	12717.02	50868.08
2135	ORD01006	PROD0158	1	12650.30	12650.30
2138	ORD01008	PROD0095	2	49921.23	99842.46
2143	ORD01011	PROD0172	2	95695.43	191390.86
2144	ORD01011	PROD0094	1	117897.53	117897.53
2145	ORD01012	PROD0249	3	774.24	2322.72
2146	ORD01012	PROD0194	5	24802.59	124012.95
2147	ORD01012	PROD0140	4	2847.84	11391.36
2149	ORD01014	PROD0231	1	6206.49	6206.49
2150	ORD01014	PROD0159	4	17483.90	69935.60
2151	ORD01015	PROD0126	3	13544.05	40632.15
2152	ORD01016	PROD0219	1	14849.13	14849.13
2153	ORD01016	PROD0096	5	179864.29	899321.45
2154	ORD01016	PROD0238	3	6026.76	18080.28
2155	ORD01016	PROD0226	2	7172.97	14345.94
2156	ORD01016	PROD0041	5	14461.31	72306.55
2157	ORD01017	PROD0005	3	85978.02	257934.06
2158	ORD01017	PROD0092	3	140982.24	422946.72
2159	ORD01018	PROD0149	3	8124.11	24372.33
2160	ORD01018	PROD0269	3	2989.48	8968.44
2161	ORD01018	PROD0172	4	95695.43	382781.72
2162	ORD01018	PROD0202	4	12764.12	51056.48
2163	ORD01019	PROD0132	1	23990.67	23990.67
2164	ORD01020	PROD0125	3	22153.16	66459.48
2172	ORD01023	PROD0246	1	5399.76	5399.76
2173	ORD01024	PROD0212	4	8757.97	35031.88
2174	ORD01024	PROD0190	5	22778.54	113892.70
2175	ORD01024	PROD0173	2	39177.27	78354.54
2176	ORD01025	PROD0156	1	21374.21	21374.21
2177	ORD01025	PROD0196	2	2511.26	5022.52
2178	ORD01026	PROD0237	3	7201.43	21604.29
2184	ORD01029	PROD0025	3	330590.39	991771.17
2185	ORD01029	PROD0105	2	162358.65	324717.30
2186	ORD01030	PROD0150	2	12003.33	24006.66
2196	ORD01036	PROD0079	1	13912.80	13912.80
2197	ORD01036	PROD0120	2	35341.43	70682.86
2198	ORD01037	PROD0102	3	45021.16	135063.48
2203	ORD01039	PROD0190	2	22778.54	45557.08
2206	ORD01041	PROD0035	5	190414.55	952072.75
2212	ORD01045	PROD0241	5	1174.07	5870.35
2213	ORD01045	PROD0076	1	27116.85	27116.85
2214	ORD01045	PROD0174	2	110640.11	221280.22
2217	ORD01048	PROD0062	2	22431.17	44862.34
2218	ORD01048	PROD0272	3	11096.23	33288.69
2219	ORD01048	PROD0235	5	1609.74	8048.70
2220	ORD01048	PROD0263	4	8199.23	32796.92
2221	ORD01048	PROD0022	5	222156.94	1110784.70
2222	ORD01049	PROD0019	2	339524.65	679049.30
2224	ORD01051	PROD0253	4	8743.34	34973.36
2225	ORD01052	PROD0058	4	14691.81	58767.24
2230	ORD01054	PROD0170	3	45302.42	135907.26
2231	ORD01054	PROD0007	4	290642.30	1162569.20
2234	ORD01057	PROD0255	3	7571.15	22713.45
2235	ORD01057	PROD0243	2	10094.25	20188.50
2236	ORD01058	PROD0069	1	39168.98	39168.98
2237	ORD01059	PROD0166	4	101932.80	407731.20
2238	ORD01060	PROD0079	2	13912.80	27825.60
2239	ORD01060	PROD0210	5	14712.50	73562.50
2240	ORD01061	PROD0133	5	23616.92	118084.60
2241	ORD01062	PROD0115	1	2277.24	2277.24
2242	ORD01062	PROD0276	3	6563.88	19691.64
2243	ORD01062	PROD0021	5	34405.68	172028.40
2251	ORD01066	PROD0258	4	4792.40	19169.60
2252	ORD01066	PROD0255	5	7571.15	37855.75
2253	ORD01067	PROD0145	3	22657.06	67971.18
2255	ORD01068	PROD0092	2	140982.24	281964.48
2256	ORD01068	PROD0039	1	257535.23	257535.23
2257	ORD01068	PROD0099	3	130788.21	392364.63
2258	ORD01069	PROD0262	4	3172.89	12691.56
2259	ORD01069	PROD0058	5	14691.81	73459.05
2260	ORD01069	PROD0047	4	5512.81	22051.24
2263	ORD01071	PROD0011	1	314229.61	314229.61
2264	ORD01071	PROD0087	1	12717.02	12717.02
2265	ORD01072	PROD0050	1	26917.21	26917.21
2266	ORD01073	PROD0001	5	279610.57	1398052.85
2267	ORD01073	PROD0182	2	33297.75	66595.50
2254	ORD01067	PROD0205	1	7224.75	7224.75
2324	ORD01099	PROD0245	3	5638.01	16914.03
2272	ORD01076	PROD0043	5	16739.67	83698.35
2273	ORD01076	PROD0259	4	7869.35	31477.40
2274	ORD01076	PROD0173	2	39177.27	78354.54
2275	ORD01076	PROD0059	4	35594.97	142379.88
2276	ORD01077	PROD0039	2	257535.23	515070.46
2277	ORD01078	PROD0277	5	9657.13	48285.65
2280	ORD01080	PROD0086	5	49202.47	246012.35
2281	ORD01080	PROD0004	1	39811.79	39811.79
2282	ORD01080	PROD0276	3	6563.88	19691.64
2283	ORD01081	PROD0258	1	4792.40	4792.40
2293	ORD01087	PROD0235	4	1609.74	6438.96
2294	ORD01087	PROD0158	3	12650.30	37950.90
2295	ORD01088	PROD0100	4	110269.71	441078.84
2296	ORD01088	PROD0259	2	7869.35	15738.70
2297	ORD01088	PROD0155	3	17522.15	52566.45
2298	ORD01088	PROD0058	4	14691.81	58767.24
2299	ORD01088	PROD0211	5	8250.11	41250.55
2307	ORD01092	PROD0022	4	222156.94	888627.76
2308	ORD01092	PROD0169	3	41598.42	124795.26
2312	ORD01094	PROD0200	1	29196.20	29196.20
2313	ORD01094	PROD0207	5	11561.20	57806.00
2318	ORD01096	PROD0010	4	270434.00	1081736.00
2319	ORD01096	PROD0061	2	6821.26	13642.52
2320	ORD01096	PROD0272	4	11096.23	44384.92
2321	ORD01097	PROD0063	1	35488.70	35488.70
2322	ORD01098	PROD0176	5	30789.84	153949.20
2323	ORD01098	PROD0217	4	7092.62	28370.48
2325	ORD01099	PROD0071	4	9870.56	39482.24
2327	ORD01101	PROD0167	5	22365.17	111825.85
2328	ORD01101	PROD0191	2	44052.51	88105.02
2331	ORD01103	PROD0029	4	149660.33	598641.32
2332	ORD01103	PROD0002	2	102447.74	204895.48
2333	ORD01103	PROD0128	2	24463.34	48926.68
2340	ORD01107	PROD0025	3	330590.39	991771.17
2341	ORD01107	PROD0186	4	17418.14	69672.56
2342	ORD01107	PROD0158	4	12650.30	50601.20
2343	ORD01107	PROD0048	3	10843.12	32529.36
2349	ORD01110	PROD0043	1	16739.67	16739.67
2350	ORD01111	PROD0274	5	7846.95	39234.75
2351	ORD01111	PROD0090	1	102715.97	102715.97
2352	ORD01112	PROD0223	1	7785.89	7785.89
2353	ORD01112	PROD0095	3	49921.23	149763.69
2354	ORD01112	PROD0162	2	2672.21	5344.42
2355	ORD01113	PROD0116	1	20859.43	20859.43
2356	ORD01113	PROD0248	5	4809.30	24046.50
2357	ORD01113	PROD0263	5	8199.23	40996.15
2358	ORD01113	PROD0026	1	34248.48	34248.48
2359	ORD01114	PROD0246	4	5399.76	21599.04
2360	ORD01114	PROD0227	2	9871.34	19742.68
2435	ORD01146	PROD0088	2	73744.65	147489.30
2363	ORD01117	PROD0246	5	5399.76	26998.80
2364	ORD01117	PROD0117	1	31515.40	31515.40
2365	ORD01118	PROD0210	3	14712.50	44137.50
2366	ORD01118	PROD0268	3	2944.75	8834.25
2369	ORD01120	PROD0267	2	6230.11	12460.22
2374	ORD01123	PROD0135	1	2595.60	2595.60
2375	ORD01123	PROD0169	3	41598.42	124795.26
2378	ORD01125	PROD0275	5	10193.83	50969.15
2379	ORD01125	PROD0059	2	35594.97	71189.94
2380	ORD01125	PROD0042	5	44258.35	221291.75
2383	ORD01127	PROD0114	1	7586.49	7586.49
2384	ORD01127	PROD0192	3	94625.99	283877.97
2390	ORD01129	PROD0162	3	2672.21	8016.63
2394	ORD01131	PROD0272	4	11096.23	44384.92
2395	ORD01131	PROD0255	4	7571.15	30284.60
2396	ORD01131	PROD0106	2	137481.28	274962.56
2404	ORD01136	PROD0267	1	6230.11	6230.11
2407	ORD01138	PROD0210	1	14712.50	14712.50
2408	ORD01138	PROD0136	1	8175.35	8175.35
2409	ORD01138	PROD0022	2	222156.94	444313.88
2410	ORD01138	PROD0192	5	94625.99	473129.95
2411	ORD01139	PROD0217	5	7092.62	35463.10
2412	ORD01139	PROD0069	1	39168.98	39168.98
2413	ORD01140	PROD0163	2	18374.63	36749.26
2414	ORD01141	PROD0002	5	102447.74	512238.70
2415	ORD01141	PROD0089	3	45090.58	135271.74
2416	ORD01141	PROD0259	5	7869.35	39346.75
2417	ORD01142	PROD0122	2	16203.67	32407.34
2418	ORD01142	PROD0169	4	41598.42	166393.68
2419	ORD01142	PROD0276	1	6563.88	6563.88
2420	ORD01142	PROD0233	4	10621.64	42486.56
2426	ORD01144	PROD0114	4	7586.49	30345.96
2427	ORD01144	PROD0120	4	35341.43	141365.72
2428	ORD01144	PROD0110	1	23332.73	23332.73
2429	ORD01144	PROD0208	3	9010.85	27032.55
2430	ORD01144	PROD0146	1	9207.08	9207.08
2436	ORD01147	PROD0144	1	801.07	801.07
2439	ORD01150	PROD0015	5	222324.51	1111622.55
2440	ORD01150	PROD0244	4	1664.99	6659.96
2441	ORD01150	PROD0078	2	18117.48	36234.96
2442	ORD01150	PROD0200	2	29196.20	58392.40
2443	ORD01150	PROD0131	2	21092.44	42184.88
2445	ORD01152	PROD0051	2	33329.69	66659.38
2446	ORD01152	PROD0196	1	2511.26	2511.26
2447	ORD01153	PROD0078	1	18117.48	18117.48
2451	ORD01155	PROD0171	5	105588.96	527944.80
2452	ORD01156	PROD0018	4	120439.60	481758.40
2474	ORD01163	PROD0088	5	73744.65	368723.25
2469	ORD01161	PROD0041	5	14461.31	72306.55
2470	ORD01161	PROD0239	3	1047.73	3143.19
2471	ORD01162	PROD0277	3	9657.13	28971.39
2472	ORD01163	PROD0275	4	10193.83	40775.32
2473	ORD01163	PROD0047	3	5512.81	16538.43
2475	ORD01163	PROD0221	5	13121.51	65607.55
2476	ORD01163	PROD0277	4	9657.13	38628.52
2483	ORD01167	PROD0066	2	36291.81	72583.62
2486	ORD01169	PROD0005	2	85978.02	171956.04
2491	ORD01171	PROD0057	1	24240.82	24240.82
2492	ORD01171	PROD0003	5	49538.31	247691.55
2507	ORD01179	PROD0129	3	5323.48	15970.44
2508	ORD01180	PROD0071	3	9870.56	29611.68
2509	ORD01181	PROD0260	5	5050.94	25254.70
2510	ORD01181	PROD0078	4	18117.48	72469.92
2511	ORD01181	PROD0071	5	9870.56	49352.80
2512	ORD01181	PROD0114	3	7586.49	22759.47
2517	ORD01183	PROD0045	2	15761.34	31522.68
2521	ORD01185	PROD0089	1	45090.58	45090.58
2522	ORD01185	PROD0113	3	145706.19	437118.57
2523	ORD01186	PROD0045	1	15761.34	15761.34
2524	ORD01187	PROD0219	1	14849.13	14849.13
2525	ORD01187	PROD0036	2	78738.41	157476.82
2526	ORD01187	PROD0180	1	60582.65	60582.65
2529	ORD01189	PROD0157	2	10758.03	21516.06
2530	ORD01189	PROD0091	3	141135.80	423407.40
2531	ORD01189	PROD0074	4	13460.87	53843.48
2532	ORD01189	PROD0226	1	7172.97	7172.97
2533	ORD01189	PROD0215	1	3385.48	3385.48
2546	ORD01194	PROD0248	3	4809.30	14427.90
2548	ORD01196	PROD0130	2	1182.88	2365.76
2549	ORD01196	PROD0183	3	26053.15	78159.45
2557	ORD01200	PROD0051	1	33329.69	33329.69
2559	ORD01202	PROD0271	4	1989.71	7958.84
2564	ORD01204	PROD0108	2	121332.02	242664.04
2565	ORD01204	PROD0153	1	10840.50	10840.50
2566	ORD01204	PROD0244	4	1664.99	6659.96
2567	ORD01204	PROD0060	1	10877.79	10877.79
2568	ORD01205	PROD0080	5	14845.55	74227.75
2569	ORD01205	PROD0182	3	33297.75	99893.25
2570	ORD01205	PROD0027	1	26206.57	26206.57
2660	ORD01248	PROD0088	4	73744.65	294978.60
2577	ORD01208	PROD0241	2	1174.07	2348.14
2580	ORD01210	PROD0215	1	3385.48	3385.48
2581	ORD01210	PROD0055	2	42567.03	85134.06
2583	ORD01212	PROD0203	2	3538.98	7077.96
2589	ORD01216	PROD0005	2	85978.02	171956.04
2590	ORD01216	PROD0112	3	35280.59	105841.77
2604	ORD01222	PROD0253	2	8743.34	17486.68
2605	ORD01222	PROD0169	5	41598.42	207992.10
2606	ORD01222	PROD0051	3	33329.69	99989.07
2607	ORD01222	PROD0069	5	39168.98	195844.90
2608	ORD01223	PROD0237	2	7201.43	14402.86
2609	ORD01224	PROD0190	4	22778.54	91114.16
2610	ORD01224	PROD0144	4	801.07	3204.28
2611	ORD01224	PROD0217	2	7092.62	14185.24
2612	ORD01225	PROD0186	3	17418.14	52254.42
2613	ORD01225	PROD0197	4	113579.08	454316.32
2614	ORD01226	PROD0250	3	4620.81	13862.43
2616	ORD01228	PROD0133	4	23616.92	94467.68
2627	ORD01234	PROD0165	4	22136.37	88545.48
2633	ORD01237	PROD0091	2	141135.80	282271.60
2634	ORD01238	PROD0251	4	5175.86	20703.44
2635	ORD01238	PROD0219	1	14849.13	14849.13
2636	ORD01238	PROD0062	4	22431.17	89724.68
2638	ORD01240	PROD0218	2	5238.20	10476.40
2639	ORD01240	PROD0005	1	85978.02	85978.02
2640	ORD01240	PROD0107	2	97418.23	194836.46
2641	ORD01240	PROD0092	4	140982.24	563928.96
2651	ORD01243	PROD0144	4	801.07	3204.28
2652	ORD01244	PROD0124	5	17164.25	85821.25
2653	ORD01244	PROD0003	2	49538.31	99076.62
2655	ORD01246	PROD0237	2	7201.43	14402.86
2661	ORD01249	PROD0192	4	94625.99	378503.96
2662	ORD01249	PROD0012	1	248709.70	248709.70
2663	ORD01250	PROD0012	5	248709.70	1243548.50
2664	ORD01250	PROD0087	1	12717.02	12717.02
2665	ORD01250	PROD0023	1	276589.43	276589.43
2680	ORD01257	PROD0069	1	39168.98	39168.98
2681	ORD01257	PROD0029	2	149660.33	299320.66
2682	ORD01258	PROD0143	1	13171.72	13171.72
2683	ORD01258	PROD0082	1	54346.36	54346.36
2685	ORD01260	PROD0118	1	12699.55	12699.55
2686	ORD01261	PROD0078	4	18117.48	72469.92
2687	ORD01261	PROD0261	3	8607.87	25823.61
2720	ORD01280	PROD0205	3	7224.75	21674.25
2694	ORD01264	PROD0054	3	31709.48	95128.44
2697	ORD01266	PROD0131	5	21092.44	105462.20
2698	ORD01266	PROD0165	1	22136.37	22136.37
2699	ORD01267	PROD0221	4	13121.51	52486.04
2700	ORD01267	PROD0253	5	8743.34	43716.70
2706	ORD01272	PROD0111	3	2676.03	8028.09
2707	ORD01273	PROD0180	1	60582.65	60582.65
2712	ORD01275	PROD0006	1	308912.61	308912.61
2713	ORD01276	PROD0210	4	14712.50	58850.00
2726	ORD01284	PROD0154	3	19738.96	59216.88
2727	ORD01284	PROD0071	3	9870.56	29611.68
2728	ORD01284	PROD0103	3	83304.08	249912.24
2729	ORD01284	PROD0051	1	33329.69	33329.69
2730	ORD01284	PROD0200	2	29196.20	58392.40
2736	ORD01286	PROD0045	4	15761.34	63045.36
2737	ORD01287	PROD0147	3	5055.12	15165.36
2738	ORD01287	PROD0113	3	145706.19	437118.57
2739	ORD01287	PROD0228	1	6170.81	6170.81
2740	ORD01287	PROD0158	4	12650.30	50601.20
2748	ORD01292	PROD0017	4	257730.40	1030921.60
2749	ORD01292	PROD0113	5	145706.19	728530.95
2750	ORD01293	PROD0049	2	27088.42	54176.84
2751	ORD01293	PROD0151	4	24271.64	97086.56
2752	ORD01294	PROD0232	3	4469.76	13409.28
2753	ORD01295	PROD0035	3	190414.55	571243.65
2754	ORD01295	PROD0189	1	96833.78	96833.78
2756	ORD01297	PROD0198	2	57432.47	114864.94
2757	ORD01297	PROD0011	3	314229.61	942688.83
2758	ORD01297	PROD0149	4	8124.11	32496.44
2766	ORD01301	PROD0024	4	321716.92	1286867.68
2767	ORD01301	PROD0199	2	28468.05	56936.10
2770	ORD01303	PROD0071	1	9870.56	9870.56
2771	ORD01303	PROD0072	4	43142.24	172568.96
2772	ORD01304	PROD0206	1	5427.42	5427.42
2773	ORD01304	PROD0227	4	9871.34	39485.36
2777	ORD01306	PROD0252	3	8223.52	24670.56
2778	ORD01306	PROD0062	2	22431.17	44862.34
2779	ORD01306	PROD0079	2	13912.80	27825.60
2780	ORD01306	PROD0215	4	3385.48	13541.92
2788	ORD01309	PROD0175	5	102750.60	513753.00
2789	ORD01310	PROD0263	2	8199.23	16398.46
2790	ORD01310	PROD0143	1	13171.72	13171.72
2791	ORD01311	PROD0258	4	4792.40	19169.60
2792	ORD01311	PROD0003	4	49538.31	198153.24
2836	ORD01330	PROD0245	4	5638.01	22552.04
2797	ORD01313	PROD0153	4	10840.50	43362.00
2798	ORD01313	PROD0022	1	222156.94	222156.94
2799	ORD01314	PROD0206	5	5427.42	27137.10
2800	ORD01314	PROD0077	2	20510.26	41020.52
2811	ORD01319	PROD0196	3	2511.26	7533.78
2812	ORD01319	PROD0095	5	49921.23	249606.15
2813	ORD01319	PROD0130	4	1182.88	4731.52
2818	ORD01322	PROD0193	4	9954.82	39819.28
2824	ORD01326	PROD0102	2	45021.16	90042.32
2832	ORD01329	PROD0233	5	10621.64	53108.20
2833	ORD01330	PROD0127	4	8700.29	34801.16
2834	ORD01330	PROD0111	5	2676.03	13380.15
2835	ORD01330	PROD0165	5	22136.37	110681.85
2837	ORD01331	PROD0026	3	34248.48	102745.44
2838	ORD01331	PROD0268	5	2944.75	14723.75
2847	ORD01334	PROD0279	4	962.48	3849.92
2848	ORD01335	PROD0082	2	54346.36	108692.72
2849	ORD01336	PROD0119	1	47472.78	47472.78
2868	ORD01345	PROD0274	2	7846.95	15693.90
2869	ORD01345	PROD0213	3	2985.64	8956.92
2870	ORD01345	PROD0066	1	36291.81	36291.81
2871	ORD01346	PROD0242	1	5755.30	5755.30
2872	ORD01347	PROD0086	3	49202.47	147607.41
2873	ORD01347	PROD0276	4	6563.88	26255.52
2874	ORD01347	PROD0178	2	87684.88	175369.76
2875	ORD01347	PROD0041	3	14461.31	43383.93
2876	ORD01347	PROD0138	1	15463.10	15463.10
2878	ORD01349	PROD0188	2	51993.13	103986.26
2879	ORD01350	PROD0146	1	9207.08	9207.08
2885	ORD01353	PROD0011	2	314229.61	628459.22
2886	ORD01353	PROD0228	4	6170.81	24683.24
2887	ORD01353	PROD0274	3	7846.95	23540.85
2888	ORD01353	PROD0277	2	9657.13	19314.26
2889	ORD01353	PROD0007	5	290642.30	1453211.50
2890	ORD01354	PROD0105	2	162358.65	324717.30
2891	ORD01355	PROD0154	1	19738.96	19738.96
2892	ORD01355	PROD0135	4	2595.60	10382.40
2893	ORD01355	PROD0011	4	314229.61	1256918.44
2894	ORD01355	PROD0258	1	4792.40	4792.40
2895	ORD01355	PROD0260	5	5050.94	25254.70
2903	ORD01359	PROD0082	1	54346.36	54346.36
2904	ORD01359	PROD0076	3	27116.85	81350.55
2905	ORD01360	PROD0152	5	1904.28	9521.40
2906	ORD01360	PROD0246	2	5399.76	10799.52
2907	ORD01360	PROD0030	2	253935.11	507870.22
2908	ORD01361	PROD0125	4	22153.16	88612.64
2909	ORD01361	PROD0140	4	2847.84	11391.36
2912	ORD01364	PROD0022	4	222156.94	888627.76
2913	ORD01365	PROD0045	5	15761.34	78806.70
2914	ORD01365	PROD0220	5	11275.57	56377.85
2915	ORD01365	PROD0137	5	2019.05	10095.25
2916	ORD01365	PROD0005	1	85978.02	85978.02
2920	ORD01367	PROD0188	1	51993.13	51993.13
2921	ORD01367	PROD0119	5	47472.78	237363.90
2922	ORD01368	PROD0238	3	6026.76	18080.28
2926	ORD01370	PROD0062	3	22431.17	67293.51
2927	ORD01370	PROD0200	3	29196.20	87588.60
2933	ORD01372	PROD0217	1	7092.62	7092.62
2935	ORD01374	PROD0003	4	49538.31	198153.24
2936	ORD01374	PROD0035	4	190414.55	761658.20
2937	ORD01374	PROD0226	1	7172.97	7172.97
2938	ORD01374	PROD0118	3	12699.55	38098.65
2939	ORD01374	PROD0047	4	5512.81	22051.24
2940	ORD01375	PROD0039	2	257535.23	515070.46
2944	ORD01377	PROD0269	4	2989.48	11957.92
2945	ORD01377	PROD0273	3	1784.35	5353.05
2946	ORD01377	PROD0204	4	5933.15	23732.60
2956	ORD01382	PROD0165	4	22136.37	88545.48
2957	ORD01382	PROD0123	4	11097.43	44389.72
2958	ORD01382	PROD0084	5	37258.14	186290.70
2959	ORD01382	PROD0203	5	3538.98	17694.90
2963	ORD01385	PROD0037	2	266180.98	532361.96
2964	ORD01385	PROD0269	5	2989.48	14947.40
2968	ORD01387	PROD0002	4	102447.74	409790.96
2972	ORD01389	PROD0018	4	120439.60	481758.40
2973	ORD01389	PROD0204	3	5933.15	17799.45
2974	ORD01390	PROD0122	4	16203.67	64814.68
2975	ORD01391	PROD0148	1	3628.18	3628.18
2993	ORD01397	PROD0052	1	23501.69	23501.69
2994	ORD01397	PROD0067	1	11627.77	11627.77
2995	ORD01397	PROD0081	3	110991.10	332973.30
2996	ORD01397	PROD0274	5	7846.95	39234.75
2997	ORD01398	PROD0231	4	6206.49	24825.96
2998	ORD01399	PROD0156	3	21374.21	64122.63
2999	ORD01399	PROD0255	4	7571.15	30284.60
3000	ORD01399	PROD0154	4	19738.96	78955.84
3001	ORD01399	PROD0089	5	45090.58	225452.90
3002	ORD01399	PROD0083	4	160848.97	643395.88
3007	ORD01403	PROD0228	5	6170.81	30854.05
3008	ORD01403	PROD0138	4	15463.10	61852.40
3013	ORD01405	PROD0166	3	101932.80	305798.40
3016	ORD01407	PROD0027	4	26206.57	104826.28
3021	ORD01409	PROD0242	1	5755.30	5755.30
3022	ORD01409	PROD0152	2	1904.28	3808.56
3028	ORD01411	PROD0263	1	8199.23	8199.23
3029	ORD01411	PROD0211	3	8250.11	24750.33
3030	ORD01411	PROD0032	1	246601.80	246601.80
3031	ORD01411	PROD0089	5	45090.58	225452.90
3039	ORD01414	PROD0182	4	33297.75	133191.00
3040	ORD01414	PROD0194	3	24802.59	74407.77
3043	ORD01416	PROD0129	3	5323.48	15970.44
3044	ORD01417	PROD0072	4	43142.24	172568.96
3045	ORD01417	PROD0171	2	105588.96	211177.92
3046	ORD01417	PROD0267	3	6230.11	18690.33
3047	ORD01417	PROD0144	2	801.07	1602.14
3048	ORD01417	PROD0009	1	198883.60	198883.60
3055	ORD01421	PROD0185	2	112356.62	224713.24
3056	ORD01421	PROD0193	4	9954.82	39819.28
3057	ORD01421	PROD0144	4	801.07	3204.28
3058	ORD01422	PROD0002	4	102447.74	409790.96
3059	ORD01423	PROD0047	2	5512.81	11025.62
3060	ORD01423	PROD0240	3	10219.29	30657.87
3061	ORD01423	PROD0277	2	9657.13	19314.26
3062	ORD01423	PROD0257	4	2248.73	8994.92
3063	ORD01424	PROD0012	2	248709.70	497419.40
3064	ORD01424	PROD0216	2	3485.44	6970.88
3067	ORD01426	PROD0140	5	2847.84	14239.20
3073	ORD01429	PROD0155	5	17522.15	87610.75
3074	ORD01429	PROD0190	5	22778.54	113892.70
3075	ORD01430	PROD0263	4	8199.23	32796.92
3076	ORD01430	PROD0227	2	9871.34	19742.68
3077	ORD01431	PROD0056	1	6299.62	6299.62
3078	ORD01431	PROD0093	5	8480.78	42403.90
3083	ORD01434	PROD0199	2	28468.05	56936.10
3084	ORD01434	PROD0119	3	47472.78	142418.34
3086	ORD01436	PROD0266	2	408.26	816.52
3087	ORD01436	PROD0116	3	20859.43	62578.29
3088	ORD01437	PROD0112	3	35280.59	105841.77
3089	ORD01437	PROD0052	3	23501.69	70505.07
3090	ORD01437	PROD0166	1	101932.80	101932.80
3091	ORD01438	PROD0114	3	7586.49	22759.47
3092	ORD01438	PROD0265	3	11740.65	35221.95
3101	ORD01441	PROD0219	5	14849.13	74245.65
3105	ORD01443	PROD0107	3	97418.23	292254.69
3106	ORD01443	PROD0061	5	6821.26	34106.30
3108	ORD01445	PROD0046	5	5762.47	28812.35
3109	ORD01445	PROD0170	3	45302.42	135907.26
3110	ORD01446	PROD0047	4	5512.81	22051.24
3114	ORD01448	PROD0183	5	26053.15	130265.75
3115	ORD01449	PROD0033	4	245627.48	982509.92
3116	ORD01450	PROD0037	1	266180.98	266180.98
3117	ORD01450	PROD0147	2	5055.12	10110.24
3120	ORD01452	PROD0065	3	30524.10	91572.30
3121	ORD01452	PROD0275	2	10193.83	20387.66
3122	ORD01452	PROD0208	2	9010.85	18021.70
3123	ORD01453	PROD0016	5	256280.50	1281402.50
3126	ORD01455	PROD0161	4	25829.99	103319.96
3127	ORD01456	PROD0113	3	145706.19	437118.57
3131	ORD01458	PROD0207	1	11561.20	11561.20
3132	ORD01459	PROD0156	4	21374.21	85496.84
3133	ORD01460	PROD0057	4	24240.82	96963.28
3134	ORD01460	PROD0197	2	113579.08	227158.16
3135	ORD01460	PROD0127	4	8700.29	34801.16
3137	ORD01462	PROD0135	1	2595.60	2595.60
3138	ORD01462	PROD0048	2	10843.12	21686.24
3139	ORD01462	PROD0153	5	10840.50	54202.50
3140	ORD01462	PROD0024	3	321716.92	965150.76
3141	ORD01463	PROD0139	5	14201.82	71009.10
3142	ORD01463	PROD0148	4	3628.18	14512.72
3143	ORD01463	PROD0131	4	21092.44	84369.76
3144	ORD01464	PROD0185	3	112356.62	337069.86
3145	ORD01465	PROD0102	3	45021.16	135063.48
3146	ORD01465	PROD0077	1	20510.26	20510.26
3149	ORD01467	PROD0264	1	4118.15	4118.15
3150	ORD01467	PROD0100	5	110269.71	551348.55
3152	ORD01469	PROD0054	1	31709.48	31709.48
3155	ORD01471	PROD0074	2	13460.87	26921.74
3156	ORD01471	PROD0220	1	11275.57	11275.57
3157	ORD01471	PROD0102	3	45021.16	135063.48
3158	ORD01472	PROD0100	1	110269.71	110269.71
3161	ORD01474	PROD0039	3	257535.23	772605.69
3162	ORD01475	PROD0106	2	137481.28	274962.56
3163	ORD01475	PROD0266	2	408.26	816.52
3164	ORD01475	PROD0073	3	6732.32	20196.96
3165	ORD01475	PROD0066	1	36291.81	36291.81
3166	ORD01476	PROD0194	2	24802.59	49605.18
3177	ORD01482	PROD0048	3	10843.12	32529.36
3178	ORD01483	PROD0137	2	2019.05	4038.10
3179	ORD01483	PROD0250	3	4620.81	13862.43
3180	ORD01483	PROD0200	2	29196.20	58392.40
3181	ORD01484	PROD0190	2	22778.54	45557.08
3182	ORD01484	PROD0113	4	145706.19	582824.76
3187	ORD01487	PROD0174	4	110640.11	442560.44
3199	ORD01492	PROD0141	5	11608.58	58042.90
3200	ORD01492	PROD0275	1	10193.83	10193.83
3201	ORD01492	PROD0217	5	7092.62	35463.10
3202	ORD01492	PROD0247	2	5416.29	10832.58
3203	ORD01493	PROD0101	5	114695.41	573477.05
3207	ORD01495	PROD0154	5	19738.96	98694.80
3208	ORD01495	PROD0006	3	308912.61	926737.83
3209	ORD01495	PROD0111	5	2676.03	13380.15
3210	ORD01495	PROD0203	1	3538.98	3538.98
3214	ORD01498	PROD0140	1	2847.84	2847.84
3215	ORD01498	PROD0018	2	120439.60	240879.20
3216	ORD01499	PROD0106	1	137481.28	137481.28
3217	ORD01499	PROD0141	3	11608.58	34825.74
3218	ORD01499	PROD0274	1	7846.95	7846.95
3219	ORD01500	PROD0253	3	8743.34	26230.02
3220	ORD01500	PROD0111	5	2676.03	13380.15
3221	ORD01500	PROD0020	1	293010.61	293010.61
3222	ORD01500	PROD0038	1	88262.22	88262.22
3230	ORD01503	PROD0108	1	121332.02	121332.02
3231	ORD01503	PROD0164	4	6702.72	26810.88
3232	ORD01503	PROD0102	5	45021.16	225105.80
3233	ORD01503	PROD0039	1	257535.23	257535.23
3234	ORD01503	PROD0218	4	5238.20	20952.80
3235	ORD01504	PROD0166	4	101932.80	407731.20
3241	ORD01507	PROD0110	4	23332.73	93330.92
3242	ORD01508	PROD0123	1	11097.43	11097.43
3243	ORD01508	PROD0041	4	14461.31	57845.24
3244	ORD01509	PROD0078	1	18117.48	18117.48
3249	ORD01511	PROD0255	1	7571.15	7571.15
3250	ORD01511	PROD0160	2	12278.28	24556.56
3251	ORD01511	PROD0039	3	257535.23	772605.69
3258	ORD01516	PROD0022	3	222156.94	666470.82
3259	ORD01516	PROD0043	3	16739.67	50219.01
3267	ORD01520	PROD0080	2	14845.55	29691.10
3268	ORD01520	PROD0270	3	907.09	2721.27
3269	ORD01521	PROD0138	4	15463.10	61852.40
3280	ORD01525	PROD0065	5	30524.10	152620.50
3281	ORD01526	PROD0148	2	3628.18	7256.36
3282	ORD01526	PROD0066	1	36291.81	36291.81
3283	ORD01526	PROD0019	5	339524.65	1697623.25
3284	ORD01527	PROD0013	4	337113.25	1348453.00
3285	ORD01527	PROD0117	5	31515.40	157577.00
3286	ORD01528	PROD0228	2	6170.81	12341.62
3287	ORD01528	PROD0129	4	5323.48	21293.92
3294	ORD01531	PROD0232	3	4469.76	13409.28
3295	ORD01532	PROD0115	5	2277.24	11386.20
3296	ORD01532	PROD0215	1	3385.48	3385.48
3297	ORD01533	PROD0144	2	801.07	1602.14
3304	ORD01539	PROD0110	2	23332.73	46665.46
3306	ORD01541	PROD0072	5	43142.24	215711.20
3307	ORD01541	PROD0223	5	7785.89	38929.45
3308	ORD01541	PROD0201	1	10976.40	10976.40
3309	ORD01541	PROD0095	4	49921.23	199684.92
3313	ORD01544	PROD0111	5	2676.03	13380.15
3314	ORD01544	PROD0063	2	35488.70	70977.40
3315	ORD01544	PROD0119	5	47472.78	237363.90
3316	ORD01545	PROD0025	5	330590.39	1652951.95
3317	ORD01545	PROD0055	2	42567.03	85134.06
3318	ORD01546	PROD0002	1	102447.74	102447.74
3319	ORD01546	PROD0030	2	253935.11	507870.22
3320	ORD01547	PROD0193	1	9954.82	9954.82
3321	ORD01547	PROD0144	5	801.07	4005.35
3322	ORD01547	PROD0253	3	8743.34	26230.02
3347	ORD01558	PROD0104	1	73744.65	73744.65
3419	ORD01597	PROD0205	4	7224.75	28899.00
3329	ORD01550	PROD0256	4	1625.49	6501.96
3330	ORD01550	PROD0220	4	11275.57	45102.28
3331	ORD01551	PROD0045	3	15761.34	47284.02
3340	ORD01556	PROD0173	5	39177.27	195886.35
3341	ORD01556	PROD0126	5	13544.05	67720.25
3343	ORD01558	PROD0275	4	10193.83	40775.32
3344	ORD01558	PROD0133	4	23616.92	94467.68
3345	ORD01558	PROD0053	3	43609.38	130828.14
3346	ORD01558	PROD0252	5	8223.52	41117.60
3352	ORD01561	PROD0177	2	102403.06	204806.12
3357	ORD01564	PROD0212	5	8757.97	43789.85
3361	ORD01566	PROD0111	3	2676.03	8028.09
3362	ORD01566	PROD0132	2	23990.67	47981.34
3363	ORD01567	PROD0003	2	49538.31	99076.62
3364	ORD01568	PROD0238	1	6026.76	6026.76
3365	ORD01568	PROD0071	5	9870.56	49352.80
3366	ORD01568	PROD0192	3	94625.99	283877.97
3367	ORD01569	PROD0048	4	10843.12	43372.48
3368	ORD01569	PROD0150	5	12003.33	60016.65
3371	ORD01571	PROD0101	4	114695.41	458781.64
3372	ORD01572	PROD0071	2	9870.56	19741.12
3373	ORD01573	PROD0130	5	1182.88	5914.40
3374	ORD01574	PROD0012	2	248709.70	497419.40
3375	ORD01574	PROD0261	5	8607.87	43039.35
3383	ORD01579	PROD0032	3	246601.80	739805.40
3385	ORD01581	PROD0235	3	1609.74	4829.22
3386	ORD01581	PROD0164	5	6702.72	33513.60
3387	ORD01582	PROD0196	4	2511.26	10045.04
3388	ORD01582	PROD0145	4	22657.06	90628.24
3389	ORD01582	PROD0230	5	6077.64	30388.20
3390	ORD01582	PROD0057	3	24240.82	72722.46
3397	ORD01586	PROD0035	4	190414.55	761658.20
3398	ORD01586	PROD0179	3	21340.87	64022.61
3399	ORD01587	PROD0261	3	8607.87	25823.61
3400	ORD01587	PROD0084	2	37258.14	74516.28
3401	ORD01588	PROD0023	3	276589.43	829768.29
3402	ORD01588	PROD0035	5	190414.55	952072.75
3404	ORD01590	PROD0197	4	113579.08	454316.32
3414	ORD01594	PROD0043	2	16739.67	33479.34
3416	ORD01596	PROD0229	5	4112.45	20562.25
3417	ORD01596	PROD0241	4	1174.07	4696.28
3418	ORD01596	PROD0049	1	27088.42	27088.42
3420	ORD01597	PROD0207	4	11561.20	46244.80
3423	ORD01600	PROD0133	5	23616.92	118084.60
3424	ORD01600	PROD0125	1	22153.16	22153.16
3425	ORD01601	PROD0059	3	35594.97	106784.91
3426	ORD01602	PROD0050	4	26917.21	107668.84
3427	ORD01602	PROD0023	2	276589.43	553178.86
3428	ORD01602	PROD0036	4	78738.41	314953.64
3431	ORD01604	PROD0046	5	5762.47	28812.35
3432	ORD01605	PROD0259	4	7869.35	31477.40
3436	ORD01607	PROD0086	1	49202.47	49202.47
3437	ORD01607	PROD0256	1	1625.49	1625.49
3438	ORD01607	PROD0066	1	36291.81	36291.81
3439	ORD01607	PROD0149	2	8124.11	16248.22
3443	ORD01609	PROD0102	2	45021.16	90042.32
3444	ORD01609	PROD0121	4	17176.67	68706.68
3445	ORD01609	PROD0164	5	6702.72	33513.60
3446	ORD01609	PROD0216	2	3485.44	6970.88
3454	ORD01612	PROD0214	1	12483.89	12483.89
3455	ORD01612	PROD0218	2	5238.20	10476.40
3458	ORD01614	PROD0235	1	1609.74	1609.74
3459	ORD01614	PROD0002	1	102447.74	102447.74
3460	ORD01614	PROD0178	3	87684.88	263054.64
3461	ORD01614	PROD0113	5	145706.19	728530.95
3462	ORD01614	PROD0038	2	88262.22	176524.44
3468	ORD01617	PROD0246	2	5399.76	10799.52
3469	ORD01617	PROD0204	5	5933.15	29665.75
3472	ORD01619	PROD0264	5	4118.15	20590.75
3473	ORD01619	PROD0006	2	308912.61	617825.22
3474	ORD01620	PROD0276	4	6563.88	26255.52
3475	ORD01620	PROD0001	3	279610.57	838831.71
3477	ORD01622	PROD0097	5	9141.77	45708.85
3478	ORD01623	PROD0226	1	7172.97	7172.97
3479	ORD01624	PROD0072	5	43142.24	215711.20
3480	ORD01625	PROD0042	3	44258.35	132775.05
3481	ORD01625	PROD0059	5	35594.97	177974.85
3485	ORD01627	PROD0009	5	198883.60	994418.00
3486	ORD01627	PROD0073	2	6732.32	13464.64
3489	ORD01629	PROD0083	1	160848.97	160848.97
3490	ORD01629	PROD0117	5	31515.40	157577.00
3491	ORD01629	PROD0097	1	9141.77	9141.77
3492	ORD01629	PROD0209	4	2728.52	10914.08
3493	ORD01629	PROD0108	2	121332.02	242664.04
3494	ORD01630	PROD0198	3	57432.47	172297.41
3495	ORD01630	PROD0217	5	7092.62	35463.10
3496	ORD01630	PROD0072	4	43142.24	172568.96
3504	ORD01634	PROD0138	5	15463.10	77315.50
3509	ORD01636	PROD0243	4	10094.25	40377.00
3510	ORD01636	PROD0187	1	28776.04	28776.04
3511	ORD01636	PROD0269	5	2989.48	14947.40
3515	ORD01639	PROD0238	2	6026.76	12053.52
3516	ORD01640	PROD0240	4	10219.29	40877.16
3518	ORD01642	PROD0003	3	49538.31	148614.93
3519	ORD01642	PROD0154	1	19738.96	19738.96
3529	ORD01645	PROD0115	5	2277.24	11386.20
3532	ORD01647	PROD0161	1	25829.99	25829.99
3533	ORD01647	PROD0113	4	145706.19	582824.76
3534	ORD01647	PROD0233	2	10621.64	21243.28
3535	ORD01648	PROD0198	2	57432.47	114864.94
3536	ORD01648	PROD0049	1	27088.42	27088.42
3556	ORD01656	PROD0104	5	73744.65	368723.25
3540	ORD01650	PROD0031	5	290316.23	1451581.15
3541	ORD01650	PROD0218	2	5238.20	10476.40
3552	ORD01654	PROD0122	2	16203.67	32407.34
3553	ORD01654	PROD0055	3	42567.03	127701.09
3554	ORD01655	PROD0033	3	245627.48	736882.44
3555	ORD01655	PROD0057	3	24240.82	72722.46
3557	ORD01656	PROD0154	3	19738.96	59216.88
3558	ORD01656	PROD0128	2	24463.34	48926.68
3559	ORD01656	PROD0224	1	607.93	607.93
3566	ORD01660	PROD0227	4	9871.34	39485.36
3567	ORD01660	PROD0112	4	35280.59	141122.36
3568	ORD01660	PROD0236	1	7038.57	7038.57
3571	ORD01662	PROD0091	1	141135.80	141135.80
3572	ORD01663	PROD0110	3	23332.73	69998.19
3573	ORD01663	PROD0159	1	17483.90	17483.90
3574	ORD01664	PROD0025	3	330590.39	991771.17
3575	ORD01665	PROD0153	5	10840.50	54202.50
3576	ORD01665	PROD0036	2	78738.41	157476.82
3577	ORD01666	PROD0068	1	43176.46	43176.46
3578	ORD01666	PROD0229	1	4112.45	4112.45
3579	ORD01666	PROD0089	3	45090.58	135271.74
3580	ORD01667	PROD0002	1	102447.74	102447.74
3585	ORD01669	PROD0195	4	24091.13	96364.52
3586	ORD01669	PROD0007	4	290642.30	1162569.20
3587	ORD01669	PROD0239	4	1047.73	4190.92
3588	ORD01669	PROD0262	2	3172.89	6345.78
3589	ORD01669	PROD0157	1	10758.03	10758.03
3596	ORD01673	PROD0233	4	10621.64	42486.56
3597	ORD01673	PROD0220	1	11275.57	11275.57
3604	ORD01676	PROD0072	2	43142.24	86284.48
3608	ORD01680	PROD0129	3	5323.48	15970.44
3609	ORD01680	PROD0199	4	28468.05	113872.20
3611	ORD01682	PROD0177	5	102403.06	512015.30
3612	ORD01682	PROD0093	1	8480.78	8480.78
3613	ORD01682	PROD0075	2	5182.19	10364.38
3614	ORD01683	PROD0075	5	5182.19	25910.95
3615	ORD01684	PROD0045	5	15761.34	78806.70
3622	ORD01688	PROD0161	2	25829.99	51659.98
3623	ORD01688	PROD0209	1	2728.52	2728.52
3624	ORD01689	PROD0230	1	6077.64	6077.64
3625	ORD01689	PROD0092	4	140982.24	563928.96
3626	ORD01689	PROD0213	5	2985.64	14928.20
3628	ORD01691	PROD0059	1	35594.97	35594.97
3629	ORD01691	PROD0107	4	97418.23	389672.92
3630	ORD01692	PROD0100	4	110269.71	441078.84
3631	ORD01693	PROD0019	1	339524.65	339524.65
3632	ORD01694	PROD0152	3	1904.28	5712.84
3638	ORD01698	PROD0133	1	23616.92	23616.92
3639	ORD01699	PROD0112	1	35280.59	35280.59
3644	ORD01702	PROD0261	1	8607.87	8607.87
3645	ORD01702	PROD0033	2	245627.48	491254.96
3713	ORD01736	PROD0245	4	5638.01	22552.04
3653	ORD01707	PROD0126	1	13544.05	13544.05
3654	ORD01707	PROD0189	5	96833.78	484168.90
3655	ORD01708	PROD0173	3	39177.27	117531.81
3656	ORD01708	PROD0214	1	12483.89	12483.89
3657	ORD01709	PROD0034	4	272513.12	1090052.48
3658	ORD01709	PROD0099	1	130788.21	130788.21
3659	ORD01710	PROD0029	2	149660.33	299320.66
3660	ORD01710	PROD0261	4	8607.87	34431.48
3661	ORD01711	PROD0137	2	2019.05	4038.10
3662	ORD01712	PROD0196	5	2511.26	12556.30
3663	ORD01712	PROD0222	4	2802.33	11209.32
3664	ORD01713	PROD0129	1	5323.48	5323.48
3667	ORD01715	PROD0118	3	12699.55	38098.65
3668	ORD01715	PROD0122	2	16203.67	32407.34
3669	ORD01716	PROD0260	3	5050.94	15152.82
3670	ORD01716	PROD0223	2	7785.89	15571.78
3671	ORD01716	PROD0186	3	17418.14	52254.42
3676	ORD01720	PROD0241	1	1174.07	1174.07
3677	ORD01720	PROD0208	3	9010.85	27032.55
3678	ORD01720	PROD0169	4	41598.42	166393.68
3679	ORD01721	PROD0175	5	102750.60	513753.00
3680	ORD01721	PROD0141	5	11608.58	58042.90
3681	ORD01721	PROD0070	4	25905.43	103621.72
3684	ORD01723	PROD0012	4	248709.70	994838.80
3686	ORD01725	PROD0215	1	3385.48	3385.48
3687	ORD01725	PROD0222	3	2802.33	8406.99
3688	ORD01725	PROD0167	1	22365.17	22365.17
3689	ORD01726	PROD0093	2	8480.78	16961.56
3695	ORD01728	PROD0223	5	7785.89	38929.45
3696	ORD01728	PROD0037	2	266180.98	532361.96
3697	ORD01728	PROD0242	3	5755.30	17265.90
3698	ORD01728	PROD0275	4	10193.83	40775.32
3699	ORD01729	PROD0276	2	6563.88	13127.76
3700	ORD01729	PROD0166	4	101932.80	407731.20
3701	ORD01729	PROD0252	3	8223.52	24670.56
3702	ORD01729	PROD0220	5	11275.57	56377.85
3705	ORD01731	PROD0044	1	32574.27	32574.27
3706	ORD01732	PROD0044	1	32574.27	32574.27
3707	ORD01732	PROD0107	3	97418.23	292254.69
3708	ORD01733	PROD0269	4	2989.48	11957.92
3709	ORD01733	PROD0193	1	9954.82	9954.82
3710	ORD01734	PROD0156	3	21374.21	64122.63
3712	ORD01736	PROD0046	1	5762.47	5762.47
3714	ORD01737	PROD0220	4	11275.57	45102.28
3715	ORD01737	PROD0089	2	45090.58	90181.16
3722	ORD01740	PROD0012	3	248709.70	746129.10
3723	ORD01740	PROD0246	1	5399.76	5399.76
3724	ORD01740	PROD0216	3	3485.44	10456.32
3725	ORD01740	PROD0240	5	10219.29	51096.45
3726	ORD01741	PROD0107	1	97418.23	97418.23
3727	ORD01741	PROD0031	1	290316.23	290316.23
3728	ORD01741	PROD0030	5	253935.11	1269675.55
3729	ORD01742	PROD0077	3	20510.26	61530.78
3730	ORD01742	PROD0124	3	17164.25	51492.75
3731	ORD01742	PROD0149	2	8124.11	16248.22
3732	ORD01743	PROD0067	1	11627.77	11627.77
3733	ORD01743	PROD0211	1	8250.11	8250.11
3734	ORD01743	PROD0221	3	13121.51	39364.53
3735	ORD01743	PROD0017	4	257730.40	1030921.60
3749	ORD01751	PROD0182	1	33297.75	33297.75
3750	ORD01752	PROD0125	2	22153.16	44306.32
3752	ORD01754	PROD0086	2	49202.47	98404.94
3753	ORD01754	PROD0116	3	20859.43	62578.29
3754	ORD01754	PROD0259	1	7869.35	7869.35
3755	ORD01754	PROD0247	5	5416.29	27081.45
3756	ORD01755	PROD0049	1	27088.42	27088.42
3757	ORD01755	PROD0105	2	162358.65	324717.30
3758	ORD01756	PROD0137	4	2019.05	8076.20
3759	ORD01757	PROD0187	4	28776.04	115104.16
3760	ORD01757	PROD0086	5	49202.47	246012.35
3761	ORD01757	PROD0061	5	6821.26	34106.30
3763	ORD01759	PROD0057	3	24240.82	72722.46
3764	ORD01759	PROD0193	5	9954.82	49774.10
3765	ORD01759	PROD0236	2	7038.57	14077.14
3768	ORD01761	PROD0089	5	45090.58	225452.90
3769	ORD01761	PROD0160	4	12278.28	49113.12
3770	ORD01761	PROD0081	2	110991.10	221982.20
3771	ORD01761	PROD0053	1	43609.38	43609.38
3772	ORD01761	PROD0190	5	22778.54	113892.70
3775	ORD01763	PROD0165	3	22136.37	66409.11
3776	ORD01763	PROD0115	3	2277.24	6831.72
3777	ORD01763	PROD0020	1	293010.61	293010.61
3778	ORD01763	PROD0098	4	54814.26	219257.04
3779	ORD01763	PROD0031	4	290316.23	1161264.92
3780	ORD01764	PROD0161	4	25829.99	103319.96
3781	ORD01764	PROD0164	4	6702.72	26810.88
3784	ORD01767	PROD0195	1	24091.13	24091.13
3785	ORD01767	PROD0048	5	10843.12	54215.60
3786	ORD01767	PROD0009	2	198883.60	397767.20
3796	ORD01771	PROD0238	3	6026.76	18080.28
3797	ORD01772	PROD0063	5	35488.70	177443.50
3798	ORD01772	PROD0075	3	5182.19	15546.57
3806	ORD01776	PROD0252	5	8223.52	41117.60
3809	ORD01778	PROD0046	1	5762.47	5762.47
3810	ORD01779	PROD0142	5	8820.60	44103.00
3811	ORD01779	PROD0229	5	4112.45	20562.25
3812	ORD01779	PROD0041	1	14461.31	14461.31
3813	ORD01780	PROD0267	5	6230.11	31150.55
3814	ORD01780	PROD0166	3	101932.80	305798.40
3815	ORD01780	PROD0126	3	13544.05	40632.15
3816	ORD01780	PROD0087	1	12717.02	12717.02
3817	ORD01781	PROD0120	5	35341.43	176707.15
3818	ORD01781	PROD0158	3	12650.30	37950.90
3819	ORD01781	PROD0226	1	7172.97	7172.97
3820	ORD01781	PROD0066	4	36291.81	145167.24
3821	ORD01781	PROD0123	4	11097.43	44389.72
3822	ORD01782	PROD0202	1	12764.12	12764.12
3823	ORD01782	PROD0253	5	8743.34	43716.70
3824	ORD01783	PROD0212	2	8757.97	17515.94
3825	ORD01783	PROD0170	5	45302.42	226512.10
3826	ORD01783	PROD0195	2	24091.13	48182.26
3831	ORD01785	PROD0275	3	10193.83	30581.49
3836	ORD01788	PROD0169	5	41598.42	207992.10
3837	ORD01788	PROD0082	4	54346.36	217385.44
3838	ORD01788	PROD0258	3	4792.40	14377.20
3839	ORD01789	PROD0150	2	12003.33	24006.66
3840	ORD01789	PROD0270	4	907.09	3628.36
3841	ORD01789	PROD0198	4	57432.47	229729.88
3842	ORD01790	PROD0132	2	23990.67	47981.34
3843	ORD01790	PROD0172	3	95695.43	287086.29
3844	ORD01791	PROD0058	4	14691.81	58767.24
3845	ORD01791	PROD0207	5	11561.20	57806.00
3855	ORD01797	PROD0178	3	87684.88	263054.64
3856	ORD01798	PROD0021	4	34405.68	137622.72
3857	ORD01798	PROD0224	2	607.93	1215.86
3858	ORD01798	PROD0249	4	774.24	3096.96
3859	ORD01798	PROD0137	2	2019.05	4038.10
3860	ORD01799	PROD0033	5	245627.48	1228137.40
3861	ORD01799	PROD0055	2	42567.03	85134.06
3862	ORD01800	PROD0079	2	13912.80	27825.60
3863	ORD01800	PROD0257	1	2248.73	2248.73
3864	ORD01800	PROD0187	3	28776.04	86328.12
3865	ORD01800	PROD0022	3	222156.94	666470.82
3870	ORD01802	PROD0245	4	5638.01	22552.04
3868	ORD01802	PROD0190	3	22778.54	68335.62
3869	ORD01802	PROD0204	3	5933.15	17799.45
3871	ORD01802	PROD0263	1	8199.23	8199.23
3873	ORD01804	PROD0142	1	8820.60	8820.60
3874	ORD01804	PROD0154	3	19738.96	59216.88
3877	ORD01806	PROD0019	1	339524.65	339524.65
3878	ORD01806	PROD0247	3	5416.29	16248.87
3885	ORD01810	PROD0135	3	2595.60	7786.80
3886	ORD01810	PROD0124	5	17164.25	85821.25
3887	ORD01810	PROD0037	4	266180.98	1064723.92
3888	ORD01811	PROD0054	3	31709.48	95128.44
3889	ORD01811	PROD0115	3	2277.24	6831.72
3890	ORD01812	PROD0192	4	94625.99	378503.96
3891	ORD01813	PROD0191	3	44052.51	132157.53
3894	ORD01815	PROD0061	4	6821.26	27285.04
3895	ORD01815	PROD0100	2	110269.71	220539.42
3911	ORD01822	PROD0102	4	45021.16	180084.64
3912	ORD01823	PROD0251	4	5175.86	20703.44
3913	ORD01823	PROD0030	2	253935.11	507870.22
3915	ORD01825	PROD0159	4	17483.90	69935.60
3916	ORD01825	PROD0085	3	89243.32	267729.96
3918	ORD01827	PROD0006	2	308912.61	617825.22
3919	ORD01827	PROD0027	3	26206.57	78619.71
3920	ORD01827	PROD0234	4	6463.53	25854.12
3921	ORD01828	PROD0176	2	30789.84	61579.68
3928	ORD01832	PROD0194	2	24802.59	49605.18
3929	ORD01832	PROD0191	2	44052.51	88105.02
3930	ORD01833	PROD0273	1	1784.35	1784.35
3931	ORD01833	PROD0176	2	30789.84	61579.68
3933	ORD01835	PROD0220	3	11275.57	33826.71
3934	ORD01835	PROD0263	1	8199.23	8199.23
3936	ORD01837	PROD0227	2	9871.34	19742.68
3941	ORD01839	PROD0034	2	272513.12	545026.24
3942	ORD01839	PROD0214	1	12483.89	12483.89
3945	ORD01842	PROD0206	3	5427.42	16282.26
3946	ORD01842	PROD0019	2	339524.65	679049.30
3950	ORD01845	PROD0201	4	10976.40	43905.60
3951	ORD01846	PROD0128	4	24463.34	97853.36
3958	ORD01851	PROD0156	2	21374.21	42748.42
3959	ORD01851	PROD0025	5	330590.39	1652951.95
3960	ORD01851	PROD0046	2	5762.47	11524.94
3963	ORD01853	PROD0014	4	289145.53	1156582.12
3964	ORD01853	PROD0099	5	130788.21	653941.05
3965	ORD01853	PROD0017	4	257730.40	1030921.60
3966	ORD01853	PROD0177	1	102403.06	102403.06
3967	ORD01854	PROD0048	4	10843.12	43372.48
3970	ORD01856	PROD0224	1	607.93	607.93
3971	ORD01856	PROD0032	4	246601.80	986407.20
3976	ORD01859	PROD0225	1	9270.30	9270.30
3977	ORD01859	PROD0112	5	35280.59	176402.95
3982	ORD01862	PROD0180	4	60582.65	242330.60
3984	ORD01864	PROD0260	3	5050.94	15152.82
3985	ORD01865	PROD0094	2	117897.53	235795.06
3986	ORD01865	PROD0209	5	2728.52	13642.60
3987	ORD01865	PROD0035	2	190414.55	380829.10
3988	ORD01866	PROD0234	1	6463.53	6463.53
3989	ORD01866	PROD0225	2	9270.30	18540.60
3990	ORD01866	PROD0192	5	94625.99	473129.95
3991	ORD01866	PROD0240	5	10219.29	51096.45
3992	ORD01867	PROD0228	1	6170.81	6170.81
3998	ORD01870	PROD0015	2	222324.51	444649.02
3999	ORD01870	PROD0194	1	24802.59	24802.59
4000	ORD01870	PROD0133	4	23616.92	94467.68
4001	ORD01871	PROD0072	5	43142.24	215711.20
4002	ORD01872	PROD0196	3	2511.26	7533.78
4003	ORD01873	PROD0267	1	6230.11	6230.11
4005	ORD01875	PROD0218	4	5238.20	20952.80
4006	ORD01875	PROD0272	5	11096.23	55481.15
4007	ORD01876	PROD0128	1	24463.34	24463.34
4011	ORD01879	PROD0210	5	14712.50	73562.50
4012	ORD01879	PROD0089	1	45090.58	45090.58
4013	ORD01880	PROD0100	2	110269.71	220539.42
4014	ORD01881	PROD0092	3	140982.24	422946.72
4015	ORD01881	PROD0270	3	907.09	2721.27
4016	ORD01881	PROD0250	1	4620.81	4620.81
4017	ORD01882	PROD0043	3	16739.67	50219.01
4018	ORD01882	PROD0251	3	5175.86	15527.58
4019	ORD01882	PROD0185	3	112356.62	337069.86
4024	ORD01885	PROD0278	2	6353.37	12706.74
4027	ORD01887	PROD0206	4	5427.42	21709.68
4028	ORD01888	PROD0236	1	7038.57	7038.57
4029	ORD01888	PROD0004	3	39811.79	119435.37
4035	ORD01892	PROD0064	5	34644.88	173224.40
4036	ORD01892	PROD0040	4	47715.49	190861.96
4037	ORD01892	PROD0220	1	11275.57	11275.57
4038	ORD01892	PROD0109	3	70228.44	210685.32
4039	ORD01893	PROD0057	2	24240.82	48481.64
4040	ORD01893	PROD0159	3	17483.90	52451.70
4047	ORD01898	PROD0081	2	110991.10	221982.20
4048	ORD01898	PROD0025	3	330590.39	991771.17
4049	ORD01899	PROD0026	5	34248.48	171242.40
4050	ORD01899	PROD0016	1	256280.50	256280.50
4051	ORD01899	PROD0147	4	5055.12	20220.48
4052	ORD01899	PROD0005	3	85978.02	257934.06
4053	ORD01900	PROD0071	2	9870.56	19741.12
4054	ORD01901	PROD0044	1	32574.27	32574.27
4055	ORD01901	PROD0138	1	15463.10	15463.10
4056	ORD01902	PROD0094	4	117897.53	471590.12
4059	ORD01904	PROD0140	3	2847.84	8543.52
4060	ORD01904	PROD0230	2	6077.64	12155.28
4064	ORD01906	PROD0121	3	17176.67	51530.01
4065	ORD01906	PROD0207	1	11561.20	11561.20
4066	ORD01907	PROD0154	4	19738.96	78955.84
4067	ORD01908	PROD0167	3	22365.17	67095.51
4068	ORD01908	PROD0163	1	18374.63	18374.63
4069	ORD01909	PROD0032	4	246601.80	986407.20
4074	ORD01912	PROD0114	2	7586.49	15172.98
4075	ORD01913	PROD0092	2	140982.24	281964.48
4079	ORD01915	PROD0015	4	222324.51	889298.04
4080	ORD01916	PROD0137	1	2019.05	2019.05
4082	ORD01918	PROD0265	3	11740.65	35221.95
4083	ORD01918	PROD0039	1	257535.23	257535.23
4084	ORD01918	PROD0047	3	5512.81	16538.43
4085	ORD01918	PROD0128	2	24463.34	48926.68
4087	ORD01920	PROD0068	4	43176.46	172705.84
4088	ORD01920	PROD0143	1	13171.72	13171.72
4089	ORD01920	PROD0210	4	14712.50	58850.00
4090	ORD01920	PROD0126	2	13544.05	27088.10
4091	ORD01920	PROD0009	1	198883.60	198883.60
4096	ORD01924	PROD0020	1	293010.61	293010.61
4097	ORD01924	PROD0056	3	6299.62	18898.86
4098	ORD01924	PROD0023	4	276589.43	1106357.72
4102	ORD01926	PROD0209	4	2728.52	10914.08
4103	ORD01926	PROD0261	5	8607.87	43039.35
4109	ORD01930	PROD0115	5	2277.24	11386.20
4110	ORD01930	PROD0015	2	222324.51	444649.02
4111	ORD01931	PROD0105	4	162358.65	649434.60
4112	ORD01931	PROD0211	4	8250.11	33000.44
4113	ORD01931	PROD0237	3	7201.43	21604.29
4114	ORD01931	PROD0041	5	14461.31	72306.55
4115	ORD01931	PROD0134	1	19220.41	19220.41
4117	ORD01933	PROD0188	2	51993.13	103986.26
4118	ORD01933	PROD0206	3	5427.42	16282.26
4119	ORD01934	PROD0076	1	27116.85	27116.85
4120	ORD01934	PROD0009	2	198883.60	397767.20
4122	ORD01936	PROD0083	4	160848.97	643395.88
4132	ORD01939	PROD0031	1	290316.23	290316.23
4133	ORD01939	PROD0015	5	222324.51	1111622.55
4135	ORD01941	PROD0184	5	48414.15	242070.75
4136	ORD01941	PROD0052	5	23501.69	117508.45
4137	ORD01942	PROD0029	2	149660.33	299320.66
4138	ORD01942	PROD0003	2	49538.31	99076.62
4139	ORD01943	PROD0053	3	43609.38	130828.14
4140	ORD01943	PROD0095	1	49921.23	49921.23
4141	ORD01944	PROD0085	1	89243.32	89243.32
4142	ORD01944	PROD0260	4	5050.94	20203.76
4143	ORD01944	PROD0007	4	290642.30	1162569.20
4144	ORD01944	PROD0173	4	39177.27	156709.08
4147	ORD01946	PROD0214	2	12483.89	24967.78
4148	ORD01946	PROD0043	4	16739.67	66958.68
4149	ORD01946	PROD0168	4	100026.32	400105.28
4150	ORD01947	PROD0133	5	23616.92	118084.60
4151	ORD01948	PROD0121	3	17176.67	51530.01
4152	ORD01948	PROD0237	1	7201.43	7201.43
4153	ORD01948	PROD0040	2	47715.49	95430.98
4154	ORD01948	PROD0154	1	19738.96	19738.96
4155	ORD01949	PROD0063	1	35488.70	35488.70
4156	ORD01949	PROD0135	5	2595.60	12978.00
4157	ORD01950	PROD0048	5	10843.12	54215.60
4161	ORD01954	PROD0002	3	102447.74	307343.22
4162	ORD01954	PROD0159	4	17483.90	69935.60
4163	ORD01955	PROD0152	4	1904.28	7617.12
4164	ORD01955	PROD0258	5	4792.40	23962.00
4165	ORD01956	PROD0200	4	29196.20	116784.80
4166	ORD01956	PROD0140	2	2847.84	5695.68
4167	ORD01956	PROD0162	2	2672.21	5344.42
4172	ORD01959	PROD0154	1	19738.96	19738.96
4173	ORD01959	PROD0037	4	266180.98	1064723.92
4174	ORD01960	PROD0024	4	321716.92	1286867.68
4175	ORD01960	PROD0179	4	21340.87	85363.48
4176	ORD01961	PROD0049	3	27088.42	81265.26
4177	ORD01961	PROD0085	2	89243.32	178486.64
4178	ORD01962	PROD0267	4	6230.11	24920.44
4181	ORD01964	PROD0234	4	6463.53	25854.12
4182	ORD01964	PROD0240	2	10219.29	20438.58
4183	ORD01964	PROD0003	4	49538.31	198153.24
4184	ORD01964	PROD0037	3	266180.98	798542.94
4185	ORD01964	PROD0228	5	6170.81	30854.05
4189	ORD01967	PROD0217	4	7092.62	28370.48
4195	ORD01969	PROD0197	3	113579.08	340737.24
4196	ORD01969	PROD0207	2	11561.20	23122.40
4203	ORD01973	PROD0247	4	5416.29	21665.16
4204	ORD01973	PROD0200	1	29196.20	29196.20
4205	ORD01973	PROD0226	3	7172.97	21518.91
4206	ORD01973	PROD0018	3	120439.60	361318.80
4212	ORD01976	PROD0168	5	100026.32	500131.60
4213	ORD01976	PROD0185	2	112356.62	224713.24
4214	ORD01976	PROD0249	3	774.24	2322.72
4215	ORD01976	PROD0003	2	49538.31	99076.62
4216	ORD01976	PROD0119	4	47472.78	189891.12
4224	ORD01979	PROD0264	1	4118.15	4118.15
4225	ORD01979	PROD0042	2	44258.35	88516.70
4226	ORD01979	PROD0072	1	43142.24	43142.24
4227	ORD01980	PROD0156	5	21374.21	106871.05
4228	ORD01980	PROD0193	5	9954.82	49774.10
4230	ORD01982	PROD0126	4	13544.05	54176.20
4231	ORD01982	PROD0212	1	8757.97	8757.97
4232	ORD01982	PROD0186	5	17418.14	87090.70
4233	ORD01982	PROD0163	2	18374.63	36749.26
4239	ORD01985	PROD0212	4	8757.97	35031.88
4240	ORD01985	PROD0237	3	7201.43	21604.29
4244	ORD01987	PROD0134	2	19220.41	38440.82
4245	ORD01987	PROD0165	2	22136.37	44272.74
4249	ORD01990	PROD0013	4	337113.25	1348453.00
4250	ORD01990	PROD0165	1	22136.37	22136.37
4251	ORD01990	PROD0256	3	1625.49	4876.47
4253	ORD01992	PROD0078	1	18117.48	18117.48
4256	ORD01995	PROD0251	2	5175.86	10351.72
4257	ORD01995	PROD0240	4	10219.29	40877.16
4263	ORD01997	PROD0182	4	33297.75	133191.00
4264	ORD01998	PROD0150	1	12003.33	12003.33
4265	ORD01998	PROD0083	1	160848.97	160848.97
4266	ORD01998	PROD0106	5	137481.28	687406.40
4267	ORD01998	PROD0107	1	97418.23	97418.23
4274	ORD02001	PROD0033	5	245627.48	1228137.40
4275	ORD02002	PROD0083	4	160848.97	643395.88
4276	ORD02003	PROD0168	1	100026.32	100026.32
4277	ORD02003	PROD0181	1	63768.87	63768.87
4278	ORD02003	PROD0170	1	45302.42	45302.42
4280	ORD02005	PROD0006	4	308912.61	1235650.44
4281	ORD02006	PROD0098	3	54814.26	164442.78
4282	ORD02007	PROD0059	5	35594.97	177974.85
4283	ORD02007	PROD0223	1	7785.89	7785.89
4284	ORD02007	PROD0073	5	6732.32	33661.60
4285	ORD02008	PROD0242	1	5755.30	5755.30
4286	ORD02008	PROD0157	2	10758.03	21516.06
4287	ORD02009	PROD0200	3	29196.20	87588.60
4288	ORD02009	PROD0051	5	33329.69	166648.45
4289	ORD02009	PROD0224	4	607.93	2431.72
4290	ORD02009	PROD0201	1	10976.40	10976.40
4295	ORD02013	PROD0025	3	330590.39	991771.17
4297	ORD02015	PROD0102	1	45021.16	45021.16
4298	ORD02015	PROD0187	1	28776.04	28776.04
4299	ORD02015	PROD0024	3	321716.92	965150.76
4300	ORD02015	PROD0055	2	42567.03	85134.06
4303	ORD02017	PROD0184	5	48414.15	242070.75
4304	ORD02018	PROD0159	2	17483.90	34967.80
4305	ORD02019	PROD0187	3	28776.04	86328.12
4306	ORD02019	PROD0093	3	8480.78	25442.34
4307	ORD02019	PROD0024	5	321716.92	1608584.60
4309	ORD02021	PROD0074	3	13460.87	40382.61
4310	ORD02021	PROD0227	3	9871.34	29614.02
4316	ORD02023	PROD0222	1	2802.33	2802.33
4327	ORD02028	PROD0146	5	9207.08	46035.40
4329	ORD02030	PROD0176	3	30789.84	92369.52
4330	ORD02030	PROD0146	4	9207.08	36828.32
4331	ORD02030	PROD0119	3	47472.78	142418.34
4332	ORD02031	PROD0108	4	121332.02	485328.08
4333	ORD02031	PROD0265	5	11740.65	58703.25
4334	ORD02031	PROD0169	5	41598.42	207992.10
4335	ORD02031	PROD0028	4	316366.34	1265465.36
4343	ORD02034	PROD0252	5	8223.52	41117.60
4344	ORD02034	PROD0261	2	8607.87	17215.74
4345	ORD02035	PROD0175	5	102750.60	513753.00
4346	ORD02035	PROD0067	3	11627.77	34883.31
4347	ORD02036	PROD0170	1	45302.42	45302.42
4349	ORD02038	PROD0125	3	22153.16	66459.48
4350	ORD02038	PROD0183	4	26053.15	104212.60
4351	ORD02038	PROD0161	1	25829.99	25829.99
4352	ORD02038	PROD0189	2	96833.78	193667.56
4353	ORD02039	PROD0185	1	112356.62	112356.62
4354	ORD02039	PROD0141	2	11608.58	23217.16
4355	ORD02039	PROD0241	1	1174.07	1174.07
4356	ORD02039	PROD0201	5	10976.40	54882.00
4359	ORD02041	PROD0014	3	289145.53	867436.59
4362	ORD02043	PROD0220	4	11275.57	45102.28
4363	ORD02043	PROD0004	4	39811.79	159247.16
4364	ORD02043	PROD0256	5	1625.49	8127.45
4372	ORD02047	PROD0237	1	7201.43	7201.43
4373	ORD02047	PROD0013	3	337113.25	1011339.75
4374	ORD02048	PROD0244	1	1664.99	1664.99
4375	ORD02048	PROD0084	4	37258.14	149032.56
4380	ORD02051	PROD0166	4	101932.80	407731.20
4386	ORD02054	PROD0010	3	270434.00	811302.00
4387	ORD02054	PROD0219	4	14849.13	59396.52
4388	ORD02055	PROD0239	4	1047.73	4190.92
4389	ORD02055	PROD0129	4	5323.48	21293.92
4390	ORD02056	PROD0240	4	10219.29	40877.16
4391	ORD02057	PROD0079	3	13912.80	41738.40
4392	ORD02057	PROD0280	2	7685.53	15371.06
4403	ORD02062	PROD0134	5	19220.41	96102.05
4404	ORD02062	PROD0011	4	314229.61	1256918.44
4407	ORD02064	PROD0116	4	20859.43	83437.72
4408	ORD02065	PROD0151	1	24271.64	24271.64
4409	ORD02065	PROD0212	1	8757.97	8757.97
4416	ORD02068	PROD0171	5	105588.96	527944.80
4417	ORD02068	PROD0118	4	12699.55	50798.20
4418	ORD02069	PROD0133	2	23616.92	47233.84
4419	ORD02070	PROD0188	1	51993.13	51993.13
4420	ORD02071	PROD0203	5	3538.98	17694.90
4421	ORD02071	PROD0230	1	6077.64	6077.64
4422	ORD02071	PROD0195	4	24091.13	96364.52
4423	ORD02072	PROD0235	3	1609.74	4829.22
4424	ORD02072	PROD0155	5	17522.15	87610.75
4425	ORD02072	PROD0024	3	321716.92	965150.76
4426	ORD02073	PROD0264	2	4118.15	8236.30
4427	ORD02073	PROD0030	3	253935.11	761805.33
4429	ORD02075	PROD0163	5	18374.63	91873.15
4430	ORD02075	PROD0075	1	5182.19	5182.19
4431	ORD02075	PROD0226	1	7172.97	7172.97
4440	ORD02079	PROD0005	5	85978.02	429890.10
4441	ORD02079	PROD0172	2	95695.43	191390.86
4442	ORD02079	PROD0170	5	45302.42	226512.10
4443	ORD02079	PROD0152	5	1904.28	9521.40
4445	ORD02081	PROD0234	4	6463.53	25854.12
4446	ORD02081	PROD0054	5	31709.48	158547.40
4447	ORD02082	PROD0173	5	39177.27	195886.35
4448	ORD02083	PROD0220	5	11275.57	56377.85
4449	ORD02083	PROD0258	5	4792.40	23962.00
4450	ORD02084	PROD0169	5	41598.42	207992.10
4456	ORD02088	PROD0246	3	5399.76	16199.28
4457	ORD02088	PROD0125	4	22153.16	88612.64
4458	ORD02088	PROD0217	1	7092.62	7092.62
4459	ORD02089	PROD0068	2	43176.46	86352.92
4460	ORD02090	PROD0130	5	1182.88	5914.40
4461	ORD02091	PROD0154	2	19738.96	39477.92
4462	ORD02091	PROD0124	1	17164.25	17164.25
4463	ORD02092	PROD0212	2	8757.97	17515.94
4464	ORD02093	PROD0054	2	31709.48	63418.96
4465	ORD02093	PROD0067	5	11627.77	58138.85
4466	ORD02093	PROD0040	1	47715.49	47715.49
4472	ORD02096	PROD0268	5	2944.75	14723.75
4473	ORD02096	PROD0277	1	9657.13	9657.13
4474	ORD02096	PROD0196	3	2511.26	7533.78
4475	ORD02096	PROD0222	5	2802.33	14011.65
4478	ORD02098	PROD0277	5	9657.13	48285.65
4479	ORD02099	PROD0222	4	2802.33	11209.32
4482	ORD02101	PROD0116	4	20859.43	83437.72
4483	ORD02101	PROD0138	1	15463.10	15463.10
4490	ORD02105	PROD0230	2	6077.64	12155.28
4491	ORD02105	PROD0012	3	248709.70	746129.10
4492	ORD02105	PROD0160	1	12278.28	12278.28
4493	ORD02106	PROD0115	4	2277.24	9108.96
4494	ORD02106	PROD0231	1	6206.49	6206.49
4499	ORD02108	PROD0143	5	13171.72	65858.60
4530	ORD02121	PROD0104	2	73744.65	147489.30
4507	ORD02112	PROD0025	2	330590.39	661180.78
4508	ORD02113	PROD0259	4	7869.35	31477.40
4509	ORD02113	PROD0256	2	1625.49	3250.98
4510	ORD02113	PROD0047	5	5512.81	27564.05
4515	ORD02115	PROD0262	1	3172.89	3172.89
4516	ORD02115	PROD0236	3	7038.57	21115.71
4524	ORD02119	PROD0272	4	11096.23	44384.92
4525	ORD02119	PROD0257	3	2248.73	6746.19
4526	ORD02119	PROD0084	1	37258.14	37258.14
4527	ORD02119	PROD0039	1	257535.23	257535.23
4528	ORD02120	PROD0031	2	290316.23	580632.46
4529	ORD02121	PROD0238	5	6026.76	30133.80
4531	ORD02121	PROD0014	3	289145.53	867436.59
4532	ORD02121	PROD0263	1	8199.23	8199.23
4536	ORD02123	PROD0047	1	5512.81	5512.81
4537	ORD02123	PROD0091	5	141135.80	705679.00
4538	ORD02124	PROD0032	1	246601.80	246601.80
4541	ORD02127	PROD0222	4	2802.33	11209.32
4542	ORD02127	PROD0091	4	141135.80	564543.20
4543	ORD02128	PROD0085	5	89243.32	446216.60
4547	ORD02132	PROD0106	1	137481.28	137481.28
4548	ORD02133	PROD0154	1	19738.96	19738.96
4552	ORD02136	PROD0266	4	408.26	1633.04
4553	ORD02137	PROD0236	2	7038.57	14077.14
4554	ORD02138	PROD0258	1	4792.40	4792.40
4555	ORD02138	PROD0040	1	47715.49	47715.49
4562	ORD02141	PROD0005	1	85978.02	85978.02
4563	ORD02142	PROD0128	2	24463.34	48926.68
4564	ORD02142	PROD0094	3	117897.53	353692.59
4565	ORD02143	PROD0278	5	6353.37	31766.85
4566	ORD02144	PROD0253	5	8743.34	43716.70
4567	ORD02144	PROD0096	3	179864.29	539592.87
4568	ORD02144	PROD0073	5	6732.32	33661.60
4569	ORD02145	PROD0059	5	35594.97	177974.85
4574	ORD02147	PROD0133	2	23616.92	47233.84
4577	ORD02149	PROD0177	5	102403.06	512015.30
4578	ORD02149	PROD0087	4	12717.02	50868.08
4579	ORD02150	PROD0057	3	24240.82	72722.46
4580	ORD02150	PROD0138	1	15463.10	15463.10
4585	ORD02153	PROD0204	5	5933.15	29665.75
4589	ORD02156	PROD0048	4	10843.12	43372.48
4590	ORD02156	PROD0212	2	8757.97	17515.94
4591	ORD02156	PROD0071	2	9870.56	19741.12
4592	ORD02156	PROD0078	5	18117.48	90587.40
4594	ORD02158	PROD0167	3	22365.17	67095.51
4595	ORD02158	PROD0231	1	6206.49	6206.49
4596	ORD02158	PROD0011	5	314229.61	1571148.05
4597	ORD02158	PROD0100	5	110269.71	551348.55
4598	ORD02159	PROD0133	1	23616.92	23616.92
4599	ORD02160	PROD0216	2	3485.44	6970.88
4601	ORD02162	PROD0151	1	24271.64	24271.64
4602	ORD02162	PROD0071	4	9870.56	39482.24
4607	ORD02166	PROD0047	1	5512.81	5512.81
4608	ORD02166	PROD0024	1	321716.92	321716.92
4609	ORD02167	PROD0173	4	39177.27	156709.08
4610	ORD02168	PROD0145	1	22657.06	22657.06
4657	ORD02190	PROD0205	2	7224.75	14449.50
4621	ORD02173	PROD0196	1	2511.26	2511.26
4628	ORD02176	PROD0062	3	22431.17	67293.51
4629	ORD02176	PROD0076	2	27116.85	54233.70
4630	ORD02177	PROD0084	4	37258.14	149032.56
4631	ORD02177	PROD0085	4	89243.32	356973.28
4635	ORD02179	PROD0272	1	11096.23	11096.23
4636	ORD02179	PROD0069	1	39168.98	39168.98
4644	ORD02182	PROD0156	4	21374.21	85496.84
4645	ORD02182	PROD0277	4	9657.13	38628.52
4646	ORD02183	PROD0138	4	15463.10	61852.40
4647	ORD02183	PROD0175	3	102750.60	308251.80
4648	ORD02184	PROD0262	1	3172.89	3172.89
4649	ORD02184	PROD0083	4	160848.97	643395.88
4650	ORD02184	PROD0258	5	4792.40	23962.00
4651	ORD02185	PROD0068	2	43176.46	86352.92
4652	ORD02186	PROD0200	3	29196.20	87588.60
4655	ORD02189	PROD0065	3	30524.10	91572.30
4656	ORD02190	PROD0108	5	121332.02	606660.10
4658	ORD02190	PROD0209	2	2728.52	5457.04
4660	ORD02192	PROD0091	3	141135.80	423407.40
4661	ORD02192	PROD0096	5	179864.29	899321.45
4665	ORD02194	PROD0098	2	54814.26	109628.52
4670	ORD02196	PROD0269	3	2989.48	8968.44
4673	ORD02198	PROD0114	5	7586.49	37932.45
4674	ORD02198	PROD0238	2	6026.76	12053.52
4683	ORD02203	PROD0235	3	1609.74	4829.22
4684	ORD02203	PROD0115	4	2277.24	9108.96
4687	ORD02205	PROD0079	1	13912.80	13912.80
4688	ORD02206	PROD0213	2	2985.64	5971.28
4689	ORD02207	PROD0147	4	5055.12	20220.48
4690	ORD02208	PROD0252	2	8223.52	16447.04
4695	ORD02210	PROD0110	5	23332.73	116663.65
4696	ORD02211	PROD0006	3	308912.61	926737.83
4702	ORD02213	PROD0012	1	248709.70	248709.70
4703	ORD02213	PROD0102	4	45021.16	180084.64
4704	ORD02213	PROD0254	3	9824.37	29473.11
4709	ORD02215	PROD0120	4	35341.43	141365.72
4710	ORD02215	PROD0277	5	9657.13	48285.65
4711	ORD02216	PROD0170	4	45302.42	181209.68
4715	ORD02219	PROD0081	3	110991.10	332973.30
4718	ORD02221	PROD0208	5	9010.85	45054.25
4720	ORD02223	PROD0149	4	8124.11	32496.44
4721	ORD02223	PROD0196	1	2511.26	2511.26
4722	ORD02224	PROD0236	5	7038.57	35192.85
4723	ORD02224	PROD0221	1	13121.51	13121.51
4724	ORD02225	PROD0023	3	276589.43	829768.29
4725	ORD02225	PROD0122	3	16203.67	48611.01
4726	ORD02225	PROD0208	5	9010.85	45054.25
4728	ORD02227	PROD0206	1	5427.42	5427.42
4729	ORD02227	PROD0001	2	279610.57	559221.14
4736	ORD02232	PROD0160	5	12278.28	61391.40
4743	ORD02235	PROD0038	4	88262.22	353048.88
4744	ORD02235	PROD0242	3	5755.30	17265.90
4750	ORD02238	PROD0033	1	245627.48	245627.48
4751	ORD02238	PROD0278	1	6353.37	6353.37
4755	ORD02240	PROD0146	3	9207.08	27621.24
4759	ORD02242	PROD0217	1	7092.62	7092.62
4760	ORD02242	PROD0004	4	39811.79	159247.16
4761	ORD02242	PROD0266	3	408.26	1224.78
4762	ORD02243	PROD0278	1	6353.37	6353.37
4763	ORD02243	PROD0039	3	257535.23	772605.69
4764	ORD02243	PROD0256	1	1625.49	1625.49
4765	ORD02244	PROD0181	1	63768.87	63768.87
4769	ORD02247	PROD0227	2	9871.34	19742.68
4770	ORD02247	PROD0221	5	13121.51	65607.55
4771	ORD02247	PROD0092	3	140982.24	422946.72
4772	ORD02247	PROD0162	4	2672.21	10688.84
4774	ORD02249	PROD0151	5	24271.64	121358.20
4775	ORD02249	PROD0193	3	9954.82	29864.46
4776	ORD02250	PROD0044	5	32574.27	162871.35
4777	ORD02250	PROD0062	4	22431.17	89724.68
4778	ORD02250	PROD0200	4	29196.20	116784.80
4779	ORD02250	PROD0199	1	28468.05	28468.05
4780	ORD02250	PROD0071	2	9870.56	19741.12
4787	ORD02254	PROD0268	5	2944.75	14723.75
4788	ORD02254	PROD0159	4	17483.90	69935.60
4789	ORD02255	PROD0077	1	20510.26	20510.26
4790	ORD02256	PROD0061	5	6821.26	34106.30
4791	ORD02257	PROD0077	2	20510.26	41020.52
4792	ORD02258	PROD0139	3	14201.82	42605.46
4793	ORD02258	PROD0133	1	23616.92	23616.92
4794	ORD02258	PROD0116	3	20859.43	62578.29
4795	ORD02258	PROD0056	1	6299.62	6299.62
4796	ORD02259	PROD0101	4	114695.41	458781.64
4797	ORD02259	PROD0239	5	1047.73	5238.65
4798	ORD02260	PROD0059	4	35594.97	142379.88
4799	ORD02261	PROD0265	1	11740.65	11740.65
4800	ORD02261	PROD0042	1	44258.35	44258.35
4801	ORD02261	PROD0258	5	4792.40	23962.00
4802	ORD02261	PROD0056	4	6299.62	25198.48
4806	ORD02263	PROD0154	5	19738.96	98694.80
4810	ORD02265	PROD0096	3	179864.29	539592.87
4811	ORD02265	PROD0013	1	337113.25	337113.25
4812	ORD02266	PROD0242	2	5755.30	11510.60
4813	ORD02267	PROD0277	4	9657.13	38628.52
4814	ORD02267	PROD0280	3	7685.53	23056.59
4815	ORD02268	PROD0242	3	5755.30	17265.90
4816	ORD02269	PROD0098	1	54814.26	54814.26
4817	ORD02270	PROD0247	1	5416.29	5416.29
4818	ORD02270	PROD0152	3	1904.28	5712.84
4820	ORD02272	PROD0246	1	5399.76	5399.76
4821	ORD02273	PROD0231	1	6206.49	6206.49
4822	ORD02273	PROD0085	1	89243.32	89243.32
4823	ORD02273	PROD0222	1	2802.33	2802.33
4824	ORD02273	PROD0240	1	10219.29	10219.29
4825	ORD02274	PROD0187	3	28776.04	86328.12
4826	ORD02274	PROD0278	5	6353.37	31766.85
4827	ORD02275	PROD0067	3	11627.77	34883.31
4828	ORD02275	PROD0060	5	10877.79	54388.95
4829	ORD02276	PROD0252	5	8223.52	41117.60
4830	ORD02276	PROD0148	1	3628.18	3628.18
4831	ORD02277	PROD0165	1	22136.37	22136.37
4832	ORD02277	PROD0136	3	8175.35	24526.05
4833	ORD02277	PROD0021	4	34405.68	137622.72
4834	ORD02277	PROD0225	2	9270.30	18540.60
4835	ORD02278	PROD0236	4	7038.57	28154.28
4836	ORD02278	PROD0242	3	5755.30	17265.90
4839	ORD02280	PROD0066	5	36291.81	181459.05
4840	ORD02280	PROD0062	2	22431.17	44862.34
4841	ORD02281	PROD0069	2	39168.98	78337.96
4842	ORD02281	PROD0219	5	14849.13	74245.65
4843	ORD02281	PROD0134	2	19220.41	38440.82
4846	ORD02283	PROD0136	3	8175.35	24526.05
4847	ORD02283	PROD0106	5	137481.28	687406.40
4848	ORD02284	PROD0222	3	2802.33	8406.99
4849	ORD02285	PROD0240	1	10219.29	10219.29
4850	ORD02285	PROD0046	3	5762.47	17287.41
4851	ORD02285	PROD0243	5	10094.25	50471.25
4852	ORD02286	PROD0211	3	8250.11	24750.33
4860	ORD02290	PROD0178	2	87684.88	175369.76
4866	ORD02293	PROD0102	4	45021.16	180084.64
4872	ORD02295	PROD0014	4	289145.53	1156582.12
4873	ORD02295	PROD0196	5	2511.26	12556.30
4874	ORD02296	PROD0202	4	12764.12	51056.48
4875	ORD02296	PROD0061	2	6821.26	13642.52
4876	ORD02296	PROD0024	4	321716.92	1286867.68
4877	ORD02296	PROD0093	3	8480.78	25442.34
4878	ORD02296	PROD0100	2	110269.71	220539.42
4882	ORD02299	PROD0158	4	12650.30	50601.20
4883	ORD02299	PROD0050	4	26917.21	107668.84
4896	ORD02305	PROD0019	3	339524.65	1018573.95
4897	ORD02305	PROD0067	2	11627.77	23255.54
4898	ORD02305	PROD0130	4	1182.88	4731.52
4899	ORD02305	PROD0013	4	337113.25	1348453.00
4904	ORD02308	PROD0207	5	11561.20	57806.00
4905	ORD02309	PROD0269	1	2989.48	2989.48
4906	ORD02310	PROD0141	1	11608.58	11608.58
4912	ORD02314	PROD0028	1	316366.34	316366.34
4913	ORD02314	PROD0146	1	9207.08	9207.08
4914	ORD02315	PROD0168	4	100026.32	400105.28
4915	ORD02315	PROD0059	3	35594.97	106784.91
4916	ORD02316	PROD0101	2	114695.41	229390.82
4921	ORD02318	PROD0207	5	11561.20	57806.00
4922	ORD02319	PROD0278	5	6353.37	31766.85
4923	ORD02319	PROD0062	2	22431.17	44862.34
4924	ORD02319	PROD0082	2	54346.36	108692.72
4927	ORD02322	PROD0006	1	308912.61	308912.61
4928	ORD02322	PROD0251	4	5175.86	20703.44
4929	ORD02322	PROD0034	3	272513.12	817539.36
4930	ORD02323	PROD0271	5	1989.71	9948.55
4931	ORD02323	PROD0105	3	162358.65	487075.95
4932	ORD02323	PROD0276	5	6563.88	32819.40
4933	ORD02323	PROD0155	2	17522.15	35044.30
4934	ORD02323	PROD0226	1	7172.97	7172.97
4935	ORD02324	PROD0004	3	39811.79	119435.37
4936	ORD02324	PROD0150	5	12003.33	60016.65
4985	ORD02348	PROD0104	4	73744.65	294978.60
4943	ORD02328	PROD0028	1	316366.34	316366.34
4948	ORD02330	PROD0181	1	63768.87	63768.87
4949	ORD02330	PROD0141	2	11608.58	23217.16
4950	ORD02331	PROD0111	5	2676.03	13380.15
4951	ORD02331	PROD0048	3	10843.12	32529.36
4956	ORD02333	PROD0265	3	11740.65	35221.95
4957	ORD02334	PROD0077	3	20510.26	61530.78
4958	ORD02334	PROD0139	2	14201.82	28403.64
4959	ORD02334	PROD0169	5	41598.42	207992.10
4964	ORD02338	PROD0156	3	21374.21	64122.63
4967	ORD02340	PROD0171	1	105588.96	105588.96
4971	ORD02342	PROD0169	4	41598.42	166393.68
4972	ORD02342	PROD0154	4	19738.96	78955.84
4973	ORD02343	PROD0061	2	6821.26	13642.52
4981	ORD02346	PROD0176	2	30789.84	61579.68
4982	ORD02346	PROD0016	4	256280.50	1025122.00
4984	ORD02348	PROD0058	1	14691.81	14691.81
4986	ORD02348	PROD0142	1	8820.60	8820.60
4987	ORD02349	PROD0173	3	39177.27	117531.81
4989	ORD02351	PROD0183	5	26053.15	130265.75
4990	ORD02351	PROD0004	1	39811.79	39811.79
4991	ORD02351	PROD0155	1	17522.15	17522.15
4992	ORD02352	PROD0169	4	41598.42	166393.68
5000	ORD02356	PROD0098	2	54814.26	109628.52
5001	ORD02357	PROD0121	2	17176.67	34353.34
5002	ORD02357	PROD0279	1	962.48	962.48
5003	ORD02357	PROD0230	5	6077.64	30388.20
5004	ORD02357	PROD0266	5	408.26	2041.30
5008	ORD02360	PROD0016	3	256280.50	768841.50
5012	ORD02362	PROD0087	3	12717.02	38151.06
5013	ORD02363	PROD0112	1	35280.59	35280.59
5014	ORD02363	PROD0172	3	95695.43	287086.29
5015	ORD02363	PROD0128	3	24463.34	73390.02
5016	ORD02364	PROD0194	5	24802.59	124012.95
5017	ORD02364	PROD0006	4	308912.61	1235650.44
5018	ORD02364	PROD0193	4	9954.82	39819.28
5019	ORD02364	PROD0138	4	15463.10	61852.40
5023	ORD02367	PROD0139	4	14201.82	56807.28
5024	ORD02367	PROD0028	1	316366.34	316366.34
5037	ORD02371	PROD0223	3	7785.89	23357.67
5038	ORD02372	PROD0262	1	3172.89	3172.89
5039	ORD02372	PROD0221	3	13121.51	39364.53
5040	ORD02372	PROD0227	2	9871.34	19742.68
5041	ORD02372	PROD0129	1	5323.48	5323.48
5042	ORD02372	PROD0234	2	6463.53	12927.06
5044	ORD02374	PROD0279	1	962.48	962.48
5070	ORD02386	PROD0104	2	73744.65	147489.30
5104	ORD02397	PROD0104	1	73744.65	73744.65
5049	ORD02376	PROD0040	1	47715.49	47715.49
5050	ORD02376	PROD0252	1	8223.52	8223.52
5053	ORD02378	PROD0220	1	11275.57	11275.57
5054	ORD02379	PROD0004	4	39811.79	159247.16
5055	ORD02380	PROD0006	2	308912.61	617825.22
5056	ORD02380	PROD0079	1	13912.80	13912.80
5057	ORD02381	PROD0229	2	4112.45	8224.90
5058	ORD02382	PROD0128	2	24463.34	48926.68
5059	ORD02382	PROD0045	4	15761.34	63045.36
5060	ORD02383	PROD0174	3	110640.11	331920.33
5061	ORD02383	PROD0262	4	3172.89	12691.56
5062	ORD02383	PROD0012	3	248709.70	746129.10
5063	ORD02383	PROD0215	3	3385.48	10156.44
5064	ORD02383	PROD0075	3	5182.19	15546.57
5066	ORD02385	PROD0250	3	4620.81	13862.43
5067	ORD02385	PROD0022	4	222156.94	888627.76
5068	ORD02385	PROD0219	1	14849.13	14849.13
5069	ORD02385	PROD0002	1	102447.74	102447.74
5071	ORD02386	PROD0093	5	8480.78	42403.90
5072	ORD02386	PROD0124	2	17164.25	34328.50
5073	ORD02386	PROD0187	2	28776.04	57552.08
5075	ORD02388	PROD0117	3	31515.40	94546.20
5076	ORD02388	PROD0017	2	257730.40	515460.80
5077	ORD02388	PROD0076	4	27116.85	108467.40
5082	ORD02390	PROD0114	2	7586.49	15172.98
5083	ORD02391	PROD0004	3	39811.79	119435.37
5084	ORD02391	PROD0162	3	2672.21	8016.63
5085	ORD02391	PROD0247	2	5416.29	10832.58
5096	ORD02395	PROD0122	3	16203.67	48611.01
5097	ORD02395	PROD0123	3	11097.43	33292.29
5098	ORD02395	PROD0016	5	256280.50	1281402.50
5099	ORD02395	PROD0036	1	78738.41	78738.41
5100	ORD02395	PROD0030	4	253935.11	1015740.44
5103	ORD02397	PROD0172	4	95695.43	382781.72
5105	ORD02397	PROD0189	4	96833.78	387335.12
5106	ORD02398	PROD0007	4	290642.30	1162569.20
5107	ORD02399	PROD0082	1	54346.36	54346.36
5108	ORD02399	PROD0211	2	8250.11	16500.22
5111	ORD02401	PROD0035	5	190414.55	952072.75
5112	ORD02401	PROD0143	1	13171.72	13171.72
5113	ORD02402	PROD0256	3	1625.49	4876.47
5114	ORD02402	PROD0208	5	9010.85	45054.25
5115	ORD02402	PROD0087	4	12717.02	50868.08
5116	ORD02402	PROD0271	4	1989.71	7958.84
5117	ORD02402	PROD0013	4	337113.25	1348453.00
5118	ORD02403	PROD0198	5	57432.47	287162.35
5121	ORD02405	PROD0058	5	14691.81	73459.05
5122	ORD02406	PROD0236	3	7038.57	21115.71
5123	ORD02406	PROD0145	1	22657.06	22657.06
5124	ORD02406	PROD0272	1	11096.23	11096.23
5125	ORD02406	PROD0090	4	102715.97	410863.88
5128	ORD02408	PROD0145	3	22657.06	67971.18
5129	ORD02408	PROD0256	5	1625.49	8127.45
5130	ORD02408	PROD0231	5	6206.49	31032.45
5131	ORD02408	PROD0123	3	11097.43	33292.29
5132	ORD02409	PROD0241	2	1174.07	2348.14
5133	ORD02409	PROD0064	3	34644.88	103934.64
5142	ORD02415	PROD0085	2	89243.32	178486.64
5143	ORD02415	PROD0066	5	36291.81	181459.05
5149	ORD02418	PROD0258	1	4792.40	4792.40
5158	ORD02422	PROD0075	4	5182.19	20728.76
5159	ORD02423	PROD0001	5	279610.57	1398052.85
5160	ORD02423	PROD0055	5	42567.03	212835.15
5161	ORD02423	PROD0269	5	2989.48	14947.40
5162	ORD02423	PROD0037	4	266180.98	1064723.92
5165	ORD02425	PROD0097	3	9141.77	27425.31
5174	ORD02431	PROD0098	3	54814.26	164442.78
5179	ORD02433	PROD0172	1	95695.43	95695.43
5180	ORD02433	PROD0139	2	14201.82	28403.64
5181	ORD02434	PROD0175	5	102750.60	513753.00
5186	ORD02437	PROD0057	3	24240.82	72722.46
5191	ORD02439	PROD0260	3	5050.94	15152.82
5192	ORD02440	PROD0038	5	88262.22	441311.10
5193	ORD02441	PROD0168	3	100026.32	300078.96
5194	ORD02441	PROD0053	5	43609.38	218046.90
5195	ORD02441	PROD0214	1	12483.89	12483.89
5196	ORD02441	PROD0160	3	12278.28	36834.84
5202	ORD02444	PROD0202	4	12764.12	51056.48
5203	ORD02445	PROD0130	2	1182.88	2365.76
5205	ORD02447	PROD0241	5	1174.07	5870.35
5206	ORD02447	PROD0155	4	17522.15	70088.60
5207	ORD02447	PROD0027	4	26206.57	104826.28
5212	ORD02450	PROD0273	4	1784.35	7137.40
5213	ORD02450	PROD0107	4	97418.23	389672.92
5214	ORD02450	PROD0092	2	140982.24	281964.48
5215	ORD02451	PROD0087	4	12717.02	50868.08
5216	ORD02451	PROD0262	2	3172.89	6345.78
5217	ORD02451	PROD0098	2	54814.26	109628.52
5222	ORD02453	PROD0096	2	179864.29	359728.58
5223	ORD02453	PROD0042	3	44258.35	132775.05
5224	ORD02454	PROD0246	3	5399.76	16199.28
5227	ORD02456	PROD0006	5	308912.61	1544563.05
5228	ORD02456	PROD0167	3	22365.17	67095.51
5235	ORD02461	PROD0250	4	4620.81	18483.24
5236	ORD02461	PROD0258	1	4792.40	4792.40
5237	ORD02462	PROD0042	4	44258.35	177033.40
5241	ORD02464	PROD0255	1	7571.15	7571.15
5242	ORD02464	PROD0112	1	35280.59	35280.59
5243	ORD02465	PROD0258	4	4792.40	19169.60
5244	ORD02465	PROD0207	3	11561.20	34683.60
5245	ORD02465	PROD0083	5	160848.97	804244.85
5246	ORD02465	PROD0124	3	17164.25	51492.75
5247	ORD02465	PROD0028	1	316366.34	316366.34
5255	ORD02469	PROD0144	2	801.07	1602.14
5256	ORD02469	PROD0097	2	9141.77	18283.54
5257	ORD02469	PROD0160	3	12278.28	36834.84
5258	ORD02469	PROD0254	3	9824.37	29473.11
5259	ORD02469	PROD0131	2	21092.44	42184.88
5261	ORD02471	PROD0234	5	6463.53	32317.65
5264	ORD02473	PROD0040	5	47715.49	238577.45
5265	ORD02473	PROD0268	5	2944.75	14723.75
5268	ORD02475	PROD0115	2	2277.24	4554.48
5269	ORD02475	PROD0234	1	6463.53	6463.53
5270	ORD02476	PROD0175	5	102750.60	513753.00
5271	ORD02477	PROD0115	5	2277.24	11386.20
5272	ORD02477	PROD0144	5	801.07	4005.35
5273	ORD02477	PROD0059	1	35594.97	35594.97
5274	ORD02478	PROD0055	3	42567.03	127701.09
5285	ORD02483	PROD0265	4	11740.65	46962.60
5286	ORD02483	PROD0212	4	8757.97	35031.88
5290	ORD02485	PROD0035	1	190414.55	190414.55
5295	ORD02488	PROD0255	1	7571.15	7571.15
5296	ORD02489	PROD0239	2	1047.73	2095.46
5297	ORD02489	PROD0008	2	121518.49	243036.98
5307	ORD02493	PROD0148	2	3628.18	7256.36
5308	ORD02493	PROD0126	2	13544.05	27088.10
5311	ORD02495	PROD0236	3	7038.57	21115.71
5325	ORD02504	PROD0069	5	39168.98	195844.90
5326	ORD02504	PROD0100	3	110269.71	330809.13
5327	ORD02504	PROD0178	5	87684.88	438424.40
5333	ORD02507	PROD0243	4	10094.25	40377.00
5334	ORD02507	PROD0253	3	8743.34	26230.02
5335	ORD02507	PROD0251	3	5175.86	15527.58
5336	ORD02508	PROD0219	3	14849.13	44547.39
5337	ORD02509	PROD0200	2	29196.20	58392.40
5338	ORD02509	PROD0153	4	10840.50	43362.00
5339	ORD02509	PROD0280	3	7685.53	23056.59
5340	ORD02509	PROD0223	3	7785.89	23357.67
5341	ORD02510	PROD0149	2	8124.11	16248.22
5342	ORD02510	PROD0195	1	24091.13	24091.13
5343	ORD02510	PROD0011	1	314229.61	314229.61
5344	ORD02510	PROD0052	3	23501.69	70505.07
5347	ORD02512	PROD0226	4	7172.97	28691.88
5348	ORD02512	PROD0074	2	13460.87	26921.74
5355	ORD02515	PROD0136	3	8175.35	24526.05
5356	ORD02515	PROD0213	3	2985.64	8956.92
5363	ORD02518	PROD0067	4	11627.77	46511.08
5365	ORD02520	PROD0041	1	14461.31	14461.31
5368	ORD02522	PROD0216	4	3485.44	13941.76
5369	ORD02522	PROD0252	3	8223.52	24670.56
5374	ORD02524	PROD0251	4	5175.86	20703.44
5377	ORD02527	PROD0100	1	110269.71	110269.71
5395	ORD02536	PROD0263	5	8199.23	40996.15
5400	ORD02540	PROD0069	2	39168.98	78337.96
5401	ORD02540	PROD0021	5	34405.68	172028.40
5402	ORD02540	PROD0158	3	12650.30	37950.90
5416	ORD02545	PROD0137	5	2019.05	10095.25
5417	ORD02545	PROD0183	5	26053.15	130265.75
5420	ORD02547	PROD0092	4	140982.24	563928.96
5423	ORD02549	PROD0080	4	14845.55	59382.20
5424	ORD02549	PROD0128	5	24463.34	122316.70
5425	ORD02549	PROD0003	5	49538.31	247691.55
5426	ORD02549	PROD0014	3	289145.53	867436.59
5427	ORD02549	PROD0175	5	102750.60	513753.00
5428	ORD02550	PROD0004	5	39811.79	199058.95
5436	ORD02554	PROD0123	1	11097.43	11097.43
5437	ORD02554	PROD0127	1	8700.29	8700.29
5438	ORD02554	PROD0228	3	6170.81	18512.43
5440	ORD02556	PROD0041	4	14461.31	57845.24
5441	ORD02556	PROD0184	4	48414.15	193656.60
5442	ORD02557	PROD0063	2	35488.70	70977.40
5443	ORD02557	PROD0269	3	2989.48	8968.44
5444	ORD02558	PROD0120	3	35341.43	106024.29
5445	ORD02558	PROD0033	1	245627.48	245627.48
5446	ORD02559	PROD0089	2	45090.58	90181.16
5447	ORD02559	PROD0043	2	16739.67	33479.34
5448	ORD02559	PROD0083	2	160848.97	321697.94
5452	ORD02562	PROD0200	3	29196.20	87588.60
5453	ORD02562	PROD0004	3	39811.79	119435.37
5465	ORD02567	PROD0003	4	49538.31	198153.24
5468	ORD02569	PROD0126	1	13544.05	13544.05
5469	ORD02569	PROD0084	3	37258.14	111774.42
5473	ORD02571	PROD0176	4	30789.84	123159.36
5474	ORD02571	PROD0268	3	2944.75	8834.25
5475	ORD02572	PROD0142	2	8820.60	17641.20
5476	ORD02573	PROD0038	4	88262.22	353048.88
5490	ORD02578	PROD0025	1	330590.39	330590.39
5491	ORD02578	PROD0047	2	5512.81	11025.62
5497	ORD02581	PROD0201	3	10976.40	32929.20
5499	ORD02583	PROD0008	3	121518.49	364555.47
5500	ORD02583	PROD0121	5	17176.67	85883.35
5501	ORD02583	PROD0028	5	316366.34	1581831.70
5502	ORD02583	PROD0254	3	9824.37	29473.11
5503	ORD02583	PROD0161	1	25829.99	25829.99
5504	ORD02584	PROD0178	1	87684.88	87684.88
5509	ORD02586	PROD0090	3	102715.97	308147.91
5510	ORD02586	PROD0121	2	17176.67	34353.34
5511	ORD02587	PROD0176	4	30789.84	123159.36
5512	ORD02587	PROD0132	4	23990.67	95962.68
5513	ORD02588	PROD0055	3	42567.03	127701.09
5514	ORD02589	PROD0127	2	8700.29	17400.58
5515	ORD02589	PROD0112	4	35280.59	141122.36
5516	ORD02589	PROD0066	1	36291.81	36291.81
5517	ORD02589	PROD0137	2	2019.05	4038.10
5523	ORD02592	PROD0076	3	27116.85	81350.55
5524	ORD02592	PROD0227	5	9871.34	49356.70
5525	ORD02593	PROD0093	2	8480.78	16961.56
5526	ORD02593	PROD0044	2	32574.27	65148.54
5527	ORD02593	PROD0046	1	5762.47	5762.47
5528	ORD02593	PROD0216	4	3485.44	13941.76
5530	ORD02595	PROD0083	5	160848.97	804244.85
5531	ORD02596	PROD0004	2	39811.79	79623.58
5532	ORD02596	PROD0029	2	149660.33	299320.66
5533	ORD02596	PROD0238	4	6026.76	24107.04
5534	ORD02597	PROD0260	3	5050.94	15152.82
5535	ORD02597	PROD0229	4	4112.45	16449.80
5536	ORD02597	PROD0280	1	7685.53	7685.53
5538	ORD02599	PROD0218	4	5238.20	20952.80
5539	ORD02599	PROD0244	3	1664.99	4994.97
5546	ORD02602	PROD0161	5	25829.99	129149.95
5547	ORD02602	PROD0035	3	190414.55	571243.65
5549	ORD02604	PROD0230	2	6077.64	12155.28
5550	ORD02604	PROD0162	5	2672.21	13361.05
5551	ORD02604	PROD0079	4	13912.80	55651.20
5552	ORD02605	PROD0066	3	36291.81	108875.43
5553	ORD02606	PROD0102	4	45021.16	180084.64
5554	ORD02607	PROD0220	3	11275.57	33826.71
5555	ORD02608	PROD0080	1	14845.55	14845.55
5556	ORD02608	PROD0092	1	140982.24	140982.24
5557	ORD02608	PROD0074	5	13460.87	67304.35
5558	ORD02609	PROD0086	1	49202.47	49202.47
5559	ORD02609	PROD0190	1	22778.54	22778.54
5671	ORD02658	PROD0088	5	73744.65	368723.25
5580	ORD02620	PROD0185	5	112356.62	561783.10
5581	ORD02620	PROD0043	3	16739.67	50219.01
5582	ORD02620	PROD0267	4	6230.11	24920.44
5583	ORD02620	PROD0219	1	14849.13	14849.13
5588	ORD02622	PROD0253	5	8743.34	43716.70
5589	ORD02622	PROD0127	5	8700.29	43501.45
5594	ORD02624	PROD0125	3	22153.16	66459.48
5595	ORD02624	PROD0203	1	3538.98	3538.98
5596	ORD02624	PROD0112	5	35280.59	176402.95
5597	ORD02624	PROD0035	5	190414.55	952072.75
5598	ORD02625	PROD0219	2	14849.13	29698.26
5599	ORD02625	PROD0248	1	4809.30	4809.30
5607	ORD02628	PROD0253	3	8743.34	26230.02
5612	ORD02630	PROD0280	2	7685.53	15371.06
5613	ORD02631	PROD0007	1	290642.30	290642.30
5614	ORD02632	PROD0120	2	35341.43	70682.86
5615	ORD02633	PROD0084	1	37258.14	37258.14
5616	ORD02633	PROD0046	4	5762.47	23049.88
5617	ORD02633	PROD0113	4	145706.19	582824.76
5618	ORD02633	PROD0058	5	14691.81	73459.05
5619	ORD02634	PROD0052	4	23501.69	94006.76
5620	ORD02634	PROD0043	4	16739.67	66958.68
5624	ORD02636	PROD0120	2	35341.43	70682.86
5625	ORD02636	PROD0009	2	198883.60	397767.20
5626	ORD02637	PROD0007	3	290642.30	871926.90
5627	ORD02638	PROD0015	3	222324.51	666973.53
5628	ORD02638	PROD0230	3	6077.64	18232.92
5629	ORD02639	PROD0224	5	607.93	3039.65
5630	ORD02639	PROD0232	4	4469.76	17879.04
5634	ORD02642	PROD0014	5	289145.53	1445727.65
5635	ORD02642	PROD0061	2	6821.26	13642.52
5638	ORD02644	PROD0244	1	1664.99	1664.99
5639	ORD02644	PROD0040	4	47715.49	190861.96
5640	ORD02644	PROD0046	3	5762.47	17287.41
5641	ORD02644	PROD0236	5	7038.57	35192.85
5648	ORD02647	PROD0206	4	5427.42	21709.68
5649	ORD02647	PROD0238	4	6026.76	24107.04
5655	ORD02650	PROD0070	2	25905.43	51810.86
5656	ORD02650	PROD0166	2	101932.80	203865.60
5659	ORD02652	PROD0009	1	198883.60	198883.60
5660	ORD02652	PROD0084	5	37258.14	186290.70
5661	ORD02652	PROD0131	2	21092.44	42184.88
5662	ORD02653	PROD0197	3	113579.08	340737.24
5663	ORD02654	PROD0202	3	12764.12	38292.36
5672	ORD02659	PROD0137	3	2019.05	6057.15
5673	ORD02660	PROD0044	3	32574.27	97722.81
5674	ORD02660	PROD0040	3	47715.49	143146.47
5675	ORD02660	PROD0054	5	31709.48	158547.40
5676	ORD02660	PROD0240	3	10219.29	30657.87
5680	ORD02662	PROD0089	3	45090.58	135271.74
5681	ORD02662	PROD0129	2	5323.48	10646.96
5682	ORD02662	PROD0199	5	28468.05	142340.25
5683	ORD02663	PROD0271	4	1989.71	7958.84
5684	ORD02664	PROD0062	3	22431.17	67293.51
5685	ORD02664	PROD0134	1	19220.41	19220.41
5686	ORD02665	PROD0025	3	330590.39	991771.17
5687	ORD02665	PROD0174	3	110640.11	331920.33
5688	ORD02665	PROD0239	2	1047.73	2095.46
5695	ORD02668	PROD0076	5	27116.85	135584.25
5696	ORD02668	PROD0033	4	245627.48	982509.92
5697	ORD02669	PROD0137	4	2019.05	8076.20
5689	ORD02665	PROD0088	1	73744.65	73744.65
5713	ORD02676	PROD0088	3	73744.65	221233.95
5722	ORD02681	PROD0088	5	73744.65	368723.25
5743	ORD02690	PROD0104	5	73744.65	368723.25
5786	ORD02716	PROD0104	4	73744.65	294978.60
5711	ORD02676	PROD0251	1	5175.86	5175.86
5712	ORD02676	PROD0258	3	4792.40	14377.20
5714	ORD02676	PROD0118	4	12699.55	50798.20
5716	ORD02678	PROD0275	1	10193.83	10193.83
5720	ORD02681	PROD0168	1	100026.32	100026.32
5721	ORD02681	PROD0042	1	44258.35	44258.35
5723	ORD02681	PROD0045	3	15761.34	47284.02
5724	ORD02682	PROD0067	3	11627.77	34883.31
5725	ORD02682	PROD0143	5	13171.72	65858.60
5729	ORD02685	PROD0130	1	1182.88	1182.88
5730	ORD02685	PROD0181	2	63768.87	127537.74
5731	ORD02685	PROD0080	2	14845.55	29691.10
5732	ORD02685	PROD0170	3	45302.42	135907.26
5733	ORD02686	PROD0167	2	22365.17	44730.34
5734	ORD02686	PROD0087	4	12717.02	50868.08
5742	ORD02689	PROD0213	5	2985.64	14928.20
5744	ORD02691	PROD0067	4	11627.77	46511.08
5753	ORD02697	PROD0082	1	54346.36	54346.36
5754	ORD02698	PROD0214	4	12483.89	49935.56
5755	ORD02698	PROD0176	4	30789.84	123159.36
5757	ORD02700	PROD0026	2	34248.48	68496.96
5758	ORD02701	PROD0070	2	25905.43	51810.86
5759	ORD02701	PROD0099	2	130788.21	261576.42
5760	ORD02702	PROD0267	3	6230.11	18690.33
5761	ORD02703	PROD0071	4	9870.56	39482.24
5776	ORD02710	PROD0080	5	14845.55	74227.75
5777	ORD02711	PROD0241	5	1174.07	5870.35
5778	ORD02711	PROD0250	3	4620.81	13862.43
5779	ORD02712	PROD0117	4	31515.40	126061.60
5780	ORD02712	PROD0217	2	7092.62	14185.24
5783	ORD02714	PROD0128	1	24463.34	24463.34
5784	ORD02715	PROD0045	3	15761.34	47284.02
5785	ORD02715	PROD0198	3	57432.47	172297.41
5787	ORD02716	PROD0065	5	30524.10	152620.50
5789	ORD02717	PROD0036	1	78738.41	78738.41
5790	ORD02717	PROD0178	3	87684.88	263054.64
5791	ORD02717	PROD0184	3	48414.15	145242.45
5792	ORD02717	PROD0240	4	10219.29	40877.16
5838	ORD02740	PROD0205	1	7224.75	7224.75
5807	ORD02723	PROD0041	2	14461.31	28922.62
5808	ORD02723	PROD0217	2	7092.62	14185.24
5809	ORD02723	PROD0129	1	5323.48	5323.48
5810	ORD02724	PROD0105	5	162358.65	811793.25
5811	ORD02724	PROD0056	1	6299.62	6299.62
5812	ORD02725	PROD0178	2	87684.88	175369.76
5813	ORD02726	PROD0179	4	21340.87	85363.48
5814	ORD02726	PROD0214	2	12483.89	24967.78
5817	ORD02729	PROD0167	2	22365.17	44730.34
5831	ORD02737	PROD0025	1	330590.39	330590.39
5832	ORD02737	PROD0128	3	24463.34	73390.02
5833	ORD02738	PROD0204	3	5933.15	17799.45
5834	ORD02738	PROD0169	5	41598.42	207992.10
5835	ORD02738	PROD0078	3	18117.48	54352.44
5836	ORD02739	PROD0087	1	12717.02	12717.02
5837	ORD02739	PROD0003	3	49538.31	148614.93
5843	ORD02743	PROD0210	1	14712.50	14712.50
5844	ORD02743	PROD0203	2	3538.98	7077.96
5845	ORD02744	PROD0018	5	120439.60	602198.00
5846	ORD02744	PROD0047	3	5512.81	16538.43
5847	ORD02744	PROD0189	4	96833.78	387335.12
5850	ORD02746	PROD0055	2	42567.03	85134.06
5851	ORD02746	PROD0168	4	100026.32	400105.28
5852	ORD02747	PROD0115	2	2277.24	4554.48
5853	ORD02747	PROD0110	1	23332.73	23332.73
5854	ORD02747	PROD0052	5	23501.69	117508.45
5855	ORD02747	PROD0035	5	190414.55	952072.75
5857	ORD02749	PROD0248	1	4809.30	4809.30
5860	ORD02751	PROD0125	1	22153.16	22153.16
5865	ORD02754	PROD0215	3	3385.48	10156.44
5866	ORD02754	PROD0066	4	36291.81	145167.24
5867	ORD02754	PROD0162	5	2672.21	13361.05
5868	ORD02755	PROD0047	3	5512.81	16538.43
5870	ORD02757	PROD0132	3	23990.67	71972.01
5871	ORD02757	PROD0201	4	10976.40	43905.60
5872	ORD02757	PROD0226	3	7172.97	21518.91
5873	ORD02757	PROD0119	2	47472.78	94945.56
5891	ORD02764	PROD0230	2	6077.64	12155.28
5892	ORD02764	PROD0005	4	85978.02	343912.08
5894	ORD02766	PROD0261	3	8607.87	25823.61
5895	ORD02766	PROD0213	4	2985.64	11942.56
5896	ORD02766	PROD0029	4	149660.33	598641.32
5899	ORD02768	PROD0258	5	4792.40	23962.00
5900	ORD02769	PROD0272	1	11096.23	11096.23
5901	ORD02769	PROD0247	5	5416.29	27081.45
5905	ORD02772	PROD0266	2	408.26	816.52
5906	ORD02772	PROD0273	3	1784.35	5353.05
5913	ORD02776	PROD0164	1	6702.72	6702.72
5914	ORD02776	PROD0261	2	8607.87	17215.74
5915	ORD02776	PROD0220	3	11275.57	33826.71
5916	ORD02777	PROD0078	5	18117.48	90587.40
5917	ORD02777	PROD0126	3	13544.05	40632.15
5918	ORD02777	PROD0154	2	19738.96	39477.92
5919	ORD02778	PROD0272	2	11096.23	22192.46
5920	ORD02778	PROD0069	5	39168.98	195844.90
5921	ORD02778	PROD0207	5	11561.20	57806.00
5922	ORD02779	PROD0200	5	29196.20	145981.00
5923	ORD02779	PROD0083	4	160848.97	643395.88
5924	ORD02780	PROD0111	3	2676.03	8028.09
5925	ORD02780	PROD0241	4	1174.07	4696.28
5926	ORD02780	PROD0013	5	337113.25	1685566.25
5927	ORD02780	PROD0108	4	121332.02	485328.08
5928	ORD02780	PROD0177	2	102403.06	204806.12
5931	ORD02783	PROD0049	3	27088.42	81265.26
5932	ORD02783	PROD0257	3	2248.73	6746.19
5933	ORD02784	PROD0002	1	102447.74	102447.74
5934	ORD02785	PROD0244	2	1664.99	3329.98
5935	ORD02786	PROD0280	4	7685.53	30742.12
5936	ORD02786	PROD0195	1	24091.13	24091.13
5937	ORD02786	PROD0185	4	112356.62	449426.48
5940	ORD02789	PROD0279	5	962.48	4812.40
5941	ORD02789	PROD0225	3	9270.30	27810.90
5942	ORD02789	PROD0091	4	141135.80	564543.20
5943	ORD02789	PROD0267	4	6230.11	24920.44
5944	ORD02790	PROD0151	4	24271.64	97086.56
5949	ORD02792	PROD0018	1	120439.60	120439.60
5950	ORD02792	PROD0118	4	12699.55	50798.20
5951	ORD02792	PROD0049	4	27088.42	108353.68
5952	ORD02792	PROD0032	2	246601.80	493203.60
5956	ORD02794	PROD0054	1	31709.48	31709.48
5957	ORD02795	PROD0031	1	290316.23	290316.23
5958	ORD02795	PROD0094	3	117897.53	353692.59
5959	ORD02795	PROD0200	4	29196.20	116784.80
5961	ORD02797	PROD0148	4	3628.18	14512.72
5962	ORD02797	PROD0164	2	6702.72	13405.44
5963	ORD02798	PROD0141	5	11608.58	58042.90
5964	ORD02798	PROD0079	2	13912.80	27825.60
5965	ORD02798	PROD0109	3	70228.44	210685.32
5966	ORD02798	PROD0269	3	2989.48	8968.44
5967	ORD02799	PROD0008	2	121518.49	243036.98
5968	ORD02799	PROD0238	5	6026.76	30133.80
5975	ORD02803	PROD0261	5	8607.87	43039.35
5976	ORD02804	PROD0062	4	22431.17	89724.68
5977	ORD02804	PROD0081	5	110991.10	554955.50
5978	ORD02805	PROD0070	2	25905.43	51810.86
5979	ORD02805	PROD0143	1	13171.72	13171.72
5980	ORD02805	PROD0033	2	245627.48	491254.96
5981	ORD02805	PROD0119	2	47472.78	94945.56
5982	ORD02805	PROD0152	3	1904.28	5712.84
5985	ORD02807	PROD0137	2	2019.05	4038.10
5987	ORD02809	PROD0066	5	36291.81	181459.05
5992	ORD02811	PROD0248	3	4809.30	14427.90
5993	ORD02811	PROD0130	3	1182.88	3548.64
5994	ORD02812	PROD0129	1	5323.48	5323.48
5999	ORD02816	PROD0079	2	13912.80	27825.60
6000	ORD02816	PROD0183	5	26053.15	130265.75
6002	ORD02818	PROD0221	4	13121.51	52486.04
6003	ORD02819	PROD0236	2	7038.57	14077.14
6004	ORD02819	PROD0162	3	2672.21	8016.63
6005	ORD02820	PROD0081	1	110991.10	110991.10
6006	ORD02820	PROD0264	2	4118.15	8236.30
6007	ORD02820	PROD0118	5	12699.55	63497.75
6008	ORD02820	PROD0113	3	145706.19	437118.57
6009	ORD02821	PROD0097	1	9141.77	9141.77
6010	ORD02821	PROD0093	1	8480.78	8480.78
6011	ORD02821	PROD0240	1	10219.29	10219.29
6012	ORD02821	PROD0122	3	16203.67	48611.01
6013	ORD02821	PROD0149	5	8124.11	40620.55
6015	ORD02822	PROD0231	3	6206.49	18619.47
6016	ORD02822	PROD0238	5	6026.76	30133.80
6017	ORD02823	PROD0200	3	29196.20	87588.60
6014	ORD02822	PROD0104	1	73744.65	73744.65
6034	ORD02829	PROD0086	5	49202.47	246012.35
6035	ORD02829	PROD0252	3	8223.52	24670.56
6036	ORD02829	PROD0274	2	7846.95	15693.90
6037	ORD02830	PROD0150	3	12003.33	36009.99
6038	ORD02830	PROD0052	5	23501.69	117508.45
6039	ORD02831	PROD0143	4	13171.72	52686.88
6040	ORD02831	PROD0110	2	23332.73	46665.46
6041	ORD02831	PROD0234	1	6463.53	6463.53
6044	ORD02833	PROD0031	3	290316.23	870948.69
6045	ORD02834	PROD0217	3	7092.62	21277.86
6046	ORD02835	PROD0091	3	141135.80	423407.40
6047	ORD02835	PROD0258	2	4792.40	9584.80
6048	ORD02835	PROD0170	4	45302.42	181209.68
6051	ORD02837	PROD0229	4	4112.45	16449.80
6052	ORD02837	PROD0188	1	51993.13	51993.13
6053	ORD02837	PROD0261	1	8607.87	8607.87
6054	ORD02837	PROD0237	3	7201.43	21604.29
6055	ORD02837	PROD0125	2	22153.16	44306.32
6056	ORD02838	PROD0221	4	13121.51	52486.04
6060	ORD02840	PROD0062	2	22431.17	44862.34
6062	ORD02842	PROD0167	3	22365.17	67095.51
6063	ORD02842	PROD0005	2	85978.02	171956.04
6064	ORD02842	PROD0211	4	8250.11	33000.44
6070	ORD02846	PROD0023	2	276589.43	553178.86
6071	ORD02847	PROD0095	4	49921.23	199684.92
6073	ORD02849	PROD0147	3	5055.12	15165.36
6074	ORD02849	PROD0003	2	49538.31	99076.62
6075	ORD02849	PROD0167	1	22365.17	22365.17
6076	ORD02849	PROD0120	4	35341.43	141365.72
6077	ORD02849	PROD0092	5	140982.24	704911.20
6084	ORD02853	PROD0255	3	7571.15	22713.45
6085	ORD02853	PROD0005	2	85978.02	171956.04
6086	ORD02854	PROD0065	2	30524.10	61048.20
6089	ORD02856	PROD0096	3	179864.29	539592.87
6090	ORD02857	PROD0039	5	257535.23	1287676.15
6091	ORD02857	PROD0103	3	83304.08	249912.24
6092	ORD02857	PROD0244	2	1664.99	3329.98
6093	ORD02857	PROD0267	1	6230.11	6230.11
6094	ORD02857	PROD0129	2	5323.48	10646.96
6101	ORD02861	PROD0002	2	102447.74	204895.48
6102	ORD02861	PROD0055	5	42567.03	212835.15
6103	ORD02861	PROD0139	4	14201.82	56807.28
6104	ORD02861	PROD0271	1	1989.71	1989.71
6105	ORD02861	PROD0056	5	6299.62	31498.10
6112	ORD02865	PROD0018	5	120439.60	602198.00
6113	ORD02866	PROD0266	4	408.26	1633.04
6117	ORD02868	PROD0217	2	7092.62	14185.24
6118	ORD02868	PROD0133	3	23616.92	70850.76
6119	ORD02868	PROD0074	5	13460.87	67304.35
6120	ORD02868	PROD0259	5	7869.35	39346.75
6121	ORD02868	PROD0059	2	35594.97	71189.94
6124	ORD02870	PROD0133	4	23616.92	94467.68
6125	ORD02870	PROD0222	3	2802.33	8406.99
6126	ORD02870	PROD0190	4	22778.54	91114.16
6127	ORD02871	PROD0109	3	70228.44	210685.32
6128	ORD02871	PROD0012	5	248709.70	1243548.50
6129	ORD02872	PROD0203	1	3538.98	3538.98
6130	ORD02872	PROD0149	4	8124.11	32496.44
6131	ORD02873	PROD0098	1	54814.26	54814.26
6132	ORD02873	PROD0067	4	11627.77	46511.08
6133	ORD02873	PROD0066	2	36291.81	72583.62
6134	ORD02873	PROD0116	3	20859.43	62578.29
6136	ORD02875	PROD0165	4	22136.37	88545.48
6137	ORD02875	PROD0279	1	962.48	962.48
6138	ORD02876	PROD0019	3	339524.65	1018573.95
6139	ORD02876	PROD0266	3	408.26	1224.78
6140	ORD02876	PROD0113	2	145706.19	291412.38
6141	ORD02876	PROD0189	4	96833.78	387335.12
6144	ORD02878	PROD0084	2	37258.14	74516.28
6145	ORD02878	PROD0072	4	43142.24	172568.96
6146	ORD02879	PROD0106	5	137481.28	687406.40
6153	ORD02882	PROD0127	5	8700.29	43501.45
6156	ORD02885	PROD0027	1	26206.57	26206.57
6157	ORD02886	PROD0240	5	10219.29	51096.45
6160	ORD02888	PROD0067	3	11627.77	34883.31
6161	ORD02888	PROD0069	2	39168.98	78337.96
6162	ORD02889	PROD0025	1	330590.39	330590.39
6163	ORD02889	PROD0085	5	89243.32	446216.60
6164	ORD02890	PROD0018	2	120439.60	240879.20
6167	ORD02892	PROD0127	5	8700.29	43501.45
6168	ORD02892	PROD0189	5	96833.78	484168.90
6171	ORD02894	PROD0243	4	10094.25	40377.00
6172	ORD02894	PROD0149	4	8124.11	32496.44
6173	ORD02894	PROD0211	5	8250.11	41250.55
6180	ORD02897	PROD0101	5	114695.41	573477.05
6181	ORD02898	PROD0253	5	8743.34	43716.70
6182	ORD02898	PROD0238	2	6026.76	12053.52
6183	ORD02898	PROD0044	2	32574.27	65148.54
6184	ORD02898	PROD0246	1	5399.76	5399.76
6185	ORD02899	PROD0092	4	140982.24	563928.96
6186	ORD02899	PROD0259	5	7869.35	39346.75
6187	ORD02899	PROD0209	1	2728.52	2728.52
6188	ORD02900	PROD0022	5	222156.94	1110784.70
6198	ORD02903	PROD0170	2	45302.42	90604.84
6199	ORD02903	PROD0033	2	245627.48	491254.96
6201	ORD02905	PROD0067	4	11627.77	46511.08
6202	ORD02905	PROD0199	3	28468.05	85404.15
6203	ORD02905	PROD0172	1	95695.43	95695.43
6204	ORD02905	PROD0273	2	1784.35	3568.70
6207	ORD02907	PROD0212	4	8757.97	35031.88
6208	ORD02907	PROD0044	4	32574.27	130297.08
6209	ORD02907	PROD0019	4	339524.65	1358098.60
6210	ORD02907	PROD0247	5	5416.29	27081.45
6211	ORD02907	PROD0136	4	8175.35	32701.40
6214	ORD02909	PROD0191	2	44052.51	88105.02
6217	ORD02911	PROD0153	4	10840.50	43362.00
6218	ORD02911	PROD0237	3	7201.43	21604.29
6219	ORD02912	PROD0105	4	162358.65	649434.60
6220	ORD02913	PROD0153	3	10840.50	32521.50
6223	ORD02915	PROD0028	4	316366.34	1265465.36
6224	ORD02915	PROD0184	3	48414.15	145242.45
6225	ORD02915	PROD0040	1	47715.49	47715.49
6234	ORD02920	PROD0245	1	5638.01	5638.01
6304	ORD02958	PROD0245	2	5638.01	11276.02
6231	ORD02919	PROD0019	2	339524.65	679049.30
6232	ORD02919	PROD0243	5	10094.25	50471.25
6233	ORD02919	PROD0046	5	5762.47	28812.35
6235	ORD02921	PROD0066	4	36291.81	145167.24
6236	ORD02922	PROD0223	5	7785.89	38929.45
6237	ORD02923	PROD0035	5	190414.55	952072.75
6238	ORD02924	PROD0212	1	8757.97	8757.97
6239	ORD02925	PROD0189	3	96833.78	290501.34
6243	ORD02928	PROD0210	3	14712.50	44137.50
6252	ORD02933	PROD0219	2	14849.13	29698.26
6253	ORD02933	PROD0193	4	9954.82	39819.28
6254	ORD02934	PROD0228	4	6170.81	24683.24
6259	ORD02936	PROD0148	1	3628.18	3628.18
6260	ORD02936	PROD0161	3	25829.99	77489.97
6261	ORD02937	PROD0067	4	11627.77	46511.08
6262	ORD02938	PROD0250	4	4620.81	18483.24
6263	ORD02939	PROD0048	3	10843.12	32529.36
6264	ORD02939	PROD0225	4	9270.30	37081.20
6265	ORD02940	PROD0270	5	907.09	4535.45
6266	ORD02940	PROD0180	4	60582.65	242330.60
6269	ORD02942	PROD0164	4	6702.72	26810.88
6270	ORD02942	PROD0093	3	8480.78	25442.34
6271	ORD02942	PROD0174	4	110640.11	442560.44
6276	ORD02945	PROD0015	1	222324.51	222324.51
6277	ORD02946	PROD0165	5	22136.37	110681.85
6284	ORD02949	PROD0011	2	314229.61	628459.22
6285	ORD02949	PROD0203	5	3538.98	17694.90
6286	ORD02950	PROD0251	4	5175.86	20703.44
6287	ORD02950	PROD0167	5	22365.17	111825.85
6293	ORD02952	PROD0167	1	22365.17	22365.17
6294	ORD02952	PROD0172	1	95695.43	95695.43
6298	ORD02954	PROD0177	4	102403.06	409612.24
6299	ORD02954	PROD0149	2	8124.11	16248.22
6300	ORD02955	PROD0227	3	9871.34	29614.02
6315	ORD02964	PROD0212	1	8757.97	8757.97
6318	ORD02966	PROD0007	3	290642.30	871926.90
6321	ORD02968	PROD0077	1	20510.26	20510.26
6322	ORD02968	PROD0024	2	321716.92	643433.84
6323	ORD02968	PROD0270	3	907.09	2721.27
6324	ORD02969	PROD0156	4	21374.21	85496.84
6325	ORD02969	PROD0126	4	13544.05	54176.20
6326	ORD02969	PROD0060	1	10877.79	10877.79
6327	ORD02970	PROD0224	2	607.93	1215.86
6328	ORD02970	PROD0046	3	5762.47	17287.41
6330	ORD02972	PROD0020	3	293010.61	879031.83
6331	ORD02972	PROD0197	5	113579.08	567895.40
6335	ORD02974	PROD0050	2	26917.21	53834.42
6336	ORD02974	PROD0249	2	774.24	1548.48
6337	ORD02974	PROD0020	3	293010.61	879031.83
6338	ORD02974	PROD0269	1	2989.48	2989.48
6340	ORD02976	PROD0279	4	962.48	3849.92
6341	ORD02977	PROD0057	1	24240.82	24240.82
6342	ORD02977	PROD0225	5	9270.30	46351.50
6343	ORD02978	PROD0060	4	10877.79	43511.16
6344	ORD02978	PROD0204	5	5933.15	29665.75
6345	ORD02979	PROD0056	2	6299.62	12599.24
6346	ORD02980	PROD0198	2	57432.47	114864.94
6347	ORD02980	PROD0079	1	13912.80	13912.80
6348	ORD02980	PROD0190	2	22778.54	45557.08
6349	ORD02980	PROD0225	3	9270.30	27810.90
6350	ORD02981	PROD0182	4	33297.75	133191.00
6351	ORD02981	PROD0256	3	1625.49	4876.47
6352	ORD02981	PROD0159	3	17483.90	52451.70
6354	ORD02983	PROD0089	3	45090.58	135271.74
6355	ORD02983	PROD0196	4	2511.26	10045.04
6356	ORD02983	PROD0043	1	16739.67	16739.67
6357	ORD02983	PROD0136	4	8175.35	32701.40
6358	ORD02984	PROD0257	3	2248.73	6746.19
6359	ORD02984	PROD0074	1	13460.87	13460.87
6360	ORD02984	PROD0213	5	2985.64	14928.20
6361	ORD02984	PROD0147	1	5055.12	5055.12
6362	ORD02984	PROD0189	2	96833.78	193667.56
6370	ORD02987	PROD0098	2	54814.26	109628.52
6371	ORD02987	PROD0181	3	63768.87	191306.61
6372	ORD02988	PROD0107	1	97418.23	97418.23
6373	ORD02988	PROD0274	3	7846.95	23540.85
6374	ORD02988	PROD0131	3	21092.44	63277.32
6375	ORD02989	PROD0073	4	6732.32	26929.28
6378	ORD02991	PROD0095	5	49921.23	249606.15
6379	ORD02992	PROD0065	4	30524.10	122096.40
6380	ORD02992	PROD0230	3	6077.64	18232.92
6381	ORD02992	PROD0229	4	4112.45	16449.80
6382	ORD02992	PROD0220	5	11275.57	56377.85
6389	ORD02996	PROD0106	5	137481.28	687406.40
6390	ORD02996	PROD0055	1	42567.03	42567.03
6391	ORD02996	PROD0248	3	4809.30	14427.90
6392	ORD02996	PROD0231	2	6206.49	12412.98
6393	ORD02997	PROD0050	5	26917.21	134586.05
6394	ORD02998	PROD0062	5	22431.17	112155.85
6395	ORD02998	PROD0114	5	7586.49	37932.45
6397	ORD03000	PROD0044	4	32574.27	130297.08
6398	ORD03000	PROD0012	4	248709.70	994838.80
6399	ORD03001	PROD0090	3	102715.97	308147.91
6400	ORD03001	PROD0074	4	13460.87	53843.48
6402	ORD03003	PROD0272	3	11096.23	33288.69
6408	ORD03006	PROD0084	4	37258.14	149032.56
6409	ORD03006	PROD0059	2	35594.97	71189.94
6410	ORD03006	PROD0149	4	8124.11	32496.44
6411	ORD03006	PROD0022	2	222156.94	444313.88
6412	ORD03007	PROD0100	5	110269.71	551348.55
6413	ORD03007	PROD0006	2	308912.61	617825.22
6414	ORD03008	PROD0091	3	141135.80	423407.40
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, customer_id, seller_id, order_date, delivery_date, order_status, total_amount, status_verification) FROM stdin;
ORD00002	CUST0002	SELL026	2024-09-10	2024-09-23	Delivered	5416.29	Verified
ORD00003	CUST0003	SELL056	2024-09-07	2024-09-12	Delivered	343428.55	Verified
ORD00004	CUST0003	SELL040	2023-12-10	2023-12-14	Delivered	26203.69	Verified
ORD00006	CUST0004	SELL083	2024-06-28	2024-07-01	Delivered	2257228.05	Verified
ORD00009	CUST0004	SELL085	2024-04-28	2024-05-03	Delivered	1260295.96	Verified
ORD00059	CUST0023	SELL083	2024-10-05	2024-10-11	Delivered	1721730.29	imputed verfied
ORD00012	CUST0004	SELL063	2024-05-25	2024-05-27	Delivered	314953.64	Verified
ORD00013	CUST0004	SELL048	2024-12-29	2024-12-31	Delivered	78337.96	Verified
ORD00014	CUST0004	SELL028	2024-02-14	2024-02-21	Delivered	580632.46	Verified
ORD00015	CUST0004	SELL014	2024-07-16	2024-07-21	Delivered	316660.38	Verified
ORD00016	CUST0004	SELL013	2024-08-20	2024-08-27	Delivered	2019.05	Verified
ORD00017	CUST0004	SELL001	2024-01-10	2024-01-15	Delivered	18690.33	Verified
ORD00019	CUST0005	SELL052	2023-10-30	2023-11-05	Delivered	1154125.19	Verified
ORD00062	CUST0024	SELL069	2024-07-24	2024-07-28	Delivered	841181.08	mismatch price
ORD00065	CUST0028	SELL003	2024-09-02	2024-09-05	Delivered	568676.24	mismatch price
ORD00083	CUST0031	SELL007	2024-07-09	2024-07-16	Delivered	221349.29	mismatch price
ORD00093	CUST0034	SELL014	2023-07-21	2023-07-22	Delivered	150879.51	mismatch price
ORD00024	CUST0008	SELL050	2023-09-23	2023-09-26	Delivered	202012.48	Verified
ORD00018	CUST0005	SELL041	2024-04-18	2024-04-21	Delivered	636190.87	mismatch price
ORD00026	CUST0008	SELL076	2023-11-05	2023-11-11	Delivered	641461.84	Verified
ORD00027	CUST0008	SELL041	2024-11-15	2024-11-19	Delivered	63031.03	Verified
ORD00028	CUST0009	SELL019	2023-10-10	2023-10-14	Delivered	387229.75	Verified
ORD00029	CUST0010	SELL028	2024-09-08	2024-09-15	Delivered	610496.92	Verified
ORD00032	CUST0012	SELL042	2024-10-08	2024-10-12	Delivered	742823.21	Verified
ORD00033	CUST0012	SELL084	2024-06-27	2024-07-02	Delivered	87218.76	Verified
ORD00037	CUST0014	SELL074	2024-11-11	2024-11-16	Delivered	418860.68	Verified
ORD00038	CUST0014	SELL090	2024-11-18	2024-11-25	Delivered	50969.15	Verified
ORD00040	CUST0014	SELL041	2024-08-19	2024-08-23	Delivered	181459.05	Verified
ORD00042	CUST0015	SELL067	2023-09-28	2023-09-29	Delivered	386969.63	Verified
ORD00045	CUST0017	SELL033	2023-07-07	2023-07-08	Delivered	37115.57	Verified
ORD00047	CUST0018	SELL088	2023-12-24	2023-12-27	Delivered	397308.38	Verified
ORD00048	CUST0020	SELL049	2023-11-03	2023-11-08	Delivered	620263.73	Verified
ORD00049	CUST0021	SELL024	2023-12-08	2023-12-16	Delivered	8921.75	Verified
ORD00056	CUST0021	SELL088	2024-09-29	2024-10-09	Delivered	55822.24	Verified
ORD00057	CUST0022	SELL022	2024-10-15	2024-10-19	Delivered	44075.43	Verified
ORD00060	CUST0023	SELL014	2024-09-07	2024-09-14	Delivered	719457.16	Verified
ORD00068	CUST0029	SELL014	2024-10-15	2024-10-21	Delivered	59207.10	Verified
ORD00070	CUST0029	SELL062	2024-07-06	2024-07-10	Delivered	14849.13	Verified
ORD00072	CUST0030	SELL013	2023-12-22	2023-12-27	Delivered	28219.20	Verified
ORD00074	CUST0030	SELL050	2024-12-29	2025-01-03	Delivered	85134.06	Verified
ORD00082	CUST0031	SELL069	2024-07-05	2024-07-06	Delivered	68811.36	Verified
ORD00084	CUST0031	SELL071	2024-09-07	2024-09-13	Delivered	156675.92	Verified
ORD00088	CUST0032	SELL024	2023-10-28	2023-11-01	Delivered	317920.43	Verified
ORD00089	CUST0033	SELL055	2024-02-07	2024-02-11	Delivered	11561.20	Verified
ORD00091	CUST0033	SELL035	2023-09-12	2023-09-16	Delivered	290642.30	Verified
ORD00092	CUST0034	SELL073	2023-06-12	2023-06-16	Delivered	172118.10	Verified
ORD00094	CUST0034	SELL037	2024-04-14	2024-04-20	Delivered	113579.08	Verified
ORD00095	CUST0034	SELL046	2023-11-01	2023-11-04	Delivered	105588.96	Verified
ORD00097	CUST0034	SELL088	2024-05-25	2024-05-31	Delivered	15165.36	Verified
ORD00100	CUST0036	SELL089	2024-11-21	2024-11-25	Delivered	1216584.61	Verified
ORD00103	CUST0037	SELL049	2024-08-25	2024-08-29	Delivered	541867.09	Verified
ORD00104	CUST0037	SELL019	2024-08-30	2024-09-06	Delivered	47715.49	Verified
ORD00163	CUST0060	SELL059	2024-06-30	2024-07-06	Delivered	272069.49	imputed verfied
ORD00107	CUST0040	SELL055	2024-10-28	2024-11-02	Delivered	163173.87	Verified
ORD00109	CUST0040	SELL014	2024-08-10	2024-08-13	Delivered	95695.43	Verified
ORD00139	CUST0049	SELL054	2024-12-02	2024-12-09	Delivered	61679.19	mismatch price
ORD00181	CUST0063	SELL070	2024-04-29	2024-05-02	Delivered	13862.43	imputed verfied
ORD00101	CUST0036	SELL054	2024-11-25	2024-12-01	Delivered	338696.40	imputed verfied
ORD00114	CUST0040	SELL088	2023-07-11	2023-07-15	Delivered	116631.80	Verified
ORD00156	CUST0058	SELL048	2023-12-29	2024-01-01	Delivered	28748.14	mismatch price
ORD00192	CUST0069	SELL055	2024-12-14	2024-12-17	Delivered	51341.16	mismatch price
ORD00170	CUST0061	SELL050	2024-08-10	2024-08-13	Delivered	445715.05	mismatch price
ORD00118	CUST0041	SELL041	2023-05-11	2023-05-21	Delivered	3808.56	Verified
ORD00119	CUST0041	SELL059	2024-02-07	2024-02-12	Delivered	30282.75	Verified
ORD00179	CUST0063	SELL034	2024-04-04	2024-04-06	Delivered	361242.00	mismatch price
ORD00121	CUST0041	SELL080	2023-06-23	2023-07-04	Delivered	361871.41	Verified
ORD00123	CUST0044	SELL014	2024-03-23	2024-03-29	Delivered	286796.28	Verified
ORD00124	CUST0044	SELL005	2024-09-27	2024-10-01	Delivered	17894.71	Verified
ORD00125	CUST0044	SELL047	2024-08-09	2024-08-16	Delivered	1308986.59	Verified
ORD00126	CUST0044	SELL052	2024-03-10	2024-03-13	Delivered	17879.04	Verified
ORD00110	CUST0040	SELL040	2023-09-20	2023-09-22	Delivered	73744.65	imputed verfied
ORD00130	CUST0046	SELL053	2024-06-06	2024-06-12	Delivered	409790.96	Verified
ORD00131	CUST0046	SELL013	2024-11-15	2024-11-20	Delivered	36567.08	Verified
ORD00132	CUST0047	SELL087	2024-03-22	2024-03-28	Delivered	387334.01	Verified
ORD00136	CUST0048	SELL014	2024-12-05	2024-12-09	Delivered	121358.37	Verified
ORD00138	CUST0049	SELL060	2024-07-18	2024-07-25	Delivered	90240.52	Verified
ORD00144	CUST0052	SELL029	2024-08-05	2024-08-18	Delivered	20387.66	Verified
ORD00146	CUST0052	SELL016	2023-11-18	2023-11-30	Delivered	67971.18	Verified
ORD00148	CUST0053	SELL049	2023-09-10	2023-09-14	Delivered	424510.83	Verified
ORD00149	CUST0054	SELL077	2024-02-23	2024-02-28	Delivered	165983.83	Verified
ORD00150	CUST0055	SELL015	2023-08-20	2023-08-23	Delivered	923063.39	Verified
ORD00152	CUST0058	SELL014	2024-11-23	2024-11-27	Delivered	381529.84	Verified
ORD00154	CUST0058	SELL066	2023-12-24	2023-12-25	Delivered	44137.50	Verified
ORD00155	CUST0058	SELL015	2024-08-19	2024-08-20	Delivered	407731.20	Verified
ORD00157	CUST0058	SELL042	2024-03-10	2024-03-17	Delivered	1837779.82	Verified
ORD00159	CUST0059	SELL054	2024-11-04	2024-11-11	Delivered	8939.52	Verified
ORD00161	CUST0059	SELL068	2024-07-29	2024-08-09	Delivered	198883.60	Verified
ORD00165	CUST0061	SELL010	2024-07-19	2024-07-22	Delivered	72273.39	Verified
ORD00166	CUST0061	SELL041	2024-12-04	2024-12-06	Delivered	241237.25	Verified
ORD00169	CUST0061	SELL027	2024-08-25	2024-08-28	Delivered	74101.71	Verified
ORD00172	CUST0062	SELL011	2024-04-19	2024-04-24	Delivered	140456.88	Verified
ORD00173	CUST0062	SELL048	2024-05-24	2024-05-27	Delivered	10045.04	Verified
ORD00175	CUST0062	SELL074	2024-03-27	2024-03-28	Delivered	1362565.60	Verified
ORD00176	CUST0063	SELL029	2024-03-11	2024-03-12	Delivered	463018.78	Verified
ORD00178	CUST0063	SELL022	2023-07-15	2023-07-16	Delivered	12927.06	Verified
ORD00183	CUST0064	SELL090	2024-11-15	2024-11-20	Delivered	1118704.60	Verified
ORD00184	CUST0065	SELL036	2024-12-18	2024-12-22	Delivered	1110784.70	Verified
ORD00186	CUST0066	SELL038	2024-10-07	2024-10-10	Delivered	68811.36	Verified
ORD00187	CUST0066	SELL056	2024-09-05	2024-09-07	Delivered	279610.57	Verified
ORD00190	CUST0067	SELL013	2024-12-16	2024-12-20	Delivered	205354.87	Verified
ORD00191	CUST0068	SELL060	2023-10-30	2023-11-05	Delivered	11170.68	Verified
ORD00194	CUST0069	SELL086	2024-12-23	2024-12-27	Delivered	1633.04	Verified
ORD00196	CUST0069	SELL075	2024-12-24	2024-12-30	Delivered	1906549.00	Verified
ORD00197	CUST0071	SELL001	2023-10-04	2023-10-07	Delivered	1106566.77	Verified
ORD00198	CUST0071	SELL004	2024-01-07	2024-01-11	Delivered	637741.33	Verified
ORD00200	CUST0071	SELL085	2023-05-21	2023-05-28	Delivered	15864.45	Verified
ORD00246	CUST0088	SELL053	2024-02-09	2024-02-10	Delivered	73882.44	imputed verfied
ORD00202	CUST0071	SELL016	2023-09-27	2023-10-01	Delivered	415783.66	Verified
ORD00232	CUST0082	SELL005	2024-05-27	2024-05-31	Delivered	114557.57	mismatch price
ORD00205	CUST0072	SELL049	2024-08-09	2024-08-18	Delivered	184222.10	Verified
ORD00206	CUST0073	SELL014	2024-12-07	2024-12-13	Delivered	207195.58	Verified
ORD00208	CUST0075	SELL074	2024-10-26	2024-11-01	Delivered	463513.16	Verified
ORD00210	CUST0076	SELL053	2024-12-25	2025-01-01	Delivered	1046114.96	Verified
ORD00212	CUST0076	SELL017	2024-12-20	2024-12-21	Delivered	97186.64	Verified
ORD00215	CUST0077	SELL043	2024-09-27	2024-10-03	Delivered	1067633.73	Verified
ORD00216	CUST0077	SELL054	2024-04-25	2024-04-29	Delivered	104715.98	Verified
ORD00220	CUST0080	SELL056	2024-08-05	2024-08-08	Delivered	1821077.11	Verified
ORD00223	CUST0081	SELL047	2024-03-02	2024-03-05	Delivered	81177.59	Verified
ORD00225	CUST0081	SELL019	2024-02-26	2024-03-03	Delivered	68706.68	Verified
ORD00226	CUST0081	SELL005	2024-01-08	2024-01-15	Delivered	340737.24	Verified
ORD00228	CUST0081	SELL085	2024-10-13	2024-10-14	Delivered	19060.11	Verified
ORD00230	CUST0081	SELL071	2024-11-30	2024-12-01	Delivered	18140.90	Verified
ORD00231	CUST0082	SELL060	2024-09-18	2024-09-22	Delivered	299658.88	Verified
ORD00234	CUST0083	SELL036	2024-10-15	2024-10-16	Delivered	869814.44	Verified
ORD00238	CUST0083	SELL074	2024-07-22	2024-07-25	Delivered	2985.64	Verified
ORD00239	CUST0083	SELL047	2024-08-08	2024-08-13	Delivered	8185.56	Verified
ORD00240	CUST0084	SELL076	2024-09-24	2024-09-26	Delivered	210685.32	Verified
ORD00243	CUST0084	SELL043	2024-11-16	2024-11-18	Delivered	34836.28	Verified
ORD00245	CUST0087	SELL030	2024-01-12	2024-01-21	Delivered	87303.72	Verified
ORD00247	CUST0088	SELL071	2023-06-28	2023-07-05	Delivered	125704.93	Verified
ORD00252	CUST0090	SELL076	2024-10-26	2024-11-01	Delivered	53834.42	Verified
ORD00254	CUST0090	SELL027	2024-05-28	2024-06-03	Delivered	90661.69	Verified
ORD00259	CUST0093	SELL041	2024-09-29	2024-10-05	Delivered	1008375.05	Verified
ORD00260	CUST0093	SELL029	2024-01-01	2024-01-05	Delivered	21046.98	Verified
ORD00261	CUST0093	SELL012	2024-01-20	2024-01-26	Delivered	1033526.75	Verified
ORD00266	CUST0096	SELL053	2024-09-06	2024-09-14	Delivered	39485.36	Verified
ORD00267	CUST0096	SELL044	2024-08-09	2024-08-15	Delivered	1337468.88	Verified
ORD00268	CUST0096	SELL015	2024-12-24	2025-01-06	Delivered	1040455.46	Verified
ORD00270	CUST0097	SELL048	2024-12-06	2024-12-10	Delivered	13380.15	Verified
ORD00272	CUST0099	SELL049	2023-12-14	2023-12-17	Delivered	57378.28	Verified
ORD00273	CUST0099	SELL078	2024-06-03	2024-06-13	Delivered	688797.69	Verified
ORD00274	CUST0099	SELL049	2023-07-16	2023-07-25	Delivered	21686.24	Verified
ORD00275	CUST0099	SELL065	2024-08-11	2024-08-21	Delivered	795534.40	Verified
ORD00276	CUST0100	SELL004	2024-06-19	2024-06-24	Delivered	189891.12	Verified
ORD00277	CUST0100	SELL081	2024-11-03	2024-11-05	Delivered	565928.04	Verified
ORD00278	CUST0100	SELL064	2024-12-03	2024-12-10	Delivered	36834.84	Verified
ORD00281	CUST0100	SELL064	2024-06-21	2024-06-25	Delivered	11957.92	Verified
ORD00282	CUST0100	SELL016	2024-09-07	2024-09-10	Delivered	163963.66	Verified
ORD00284	CUST0101	SELL061	2023-09-15	2023-09-21	Delivered	24967.78	Verified
ORD00285	CUST0101	SELL026	2023-05-05	2023-05-07	Delivered	21301.38	Verified
ORD00286	CUST0101	SELL072	2023-10-07	2023-10-13	Delivered	1482049.93	Verified
ORD00289	CUST0102	SELL019	2023-10-05	2023-10-09	Delivered	838831.71	Verified
ORD00291	CUST0102	SELL061	2024-04-03	2024-04-11	Delivered	8834.25	Verified
ORD00293	CUST0102	SELL060	2024-02-17	2024-02-24	Delivered	511280.86	Verified
ORD00294	CUST0102	SELL068	2023-03-08	2023-03-15	Delivered	52451.70	Verified
ORD00296	CUST0102	SELL074	2023-11-12	2023-11-14	Delivered	95114.76	Verified
ORD00297	CUST0105	SELL008	2023-07-21	2023-07-25	Delivered	375751.75	Verified
ORD00298	CUST0105	SELL041	2023-05-15	2023-05-28	Delivered	392099.74	Verified
ORD00300	CUST0105	SELL001	2024-06-20	2024-07-04	Delivered	60582.65	Verified
ORD00301	CUST0106	SELL024	2024-06-01	2024-06-05	Delivered	1006562.43	Verified
ORD00302	CUST0107	SELL017	2024-10-07	2024-10-12	Delivered	72273.39	Verified
ORD00303	CUST0107	SELL035	2024-10-16	2024-10-21	Delivered	541298.27	Verified
ORD00368	CUST0126	SELL043	2024-06-14	2024-06-20	Delivered	92322.49	imputed verfied
ORD00305	CUST0107	SELL027	2024-12-04	2024-12-10	Delivered	23962.00	Verified
ORD00383	CUST0129	SELL019	2024-12-26	2025-01-02	Delivered	8999.40	mismatch price
ORD00307	CUST0107	SELL076	2024-09-29	2024-10-08	Delivered	124012.95	Verified
ORD00331	CUST0116	SELL036	2024-07-04	2024-07-08	Delivered	643433.84	mismatch price
ORD00312	CUST0108	SELL077	2024-06-11	2024-06-17	Delivered	517459.78	Verified
ORD00313	CUST0110	SELL024	2024-09-22	2024-09-23	Delivered	649434.60	Verified
ORD00314	CUST0111	SELL013	2024-11-11	2024-11-14	Delivered	331970.24	Verified
ORD00317	CUST0111	SELL023	2024-11-12	2024-11-17	Delivered	1015340.04	Verified
ORD00324	CUST0114	SELL037	2024-07-23	2024-07-27	Delivered	20703.44	Verified
ORD00325	CUST0114	SELL044	2024-11-19	2024-11-23	Delivered	1024046.49	Verified
ORD00329	CUST0116	SELL044	2023-07-26	2023-07-29	Delivered	1056588.38	Verified
ORD00330	CUST0116	SELL079	2024-11-18	2024-11-24	Delivered	237701.88	Verified
ORD00333	CUST0116	SELL003	2024-03-04	2024-03-09	Delivered	1038583.27	Verified
ORD00335	CUST0117	SELL087	2024-11-28	2024-12-02	Delivered	11561.20	Verified
ORD00337	CUST0118	SELL037	2024-09-04	2024-09-07	Delivered	118777.43	Verified
ORD00338	CUST0119	SELL015	2023-11-08	2023-11-10	Delivered	835660.76	Verified
ORD00345	CUST0120	SELL059	2024-09-01	2024-09-10	Delivered	12341.62	Verified
ORD00347	CUST0121	SELL034	2024-05-19	2024-05-28	Delivered	1135166.90	Verified
ORD00348	CUST0122	SELL081	2024-04-13	2024-04-24	Delivered	80565.33	Verified
ORD00351	CUST0122	SELL019	2024-08-09	2024-08-14	Delivered	905369.04	Verified
ORD00353	CUST0123	SELL004	2024-03-08	2024-03-13	Delivered	1747386.06	Verified
ORD00360	CUST0123	SELL069	2024-06-17	2024-06-20	Delivered	579273.29	Verified
ORD00361	CUST0123	SELL039	2024-06-21	2024-06-30	Delivered	81869.66	Verified
ORD00363	CUST0124	SELL069	2024-12-18	2024-12-25	Delivered	58042.90	Verified
ORD00367	CUST0126	SELL061	2024-03-31	2024-04-10	Delivered	71357.08	Verified
ORD00369	CUST0126	SELL046	2024-08-04	2024-08-12	Delivered	135890.25	Verified
ORD00372	CUST0127	SELL063	2024-11-15	2024-11-21	Delivered	9954.82	Verified
ORD00374	CUST0127	SELL042	2024-09-26	2024-09-28	Delivered	68757.46	Verified
ORD00376	CUST0128	SELL018	2024-06-23	2024-06-25	Delivered	33000.44	Verified
ORD00385	CUST0129	SELL030	2024-11-30	2024-12-03	Delivered	1340872.79	Verified
ORD00386	CUST0129	SELL057	2024-12-03	2024-12-07	Delivered	549925.12	Verified
ORD00389	CUST0130	SELL054	2024-11-24	2024-12-03	Delivered	170398.32	Verified
ORD00390	CUST0130	SELL011	2024-12-19	2025-01-02	Delivered	46462.10	Verified
ORD00391	CUST0130	SELL023	2024-10-02	2024-10-08	Delivered	73400.14	Verified
ORD00393	CUST0130	SELL021	2024-12-21	2024-12-25	Delivered	487075.95	Verified
ORD00394	CUST0131	SELL043	2024-09-20	2024-09-22	Delivered	1174.07	Verified
ORD00395	CUST0131	SELL077	2024-06-02	2024-06-10	Delivered	392693.70	Verified
ORD00454	CUST0145	SELL029	2024-11-15	2024-11-17	Delivered	1300172.97	mismatch price
ORD00479	CUST0152	SELL018	2024-06-28	2024-07-01	Delivered	130549.90	mismatch price
ORD00409	CUST0134	SELL054	2024-01-29	2024-02-09	Delivered	208766.75	Verified
ORD00412	CUST0135	SELL087	2024-04-30	2024-05-04	Delivered	100026.32	Verified
ORD00413	CUST0135	SELL030	2024-11-07	2024-11-16	Delivered	227426.90	Verified
ORD00416	CUST0137	SELL036	2024-11-06	2024-11-09	Delivered	73579.33	Verified
ORD00423	CUST0138	SELL045	2024-10-28	2024-11-05	Delivered	168960.56	Verified
ORD00427	CUST0139	SELL019	2024-12-07	2024-12-13	Delivered	142692.85	Verified
ORD00431	CUST0139	SELL073	2024-04-21	2024-05-01	Delivered	899321.45	Verified
ORD00433	CUST0139	SELL069	2023-06-14	2023-06-19	Delivered	132923.54	Verified
ORD00437	CUST0140	SELL066	2024-03-17	2024-03-22	Delivered	284037.06	Verified
ORD00441	CUST0141	SELL013	2023-07-15	2023-07-22	Delivered	1817749.85	Verified
ORD00447	CUST0144	SELL063	2024-04-08	2024-04-15	Delivered	11561.20	Verified
ORD00450	CUST0145	SELL055	2024-11-14	2024-11-20	Delivered	115950.03	Verified
ORD00453	CUST0145	SELL007	2024-11-14	2024-11-19	Delivered	67579.57	Verified
ORD00455	CUST0145	SELL001	2024-12-16	2024-12-19	Delivered	792677.46	Verified
ORD00456	CUST0145	SELL088	2024-12-14	2024-12-18	Delivered	701886.30	Verified
ORD00457	CUST0145	SELL025	2024-11-28	2024-12-05	Delivered	1255316.56	Verified
ORD00458	CUST0148	SELL022	2024-08-16	2024-08-19	Delivered	166388.35	Verified
ORD00460	CUST0148	SELL089	2024-11-06	2024-11-13	Delivered	160987.02	Verified
ORD00463	CUST0148	SELL057	2024-09-17	2024-09-23	Delivered	7172.97	Verified
ORD00468	CUST0149	SELL059	2024-06-11	2024-06-13	Delivered	231544.96	Verified
ORD00470	CUST0149	SELL030	2024-06-14	2024-06-19	Delivered	816829.96	Verified
ORD00471	CUST0150	SELL025	2024-10-15	2024-10-17	Delivered	167987.24	Verified
ORD00472	CUST0150	SELL070	2024-05-28	2024-05-29	Delivered	37254.90	Verified
ORD00477	CUST0152	SELL023	2024-06-29	2024-07-13	Delivered	117508.45	Verified
ORD00478	CUST0152	SELL080	2024-02-05	2024-02-16	Delivered	3149.21	Verified
ORD00481	CUST0152	SELL015	2024-10-25	2024-10-30	Delivered	924212.96	Verified
ORD00482	CUST0152	SELL067	2024-03-22	2024-03-29	Delivered	515180.54	Verified
ORD00484	CUST0153	SELL089	2024-12-10	2024-12-11	Delivered	508341.61	Verified
ORD00490	CUST0156	SELL050	2024-08-01	2024-08-05	Delivered	22192.46	Verified
ORD00571	CUST0179	SELL033	2024-09-19	2024-09-22	Delivered	49774.10	imputed verfied
ORD00496	CUST0157	SELL025	2024-09-08	2024-09-13	Delivered	73744.65	imputed verfied
ORD00493	CUST0156	SELL045	2024-08-21	2024-08-28	Delivered	118235.75	Verified
ORD00494	CUST0156	SELL011	2024-12-13	2024-12-22	Delivered	876039.35	Verified
ORD00497	CUST0157	SELL052	2024-11-07	2024-11-14	Delivered	20993.04	Verified
ORD00498	CUST0157	SELL041	2024-12-13	2024-12-15	Delivered	82041.04	Verified
ORD00500	CUST0158	SELL021	2023-12-30	2024-01-03	Delivered	26343.44	Verified
ORD00501	CUST0158	SELL021	2024-06-01	2024-06-08	Delivered	354085.10	Verified
ORD00502	CUST0158	SELL067	2024-07-27	2024-07-29	Delivered	929593.33	Verified
ORD00504	CUST0158	SELL054	2023-10-22	2023-10-25	Delivered	200052.64	Verified
ORD00505	CUST0159	SELL074	2024-09-30	2024-10-03	Delivered	734614.02	Verified
ORD00506	CUST0159	SELL003	2023-12-30	2024-01-03	Delivered	108353.68	Verified
ORD00509	CUST0159	SELL041	2024-06-07	2024-06-10	Delivered	72047.64	Verified
ORD00511	CUST0161	SELL038	2024-07-21	2024-07-26	Delivered	3485.44	Verified
ORD00513	CUST0162	SELL017	2024-11-11	2024-11-16	Delivered	198883.60	Verified
ORD00514	CUST0162	SELL049	2024-11-23	2024-11-26	Delivered	235009.16	Verified
ORD00516	CUST0162	SELL021	2024-06-03	2024-06-08	Delivered	589959.06	Verified
ORD00517	CUST0162	SELL083	2024-12-28	2025-01-01	Delivered	168325.37	Verified
ORD00518	CUST0162	SELL088	2024-07-18	2024-07-24	Delivered	125685.71	Verified
ORD00522	CUST0162	SELL026	2024-12-10	2024-12-17	Delivered	817839.94	Verified
ORD00523	CUST0162	SELL086	2024-04-07	2024-04-13	Delivered	180380.35	Verified
ORD00524	CUST0162	SELL039	2024-07-07	2024-07-12	Delivered	339418.37	Verified
ORD00525	CUST0163	SELL028	2024-09-01	2024-09-02	Delivered	841301.64	Verified
ORD00527	CUST0165	SELL073	2023-06-07	2023-06-15	Delivered	1380886.77	Verified
ORD00529	CUST0169	SELL062	2024-01-05	2024-01-10	Delivered	27825.60	Verified
ORD00530	CUST0169	SELL060	2023-05-04	2023-05-08	Delivered	1120410.59	Verified
ORD00534	CUST0170	SELL048	2024-10-31	2024-11-04	Delivered	223383.08	Verified
ORD00535	CUST0170	SELL018	2024-11-13	2024-11-16	Delivered	193656.60	Verified
ORD00538	CUST0171	SELL086	2023-12-21	2023-12-26	Delivered	451022.95	Verified
ORD00541	CUST0171	SELL025	2024-11-09	2024-11-16	Delivered	768841.50	Verified
ORD00542	CUST0171	SELL058	2024-12-01	2024-12-04	Delivered	926660.16	Verified
ORD00545	CUST0173	SELL081	2024-11-13	2024-11-15	Delivered	240142.74	Verified
ORD00546	CUST0173	SELL053	2024-12-23	2024-12-28	Delivered	181459.05	Verified
ORD00548	CUST0174	SELL063	2024-12-11	2024-12-16	Delivered	13409.28	Verified
ORD00549	CUST0174	SELL088	2024-12-12	2024-12-13	Delivered	95430.98	Verified
ORD00552	CUST0174	SELL047	2024-12-10	2024-12-14	Delivered	1613502.06	Verified
ORD00554	CUST0174	SELL018	2024-12-04	2024-12-06	Delivered	160848.97	Verified
ORD00557	CUST0174	SELL002	2024-11-04	2024-11-09	Delivered	10095.25	Verified
ORD00561	CUST0175	SELL051	2024-12-04	2024-12-11	Delivered	378503.96	Verified
ORD00563	CUST0175	SELL054	2024-12-14	2024-12-16	Delivered	65148.54	Verified
ORD00567	CUST0178	SELL067	2024-03-30	2024-04-02	Delivered	98560.00	Verified
ORD00570	CUST0178	SELL064	2024-05-01	2024-05-07	Delivered	43905.60	Verified
ORD00573	CUST0181	SELL047	2024-05-31	2024-06-01	Delivered	1564948.01	Verified
ORD00575	CUST0181	SELL030	2024-08-19	2024-08-21	Delivered	10095.25	Verified
ORD00578	CUST0183	SELL031	2024-01-27	2024-01-29	Delivered	146008.50	Verified
ORD00580	CUST0183	SELL056	2024-03-20	2024-03-29	Delivered	236830.69	Verified
ORD00581	CUST0183	SELL077	2024-01-12	2024-01-15	Delivered	109722.82	Verified
ORD00583	CUST0183	SELL047	2023-07-08	2023-07-15	Delivered	32894.08	Verified
ORD00584	CUST0183	SELL030	2023-09-15	2023-09-22	Delivered	76881.64	Verified
ORD00586	CUST0185	SELL056	2024-11-10	2024-11-12	Delivered	359728.58	Verified
ORD00587	CUST0187	SELL055	2024-11-19	2024-11-28	Delivered	655577.48	Verified
ORD00667	CUST0207	SELL069	2024-04-10	2024-04-15	Delivered	126061.60	imputed verfied
ORD00593	CUST0188	SELL048	2024-05-05	2024-05-10	Delivered	76726.04	mismatch price
ORD00595	CUST0190	SELL060	2024-11-01	2024-11-10	Delivered	649434.60	Verified
ORD00598	CUST0190	SELL066	2024-12-10	2024-12-12	Delivered	17607.17	mismatch price
ORD00638	CUST0200	SELL021	2023-05-26	2023-06-03	Delivered	439020.25	mismatch price
ORD00599	CUST0190	SELL037	2024-11-27	2024-12-04	Delivered	58703.25	Verified
ORD00600	CUST0190	SELL005	2024-12-01	2024-12-11	Delivered	771760.08	Verified
ORD00648	CUST0203	SELL007	2024-11-25	2024-12-01	Delivered	167249.52	mismatch price
ORD00602	CUST0190	SELL002	2024-10-28	2024-11-03	Delivered	656811.71	Verified
ORD00603	CUST0192	SELL087	2024-11-20	2024-11-22	Delivered	78576.78	Verified
ORD00608	CUST0193	SELL085	2023-09-27	2023-10-01	Delivered	25829.99	Verified
ORD00609	CUST0194	SELL016	2023-04-12	2023-04-15	Delivered	18483.24	Verified
ORD00611	CUST0196	SELL002	2023-08-12	2023-08-18	Delivered	45102.28	Verified
ORD00615	CUST0196	SELL038	2024-10-03	2024-10-08	Delivered	803078.39	Verified
ORD00616	CUST0196	SELL090	2024-02-10	2024-02-17	Delivered	24990.69	Verified
ORD00617	CUST0197	SELL040	2024-07-03	2024-07-08	Delivered	21709.68	Verified
ORD00619	CUST0198	SELL017	2024-11-12	2024-11-16	Delivered	264786.66	Verified
ORD00620	CUST0198	SELL056	2024-12-10	2024-12-14	Delivered	191420.62	Verified
ORD00621	CUST0198	SELL033	2024-11-25	2024-11-26	Delivered	30284.60	Verified
ORD00624	CUST0198	SELL031	2024-11-24	2024-11-26	Delivered	45992.18	Verified
ORD00625	CUST0198	SELL079	2024-12-13	2024-12-16	Delivered	102447.74	Verified
ORD00626	CUST0198	SELL043	2024-12-05	2024-12-07	Delivered	85781.07	Verified
ORD00628	CUST0198	SELL003	2024-12-02	2024-12-05	Delivered	1022886.92	Verified
ORD00630	CUST0199	SELL001	2024-10-06	2024-10-09	Delivered	152795.70	Verified
ORD00635	CUST0199	SELL027	2024-07-14	2024-07-18	Delivered	204981.37	Verified
ORD00637	CUST0199	SELL046	2024-10-24	2024-10-25	Delivered	918620.89	Verified
ORD00639	CUST0200	SELL052	2024-06-07	2024-06-18	Delivered	274071.30	Verified
ORD00643	CUST0202	SELL069	2024-11-19	2024-11-22	Delivered	988437.53	Verified
ORD00649	CUST0203	SELL034	2024-09-10	2024-09-11	Delivered	8700.29	Verified
ORD00652	CUST0203	SELL008	2024-07-28	2024-07-30	Delivered	534704.88	Verified
ORD00653	CUST0203	SELL037	2024-11-08	2024-11-13	Delivered	138579.52	Verified
ORD00655	CUST0203	SELL006	2024-11-28	2024-12-04	Delivered	24463.34	Verified
ORD00658	CUST0205	SELL056	2024-02-11	2024-02-17	Delivered	409790.96	Verified
ORD00660	CUST0205	SELL061	2024-03-20	2024-03-22	Delivered	872071.33	Verified
ORD00663	CUST0205	SELL035	2024-11-23	2024-11-26	Delivered	739180.57	Verified
ORD00665	CUST0207	SELL001	2024-11-19	2024-11-26	Delivered	564791.35	Verified
ORD00666	CUST0207	SELL086	2024-12-22	2024-12-30	Delivered	286980.91	Verified
ORD00668	CUST0207	SELL030	2023-07-19	2023-07-23	Delivered	1755792.32	Verified
ORD00669	CUST0209	SELL029	2024-08-31	2024-09-02	Delivered	130533.42	Verified
ORD00671	CUST0209	SELL036	2024-03-27	2024-04-02	Delivered	100327.02	Verified
ORD00675	CUST0209	SELL027	2024-02-01	2024-02-07	Delivered	78955.84	Verified
ORD00676	CUST0209	SELL022	2024-02-14	2024-02-15	Delivered	3568.70	Verified
ORD00677	CUST0209	SELL028	2024-01-19	2024-01-21	Delivered	2985.64	Verified
ORD00678	CUST0209	SELL072	2024-02-18	2024-02-23	Delivered	507804.25	Verified
ORD00681	CUST0210	SELL069	2024-10-22	2024-10-28	Delivered	178295.72	Verified
ORD00685	CUST0211	SELL002	2024-01-08	2024-01-15	Delivered	1607599.10	Verified
ORD00745	CUST0223	SELL014	2023-09-26	2023-10-01	Delivered	21878.24	mismatch price
ORD00740	CUST0222	SELL017	2024-01-13	2024-01-16	Delivered	254137.17	mismatch price
ORD00692	CUST0211	SELL048	2024-07-04	2024-07-07	Delivered	191405.76	Verified
ORD00698	CUST0212	SELL068	2024-04-19	2024-04-25	Delivered	112612.34	Verified
ORD00699	CUST0212	SELL050	2024-08-30	2024-09-05	Delivered	283877.97	Verified
ORD00704	CUST0213	SELL027	2024-04-19	2024-04-21	Delivered	526844.32	Verified
ORD00706	CUST0213	SELL042	2024-03-11	2024-03-17	Delivered	877534.55	Verified
ORD00710	CUST0214	SELL010	2024-10-25	2024-10-30	Delivered	32300.05	Verified
ORD00712	CUST0216	SELL010	2024-09-27	2024-10-01	Delivered	1018573.95	Verified
ORD00716	CUST0217	SELL059	2024-08-24	2024-08-30	Delivered	70228.44	Verified
ORD00718	CUST0217	SELL063	2024-09-14	2024-09-21	Delivered	431300.41	Verified
ORD00719	CUST0217	SELL001	2024-09-16	2024-09-21	Delivered	361931.70	Verified
ORD00720	CUST0217	SELL028	2024-12-31	2025-01-01	Delivered	473129.95	Verified
ORD00721	CUST0217	SELL003	2024-11-20	2024-11-26	Delivered	1017025.87	Verified
ORD00722	CUST0217	SELL003	2024-10-31	2024-11-02	Delivered	569557.84	Verified
ORD00726	CUST0220	SELL008	2024-08-25	2024-08-30	Delivered	537796.40	Verified
ORD00730	CUST0220	SELL046	2023-11-09	2023-11-16	Delivered	89136.44	Verified
ORD00731	CUST0220	SELL010	2024-07-03	2024-07-09	Delivered	330791.24	Verified
ORD00732	CUST0220	SELL035	2023-10-13	2023-10-15	Delivered	41020.52	Verified
ORD00735	CUST0221	SELL049	2024-01-03	2024-01-04	Delivered	260806.91	Verified
ORD00736	CUST0221	SELL023	2024-01-17	2024-01-24	Delivered	166699.15	Verified
ORD00737	CUST0221	SELL037	2024-08-30	2024-09-04	Delivered	1015740.44	Verified
ORD00741	CUST0223	SELL001	2023-09-26	2023-09-28	Delivered	582824.76	Verified
ORD00742	CUST0223	SELL070	2024-05-04	2024-05-08	Delivered	122312.70	Verified
ORD00743	CUST0223	SELL076	2024-12-23	2024-12-26	Delivered	63585.10	Verified
ORD00744	CUST0223	SELL013	2024-07-23	2024-07-24	Delivered	1283879.52	Verified
ORD00748	CUST0223	SELL041	2024-11-22	2024-11-28	Delivered	603998.75	Verified
ORD00751	CUST0223	SELL045	2023-12-06	2023-12-12	Delivered	54346.36	Verified
ORD00752	CUST0223	SELL070	2024-06-22	2024-06-25	Delivered	462984.69	Verified
ORD00757	CUST0225	SELL089	2024-07-23	2024-07-25	Delivered	63131.92	Verified
ORD00758	CUST0225	SELL085	2024-03-25	2024-04-04	Delivered	13409.28	Verified
ORD00761	CUST0227	SELL001	2024-12-13	2024-12-18	Delivered	359728.58	Verified
ORD00763	CUST0227	SELL044	2024-12-15	2024-12-21	Delivered	684591.89	Verified
ORD00766	CUST0228	SELL029	2024-10-22	2024-10-27	Delivered	147425.86	Verified
ORD00767	CUST0228	SELL063	2024-11-16	2024-11-22	Delivered	169258.32	Verified
ORD00768	CUST0228	SELL029	2024-12-27	2024-12-30	Delivered	53790.15	Verified
ORD00770	CUST0228	SELL027	2024-10-05	2024-10-08	Delivered	17287.41	Verified
ORD00771	CUST0229	SELL047	2024-03-05	2024-03-07	Delivered	110258.32	Verified
ORD00773	CUST0229	SELL012	2024-03-06	2024-03-13	Delivered	66595.50	Verified
ORD00779	CUST0231	SELL076	2024-04-26	2024-04-28	Delivered	271470.00	Verified
ORD00782	CUST0231	SELL063	2024-07-13	2024-07-18	Delivered	30345.96	Verified
ORD00825	CUST0248	SELL077	2024-06-09	2024-06-17	Delivered	512561.00	imputed verfied
ORD00786	CUST0232	SELL002	2024-10-23	2024-10-31	Delivered	70957.82	Verified
ORD00788	CUST0232	SELL072	2024-08-07	2024-08-14	Delivered	71048.06	Verified
ORD00789	CUST0232	SELL066	2024-08-08	2024-08-11	Delivered	37830.93	Verified
ORD00807	CUST0238	SELL085	2024-12-27	2024-12-30	Delivered	103538.61	mismatch price
ORD00827	CUST0248	SELL068	2024-01-09	2024-01-12	Delivered	29001.62	mismatch price
ORD00877	CUST0259	SELL089	2024-09-22	2024-09-27	Delivered	104703.44	mismatch price
ORD00844	CUST0252	SELL051	2024-10-31	2024-11-06	Delivered	34248.48	mismatch price
ORD00795	CUST0236	SELL074	2024-07-22	2024-07-25	Delivered	103294.81	Verified
ORD00796	CUST0236	SELL008	2024-06-11	2024-06-13	Delivered	51096.45	Verified
ORD00797	CUST0236	SELL042	2024-06-21	2024-06-28	Delivered	816.52	Verified
ORD00798	CUST0237	SELL051	2024-07-18	2024-07-25	Delivered	460779.85	Verified
ORD00801	CUST0237	SELL009	2024-11-16	2024-11-25	Delivered	74516.28	Verified
ORD00802	CUST0238	SELL083	2024-12-04	2024-12-06	Delivered	1032680.62	Verified
ORD00803	CUST0238	SELL026	2024-12-31	2025-01-05	Delivered	643024.25	Verified
ORD00805	CUST0238	SELL085	2024-12-28	2025-01-04	Delivered	177974.85	Verified
ORD00806	CUST0238	SELL014	2024-12-06	2024-12-10	Delivered	8480.78	Verified
ORD00808	CUST0238	SELL085	2024-12-20	2024-12-21	Delivered	87610.75	Verified
ORD00809	CUST0238	SELL037	2024-12-17	2024-12-18	Delivered	17694.90	Verified
ORD00812	CUST0244	SELL046	2024-12-08	2024-12-17	Delivered	194607.91	Verified
ORD00813	CUST0244	SELL020	2024-11-30	2024-12-04	Delivered	5416.29	Verified
ORD00814	CUST0244	SELL064	2024-12-09	2024-12-20	Delivered	246012.35	Verified
ORD00815	CUST0245	SELL053	2024-05-24	2024-05-26	Delivered	91572.30	Verified
ORD00816	CUST0245	SELL021	2024-05-30	2024-06-05	Delivered	60039.89	Verified
ORD00819	CUST0245	SELL060	2024-12-04	2024-12-10	Delivered	397793.53	Verified
ORD00820	CUST0246	SELL071	2023-05-12	2023-05-20	Delivered	24825.96	Verified
ORD00821	CUST0246	SELL006	2024-08-15	2024-08-25	Delivered	142890.79	Verified
ORD00823	CUST0247	SELL037	2024-02-20	2024-02-21	Delivered	33288.69	Verified
ORD00824	CUST0247	SELL026	2024-08-14	2024-08-20	Delivered	15571.78	Verified
ORD00828	CUST0248	SELL043	2024-05-24	2024-05-30	Delivered	527527.80	Verified
ORD00829	CUST0249	SELL034	2024-10-23	2024-10-29	Delivered	576056.05	Verified
ORD00830	CUST0249	SELL006	2024-10-27	2024-10-29	Delivered	2248.73	Verified
ORD00833	CUST0250	SELL032	2023-12-31	2024-01-06	Delivered	308147.91	Verified
ORD00835	CUST0250	SELL085	2024-04-19	2024-04-27	Delivered	93330.92	Verified
ORD00845	CUST0252	SELL012	2024-04-16	2024-04-23	Delivered	176253.29	Verified
ORD00846	CUST0252	SELL089	2024-05-16	2024-05-22	Delivered	325875.84	Verified
ORD00849	CUST0253	SELL057	2024-05-18	2024-05-21	Delivered	110640.11	Verified
ORD00851	CUST0254	SELL069	2024-04-27	2024-05-05	Delivered	570375.48	Verified
ORD00853	CUST0254	SELL076	2024-02-11	2024-02-14	Delivered	545501.09	Verified
ORD00854	CUST0254	SELL006	2024-01-05	2024-01-10	Delivered	140041.10	Verified
ORD00855	CUST0254	SELL016	2024-06-07	2024-06-13	Delivered	48024.83	Verified
ORD00856	CUST0254	SELL061	2024-10-21	2024-10-24	Delivered	885861.21	Verified
ORD00857	CUST0254	SELL001	2024-11-22	2024-12-02	Delivered	120073.18	Verified
ORD00862	CUST0255	SELL008	2023-12-26	2024-01-09	Delivered	32819.40	Verified
ORD00863	CUST0255	SELL083	2024-04-24	2024-05-08	Delivered	20590.75	Verified
ORD00868	CUST0258	SELL017	2024-12-23	2024-12-27	Delivered	234388.12	Verified
ORD00869	CUST0258	SELL055	2024-06-15	2024-06-21	Delivered	179864.29	Verified
ORD00874	CUST0258	SELL002	2024-09-01	2024-09-08	Delivered	135102.64	Verified
ORD00875	CUST0258	SELL033	2024-07-14	2024-07-19	Delivered	16199.28	Verified
ORD00878	CUST0259	SELL044	2024-11-23	2024-11-27	Delivered	354205.42	Verified
ORD00880	CUST0259	SELL025	2024-10-02	2024-10-03	Delivered	552557.03	Verified
ORD00884	CUST0261	SELL036	2024-05-25	2024-05-29	Delivered	337069.86	Verified
ORD00885	CUST0261	SELL047	2024-09-11	2024-09-21	Delivered	183062.91	Verified
ORD00886	CUST0261	SELL019	2024-02-08	2024-02-11	Delivered	55373.35	Verified
ORD00890	CUST0261	SELL020	2023-11-13	2023-11-16	Delivered	2057186.68	Verified
ORD00882	CUST0260	SELL065	2023-10-23	2023-10-28	Delivered	109517.52	mismatch price
ORD00888	CUST0261	SELL088	2024-07-19	2024-07-28	Delivered	15006.39	mismatch price
ORD00891	CUST0261	SELL002	2023-08-13	2023-08-16	Delivered	114528.20	mismatch price
ORD00895	CUST0264	SELL003	2023-10-11	2023-10-16	Delivered	365253.79	Verified
ORD00902	CUST0268	SELL049	2024-11-14	2024-11-18	Delivered	24376.32	mismatch price
ORD00948	CUST0278	SELL090	2023-05-08	2023-05-12	Delivered	1243467.40	mismatch price
ORD00898	CUST0267	SELL061	2024-09-14	2024-09-19	Delivered	364555.47	Verified
ORD00899	CUST0267	SELL038	2024-04-02	2024-04-04	Delivered	163247.70	Verified
ORD00900	CUST0267	SELL068	2024-09-30	2024-10-01	Delivered	14011.65	Verified
ORD00901	CUST0267	SELL088	2024-08-19	2024-08-24	Delivered	90584.94	Verified
ORD00903	CUST0269	SELL067	2024-08-30	2024-09-05	Delivered	252137.68	Verified
ORD00905	CUST0269	SELL059	2024-10-08	2024-10-09	Delivered	38299.46	Verified
ORD00906	CUST0269	SELL087	2024-12-17	2024-12-22	Delivered	73288.78	Verified
ORD00908	CUST0272	SELL048	2024-12-30	2025-01-06	Delivered	1320381.28	Verified
ORD00909	CUST0272	SELL064	2024-11-08	2024-11-16	Delivered	1887115.40	Verified
ORD00910	CUST0272	SELL036	2024-12-18	2024-12-23	Delivered	731989.14	Verified
ORD00911	CUST0272	SELL063	2024-11-25	2024-11-29	Delivered	377173.89	Verified
ORD00916	CUST0273	SELL088	2024-11-23	2024-12-01	Delivered	14427.90	Verified
ORD00917	CUST0273	SELL074	2024-10-14	2024-10-25	Delivered	478987.84	Verified
ORD00918	CUST0273	SELL045	2024-09-23	2024-10-02	Delivered	71972.01	Verified
ORD00921	CUST0274	SELL031	2024-08-30	2024-09-04	Delivered	72469.92	Verified
ORD00924	CUST0275	SELL070	2024-09-05	2024-09-07	Delivered	95695.43	Verified
ORD00926	CUST0275	SELL002	2024-06-26	2024-06-28	Delivered	134560.35	Verified
ORD00929	CUST0275	SELL090	2024-08-03	2024-08-06	Delivered	1580460.04	Verified
ORD00930	CUST0275	SELL090	2024-04-11	2024-04-15	Delivered	310936.87	Verified
ORD00931	CUST0275	SELL006	2024-09-26	2024-09-29	Delivered	291536.08	Verified
ORD00938	CUST0277	SELL057	2023-10-02	2023-10-06	Delivered	1192178.97	Verified
ORD00940	CUST0277	SELL028	2024-01-10	2024-01-11	Delivered	21340.87	Verified
ORD00941	CUST0277	SELL051	2024-08-25	2024-08-27	Delivered	170268.12	Verified
ORD00944	CUST0277	SELL012	2024-04-07	2024-04-08	Delivered	12341.62	Verified
ORD00945	CUST0277	SELL043	2023-08-09	2023-08-15	Delivered	746747.97	Verified
ORD00946	CUST0277	SELL030	2024-06-17	2024-06-18	Delivered	945114.90	Verified
ORD00949	CUST0278	SELL065	2024-07-19	2024-07-20	Delivered	250844.04	Verified
ORD00952	CUST0280	SELL066	2024-10-20	2024-10-22	Delivered	12278.28	Verified
ORD00953	CUST0280	SELL062	2024-06-29	2024-07-06	Delivered	632732.68	Verified
ORD00954	CUST0280	SELL030	2024-10-09	2024-10-16	Delivered	14845.55	Verified
ORD00957	CUST0280	SELL017	2024-07-02	2024-07-04	Delivered	213274.88	Verified
ORD00960	CUST0280	SELL029	2024-10-21	2024-10-26	Delivered	266180.98	Verified
ORD00961	CUST0280	SELL088	2024-06-16	2024-06-23	Delivered	320608.15	Verified
ORD00963	CUST0281	SELL008	2024-03-17	2024-03-27	Delivered	387335.12	Verified
ORD00965	CUST0281	SELL039	2024-03-04	2024-03-06	Delivered	100048.28	Verified
ORD00969	CUST0281	SELL066	2023-11-01	2023-11-11	Delivered	176857.47	Verified
ORD00972	CUST0281	SELL059	2024-11-12	2024-11-18	Delivered	1061481.88	Verified
ORD00977	CUST0285	SELL002	2024-03-31	2024-04-06	Delivered	36581.64	Verified
ORD00978	CUST0286	SELL058	2024-06-29	2024-07-06	Delivered	11097.43	Verified
ORD00982	CUST0288	SELL088	2024-07-07	2024-07-13	Delivered	67894.35	Verified
ORD00983	CUST0289	SELL027	2024-10-31	2024-11-02	Delivered	1602.14	Verified
ORD00984	CUST0289	SELL088	2024-07-24	2024-07-31	Delivered	1323987.05	Verified
ORD01003	CUST0293	SELL035	2024-02-26	2024-03-11	Delivered	92369.52	imputed verfied
ORD00986	CUST0290	SELL060	2024-02-17	2024-02-19	Delivered	13171.72	Verified
ORD00994	CUST0291	SELL071	2024-12-01	2024-12-02	Delivered	556868.36	mismatch price
ORD01036	CUST0304	SELL018	2024-09-29	2024-10-01	Delivered	75976.50	mismatch price
ORD00989	CUST0290	SELL089	2024-01-25	2024-01-30	Delivered	62992.61	Verified
ORD00990	CUST0290	SELL045	2023-10-11	2023-10-14	Delivered	337561.86	Verified
ORD01054	CUST0307	SELL067	2024-09-30	2024-10-07	Delivered	1038425.47	mismatch price
ORD01071	CUST0316	SELL056	2024-10-25	2024-10-30	Delivered	412524.16	mismatch price
ORD00993	CUST0291	SELL047	2024-12-09	2024-12-12	Delivered	243429.47	Verified
ORD00995	CUST0291	SELL071	2024-11-26	2024-12-02	Delivered	117897.53	Verified
ORD01067	CUST0313	SELL050	2024-12-31	2025-01-06	Delivered	67971.18	mismatch price
ORD00997	CUST0292	SELL089	2023-11-07	2023-11-09	Delivered	1067500.41	Verified
ORD00999	CUST0292	SELL062	2024-07-28	2024-08-03	Delivered	734304.98	Verified
ORD01000	CUST0292	SELL030	2023-07-02	2023-07-05	Delivered	332153.37	Verified
ORD01004	CUST0293	SELL049	2024-12-31	2025-01-14	Delivered	391595.61	Verified
ORD01005	CUST0293	SELL018	2023-04-16	2023-04-19	Delivered	50868.08	Verified
ORD01006	CUST0294	SELL085	2024-12-06	2024-12-12	Delivered	12650.30	Verified
ORD01008	CUST0295	SELL030	2024-05-07	2024-05-16	Delivered	99842.46	Verified
ORD01011	CUST0296	SELL066	2024-09-30	2024-10-01	Delivered	309288.39	Verified
ORD01012	CUST0296	SELL004	2024-12-05	2024-12-12	Delivered	137727.03	Verified
ORD01014	CUST0296	SELL074	2024-10-27	2024-10-30	Delivered	76142.09	Verified
ORD01015	CUST0297	SELL005	2023-05-16	2023-05-19	Delivered	40632.15	Verified
ORD01016	CUST0297	SELL050	2023-11-01	2023-11-07	Delivered	1018903.35	Verified
ORD01017	CUST0297	SELL076	2023-11-08	2023-11-11	Delivered	680880.78	Verified
ORD01018	CUST0298	SELL011	2024-03-16	2024-03-18	Delivered	467178.97	Verified
ORD01019	CUST0298	SELL029	2024-12-21	2024-12-24	Delivered	23990.67	Verified
ORD01020	CUST0298	SELL076	2024-02-02	2024-02-07	Delivered	66459.48	Verified
ORD01023	CUST0299	SELL023	2024-11-02	2024-11-08	Delivered	5399.76	Verified
ORD01024	CUST0299	SELL081	2024-12-09	2024-12-12	Delivered	227279.12	Verified
ORD01025	CUST0299	SELL036	2024-07-22	2024-07-25	Delivered	26396.73	Verified
ORD01026	CUST0302	SELL015	2024-10-04	2024-10-11	Delivered	21604.29	Verified
ORD01029	CUST0302	SELL070	2024-07-27	2024-07-29	Delivered	1316488.47	Verified
ORD01030	CUST0302	SELL025	2024-06-13	2024-06-15	Delivered	24006.66	Verified
ORD01037	CUST0304	SELL030	2023-11-01	2023-11-02	Delivered	135063.48	Verified
ORD01039	CUST0304	SELL008	2024-02-15	2024-02-21	Delivered	45557.08	Verified
ORD01041	CUST0304	SELL070	2024-10-16	2024-10-18	Delivered	952072.75	Verified
ORD01045	CUST0305	SELL020	2024-09-11	2024-09-21	Delivered	254267.42	Verified
ORD01048	CUST0306	SELL012	2024-10-26	2024-10-27	Delivered	1229781.35	Verified
ORD01049	CUST0306	SELL063	2024-10-12	2024-10-13	Delivered	679049.30	Verified
ORD01051	CUST0306	SELL023	2024-10-17	2024-10-19	Delivered	34973.36	Verified
ORD01052	CUST0307	SELL038	2024-10-21	2024-10-24	Delivered	58767.24	Verified
ORD01057	CUST0308	SELL024	2024-06-14	2024-06-17	Delivered	42901.95	Verified
ORD01058	CUST0310	SELL011	2024-12-21	2024-12-26	Delivered	39168.98	Verified
ORD01059	CUST0310	SELL037	2024-12-26	2024-12-31	Delivered	407731.20	Verified
ORD01060	CUST0312	SELL060	2024-03-29	2024-04-03	Delivered	101388.10	Verified
ORD01061	CUST0312	SELL010	2023-12-07	2023-12-15	Delivered	118084.60	Verified
ORD01062	CUST0312	SELL027	2024-06-14	2024-06-19	Delivered	193997.28	Verified
ORD01066	CUST0313	SELL023	2024-08-20	2024-08-24	Delivered	57025.35	Verified
ORD01068	CUST0314	SELL056	2024-12-19	2024-12-23	Delivered	931864.34	Verified
ORD01069	CUST0315	SELL037	2024-12-30	2024-12-31	Delivered	108201.85	Verified
ORD01072	CUST0316	SELL051	2024-10-23	2024-11-02	Delivered	26917.21	Verified
ORD01073	CUST0317	SELL031	2024-03-07	2024-03-12	Delivered	1464648.35	Verified
ORD01076	CUST0317	SELL053	2023-12-30	2024-01-03	Delivered	335910.17	Verified
ORD01077	CUST0317	SELL014	2024-12-21	2024-12-28	Delivered	515070.46	Verified
ORD01078	CUST0317	SELL078	2023-11-12	2023-11-14	Delivered	48285.65	Verified
ORD01080	CUST0318	SELL048	2023-07-10	2023-07-16	Delivered	305515.78	Verified
ORD01081	CUST0318	SELL053	2023-10-04	2023-10-08	Delivered	4792.40	Verified
ORD01144	CUST0345	SELL046	2024-06-04	2024-06-10	Delivered	231284.04	imputed verfied
ORD01147	CUST0346	SELL001	2024-09-15	2024-09-19	Delivered	900.70	mismatch price
ORD01153	CUST0347	SELL022	2024-04-26	2024-05-02	Delivered	16326.25	mismatch price
ORD01163	CUST0350	SELL041	2023-10-05	2023-10-08	Delivered	161549.82	mismatch price
ORD01087	CUST0320	SELL001	2024-12-20	2024-12-25	Delivered	44389.86	Verified
ORD01088	CUST0320	SELL010	2024-12-31	2025-01-03	Delivered	609401.78	Verified
ORD01099	CUST0328	SELL079	2024-10-11	2024-10-19	Delivered	39482.24	mismatch price
ORD01146	CUST0345	SELL034	2024-10-05	2024-10-06	Delivered	147489.30	imputed verfied
ORD01092	CUST0322	SELL074	2024-03-05	2024-03-16	Delivered	1013423.02	Verified
ORD01094	CUST0324	SELL006	2024-06-28	2024-06-30	Delivered	87002.20	Verified
ORD01096	CUST0325	SELL065	2024-11-21	2024-11-24	Delivered	1139763.44	Verified
ORD01097	CUST0325	SELL055	2024-04-29	2024-05-05	Delivered	35488.70	Verified
ORD01098	CUST0326	SELL051	2024-03-18	2024-03-20	Delivered	182319.68	Verified
ORD01101	CUST0329	SELL039	2024-08-19	2024-08-27	Delivered	199930.87	Verified
ORD01103	CUST0329	SELL022	2024-12-05	2024-12-08	Delivered	852463.48	Verified
ORD01107	CUST0330	SELL068	2023-09-12	2023-09-15	Delivered	1144574.29	Verified
ORD01110	CUST0330	SELL068	2023-08-30	2023-09-03	Delivered	16739.67	Verified
ORD01111	CUST0331	SELL066	2024-07-08	2024-07-09	Delivered	141950.72	Verified
ORD01112	CUST0331	SELL037	2024-10-09	2024-10-10	Delivered	162894.00	Verified
ORD01113	CUST0331	SELL028	2024-09-04	2024-09-10	Delivered	120150.56	Verified
ORD01114	CUST0331	SELL049	2024-07-10	2024-07-17	Delivered	41341.72	Verified
ORD01117	CUST0332	SELL077	2023-03-22	2023-04-02	Delivered	58514.20	Verified
ORD01118	CUST0332	SELL011	2024-01-27	2024-02-10	Delivered	52971.75	Verified
ORD01120	CUST0334	SELL074	2024-11-29	2024-12-05	Delivered	12460.22	Verified
ORD01123	CUST0334	SELL075	2023-10-12	2023-10-15	Delivered	127390.86	Verified
ORD01125	CUST0334	SELL044	2023-09-16	2023-09-21	Delivered	343450.84	Verified
ORD01127	CUST0335	SELL055	2024-06-19	2024-06-27	Delivered	291464.46	Verified
ORD01129	CUST0336	SELL061	2024-07-23	2024-07-28	Delivered	8016.63	Verified
ORD01131	CUST0338	SELL090	2024-08-31	2024-09-03	Delivered	349632.08	Verified
ORD01136	CUST0343	SELL032	2024-10-07	2024-10-10	Delivered	6230.11	Verified
ORD01138	CUST0343	SELL082	2024-07-10	2024-07-17	Delivered	940331.68	Verified
ORD01139	CUST0343	SELL063	2024-07-15	2024-07-17	Delivered	74632.08	Verified
ORD01140	CUST0343	SELL075	2024-08-13	2024-08-18	Delivered	36749.26	Verified
ORD01141	CUST0344	SELL089	2024-05-10	2024-05-13	Delivered	686857.19	Verified
ORD01142	CUST0344	SELL015	2024-12-28	2024-12-31	Delivered	247851.46	Verified
ORD01150	CUST0346	SELL070	2024-07-22	2024-07-28	Delivered	1255094.75	Verified
ORD01152	CUST0347	SELL049	2023-05-06	2023-05-09	Delivered	69170.64	Verified
ORD01155	CUST0347	SELL064	2024-01-29	2024-01-30	Delivered	527944.80	Verified
ORD01156	CUST0347	SELL012	2024-06-29	2024-07-03	Delivered	481758.40	Verified
ORD01161	CUST0349	SELL017	2024-12-12	2024-12-18	Delivered	75449.74	Verified
ORD01162	CUST0350	SELL089	2023-10-19	2023-10-26	Delivered	28971.39	Verified
ORD01167	CUST0350	SELL026	2023-09-03	2023-09-13	Delivered	72583.62	Verified
ORD01169	CUST0350	SELL056	2024-05-08	2024-05-14	Delivered	171956.04	Verified
ORD01171	CUST0350	SELL052	2024-05-03	2024-05-09	Delivered	271932.37	Verified
ORD01202	CUST0358	SELL007	2023-04-22	2023-04-26	Delivered	10088.47	mismatch price
ORD01224	CUST0366	SELL056	2023-07-14	2023-07-17	Delivered	80161.95	mismatch price
ORD01248	CUST0371	SELL083	2024-08-29	2024-09-06	Delivered	294978.60	imputed verfied
ORD01179	CUST0352	SELL042	2024-05-18	2024-05-22	Delivered	15970.44	Verified
ORD01180	CUST0352	SELL007	2024-05-14	2024-05-16	Delivered	29611.68	Verified
ORD01181	CUST0352	SELL070	2024-12-07	2024-12-14	Delivered	169836.89	Verified
ORD01183	CUST0353	SELL003	2024-05-30	2024-06-03	Delivered	31522.68	Verified
ORD01185	CUST0353	SELL008	2024-08-28	2024-08-29	Delivered	482209.15	Verified
ORD01186	CUST0353	SELL067	2024-03-21	2024-03-23	Delivered	15761.34	Verified
ORD01187	CUST0353	SELL073	2024-05-06	2024-05-08	Delivered	232908.60	Verified
ORD01189	CUST0353	SELL006	2024-06-18	2024-06-24	Delivered	509325.39	Verified
ORD01194	CUST0356	SELL066	2023-08-17	2023-08-20	Delivered	14427.90	Verified
ORD01196	CUST0357	SELL082	2024-04-27	2024-05-04	Delivered	80525.21	Verified
ORD01200	CUST0358	SELL003	2024-05-10	2024-05-17	Delivered	33329.69	Verified
ORD01204	CUST0359	SELL005	2024-11-03	2024-11-09	Delivered	271042.29	Verified
ORD01205	CUST0359	SELL081	2024-12-20	2024-12-23	Delivered	200327.57	Verified
ORD01208	CUST0361	SELL066	2024-03-24	2024-03-30	Delivered	2348.14	Verified
ORD01210	CUST0361	SELL006	2024-05-23	2024-05-25	Delivered	88519.54	Verified
ORD01212	CUST0363	SELL018	2024-12-15	2024-12-22	Delivered	7077.96	Verified
ORD01216	CUST0363	SELL001	2024-11-22	2024-11-23	Delivered	277797.81	Verified
ORD01222	CUST0366	SELL010	2023-05-31	2023-06-07	Delivered	521312.75	Verified
ORD01223	CUST0366	SELL082	2024-02-12	2024-02-16	Delivered	14402.86	Verified
ORD01225	CUST0366	SELL065	2024-05-23	2024-05-30	Delivered	506570.74	Verified
ORD01226	CUST0366	SELL008	2023-09-30	2023-10-06	Delivered	13862.43	Verified
ORD01228	CUST0367	SELL073	2024-02-25	2024-02-29	Delivered	94467.68	Verified
ORD01234	CUST0370	SELL002	2024-12-16	2024-12-19	Delivered	88545.48	Verified
ORD01237	CUST0370	SELL024	2024-09-14	2024-09-16	Delivered	282271.60	Verified
ORD01238	CUST0370	SELL060	2024-09-11	2024-09-12	Delivered	125277.25	Verified
ORD01240	CUST0370	SELL023	2024-11-07	2024-11-10	Delivered	855219.84	Verified
ORD01243	CUST0370	SELL024	2024-09-21	2024-09-25	Delivered	3204.28	Verified
ORD01244	CUST0371	SELL057	2024-04-09	2024-04-15	Delivered	184897.87	Verified
ORD01246	CUST0371	SELL078	2024-06-04	2024-06-09	Delivered	14402.86	Verified
ORD01249	CUST0371	SELL076	2024-01-30	2024-02-04	Delivered	627213.66	Verified
ORD01250	CUST0372	SELL047	2023-08-02	2023-08-11	Delivered	1532854.95	Verified
ORD01257	CUST0377	SELL079	2024-07-22	2024-07-29	Delivered	338489.64	Verified
ORD01258	CUST0377	SELL040	2024-04-13	2024-04-17	Delivered	67518.08	Verified
ORD01260	CUST0377	SELL058	2024-10-29	2024-11-02	Delivered	12699.55	Verified
ORD01261	CUST0377	SELL036	2024-07-26	2024-07-30	Delivered	98293.53	Verified
ORD01264	CUST0378	SELL018	2024-03-26	2024-04-02	Delivered	95128.44	Verified
ORD01266	CUST0379	SELL065	2024-03-08	2024-03-09	Delivered	127598.57	Verified
ORD01267	CUST0379	SELL062	2024-01-04	2024-01-09	Delivered	96202.74	Verified
ORD01309	CUST0392	SELL077	2024-07-29	2024-08-02	Delivered	513753.00	imputed verfied
ORD01272	CUST0381	SELL022	2024-04-19	2024-04-24	Delivered	8028.09	Verified
ORD01273	CUST0381	SELL021	2024-06-11	2024-06-16	Delivered	60582.65	Verified
ORD01276	CUST0384	SELL057	2024-03-10	2024-03-16	Delivered	73629.38	mismatch price
ORD01275	CUST0384	SELL074	2023-11-08	2023-11-13	Delivered	308912.61	Verified
ORD01335	CUST0398	SELL086	2024-11-15	2024-11-23	Delivered	108692.72	imputed verfied
ORD01322	CUST0394	SELL008	2024-08-19	2024-08-26	Delivered	49812.90	mismatch price
ORD01330	CUST0396	SELL076	2024-05-08	2024-05-12	Delivered	158863.16	mismatch price
ORD01280	CUST0385	SELL085	2024-07-31	2024-08-04	Delivered	21674.25	imputed verfied
ORD01284	CUST0386	SELL012	2024-12-23	2024-12-29	Delivered	430462.89	Verified
ORD01286	CUST0386	SELL057	2024-03-14	2024-03-19	Delivered	63045.36	Verified
ORD01287	CUST0386	SELL006	2023-09-24	2023-09-26	Delivered	509055.94	Verified
ORD01292	CUST0388	SELL076	2024-06-24	2024-07-01	Delivered	1759452.55	Verified
ORD01293	CUST0388	SELL083	2024-02-28	2024-03-06	Delivered	151263.40	Verified
ORD01294	CUST0389	SELL049	2024-08-24	2024-08-30	Delivered	13409.28	Verified
ORD01295	CUST0390	SELL030	2024-06-20	2024-06-28	Delivered	668077.43	Verified
ORD01297	CUST0391	SELL084	2024-06-04	2024-06-14	Delivered	1090050.21	Verified
ORD01301	CUST0392	SELL043	2024-06-13	2024-06-20	Delivered	1343803.78	Verified
ORD01303	CUST0392	SELL086	2024-11-18	2024-11-19	Delivered	182439.52	Verified
ORD01304	CUST0392	SELL010	2024-10-10	2024-10-16	Delivered	44912.78	Verified
ORD01306	CUST0392	SELL069	2024-11-07	2024-11-12	Delivered	110900.42	Verified
ORD01310	CUST0393	SELL030	2024-09-28	2024-10-01	Delivered	29570.18	Verified
ORD01311	CUST0393	SELL015	2023-06-20	2023-06-25	Delivered	217322.84	Verified
ORD01313	CUST0394	SELL020	2023-09-09	2023-09-14	Delivered	265518.94	Verified
ORD01314	CUST0394	SELL009	2024-11-17	2024-11-23	Delivered	68157.62	Verified
ORD01319	CUST0394	SELL042	2024-02-09	2024-02-11	Delivered	261871.45	Verified
ORD01326	CUST0396	SELL053	2024-06-02	2024-06-10	Delivered	90042.32	Verified
ORD01329	CUST0396	SELL051	2023-09-29	2023-10-07	Delivered	53108.20	Verified
ORD01331	CUST0398	SELL033	2023-05-24	2023-05-30	Delivered	117469.19	Verified
ORD01334	CUST0398	SELL064	2023-05-29	2023-06-10	Delivered	3849.92	Verified
ORD01336	CUST0398	SELL030	2023-10-13	2023-10-18	Delivered	47472.78	Verified
ORD01345	CUST0401	SELL057	2024-12-05	2024-12-06	Delivered	60942.63	Verified
ORD01346	CUST0401	SELL078	2024-12-18	2024-12-19	Delivered	5755.30	Verified
ORD01347	CUST0402	SELL031	2024-04-21	2024-04-27	Delivered	408079.72	Verified
ORD01349	CUST0402	SELL080	2024-01-13	2024-01-20	Delivered	103986.26	Verified
ORD01350	CUST0402	SELL061	2024-06-02	2024-06-06	Delivered	9207.08	Verified
ORD01353	CUST0403	SELL081	2024-11-02	2024-11-05	Delivered	2149209.07	Verified
ORD01354	CUST0403	SELL077	2024-08-06	2024-08-10	Delivered	324717.30	Verified
ORD01355	CUST0403	SELL078	2024-05-05	2024-05-07	Delivered	1317086.90	Verified
ORD01359	CUST0404	SELL088	2024-04-24	2024-04-28	Delivered	135696.91	Verified
ORD01360	CUST0404	SELL047	2024-04-11	2024-04-14	Delivered	528191.14	Verified
ORD01361	CUST0404	SELL080	2024-09-03	2024-09-04	Delivered	100004.00	Verified
ORD01364	CUST0407	SELL007	2024-08-27	2024-09-03	Delivered	888627.76	Verified
ORD01367	CUST0407	SELL048	2024-11-23	2024-12-02	Delivered	289357.03	Verified
ORD01368	CUST0407	SELL056	2024-06-24	2024-07-04	Delivered	18080.28	Verified
ORD01370	CUST0407	SELL016	2024-05-23	2024-05-26	Delivered	154882.11	Verified
ORD01372	CUST0408	SELL018	2024-06-01	2024-06-05	Delivered	7092.62	Verified
ORD01374	CUST0409	SELL048	2024-12-06	2024-12-07	Delivered	1027134.30	Verified
ORD01375	CUST0409	SELL023	2024-12-15	2024-12-17	Delivered	515070.46	Verified
ORD01365	CUST0407	SELL068	2023-12-11	2023-12-15	Delivered	191900.83	mismatch price
ORD01377	CUST0409	SELL011	2024-11-30	2024-12-06	Delivered	41043.57	Verified
ORD01385	CUST0412	SELL039	2024-02-23	2024-02-25	Delivered	604011.00	mismatch price
ORD01431	CUST0422	SELL031	2024-05-04	2024-05-09	Delivered	58923.21	mismatch price
ORD01449	CUST0427	SELL079	2024-11-25	2024-12-01	Delivered	695495.94	mismatch price
ORD01382	CUST0410	SELL072	2024-01-20	2024-01-27	Delivered	336920.80	Verified
ORD01387	CUST0412	SELL029	2024-08-17	2024-08-22	Delivered	409790.96	Verified
ORD01389	CUST0412	SELL065	2023-11-11	2023-11-17	Delivered	499557.85	Verified
ORD01390	CUST0412	SELL072	2024-11-17	2024-11-19	Delivered	64814.68	Verified
ORD01391	CUST0412	SELL039	2024-03-12	2024-03-17	Delivered	3628.18	Verified
ORD01397	CUST0414	SELL033	2024-11-08	2024-11-13	Delivered	407337.51	Verified
ORD01398	CUST0414	SELL090	2024-06-29	2024-06-30	Delivered	24825.96	Verified
ORD01399	CUST0414	SELL076	2024-12-12	2024-12-14	Delivered	1042211.85	Verified
ORD01403	CUST0416	SELL042	2024-09-09	2024-09-15	Delivered	92706.45	Verified
ORD01405	CUST0416	SELL001	2023-10-30	2023-11-01	Delivered	305798.40	Verified
ORD01407	CUST0417	SELL036	2024-09-24	2024-09-28	Delivered	104826.28	Verified
ORD01409	CUST0418	SELL066	2024-12-25	2024-12-28	Delivered	9563.86	Verified
ORD01411	CUST0418	SELL020	2024-08-24	2024-08-30	Delivered	505004.26	Verified
ORD01414	CUST0418	SELL006	2024-07-06	2024-07-13	Delivered	207598.77	Verified
ORD01416	CUST0418	SELL001	2024-07-17	2024-07-25	Delivered	15970.44	Verified
ORD01417	CUST0419	SELL077	2023-09-04	2023-09-09	Delivered	602922.95	Verified
ORD01421	CUST0419	SELL004	2024-01-15	2024-01-19	Delivered	267736.80	Verified
ORD01422	CUST0419	SELL057	2024-11-13	2024-11-20	Delivered	409790.96	Verified
ORD01423	CUST0421	SELL068	2024-04-18	2024-04-25	Delivered	69992.67	Verified
ORD01424	CUST0421	SELL071	2024-07-25	2024-07-30	Delivered	504390.28	Verified
ORD01426	CUST0421	SELL055	2024-07-30	2024-08-05	Delivered	14239.20	Verified
ORD01429	CUST0421	SELL008	2023-11-13	2023-11-18	Delivered	201503.45	Verified
ORD01430	CUST0421	SELL027	2024-01-04	2024-01-09	Delivered	52539.60	Verified
ORD01434	CUST0422	SELL076	2023-11-08	2023-11-13	Delivered	199354.44	Verified
ORD01436	CUST0422	SELL066	2024-04-04	2024-04-14	Delivered	63394.81	Verified
ORD01437	CUST0422	SELL013	2024-10-15	2024-10-21	Delivered	278279.64	Verified
ORD01438	CUST0423	SELL068	2023-12-02	2023-12-05	Delivered	57981.42	Verified
ORD01441	CUST0424	SELL081	2024-06-10	2024-06-16	Delivered	74245.65	Verified
ORD01443	CUST0425	SELL064	2024-08-03	2024-08-10	Delivered	326360.99	Verified
ORD01445	CUST0426	SELL018	2024-12-10	2024-12-12	Delivered	164719.61	Verified
ORD01446	CUST0426	SELL030	2024-11-14	2024-11-19	Delivered	22051.24	Verified
ORD01448	CUST0427	SELL016	2023-11-09	2023-11-15	Delivered	130265.75	Verified
ORD01450	CUST0427	SELL013	2023-08-10	2023-08-16	Delivered	276291.22	Verified
ORD01452	CUST0427	SELL076	2023-12-13	2023-12-15	Delivered	129981.66	Verified
ORD01453	CUST0427	SELL082	2023-07-27	2023-08-03	Delivered	1281402.50	Verified
ORD01455	CUST0428	SELL001	2024-12-25	2024-12-26	Delivered	103319.96	Verified
ORD01456	CUST0428	SELL017	2024-12-01	2024-12-08	Delivered	437118.57	Verified
ORD01458	CUST0429	SELL082	2024-11-04	2024-11-06	Delivered	11561.20	Verified
ORD01459	CUST0429	SELL045	2024-03-19	2024-03-26	Delivered	85496.84	Verified
ORD01460	CUST0429	SELL049	2024-05-31	2024-06-07	Delivered	358922.60	Verified
ORD01463	CUST0429	SELL027	2024-06-18	2024-06-24	Delivered	169891.58	Verified
ORD01464	CUST0430	SELL030	2024-08-09	2024-08-14	Delivered	337069.86	Verified
ORD01465	CUST0430	SELL038	2024-08-30	2024-09-08	Delivered	155573.74	Verified
ORD01467	CUST0432	SELL056	2024-10-16	2024-10-22	Delivered	555466.70	Verified
ORD01469	CUST0433	SELL053	2024-08-11	2024-08-16	Delivered	31709.48	Verified
ORD01528	CUST0451	SELL085	2023-12-09	2023-12-16	Delivered	33635.54	imputed verfied
ORD01471	CUST0434	SELL084	2024-11-13	2024-11-18	Delivered	173260.79	Verified
ORD01472	CUST0434	SELL005	2024-12-27	2024-12-31	Delivered	110269.71	Verified
ORD01474	CUST0435	SELL005	2023-04-04	2023-04-14	Delivered	772605.69	Verified
ORD01476	CUST0435	SELL023	2024-10-29	2024-11-11	Delivered	49605.18	Verified
ORD01462	CUST0429	SELL049	2024-03-28	2024-04-01	Delivered	842568.75	mismatch price
ORD01475	CUST0435	SELL055	2023-07-31	2023-08-09	Delivered	296286.45	mismatch price
ORD01558	CUST0460	SELL017	2024-05-13	2024-05-18	Delivered	307188.74	mismatch price
ORD01482	CUST0437	SELL030	2024-08-21	2024-08-25	Delivered	32529.36	Verified
ORD01483	CUST0437	SELL073	2024-09-12	2024-09-15	Delivered	76292.93	Verified
ORD01484	CUST0437	SELL035	2024-09-19	2024-09-20	Delivered	628381.84	Verified
ORD01487	CUST0439	SELL020	2024-10-09	2024-10-14	Delivered	442560.44	Verified
ORD01492	CUST0440	SELL001	2024-11-29	2024-12-03	Delivered	114532.41	Verified
ORD01493	CUST0440	SELL037	2024-11-18	2024-11-21	Delivered	573477.05	Verified
ORD01495	CUST0441	SELL075	2023-10-27	2023-11-02	Delivered	1042351.76	Verified
ORD01498	CUST0444	SELL032	2023-09-29	2023-10-05	Delivered	243727.04	Verified
ORD01499	CUST0444	SELL054	2024-03-09	2024-03-15	Delivered	180153.97	Verified
ORD01500	CUST0444	SELL010	2024-03-02	2024-03-03	Delivered	420883.00	Verified
ORD01503	CUST0445	SELL020	2024-02-25	2024-02-28	Delivered	651736.73	Verified
ORD01504	CUST0445	SELL049	2023-07-05	2023-07-10	Delivered	407731.20	Verified
ORD01507	CUST0446	SELL090	2024-04-24	2024-05-03	Delivered	93330.92	Verified
ORD01508	CUST0446	SELL025	2024-11-06	2024-11-14	Delivered	68942.67	Verified
ORD01509	CUST0446	SELL022	2024-07-15	2024-07-21	Delivered	18117.48	Verified
ORD01511	CUST0446	SELL023	2024-06-09	2024-06-16	Delivered	804733.40	Verified
ORD01516	CUST0449	SELL002	2023-06-09	2023-06-16	Delivered	716689.83	Verified
ORD01520	CUST0450	SELL036	2024-06-30	2024-07-11	Delivered	32412.37	Verified
ORD01521	CUST0450	SELL012	2024-09-11	2024-09-18	Delivered	61852.40	Verified
ORD01525	CUST0451	SELL079	2024-06-14	2024-06-15	Delivered	152620.50	Verified
ORD01526	CUST0451	SELL053	2024-04-06	2024-04-11	Delivered	1741171.42	Verified
ORD01527	CUST0451	SELL045	2024-02-26	2024-02-28	Delivered	1506030.00	Verified
ORD01531	CUST0452	SELL059	2023-08-12	2023-08-16	Delivered	13409.28	Verified
ORD01532	CUST0452	SELL057	2023-09-16	2023-09-18	Delivered	14771.68	Verified
ORD01533	CUST0452	SELL082	2023-08-22	2023-08-24	Delivered	1602.14	Verified
ORD01539	CUST0453	SELL008	2024-11-05	2024-11-15	Delivered	46665.46	Verified
ORD01541	CUST0454	SELL003	2024-08-11	2024-08-18	Delivered	465301.97	Verified
ORD01544	CUST0455	SELL046	2024-09-25	2024-09-27	Delivered	321721.45	Verified
ORD01545	CUST0455	SELL006	2024-09-06	2024-09-08	Delivered	1738086.01	Verified
ORD01546	CUST0455	SELL011	2024-06-30	2024-07-04	Delivered	610317.96	Verified
ORD01547	CUST0455	SELL024	2024-10-13	2024-10-15	Delivered	40190.19	Verified
ORD01550	CUST0458	SELL011	2024-11-17	2024-11-20	Delivered	51604.24	Verified
ORD01551	CUST0459	SELL074	2024-06-05	2024-06-06	Delivered	47284.02	Verified
ORD01556	CUST0459	SELL032	2023-10-18	2023-10-19	Delivered	263606.60	Verified
ORD01561	CUST0460	SELL036	2024-12-17	2024-12-21	Delivered	204806.12	Verified
ORD01564	CUST0460	SELL041	2023-11-12	2023-11-16	Delivered	43789.85	Verified
ORD01566	CUST0461	SELL079	2024-11-30	2024-12-01	Delivered	56009.43	Verified
ORD01567	CUST0461	SELL085	2024-04-20	2024-04-27	Delivered	99076.62	Verified
ORD01568	CUST0462	SELL064	2023-07-01	2023-07-04	Delivered	339257.53	Verified
ORD01569	CUST0462	SELL079	2023-07-19	2023-07-25	Delivered	103389.13	Verified
ORD01571	CUST0462	SELL057	2024-08-02	2024-08-09	Delivered	458781.64	Verified
ORD01573	CUST0462	SELL017	2024-12-06	2024-12-09	Delivered	5914.40	Verified
ORD01574	CUST0462	SELL087	2024-01-28	2024-02-01	Delivered	540458.75	Verified
ORD01639	CUST0482	SELL069	2024-10-12	2024-10-14	Delivered	12053.52	imputed verfied
ORD01629	CUST0481	SELL020	2023-06-05	2023-06-12	Delivered	581145.86	imputed verfied
ORD01579	CUST0464	SELL009	2023-07-27	2023-08-02	Delivered	739805.40	Verified
ORD01572	CUST0462	SELL015	2024-12-08	2024-12-09	Delivered	25061.13	mismatch price
ORD01581	CUST0464	SELL028	2023-10-04	2023-10-10	Delivered	38342.82	Verified
ORD01582	CUST0464	SELL067	2023-07-03	2023-07-07	Delivered	260280.99	mismatch price
ORD01602	CUST0473	SELL005	2023-04-29	2023-05-02	Delivered	978096.05	mismatch price
ORD01607	CUST0476	SELL034	2024-06-06	2024-06-13	Delivered	96615.35	mismatch price
ORD01586	CUST0468	SELL046	2024-11-30	2024-12-03	Delivered	825680.81	Verified
ORD01587	CUST0468	SELL032	2024-12-10	2024-12-12	Delivered	100339.89	Verified
ORD01588	CUST0468	SELL090	2024-11-23	2024-11-30	Delivered	1781841.04	Verified
ORD01627	CUST0481	SELL007	2024-09-27	2024-10-06	Delivered	767003.95	mismatch price
ORD01590	CUST0469	SELL060	2024-05-14	2024-05-21	Delivered	454316.32	Verified
ORD01597	CUST0472	SELL079	2024-07-21	2024-07-24	Delivered	46244.80	mismatch price
ORD01656	CUST0494	SELL067	2024-10-22	2024-10-23	Delivered	108751.49	mismatch price
ORD01594	CUST0472	SELL008	2024-03-01	2024-03-06	Delivered	33479.34	Verified
ORD01596	CUST0472	SELL062	2023-12-17	2023-12-23	Delivered	52346.95	Verified
ORD01600	CUST0473	SELL012	2024-12-13	2024-12-20	Delivered	140237.76	Verified
ORD01601	CUST0473	SELL054	2023-10-20	2023-10-22	Delivered	106784.91	Verified
ORD01604	CUST0474	SELL027	2024-12-09	2024-12-19	Delivered	28812.35	Verified
ORD01605	CUST0475	SELL050	2024-12-08	2024-12-11	Delivered	31477.40	Verified
ORD01609	CUST0476	SELL008	2024-02-27	2024-03-03	Delivered	199233.48	Verified
ORD01612	CUST0478	SELL029	2024-12-26	2024-12-29	Delivered	22960.29	Verified
ORD01614	CUST0478	SELL090	2024-10-01	2024-10-05	Delivered	1272167.51	Verified
ORD01617	CUST0479	SELL013	2024-12-03	2024-12-10	Delivered	40465.27	Verified
ORD01619	CUST0480	SELL056	2024-06-09	2024-06-13	Delivered	638415.97	Verified
ORD01620	CUST0481	SELL083	2024-04-09	2024-04-19	Delivered	865087.23	Verified
ORD01622	CUST0481	SELL049	2024-07-30	2024-08-08	Delivered	45708.85	Verified
ORD01623	CUST0481	SELL038	2023-06-07	2023-06-10	Delivered	7172.97	Verified
ORD01624	CUST0481	SELL074	2024-04-14	2024-04-19	Delivered	215711.20	Verified
ORD01625	CUST0481	SELL069	2024-06-21	2024-06-24	Delivered	310749.90	Verified
ORD01630	CUST0482	SELL034	2024-08-31	2024-09-02	Delivered	380329.47	Verified
ORD01634	CUST0482	SELL066	2024-05-10	2024-05-17	Delivered	77315.50	Verified
ORD01636	CUST0482	SELL085	2024-02-09	2024-02-16	Delivered	84100.44	Verified
ORD01640	CUST0483	SELL073	2024-08-19	2024-08-24	Delivered	40877.16	Verified
ORD01642	CUST0486	SELL017	2023-12-16	2023-12-29	Delivered	168353.89	Verified
ORD01645	CUST0490	SELL068	2024-07-27	2024-07-28	Delivered	11386.20	Verified
ORD01647	CUST0491	SELL045	2024-05-09	2024-05-12	Delivered	629898.03	Verified
ORD01648	CUST0491	SELL032	2024-05-24	2024-05-26	Delivered	141953.36	Verified
ORD01650	CUST0492	SELL076	2024-10-16	2024-10-18	Delivered	1462057.55	Verified
ORD01654	CUST0494	SELL019	2024-06-10	2024-06-16	Delivered	160108.43	Verified
ORD01655	CUST0494	SELL024	2024-06-12	2024-06-16	Delivered	809604.90	Verified
ORD01699	CUST0511	SELL013	2024-09-29	2024-10-01	Delivered	35280.59	imputed verfied
ORD01660	CUST0495	SELL010	2024-12-02	2024-12-07	Delivered	187646.29	Verified
ORD01662	CUST0497	SELL007	2023-06-02	2023-06-05	Delivered	141135.80	Verified
ORD01663	CUST0497	SELL072	2024-09-20	2024-09-24	Delivered	87482.09	Verified
ORD01665	CUST0497	SELL059	2024-01-10	2024-01-16	Delivered	211679.32	Verified
ORD01666	CUST0497	SELL032	2024-09-04	2024-09-05	Delivered	182560.65	Verified
ORD01667	CUST0497	SELL040	2024-04-24	2024-04-29	Delivered	102447.74	Verified
ORD01664	CUST0497	SELL007	2024-05-19	2024-05-23	Delivered	1158907.10	mismatch price
ORD01669	CUST0499	SELL062	2024-12-25	2024-12-31	Delivered	1280228.45	Verified
ORD01743	CUST0523	SELL024	2024-08-05	2024-08-08	Delivered	1416912.17	mismatch price
ORD01736	CUST0519	SELL057	2024-07-12	2024-07-15	Delivered	5762.47	mismatch price
ORD01673	CUST0501	SELL015	2024-03-25	2024-03-29	Delivered	53762.13	Verified
ORD01676	CUST0502	SELL006	2024-11-16	2024-11-19	Delivered	86284.48	Verified
ORD01680	CUST0503	SELL034	2024-10-04	2024-10-08	Delivered	129842.64	Verified
ORD01682	CUST0503	SELL089	2024-03-20	2024-03-22	Delivered	530860.46	Verified
ORD01683	CUST0504	SELL034	2024-01-22	2024-01-24	Delivered	25910.95	Verified
ORD01684	CUST0505	SELL067	2024-09-21	2024-09-22	Delivered	78806.70	Verified
ORD01688	CUST0506	SELL028	2023-05-12	2023-05-16	Delivered	54388.50	Verified
ORD01689	CUST0506	SELL047	2023-08-07	2023-08-11	Delivered	584934.80	Verified
ORD01691	CUST0507	SELL022	2024-10-26	2024-11-05	Delivered	425267.89	Verified
ORD01692	CUST0507	SELL015	2024-08-27	2024-08-31	Delivered	441078.84	Verified
ORD01693	CUST0507	SELL043	2024-07-30	2024-08-09	Delivered	339524.65	Verified
ORD01694	CUST0507	SELL077	2024-06-13	2024-06-17	Delivered	5712.84	Verified
ORD01698	CUST0511	SELL077	2024-09-22	2024-09-27	Delivered	23616.92	Verified
ORD01702	CUST0511	SELL012	2024-03-25	2024-04-01	Delivered	499862.83	Verified
ORD01707	CUST0513	SELL021	2024-12-06	2024-12-08	Delivered	497712.95	Verified
ORD01708	CUST0513	SELL055	2024-11-24	2024-12-04	Delivered	130015.70	Verified
ORD01709	CUST0513	SELL025	2024-11-25	2024-12-02	Delivered	1220840.69	Verified
ORD01710	CUST0513	SELL012	2024-11-27	2024-12-04	Delivered	333752.14	Verified
ORD01711	CUST0513	SELL041	2024-11-23	2024-11-28	Delivered	4038.10	Verified
ORD01712	CUST0513	SELL031	2024-11-30	2024-12-04	Delivered	23765.62	Verified
ORD01713	CUST0513	SELL069	2024-12-25	2024-12-30	Delivered	5323.48	Verified
ORD01715	CUST0517	SELL087	2024-07-25	2024-07-28	Delivered	70505.99	Verified
ORD01716	CUST0518	SELL033	2024-11-14	2024-11-19	Delivered	82979.02	Verified
ORD01720	CUST0518	SELL013	2024-04-23	2024-04-28	Delivered	194600.30	Verified
ORD01721	CUST0518	SELL076	2023-12-17	2023-12-24	Delivered	675417.62	Verified
ORD01723	CUST0518	SELL090	2024-02-13	2024-02-17	Delivered	994838.80	Verified
ORD01725	CUST0518	SELL062	2024-08-25	2024-08-29	Delivered	34157.64	Verified
ORD01726	CUST0519	SELL038	2024-06-28	2024-07-04	Delivered	16961.56	Verified
ORD01728	CUST0519	SELL034	2024-08-30	2024-09-01	Delivered	629332.63	Verified
ORD01729	CUST0519	SELL088	2024-07-07	2024-07-14	Delivered	501907.37	Verified
ORD01731	CUST0519	SELL029	2024-07-24	2024-07-27	Delivered	32574.27	Verified
ORD01732	CUST0519	SELL049	2024-07-10	2024-07-15	Delivered	324828.96	Verified
ORD01733	CUST0519	SELL063	2024-09-06	2024-09-13	Delivered	21912.74	Verified
ORD01734	CUST0519	SELL055	2024-09-18	2024-09-20	Delivered	64122.63	Verified
ORD01737	CUST0519	SELL046	2024-09-26	2024-10-03	Delivered	135283.44	Verified
ORD01740	CUST0522	SELL034	2024-12-01	2024-12-02	Delivered	813081.63	Verified
ORD01741	CUST0522	SELL061	2024-10-02	2024-10-09	Delivered	1657410.01	Verified
ORD01742	CUST0522	SELL046	2024-12-31	2025-01-04	Delivered	129271.75	Verified
ORD01751	CUST0526	SELL009	2024-12-21	2024-12-23	Delivered	33297.75	Verified
ORD01752	CUST0526	SELL063	2024-11-14	2024-11-17	Delivered	44306.32	Verified
ORD01754	CUST0528	SELL003	2024-10-31	2024-11-01	Delivered	195934.03	Verified
ORD01755	CUST0529	SELL064	2024-08-08	2024-08-15	Delivered	351805.72	Verified
ORD01756	CUST0529	SELL066	2023-12-21	2023-12-24	Delivered	8076.20	Verified
ORD01757	CUST0529	SELL068	2023-08-31	2023-09-05	Delivered	395222.81	Verified
ORD01779	CUST0540	SELL062	2024-06-07	2024-06-10	Delivered	79126.56	imputed verfied
ORD01759	CUST0529	SELL067	2024-06-30	2024-07-07	Delivered	136573.70	Verified
ORD01761	CUST0530	SELL078	2024-06-26	2024-07-02	Delivered	654050.30	Verified
ORD01802	CUST0542	SELL028	2024-05-20	2024-05-23	Delivered	94334.30	mismatch price
ORD01763	CUST0532	SELL007	2024-07-03	2024-07-10	Delivered	1746773.40	Verified
ORD01764	CUST0534	SELL039	2024-07-18	2024-07-23	Delivered	130130.84	Verified
ORD01767	CUST0535	SELL089	2024-06-01	2024-06-05	Delivered	476073.93	Verified
ORD01771	CUST0536	SELL004	2024-11-28	2024-11-30	Delivered	18080.28	Verified
ORD01772	CUST0536	SELL025	2024-12-06	2024-12-13	Delivered	192990.07	Verified
ORD01776	CUST0540	SELL018	2024-10-31	2024-11-07	Delivered	41117.60	Verified
ORD01778	CUST0540	SELL076	2024-07-24	2024-07-26	Delivered	5762.47	Verified
ORD01780	CUST0540	SELL033	2024-02-12	2024-02-18	Delivered	390298.12	Verified
ORD01781	CUST0540	SELL007	2024-01-07	2024-01-12	Delivered	411387.98	Verified
ORD01782	CUST0540	SELL017	2024-06-11	2024-06-13	Delivered	56480.82	Verified
ORD01783	CUST0540	SELL068	2024-05-18	2024-05-24	Delivered	292210.30	Verified
ORD01785	CUST0540	SELL066	2023-09-18	2023-09-23	Delivered	30581.49	Verified
ORD01788	CUST0541	SELL088	2024-05-12	2024-05-15	Delivered	439754.74	Verified
ORD01789	CUST0541	SELL009	2023-10-19	2023-10-25	Delivered	257364.90	Verified
ORD01790	CUST0541	SELL080	2024-11-06	2024-11-11	Delivered	335067.63	Verified
ORD01791	CUST0541	SELL083	2023-11-30	2023-12-03	Delivered	116573.24	Verified
ORD01797	CUST0541	SELL063	2024-07-01	2024-07-07	Delivered	263054.64	Verified
ORD01798	CUST0541	SELL020	2023-01-25	2023-01-30	Delivered	145973.64	Verified
ORD01799	CUST0541	SELL039	2023-08-08	2023-08-14	Delivered	1313271.46	Verified
ORD01800	CUST0541	SELL081	2024-01-01	2024-01-07	Delivered	782873.27	Verified
ORD01804	CUST0542	SELL074	2024-05-08	2024-05-10	Delivered	68037.48	Verified
ORD01806	CUST0544	SELL041	2024-08-30	2024-09-06	Delivered	355773.52	Verified
ORD01810	CUST0546	SELL030	2024-12-29	2025-01-07	Delivered	1158331.97	Verified
ORD01811	CUST0546	SELL044	2024-10-19	2024-10-29	Delivered	101960.16	Verified
ORD01812	CUST0546	SELL069	2024-11-19	2024-11-27	Delivered	378503.96	Verified
ORD01813	CUST0546	SELL069	2024-08-25	2024-08-29	Delivered	132157.53	Verified
ORD01815	CUST0547	SELL034	2024-09-12	2024-09-17	Delivered	247824.46	Verified
ORD01822	CUST0549	SELL087	2024-10-18	2024-10-22	Delivered	180084.64	Verified
ORD01823	CUST0550	SELL077	2024-12-27	2025-01-06	Delivered	528573.66	Verified
ORD01825	CUST0550	SELL078	2024-06-26	2024-06-28	Delivered	337665.56	Verified
ORD01827	CUST0550	SELL026	2024-12-01	2024-12-03	Delivered	722299.05	Verified
ORD01828	CUST0550	SELL066	2024-07-16	2024-07-18	Delivered	61579.68	Verified
ORD01832	CUST0552	SELL081	2024-02-02	2024-02-05	Delivered	137710.20	Verified
ORD01833	CUST0552	SELL015	2023-12-24	2023-12-25	Delivered	63364.03	Verified
ORD01835	CUST0552	SELL028	2024-09-15	2024-09-20	Delivered	42025.94	Verified
ORD01837	CUST0553	SELL013	2024-03-25	2024-03-26	Delivered	19742.68	Verified
ORD01839	CUST0556	SELL084	2024-10-23	2024-10-31	Delivered	557510.13	Verified
ORD01842	CUST0556	SELL076	2024-11-20	2024-11-23	Delivered	695331.56	Verified
ORD01845	CUST0557	SELL070	2024-12-31	2025-01-04	Delivered	43905.60	Verified
ORD01846	CUST0557	SELL032	2024-12-06	2024-12-09	Delivered	97853.36	Verified
ORD01851	CUST0558	SELL021	2024-09-08	2024-09-09	Delivered	1707225.31	Verified
ORD01853	CUST0558	SELL011	2024-05-02	2024-05-06	Delivered	2943847.83	Verified
ORD01854	CUST0558	SELL049	2023-11-18	2023-11-24	Delivered	43372.48	Verified
ORD01912	CUST0570	SELL066	2024-11-19	2024-11-21	Delivered	15003.67	mismatch price
ORD01856	CUST0558	SELL052	2024-06-24	2024-07-01	Delivered	987015.13	Verified
ORD01859	CUST0560	SELL006	2024-06-09	2024-06-14	Delivered	185673.25	Verified
ORD01862	CUST0560	SELL058	2024-06-26	2024-06-29	Delivered	242330.60	Verified
ORD01864	CUST0560	SELL075	2024-08-19	2024-08-21	Delivered	15152.82	Verified
ORD01865	CUST0561	SELL049	2024-06-20	2024-06-24	Delivered	630266.76	Verified
ORD01866	CUST0561	SELL057	2024-08-20	2024-08-27	Delivered	549230.53	Verified
ORD01867	CUST0561	SELL076	2024-05-10	2024-05-14	Delivered	6170.81	Verified
ORD01870	CUST0561	SELL003	2023-12-12	2023-12-16	Delivered	563919.29	Verified
ORD01871	CUST0561	SELL051	2023-11-02	2023-11-07	Delivered	215711.20	Verified
ORD01872	CUST0561	SELL007	2024-04-06	2024-04-12	Delivered	7533.78	Verified
ORD01873	CUST0562	SELL032	2024-08-11	2024-08-19	Delivered	6230.11	Verified
ORD01875	CUST0563	SELL062	2024-07-11	2024-07-14	Delivered	76433.95	Verified
ORD01876	CUST0563	SELL017	2024-06-18	2024-06-30	Delivered	24463.34	Verified
ORD01879	CUST0563	SELL040	2024-06-27	2024-07-02	Delivered	118653.08	Verified
ORD01880	CUST0563	SELL055	2024-09-16	2024-09-20	Delivered	220539.42	Verified
ORD01881	CUST0563	SELL011	2024-10-06	2024-10-14	Delivered	430288.80	Verified
ORD01882	CUST0563	SELL084	2024-11-29	2024-12-13	Delivered	402816.45	Verified
ORD01885	CUST0565	SELL044	2024-11-06	2024-11-11	Delivered	12706.74	Verified
ORD01887	CUST0566	SELL020	2024-02-03	2024-02-08	Delivered	21709.68	Verified
ORD01888	CUST0566	SELL013	2024-06-22	2024-06-28	Delivered	126473.94	Verified
ORD01892	CUST0567	SELL048	2023-11-18	2023-11-24	Delivered	586047.25	Verified
ORD01893	CUST0568	SELL039	2024-12-10	2024-12-14	Delivered	100933.34	Verified
ORD01898	CUST0568	SELL087	2024-10-30	2024-11-04	Delivered	1213753.37	Verified
ORD01899	CUST0568	SELL075	2024-10-27	2024-10-31	Delivered	705677.44	Verified
ORD01900	CUST0568	SELL052	2024-09-14	2024-09-16	Delivered	19741.12	Verified
ORD01901	CUST0569	SELL007	2024-01-12	2024-01-17	Delivered	48037.37	Verified
ORD01902	CUST0569	SELL059	2024-02-02	2024-02-05	Delivered	471590.12	Verified
ORD01904	CUST0569	SELL079	2024-01-14	2024-01-21	Delivered	20698.80	Verified
ORD01906	CUST0569	SELL039	2023-11-19	2023-11-23	Delivered	63091.21	Verified
ORD01907	CUST0569	SELL082	2024-12-27	2024-12-29	Delivered	78955.84	Verified
ORD01908	CUST0569	SELL065	2024-04-14	2024-04-23	Delivered	85470.14	Verified
ORD01909	CUST0570	SELL077	2024-10-23	2024-10-27	Delivered	986407.20	Verified
ORD01913	CUST0571	SELL055	2023-11-12	2023-11-17	Delivered	281964.48	Verified
ORD01915	CUST0572	SELL017	2024-07-01	2024-07-03	Delivered	889298.04	Verified
ORD01916	CUST0572	SELL064	2024-06-09	2024-06-16	Delivered	2019.05	Verified
ORD01918	CUST0574	SELL005	2024-02-05	2024-02-16	Delivered	358222.29	Verified
ORD01920	CUST0575	SELL023	2024-07-04	2024-07-09	Delivered	470699.26	Verified
ORD01924	CUST0575	SELL006	2024-08-04	2024-08-14	Delivered	1418267.19	Verified
ORD01926	CUST0575	SELL072	2023-09-24	2023-09-29	Delivered	53953.43	Verified
ORD01930	CUST0576	SELL003	2024-01-17	2024-01-20	Delivered	456035.22	Verified
ORD01931	CUST0577	SELL045	2024-10-08	2024-10-11	Delivered	795566.29	Verified
ORD01933	CUST0577	SELL045	2024-09-03	2024-09-04	Delivered	120268.52	Verified
ORD01934	CUST0577	SELL084	2024-12-14	2024-12-20	Delivered	424884.05	Verified
ORD01936	CUST0579	SELL062	2023-06-17	2023-06-27	Delivered	643395.88	Verified
ORD01939	CUST0579	SELL032	2023-10-13	2023-10-19	Delivered	1401938.78	Verified
ORD01941	CUST0582	SELL064	2024-06-16	2024-06-21	Delivered	359579.20	Verified
ORD01942	CUST0582	SELL042	2024-05-21	2024-05-28	Delivered	398397.28	Verified
ORD01943	CUST0582	SELL060	2024-04-25	2024-04-29	Delivered	180749.37	Verified
ORD01944	CUST0582	SELL014	2024-12-12	2024-12-15	Delivered	1428725.36	Verified
ORD01946	CUST0582	SELL049	2024-10-10	2024-10-15	Delivered	492031.74	Verified
ORD01947	CUST0582	SELL002	2024-04-23	2024-04-25	Delivered	118084.60	Verified
ORD01948	CUST0582	SELL032	2024-06-19	2024-06-20	Delivered	173901.38	Verified
ORD01949	CUST0582	SELL049	2024-08-29	2024-08-31	Delivered	48466.70	Verified
ORD01950	CUST0582	SELL004	2024-06-27	2024-06-28	Delivered	54215.60	Verified
ORD01955	CUST0586	SELL050	2024-11-25	2024-11-26	Delivered	31579.12	Verified
ORD01956	CUST0586	SELL046	2024-06-14	2024-06-21	Delivered	127824.90	Verified
ORD02008	CUST0598	SELL055	2024-09-01	2024-09-09	Delivered	27271.36	imputed verfied
ORD01960	CUST0587	SELL090	2024-04-14	2024-04-15	Delivered	1372231.16	Verified
ORD01961	CUST0589	SELL038	2024-12-06	2024-12-09	Delivered	259751.90	Verified
ORD01962	CUST0589	SELL057	2024-10-26	2024-10-29	Delivered	24920.44	Verified
ORD01954	CUST0586	SELL015	2024-07-17	2024-07-23	Delivered	377278.82	imputed verfied
ORD01964	CUST0590	SELL004	2023-11-20	2023-11-21	Delivered	1073842.93	Verified
ORD01959	CUST0587	SELL081	2024-09-29	2024-10-01	Delivered	868327.05	mismatch price
ORD01985	CUST0593	SELL079	2024-02-21	2024-02-27	Delivered	47930.68	mismatch price
ORD01967	CUST0590	SELL046	2024-01-07	2024-01-14	Delivered	28370.48	Verified
ORD02009	CUST0598	SELL009	2024-08-09	2024-08-15	Delivered	275127.81	mismatch price
ORD01969	CUST0591	SELL075	2023-09-07	2023-09-13	Delivered	363859.64	Verified
ORD02038	CUST0610	SELL043	2024-10-21	2024-10-26	Delivered	369351.72	mismatch price
ORD01973	CUST0591	SELL016	2024-03-16	2024-03-18	Delivered	433699.07	Verified
ORD01976	CUST0592	SELL085	2023-05-25	2023-05-28	Delivered	1016135.30	Verified
ORD01979	CUST0592	SELL034	2024-12-29	2025-01-03	Delivered	135777.09	Verified
ORD01980	CUST0592	SELL025	2024-10-15	2024-10-22	Delivered	156645.15	Verified
ORD01982	CUST0592	SELL060	2024-11-01	2024-11-07	Delivered	186774.13	Verified
ORD01987	CUST0593	SELL031	2024-02-14	2024-02-19	Delivered	82713.56	Verified
ORD01990	CUST0593	SELL078	2023-12-10	2023-12-11	Delivered	1375465.84	Verified
ORD01992	CUST0593	SELL074	2024-09-24	2024-09-27	Delivered	18117.48	Verified
ORD01995	CUST0593	SELL045	2023-11-20	2023-11-23	Delivered	51228.88	Verified
ORD01997	CUST0594	SELL055	2024-09-08	2024-09-18	Delivered	133191.00	Verified
ORD01998	CUST0594	SELL047	2024-08-14	2024-08-18	Delivered	957676.93	Verified
ORD02001	CUST0596	SELL061	2024-01-28	2024-01-30	Delivered	1228137.40	Verified
ORD02002	CUST0597	SELL087	2024-09-01	2024-09-08	Delivered	643395.88	Verified
ORD02003	CUST0598	SELL080	2024-09-01	2024-09-05	Delivered	209097.61	Verified
ORD02005	CUST0598	SELL002	2024-01-17	2024-01-19	Delivered	1235650.44	Verified
ORD02006	CUST0598	SELL030	2023-09-01	2023-09-11	Delivered	164442.78	Verified
ORD02007	CUST0598	SELL043	2024-04-30	2024-05-09	Delivered	219422.34	Verified
ORD02013	CUST0599	SELL090	2024-05-26	2024-05-31	Delivered	991771.17	Verified
ORD02015	CUST0599	SELL023	2024-04-30	2024-05-08	Delivered	1124082.02	Verified
ORD02017	CUST0599	SELL031	2024-09-19	2024-09-21	Delivered	242070.75	Verified
ORD02018	CUST0599	SELL056	2024-10-16	2024-10-26	Delivered	34967.80	Verified
ORD02019	CUST0599	SELL089	2024-02-02	2024-02-09	Delivered	1720355.06	Verified
ORD02021	CUST0600	SELL060	2024-10-30	2024-11-02	Delivered	69996.63	Verified
ORD02023	CUST0602	SELL026	2024-08-19	2024-08-24	Delivered	2802.33	Verified
ORD02028	CUST0603	SELL061	2024-08-27	2024-08-29	Delivered	46035.40	Verified
ORD02030	CUST0605	SELL082	2024-12-10	2024-12-19	Delivered	271616.18	Verified
ORD02031	CUST0606	SELL084	2024-08-20	2024-08-25	Delivered	2017488.79	Verified
ORD02034	CUST0606	SELL083	2024-07-17	2024-07-18	Delivered	58333.34	Verified
ORD02035	CUST0608	SELL025	2024-10-09	2024-10-15	Delivered	548636.31	Verified
ORD02036	CUST0610	SELL059	2024-11-16	2024-11-18	Delivered	45302.42	Verified
ORD02039	CUST0610	SELL034	2024-08-26	2024-08-29	Delivered	191629.85	Verified
ORD02041	CUST0611	SELL084	2024-11-03	2024-11-14	Delivered	867436.59	Verified
ORD02043	CUST0611	SELL028	2024-02-02	2024-02-11	Delivered	212476.89	Verified
ORD02047	CUST0611	SELL005	2024-03-08	2024-03-20	Delivered	1018541.18	Verified
ORD02048	CUST0612	SELL005	2023-10-23	2023-10-28	Delivered	150697.55	Verified
ORD02051	CUST0614	SELL041	2024-01-22	2024-01-24	Delivered	407731.20	Verified
ORD02071	CUST0618	SELL057	2024-07-17	2024-07-22	Delivered	120137.06	imputed verfied
ORD02054	CUST0614	SELL073	2024-01-13	2024-01-15	Delivered	870698.52	Verified
ORD02055	CUST0614	SELL028	2024-03-26	2024-04-04	Delivered	25484.84	Verified
ORD02056	CUST0614	SELL054	2023-04-25	2023-05-01	Delivered	40877.16	Verified
ORD02057	CUST0614	SELL065	2024-06-28	2024-07-08	Delivered	57109.46	Verified
ORD02101	CUST0626	SELL062	2023-12-24	2023-12-29	Delivered	98900.82	imputed verfied
ORD02062	CUST0616	SELL079	2024-03-23	2024-03-26	Delivered	1517372.93	mismatch price
ORD02090	CUST0621	SELL054	2024-11-29	2024-12-05	Delivered	5261.71	mismatch price
ORD02121	CUST0631	SELL080	2024-07-25	2024-07-29	Delivered	905769.62	mismatch price
ORD02064	CUST0617	SELL008	2024-09-14	2024-09-20	Delivered	83437.72	Verified
ORD02065	CUST0617	SELL058	2024-12-09	2024-12-17	Delivered	33029.61	Verified
ORD02068	CUST0617	SELL035	2024-12-29	2025-01-07	Delivered	578743.00	Verified
ORD02069	CUST0618	SELL045	2024-08-22	2024-08-26	Delivered	47233.84	Verified
ORD02070	CUST0618	SELL057	2024-08-09	2024-08-14	Delivered	51993.13	Verified
ORD02072	CUST0618	SELL012	2024-12-13	2024-12-22	Delivered	1057590.73	Verified
ORD02073	CUST0618	SELL076	2024-12-02	2024-12-08	Delivered	770041.63	Verified
ORD02075	CUST0618	SELL048	2024-10-26	2024-11-01	Delivered	104228.31	Verified
ORD02079	CUST0618	SELL085	2024-07-30	2024-08-08	Delivered	857314.46	Verified
ORD02081	CUST0620	SELL023	2023-11-26	2023-11-29	Delivered	184401.52	Verified
ORD02082	CUST0621	SELL059	2023-11-21	2023-11-22	Delivered	195886.35	Verified
ORD02083	CUST0621	SELL024	2024-11-23	2024-11-30	Delivered	80339.85	Verified
ORD02084	CUST0621	SELL043	2024-07-05	2024-07-09	Delivered	207992.10	Verified
ORD02088	CUST0621	SELL037	2024-12-14	2024-12-19	Delivered	111904.54	Verified
ORD02089	CUST0621	SELL052	2024-04-12	2024-04-19	Delivered	86352.92	Verified
ORD02091	CUST0621	SELL017	2024-04-21	2024-04-27	Delivered	56642.17	Verified
ORD02092	CUST0621	SELL063	2024-09-20	2024-09-26	Delivered	17515.94	Verified
ORD02093	CUST0621	SELL009	2024-12-31	2025-01-02	Delivered	169273.30	Verified
ORD02096	CUST0623	SELL010	2024-11-08	2024-11-12	Delivered	45926.31	Verified
ORD02098	CUST0624	SELL087	2024-08-25	2024-08-30	Delivered	48285.65	Verified
ORD02099	CUST0624	SELL003	2024-09-25	2024-09-29	Delivered	11209.32	Verified
ORD02105	CUST0626	SELL045	2024-10-17	2024-10-22	Delivered	770562.66	Verified
ORD02106	CUST0626	SELL053	2024-02-07	2024-02-10	Delivered	15315.45	Verified
ORD02108	CUST0626	SELL002	2024-11-11	2024-11-16	Delivered	65858.60	Verified
ORD02112	CUST0626	SELL011	2024-06-21	2024-06-22	Delivered	661180.78	Verified
ORD02113	CUST0626	SELL031	2024-05-09	2024-05-10	Delivered	62292.43	Verified
ORD02115	CUST0628	SELL058	2024-04-12	2024-04-18	Delivered	24288.60	Verified
ORD02119	CUST0629	SELL059	2024-11-10	2024-11-11	Delivered	345924.48	Verified
ORD02120	CUST0631	SELL038	2024-09-24	2024-09-30	Delivered	580632.46	Verified
ORD02123	CUST0631	SELL003	2024-10-10	2024-10-16	Delivered	711191.81	Verified
ORD02124	CUST0631	SELL074	2024-12-06	2024-12-10	Delivered	246601.80	Verified
ORD02127	CUST0632	SELL028	2024-12-12	2024-12-14	Delivered	575752.52	Verified
ORD02128	CUST0633	SELL020	2023-11-02	2023-11-03	Delivered	446216.60	Verified
ORD02132	CUST0634	SELL025	2023-11-15	2023-11-20	Delivered	137481.28	Verified
ORD02133	CUST0634	SELL063	2024-09-21	2024-09-29	Delivered	19738.96	Verified
ORD02136	CUST0635	SELL010	2024-11-14	2024-11-18	Delivered	1633.04	Verified
ORD02137	CUST0635	SELL020	2024-12-28	2024-12-31	Delivered	14077.14	Verified
ORD02138	CUST0635	SELL026	2024-10-24	2024-10-25	Delivered	52507.89	Verified
ORD02141	CUST0636	SELL088	2023-09-02	2023-09-08	Delivered	85978.02	Verified
ORD02142	CUST0636	SELL072	2023-10-10	2023-10-11	Delivered	402619.27	Verified
ORD02143	CUST0636	SELL063	2024-09-22	2024-09-27	Delivered	31766.85	Verified
ORD02144	CUST0636	SELL077	2024-01-26	2024-01-29	Delivered	616971.17	Verified
ORD02145	CUST0637	SELL015	2024-03-01	2024-03-08	Delivered	177974.85	Verified
ORD02147	CUST0637	SELL069	2023-12-09	2023-12-11	Delivered	47233.84	Verified
ORD02149	CUST0638	SELL014	2023-12-06	2023-12-08	Delivered	562883.38	Verified
ORD02150	CUST0638	SELL001	2024-04-17	2024-04-20	Delivered	88185.56	Verified
ORD02208	CUST0653	SELL061	2024-09-03	2024-09-04	Delivered	12989.38	mismatch price
ORD02190	CUST0646	SELL046	2024-04-17	2024-04-24	Delivered	612117.14	mismatch price
ORD02153	CUST0640	SELL034	2024-01-14	2024-01-17	Delivered	29665.75	Verified
ORD02156	CUST0640	SELL001	2024-06-20	2024-06-22	Delivered	171216.94	Verified
ORD02158	CUST0640	SELL008	2024-10-11	2024-10-18	Delivered	2195798.60	Verified
ORD02159	CUST0640	SELL009	2024-04-16	2024-04-17	Delivered	23616.92	Verified
ORD02160	CUST0641	SELL060	2024-12-19	2024-12-28	Delivered	6970.88	Verified
ORD02162	CUST0641	SELL055	2024-10-27	2024-11-04	Delivered	63753.88	Verified
ORD02166	CUST0642	SELL066	2023-11-24	2023-11-30	Delivered	327229.73	Verified
ORD02167	CUST0642	SELL080	2023-09-24	2023-09-30	Delivered	156709.08	Verified
ORD02168	CUST0642	SELL073	2024-02-11	2024-02-14	Delivered	22657.06	Verified
ORD02173	CUST0643	SELL052	2024-05-11	2024-05-14	Delivered	2511.26	Verified
ORD02176	CUST0644	SELL061	2024-10-25	2024-10-27	Delivered	121527.21	Verified
ORD02177	CUST0644	SELL004	2023-11-13	2023-11-23	Delivered	506005.84	Verified
ORD02179	CUST0644	SELL040	2024-06-09	2024-06-17	Delivered	50265.21	Verified
ORD02182	CUST0645	SELL089	2024-12-18	2025-01-01	Delivered	124125.36	Verified
ORD02183	CUST0645	SELL037	2024-11-24	2024-12-04	Delivered	370104.20	Verified
ORD02184	CUST0645	SELL012	2024-11-22	2024-11-29	Delivered	670530.77	Verified
ORD02185	CUST0645	SELL025	2024-11-16	2024-11-19	Delivered	86352.92	Verified
ORD02186	CUST0645	SELL008	2024-10-25	2024-10-31	Delivered	87588.60	Verified
ORD02189	CUST0645	SELL062	2024-11-06	2024-11-20	Delivered	91572.30	Verified
ORD02192	CUST0646	SELL029	2024-12-27	2024-12-29	Delivered	1322728.85	Verified
ORD02194	CUST0646	SELL002	2024-04-22	2024-04-26	Delivered	109628.52	Verified
ORD02196	CUST0646	SELL057	2024-04-11	2024-04-13	Delivered	8968.44	Verified
ORD02198	CUST0648	SELL086	2024-02-04	2024-02-08	Delivered	49985.97	Verified
ORD02203	CUST0650	SELL005	2024-12-27	2025-01-02	Delivered	13938.18	Verified
ORD02205	CUST0652	SELL061	2024-07-22	2024-07-24	Delivered	13912.80	Verified
ORD02206	CUST0652	SELL057	2024-08-25	2024-08-31	Delivered	5971.28	Verified
ORD02207	CUST0653	SELL073	2024-02-29	2024-03-05	Delivered	20220.48	Verified
ORD02210	CUST0654	SELL058	2024-07-08	2024-07-13	Delivered	116663.65	Verified
ORD02211	CUST0654	SELL075	2024-10-12	2024-10-13	Delivered	926737.83	Verified
ORD02213	CUST0656	SELL008	2024-07-15	2024-07-23	Delivered	458267.45	Verified
ORD02215	CUST0656	SELL028	2024-09-06	2024-09-15	Delivered	189651.37	Verified
ORD02216	CUST0656	SELL074	2024-12-21	2024-12-31	Delivered	181209.68	Verified
ORD02219	CUST0656	SELL065	2024-10-30	2024-11-04	Delivered	332973.30	Verified
ORD02221	CUST0656	SELL046	2024-08-17	2024-08-22	Delivered	45054.25	Verified
ORD02223	CUST0657	SELL040	2023-10-03	2023-10-10	Delivered	35007.70	Verified
ORD02224	CUST0657	SELL034	2023-10-10	2023-10-14	Delivered	48314.36	Verified
ORD02225	CUST0657	SELL015	2024-04-15	2024-04-17	Delivered	923433.55	Verified
ORD02227	CUST0658	SELL070	2023-09-29	2023-10-03	Delivered	564648.56	Verified
ORD02232	CUST0659	SELL069	2024-07-14	2024-07-15	Delivered	61391.40	Verified
ORD02235	CUST0661	SELL028	2024-04-23	2024-04-24	Delivered	370314.78	Verified
ORD02238	CUST0661	SELL071	2023-10-30	2023-10-31	Delivered	251980.85	Verified
ORD02240	CUST0662	SELL020	2024-06-14	2024-06-21	Delivered	27621.24	Verified
ORD02242	CUST0662	SELL007	2024-05-21	2024-05-28	Delivered	167564.56	Verified
ORD02243	CUST0662	SELL053	2024-04-12	2024-04-18	Delivered	780584.55	Verified
ORD02247	CUST0665	SELL059	2023-08-13	2023-08-20	Delivered	518985.79	Verified
ORD02249	CUST0665	SELL016	2024-12-16	2024-12-24	Delivered	151222.66	imputed verfied
ORD02250	CUST0666	SELL058	2024-08-28	2024-09-04	Delivered	417590.00	Verified
ORD02281	CUST0671	SELL034	2024-10-26	2024-10-31	Delivered	191024.43	imputed verfied
ORD02244	CUST0662	SELL042	2024-08-04	2024-08-09	Delivered	63768.87	imputed verfied
ORD02266	CUST0667	SELL068	2024-03-14	2024-03-28	Delivered	9866.86	mismatch price
ORD02254	CUST0666	SELL001	2024-11-27	2024-11-28	Delivered	84659.35	Verified
ORD02255	CUST0666	SELL008	2024-06-17	2024-06-24	Delivered	20510.26	Verified
ORD02256	CUST0666	SELL012	2024-07-18	2024-07-25	Delivered	34106.30	Verified
ORD02257	CUST0666	SELL080	2024-05-25	2024-06-01	Delivered	41020.52	Verified
ORD02258	CUST0666	SELL011	2024-11-19	2024-11-24	Delivered	135100.29	Verified
ORD02259	CUST0666	SELL034	2024-12-09	2024-12-11	Delivered	464020.29	Verified
ORD02260	CUST0666	SELL020	2024-12-30	2025-01-06	Delivered	142379.88	Verified
ORD02261	CUST0666	SELL073	2024-06-13	2024-06-18	Delivered	105159.48	Verified
ORD02278	CUST0671	SELL072	2024-10-19	2024-10-23	Delivered	32284.63	mismatch price
ORD02263	CUST0667	SELL054	2024-11-27	2024-12-02	Delivered	98694.80	Verified
ORD02331	CUST0684	SELL081	2024-10-03	2024-10-05	Delivered	40185.68	mismatch price
ORD02265	CUST0667	SELL068	2023-11-07	2023-11-17	Delivered	876706.12	Verified
ORD02267	CUST0667	SELL006	2024-04-18	2024-04-27	Delivered	61685.11	Verified
ORD02268	CUST0667	SELL086	2024-05-22	2024-06-05	Delivered	17265.90	Verified
ORD02269	CUST0667	SELL072	2024-11-02	2024-11-11	Delivered	54814.26	Verified
ORD02270	CUST0667	SELL085	2023-11-17	2023-11-21	Delivered	11129.13	Verified
ORD02272	CUST0670	SELL028	2024-10-17	2024-10-19	Delivered	5399.76	Verified
ORD02273	CUST0670	SELL032	2024-10-30	2024-11-06	Delivered	108471.43	Verified
ORD02274	CUST0670	SELL077	2024-10-15	2024-10-18	Delivered	118094.97	Verified
ORD02275	CUST0671	SELL066	2024-10-10	2024-10-14	Delivered	89272.26	Verified
ORD02276	CUST0671	SELL029	2024-06-03	2024-06-07	Delivered	44745.78	Verified
ORD02277	CUST0671	SELL030	2024-03-25	2024-03-27	Delivered	202825.74	Verified
ORD02280	CUST0671	SELL088	2024-04-13	2024-04-15	Delivered	226321.39	Verified
ORD02283	CUST0672	SELL033	2024-02-05	2024-02-07	Delivered	711932.45	Verified
ORD02284	CUST0673	SELL085	2024-12-17	2024-12-22	Delivered	8406.99	Verified
ORD02285	CUST0673	SELL050	2024-10-30	2024-11-06	Delivered	77977.95	Verified
ORD02286	CUST0673	SELL013	2024-11-24	2024-11-29	Delivered	24750.33	Verified
ORD02290	CUST0673	SELL077	2024-11-15	2024-11-18	Delivered	175369.76	Verified
ORD02293	CUST0674	SELL040	2024-09-01	2024-09-02	Delivered	180084.64	Verified
ORD02295	CUST0675	SELL029	2024-06-15	2024-06-19	Delivered	1169138.42	Verified
ORD02296	CUST0675	SELL024	2024-11-10	2024-11-14	Delivered	1597548.44	Verified
ORD02299	CUST0675	SELL015	2024-09-26	2024-09-27	Delivered	158270.04	Verified
ORD02305	CUST0677	SELL033	2024-07-01	2024-07-05	Delivered	2395014.01	Verified
ORD02308	CUST0677	SELL069	2024-11-28	2024-12-04	Delivered	57806.00	Verified
ORD02309	CUST0677	SELL049	2024-05-01	2024-05-06	Delivered	2989.48	Verified
ORD02310	CUST0677	SELL027	2024-03-15	2024-03-19	Delivered	11608.58	Verified
ORD02314	CUST0679	SELL043	2024-10-29	2024-10-30	Delivered	325573.42	Verified
ORD02315	CUST0680	SELL015	2024-11-22	2024-12-03	Delivered	506890.19	Verified
ORD02316	CUST0680	SELL061	2024-12-19	2025-01-01	Delivered	229390.82	Verified
ORD02318	CUST0682	SELL060	2024-12-07	2024-12-09	Delivered	57806.00	Verified
ORD02319	CUST0682	SELL082	2024-12-26	2024-12-27	Delivered	185321.91	Verified
ORD02322	CUST0682	SELL065	2024-12-24	2024-12-30	Delivered	1147155.41	Verified
ORD02323	CUST0682	SELL005	2024-12-23	2024-12-27	Delivered	572061.17	Verified
ORD02324	CUST0683	SELL043	2023-10-14	2023-10-21	Delivered	179452.02	Verified
ORD02328	CUST0683	SELL044	2024-05-29	2024-06-04	Delivered	316366.34	Verified
ORD02330	CUST0684	SELL083	2024-10-14	2024-10-19	Delivered	86986.03	Verified
ORD02333	CUST0685	SELL058	2024-04-01	2024-04-04	Delivered	35221.95	Verified
ORD02334	CUST0685	SELL076	2024-08-09	2024-08-11	Delivered	297926.52	Verified
ORD02338	CUST0686	SELL080	2024-07-26	2024-08-03	Delivered	64122.63	Verified
ORD02340	CUST0688	SELL006	2024-04-28	2024-05-01	Delivered	105588.96	Verified
ORD02342	CUST0688	SELL058	2024-12-01	2024-12-03	Delivered	245349.52	Verified
ORD02343	CUST0688	SELL024	2024-04-20	2024-04-27	Delivered	13642.52	Verified
ORD02386	CUST0696	SELL059	2024-12-21	2024-12-30	Delivered	134284.48	mismatch price
ORD02346	CUST0689	SELL047	2024-10-22	2024-10-29	Delivered	1086701.68	Verified
ORD02397	CUST0700	SELL046	2024-11-30	2024-12-07	Delivered	770116.84	mismatch price
ORD02349	CUST0689	SELL038	2024-09-20	2024-09-25	Delivered	117531.81	Verified
ORD02348	CUST0689	SELL037	2024-09-28	2024-10-01	Delivered	23512.41	mismatch price
ORD02351	CUST0690	SELL072	2024-04-17	2024-04-19	Delivered	187599.69	Verified
ORD02352	CUST0690	SELL061	2023-04-11	2023-04-14	Delivered	166393.68	Verified
ORD02356	CUST0690	SELL037	2023-08-14	2023-08-22	Delivered	109628.52	Verified
ORD02357	CUST0690	SELL024	2024-05-06	2024-05-08	Delivered	67745.32	Verified
ORD02360	CUST0691	SELL053	2024-05-12	2024-05-14	Delivered	768841.50	Verified
ORD02362	CUST0691	SELL039	2024-11-14	2024-11-21	Delivered	38151.06	Verified
ORD02363	CUST0691	SELL050	2023-10-16	2023-10-19	Delivered	395756.90	Verified
ORD02364	CUST0691	SELL002	2023-12-12	2023-12-15	Delivered	1461335.07	Verified
ORD02367	CUST0692	SELL030	2023-03-11	2023-03-13	Delivered	373173.62	Verified
ORD02371	CUST0692	SELL053	2023-07-05	2023-07-08	Delivered	23357.67	Verified
ORD02372	CUST0693	SELL012	2023-11-09	2023-11-11	Delivered	80530.64	Verified
ORD02374	CUST0694	SELL071	2024-06-24	2024-07-01	Delivered	962.48	Verified
ORD02376	CUST0695	SELL065	2024-08-30	2024-09-05	Delivered	55939.01	Verified
ORD02378	CUST0695	SELL024	2024-09-15	2024-09-21	Delivered	11275.57	Verified
ORD02379	CUST0695	SELL025	2024-09-26	2024-10-01	Delivered	159247.16	Verified
ORD02380	CUST0695	SELL006	2024-11-30	2024-12-02	Delivered	631738.02	Verified
ORD02381	CUST0695	SELL059	2024-10-05	2024-10-07	Delivered	8224.90	Verified
ORD02382	CUST0695	SELL017	2024-10-05	2024-10-10	Delivered	111972.04	Verified
ORD02383	CUST0696	SELL053	2024-12-02	2024-12-06	Delivered	1116444.00	Verified
ORD02385	CUST0696	SELL088	2024-11-25	2024-12-03	Delivered	1019787.06	Verified
ORD02388	CUST0697	SELL014	2024-09-20	2024-09-24	Delivered	718474.40	Verified
ORD02390	CUST0697	SELL013	2024-09-01	2024-09-08	Delivered	15172.98	Verified
ORD02391	CUST0697	SELL026	2024-10-27	2024-11-04	Delivered	138284.58	Verified
ORD02395	CUST0697	SELL064	2024-07-29	2024-08-01	Delivered	2457784.65	Verified
ORD02398	CUST0700	SELL034	2024-12-30	2025-01-04	Delivered	1162569.20	Verified
ORD02399	CUST0700	SELL024	2024-11-04	2024-11-10	Delivered	70846.58	Verified
ORD02401	CUST0701	SELL001	2024-12-14	2024-12-21	Delivered	965244.47	Verified
ORD02402	CUST0701	SELL026	2024-07-03	2024-07-10	Delivered	1457210.64	Verified
ORD02403	CUST0701	SELL060	2023-12-20	2023-12-25	Delivered	287162.35	Verified
ORD02405	CUST0701	SELL047	2024-09-27	2024-10-02	Delivered	73459.05	Verified
ORD02406	CUST0702	SELL073	2024-05-13	2024-05-19	Delivered	465732.88	Verified
ORD02408	CUST0703	SELL058	2024-12-24	2025-01-03	Delivered	140423.37	Verified
ORD02409	CUST0703	SELL078	2024-09-17	2024-09-25	Delivered	106282.78	Verified
ORD02415	CUST0707	SELL016	2024-08-18	2024-08-25	Delivered	359945.69	Verified
ORD02418	CUST0707	SELL027	2024-09-14	2024-09-21	Delivered	4792.40	Verified
ORD02422	CUST0708	SELL009	2024-12-23	2024-12-30	Delivered	20728.76	Verified
ORD02423	CUST0709	SELL015	2024-07-26	2024-07-30	Delivered	2690559.32	Verified
ORD02425	CUST0710	SELL064	2024-08-16	2024-08-23	Delivered	27425.31	Verified
ORD02431	CUST0712	SELL046	2023-09-29	2023-10-04	Delivered	164442.78	Verified
ORD02433	CUST0712	SELL011	2024-06-22	2024-06-28	Delivered	124099.07	Verified
ORD02434	CUST0712	SELL002	2024-08-17	2024-08-24	Delivered	513753.00	Verified
ORD02439	CUST0713	SELL006	2023-04-16	2023-04-22	Delivered	15152.82	Verified
ORD02440	CUST0714	SELL080	2024-12-25	2024-12-28	Delivered	441311.10	Verified
ORD02441	CUST0714	SELL059	2024-11-04	2024-11-08	Delivered	567444.59	Verified
ORD02437	CUST0713	SELL065	2023-12-30	2024-01-05	Delivered	54574.89	mismatch price
ORD02444	CUST0714	SELL033	2024-11-05	2024-11-11	Delivered	51056.48	Verified
ORD02445	CUST0714	SELL041	2024-11-09	2024-11-11	Delivered	2365.76	Verified
ORD02454	CUST0715	SELL084	2024-09-02	2024-09-11	Delivered	16768.75	mismatch price
ORD02447	CUST0714	SELL055	2024-12-27	2025-01-02	Delivered	180785.23	Verified
ORD02465	CUST0720	SELL003	2024-07-31	2024-08-04	Delivered	1456956.16	mismatch price
ORD02510	CUST0731	SELL046	2024-07-19	2024-07-30	Delivered	337634.60	mismatch price
ORD02450	CUST0714	SELL056	2024-12-03	2024-12-04	Delivered	678774.80	Verified
ORD02451	CUST0714	SELL014	2024-11-12	2024-11-18	Delivered	166842.38	Verified
ORD02453	CUST0714	SELL055	2024-11-19	2024-11-20	Delivered	492503.63	Verified
ORD02456	CUST0715	SELL031	2024-09-20	2024-09-23	Delivered	1611658.56	Verified
ORD02461	CUST0719	SELL018	2024-11-25	2024-11-28	Delivered	23275.64	Verified
ORD02462	CUST0720	SELL015	2024-07-23	2024-08-03	Delivered	177033.40	Verified
ORD02464	CUST0720	SELL075	2024-07-20	2024-07-28	Delivered	42851.74	Verified
ORD02469	CUST0721	SELL017	2024-12-22	2024-12-28	Delivered	128378.51	Verified
ORD02471	CUST0721	SELL044	2024-09-18	2024-09-20	Delivered	32317.65	Verified
ORD02473	CUST0721	SELL011	2024-12-01	2024-12-07	Delivered	253301.20	Verified
ORD02475	CUST0722	SELL011	2024-12-04	2024-12-09	Delivered	11018.01	Verified
ORD02476	CUST0722	SELL076	2023-11-15	2023-11-16	Delivered	513753.00	Verified
ORD02477	CUST0722	SELL059	2024-12-24	2024-12-30	Delivered	50986.52	Verified
ORD02478	CUST0722	SELL087	2024-09-27	2024-09-30	Delivered	127701.09	Verified
ORD02483	CUST0723	SELL005	2024-02-26	2024-03-04	Delivered	81994.48	Verified
ORD02485	CUST0724	SELL080	2024-10-03	2024-10-10	Delivered	190414.55	Verified
ORD02488	CUST0724	SELL038	2024-12-29	2025-01-05	Delivered	7571.15	Verified
ORD02489	CUST0725	SELL016	2023-09-28	2023-09-29	Delivered	245132.44	Verified
ORD02493	CUST0726	SELL066	2024-11-13	2024-11-14	Delivered	34344.46	Verified
ORD02495	CUST0727	SELL035	2024-08-20	2024-08-25	Delivered	21115.71	Verified
ORD02504	CUST0730	SELL024	2024-12-14	2024-12-15	Delivered	965078.43	Verified
ORD02507	CUST0731	SELL036	2024-12-29	2025-01-03	Delivered	82134.60	Verified
ORD02508	CUST0731	SELL032	2024-04-06	2024-04-18	Delivered	44547.39	Verified
ORD02509	CUST0731	SELL066	2023-09-24	2023-10-05	Delivered	148168.66	Verified
ORD02512	CUST0732	SELL033	2024-08-12	2024-08-18	Delivered	55613.62	Verified
ORD02515	CUST0732	SELL064	2024-08-18	2024-08-25	Delivered	33482.97	Verified
ORD02518	CUST0733	SELL027	2024-06-28	2024-07-03	Delivered	46511.08	Verified
ORD02520	CUST0734	SELL049	2023-07-16	2023-07-21	Delivered	14461.31	Verified
ORD02522	CUST0734	SELL018	2024-04-05	2024-04-10	Delivered	38612.32	Verified
ORD02524	CUST0736	SELL018	2024-03-06	2024-03-08	Delivered	20703.44	Verified
ORD02527	CUST0736	SELL046	2023-11-29	2023-12-01	Delivered	110269.71	Verified
ORD02536	CUST0737	SELL004	2023-12-17	2023-12-22	Delivered	40996.15	Verified
ORD02540	CUST0737	SELL037	2024-02-16	2024-02-19	Delivered	288317.26	Verified
ORD02545	CUST0740	SELL015	2024-06-22	2024-06-24	Delivered	140361.00	Verified
ORD02547	CUST0740	SELL058	2024-09-25	2024-09-30	Delivered	563928.96	Verified
ORD02549	CUST0740	SELL024	2024-10-05	2024-10-09	Delivered	1810580.04	Verified
ORD02550	CUST0740	SELL050	2024-09-05	2024-09-12	Delivered	199058.95	Verified
ORD02554	CUST0740	SELL013	2024-04-14	2024-04-18	Delivered	38310.15	Verified
ORD02556	CUST0741	SELL059	2024-06-30	2024-07-06	Delivered	251501.84	Verified
ORD02557	CUST0741	SELL065	2024-05-03	2024-05-06	Delivered	79945.84	Verified
ORD02558	CUST0741	SELL063	2024-04-15	2024-04-17	Delivered	351651.77	Verified
ORD02559	CUST0741	SELL027	2024-10-30	2024-11-03	Delivered	445358.44	Verified
ORD02562	CUST0744	SELL084	2023-12-22	2023-12-26	Delivered	207023.97	Verified
ORD02567	CUST0744	SELL036	2024-07-16	2024-07-22	Delivered	198153.24	Verified
ORD02569	CUST0747	SELL026	2024-11-29	2024-12-03	Delivered	125318.47	Verified
ORD02571	CUST0747	SELL065	2024-10-23	2024-10-26	Delivered	131993.61	Verified
ORD02572	CUST0747	SELL014	2024-12-05	2024-12-09	Delivered	17641.20	Verified
ORD02573	CUST0747	SELL067	2024-11-22	2024-11-28	Delivered	353048.88	Verified
ORD02578	CUST0748	SELL062	2024-10-24	2024-11-01	Delivered	341616.01	Verified
ORD02581	CUST0748	SELL020	2023-12-02	2023-12-06	Delivered	32929.20	Verified
ORD02583	CUST0749	SELL012	2024-09-24	2024-09-29	Delivered	2087573.62	Verified
ORD02584	CUST0749	SELL068	2024-07-19	2024-07-22	Delivered	87684.88	Verified
ORD02586	CUST0750	SELL060	2024-10-07	2024-10-09	Delivered	342501.25	Verified
ORD02587	CUST0750	SELL063	2024-11-27	2024-12-02	Delivered	219122.04	Verified
ORD02588	CUST0750	SELL044	2024-11-10	2024-11-15	Delivered	127701.09	Verified
ORD02589	CUST0750	SELL044	2024-11-14	2024-11-17	Delivered	198852.85	Verified
ORD02592	CUST0751	SELL089	2024-05-05	2024-05-06	Delivered	130707.25	Verified
ORD02593	CUST0751	SELL012	2024-10-15	2024-10-21	Delivered	101814.33	Verified
ORD02595	CUST0751	SELL033	2024-08-01	2024-08-04	Delivered	804244.85	Verified
ORD02596	CUST0751	SELL089	2024-05-30	2024-06-01	Delivered	403051.28	Verified
ORD02597	CUST0751	SELL007	2024-09-23	2024-09-28	Delivered	39288.15	Verified
ORD02599	CUST0751	SELL044	2024-11-15	2024-11-17	Delivered	25947.77	Verified
ORD02602	CUST0752	SELL041	2023-11-25	2023-11-29	Delivered	700393.60	Verified
ORD02604	CUST0753	SELL030	2024-07-16	2024-07-22	Delivered	81167.53	Verified
ORD02605	CUST0753	SELL073	2024-12-23	2024-12-24	Delivered	108875.43	Verified
ORD02606	CUST0753	SELL082	2024-10-11	2024-10-16	Delivered	180084.64	Verified
ORD02607	CUST0753	SELL009	2024-10-22	2024-10-25	Delivered	33826.71	Verified
ORD02608	CUST0753	SELL029	2024-11-10	2024-11-11	Delivered	223132.14	Verified
ORD02609	CUST0753	SELL025	2024-08-20	2024-08-26	Delivered	71981.01	Verified
ORD02620	CUST0756	SELL088	2024-12-25	2024-12-27	Delivered	651771.68	Verified
ORD02622	CUST0758	SELL027	2024-12-18	2024-12-25	Delivered	87218.15	Verified
ORD02624	CUST0758	SELL010	2024-06-21	2024-06-23	Delivered	1198474.16	Verified
ORD02625	CUST0758	SELL071	2024-06-07	2024-06-08	Delivered	34507.56	Verified
ORD02628	CUST0760	SELL010	2024-12-26	2025-01-03	Delivered	26230.02	Verified
ORD02630	CUST0760	SELL067	2024-12-16	2024-12-30	Delivered	15371.06	Verified
ORD02631	CUST0760	SELL022	2024-12-18	2024-12-24	Delivered	290642.30	Verified
ORD02632	CUST0760	SELL090	2024-12-22	2024-12-29	Delivered	70682.86	Verified
ORD02633	CUST0761	SELL084	2024-08-31	2024-09-02	Delivered	716591.83	Verified
ORD02634	CUST0762	SELL064	2024-12-28	2025-01-05	Delivered	160965.44	Verified
ORD02636	CUST0762	SELL022	2024-11-27	2024-12-03	Delivered	468450.06	Verified
ORD02637	CUST0763	SELL003	2024-01-12	2024-01-19	Delivered	871926.90	Verified
ORD02642	CUST0764	SELL018	2024-12-23	2024-12-29	Delivered	1459370.17	Verified
ORD02644	CUST0768	SELL035	2024-07-25	2024-07-31	Delivered	245007.21	Verified
ORD02639	CUST0764	SELL064	2024-12-26	2024-12-28	Delivered	20918.69	imputed verfied
ORD02647	CUST0769	SELL090	2024-10-30	2024-11-02	Delivered	45816.72	Verified
ORD02725	CUST0786	SELL068	2024-05-31	2024-06-02	Delivered	175369.76	imputed verfied
ORD02650	CUST0771	SELL021	2024-01-24	2024-01-29	Delivered	255676.46	Verified
ORD02652	CUST0772	SELL044	2024-06-17	2024-06-23	Delivered	427359.18	Verified
ORD02653	CUST0772	SELL068	2024-10-14	2024-10-19	Delivered	340737.24	Verified
ORD02654	CUST0772	SELL030	2024-10-30	2024-11-04	Delivered	38292.36	Verified
ORD02638	CUST0763	SELL008	2024-07-18	2024-07-19	Delivered	586313.81	mismatch price
ORD02697	CUST0782	SELL070	2024-05-19	2024-05-24	Delivered	45877.96	mismatch price
ORD02703	CUST0783	SELL033	2024-06-27	2024-07-01	Delivered	38061.27	mismatch price
ORD02659	CUST0772	SELL005	2024-07-01	2024-07-05	Delivered	6057.15	Verified
ORD02660	CUST0772	SELL038	2024-08-15	2024-08-22	Delivered	430074.55	Verified
ORD02665	CUST0774	SELL088	2023-10-29	2023-11-02	Delivered	1325786.96	mismatch price
ORD02662	CUST0773	SELL035	2024-10-14	2024-10-18	Delivered	288258.95	Verified
ORD02663	CUST0773	SELL027	2024-04-10	2024-04-14	Delivered	7958.84	Verified
ORD02664	CUST0774	SELL008	2024-01-21	2024-01-23	Delivered	86513.92	Verified
ORD02676	CUST0778	SELL028	2024-11-27	2024-12-05	Delivered	70351.26	mismatch price
ORD02716	CUST0784	SELL023	2024-10-30	2024-11-05	Delivered	152620.50	mismatch price
ORD02668	CUST0774	SELL040	2024-03-16	2024-03-25	Delivered	1118094.17	Verified
ORD02669	CUST0774	SELL055	2023-02-24	2023-02-26	Delivered	8076.20	Verified
ORD02681	CUST0778	SELL003	2024-12-02	2024-12-10	Delivered	191568.69	mismatch price
ORD02690	CUST0779	SELL044	2024-06-23	2024-07-03	Delivered	368723.25	imputed verfied
ORD02658	CUST0772	SELL054	2024-09-03	2024-09-10	Delivered	368723.25	imputed verfied
ORD02678	CUST0778	SELL078	2024-07-07	2024-07-12	Delivered	10193.83	Verified
ORD02682	CUST0778	SELL014	2024-07-17	2024-07-23	Delivered	100741.91	Verified
ORD02685	CUST0779	SELL063	2024-06-25	2024-06-30	Delivered	294318.98	Verified
ORD02686	CUST0779	SELL011	2024-06-08	2024-06-10	Delivered	95598.42	Verified
ORD02689	CUST0779	SELL017	2024-02-26	2024-02-29	Delivered	14928.20	Verified
ORD02691	CUST0779	SELL054	2024-05-17	2024-05-23	Delivered	46511.08	Verified
ORD02698	CUST0783	SELL060	2024-05-06	2024-05-10	Delivered	173094.92	Verified
ORD02700	CUST0783	SELL015	2023-11-21	2023-11-28	Delivered	68496.96	Verified
ORD02701	CUST0783	SELL007	2024-01-26	2024-01-28	Delivered	313387.28	Verified
ORD02702	CUST0783	SELL009	2023-10-06	2023-10-12	Delivered	18690.33	Verified
ORD02710	CUST0784	SELL022	2023-07-19	2023-07-22	Delivered	74227.75	Verified
ORD02711	CUST0784	SELL009	2024-05-22	2024-05-23	Delivered	19732.78	Verified
ORD02712	CUST0784	SELL079	2024-04-22	2024-04-23	Delivered	140246.84	Verified
ORD02714	CUST0784	SELL055	2024-11-07	2024-11-13	Delivered	24463.34	Verified
ORD02715	CUST0784	SELL076	2024-04-19	2024-04-23	Delivered	219581.43	Verified
ORD02717	CUST0784	SELL067	2023-08-11	2023-08-15	Delivered	527912.66	Verified
ORD02723	CUST0786	SELL024	2024-10-23	2024-10-27	Delivered	48431.34	Verified
ORD02724	CUST0786	SELL015	2024-03-19	2024-03-21	Delivered	818092.87	Verified
ORD02726	CUST0786	SELL002	2024-12-03	2024-12-08	Delivered	110331.26	Verified
ORD02729	CUST0789	SELL049	2024-05-19	2024-05-25	Delivered	44730.34	Verified
ORD02746	CUST0792	SELL004	2024-04-03	2024-04-12	Delivered	494280.20	mismatch price
ORD02778	CUST0800	SELL044	2024-03-29	2024-04-05	Delivered	298987.09	mismatch price
ORD02812	CUST0812	SELL061	2024-11-17	2024-11-18	Delivered	5994.32	mismatch price
ORD02822	CUST0814	SELL035	2024-03-22	2024-03-25	Delivered	48753.27	mismatch price
ORD02737	CUST0792	SELL075	2024-05-19	2024-05-22	Delivered	403980.41	Verified
ORD02738	CUST0792	SELL017	2023-08-19	2023-08-22	Delivered	280143.99	Verified
ORD02739	CUST0792	SELL031	2024-11-10	2024-11-20	Delivered	161331.95	Verified
ORD02740	CUST0792	SELL074	2024-09-11	2024-09-17	Delivered	7224.75	imputed verfied
ORD02743	CUST0792	SELL041	2024-04-15	2024-04-21	Delivered	21790.46	Verified
ORD02744	CUST0792	SELL003	2024-09-06	2024-09-13	Delivered	1006071.55	Verified
ORD02747	CUST0793	SELL004	2024-07-06	2024-07-10	Delivered	1097468.41	Verified
ORD02749	CUST0793	SELL049	2024-12-25	2024-12-30	Delivered	4809.30	Verified
ORD02751	CUST0793	SELL058	2023-12-12	2023-12-20	Delivered	22153.16	Verified
ORD02754	CUST0793	SELL055	2024-01-12	2024-01-16	Delivered	168684.73	Verified
ORD02755	CUST0793	SELL040	2024-09-08	2024-09-10	Delivered	16538.43	Verified
ORD02757	CUST0793	SELL065	2023-12-12	2023-12-22	Delivered	232342.08	Verified
ORD02764	CUST0797	SELL082	2024-08-02	2024-08-07	Delivered	356067.36	Verified
ORD02766	CUST0797	SELL010	2024-07-24	2024-07-27	Delivered	636407.49	Verified
ORD02768	CUST0797	SELL035	2024-11-15	2024-11-24	Delivered	23962.00	Verified
ORD02769	CUST0797	SELL049	2024-04-08	2024-04-10	Delivered	38177.68	Verified
ORD02772	CUST0797	SELL039	2024-07-01	2024-07-07	Delivered	6169.57	Verified
ORD02776	CUST0800	SELL023	2024-07-12	2024-07-14	Delivered	57745.17	Verified
ORD02777	CUST0800	SELL027	2024-09-10	2024-09-15	Delivered	170697.47	Verified
ORD02779	CUST0801	SELL015	2024-10-01	2024-10-05	Delivered	789376.88	Verified
ORD02780	CUST0801	SELL024	2024-10-28	2024-11-03	Delivered	2388424.82	Verified
ORD02783	CUST0801	SELL088	2024-12-03	2024-12-05	Delivered	88011.45	Verified
ORD02784	CUST0801	SELL031	2024-10-06	2024-10-11	Delivered	102447.74	Verified
ORD02785	CUST0801	SELL065	2024-10-21	2024-10-23	Delivered	3329.98	Verified
ORD02786	CUST0801	SELL075	2024-08-27	2024-08-31	Delivered	504259.73	Verified
ORD02789	CUST0801	SELL022	2024-10-08	2024-10-13	Delivered	622086.94	Verified
ORD02790	CUST0801	SELL026	2024-12-03	2024-12-07	Delivered	97086.56	Verified
ORD02792	CUST0802	SELL029	2024-05-22	2024-05-28	Delivered	772795.08	Verified
ORD02794	CUST0802	SELL046	2024-08-01	2024-08-06	Delivered	31709.48	Verified
ORD02795	CUST0802	SELL054	2024-03-01	2024-03-07	Delivered	760793.62	Verified
ORD02797	CUST0804	SELL063	2023-11-21	2023-11-27	Delivered	27918.16	Verified
ORD02798	CUST0804	SELL023	2023-12-17	2023-12-18	Delivered	305522.26	Verified
ORD02799	CUST0804	SELL009	2023-11-16	2023-11-23	Delivered	273170.78	Verified
ORD02803	CUST0809	SELL084	2024-10-03	2024-10-10	Delivered	43039.35	Verified
ORD02804	CUST0809	SELL051	2023-08-10	2023-08-14	Delivered	644680.18	Verified
ORD02805	CUST0810	SELL030	2024-12-13	2024-12-19	Delivered	656895.94	Verified
ORD02807	CUST0811	SELL046	2024-01-21	2024-01-25	Delivered	4038.10	Verified
ORD02809	CUST0811	SELL084	2023-09-04	2023-09-08	Delivered	181459.05	Verified
ORD02811	CUST0812	SELL008	2024-08-05	2024-08-06	Delivered	17976.54	Verified
ORD02816	CUST0812	SELL027	2023-10-30	2023-11-04	Delivered	158091.35	Verified
ORD02818	CUST0813	SELL048	2024-09-21	2024-09-25	Delivered	52486.04	Verified
ORD02819	CUST0814	SELL061	2023-08-25	2023-08-29	Delivered	22093.77	Verified
ORD02820	CUST0814	SELL050	2024-01-25	2024-01-29	Delivered	619843.72	Verified
ORD02821	CUST0814	SELL069	2024-06-25	2024-07-01	Delivered	117073.40	Verified
ORD02823	CUST0814	SELL078	2024-07-16	2024-07-17	Delivered	87588.60	Verified
ORD02875	CUST0822	SELL047	2024-11-27	2024-12-04	Delivered	89507.96	imputed verfied
ORD02833	CUST0815	SELL040	2024-12-21	2024-12-27	Delivered	841978.87	mismatch price
ORD02905	CUST0830	SELL033	2024-09-27	2024-09-29	Delivered	231179.36	imputed verfied
ORD02829	CUST0815	SELL076	2024-12-19	2024-12-21	Delivered	286376.81	Verified
ORD02830	CUST0815	SELL004	2024-11-17	2024-11-21	Delivered	153518.44	Verified
ORD02831	CUST0815	SELL008	2024-09-28	2024-09-30	Delivered	105815.87	Verified
ORD02886	CUST0825	SELL066	2024-03-23	2024-03-25	Delivered	51096.45	imputed verfied
ORD02834	CUST0815	SELL016	2024-09-23	2024-09-30	Delivered	21277.86	Verified
ORD02835	CUST0816	SELL068	2024-10-05	2024-10-09	Delivered	614201.88	Verified
ORD02837	CUST0816	SELL042	2024-07-20	2024-07-27	Delivered	142961.41	Verified
ORD02838	CUST0816	SELL076	2023-10-20	2023-10-26	Delivered	52486.04	Verified
ORD02920	CUST0833	SELL071	2024-06-19	2024-06-25	Delivered	5638.01	imputed verfied
ORD02840	CUST0816	SELL008	2024-05-19	2024-05-26	Delivered	44862.34	Verified
ORD02842	CUST0817	SELL028	2024-07-13	2024-07-17	Delivered	272051.99	Verified
ORD02846	CUST0817	SELL066	2024-01-05	2024-01-09	Delivered	553178.86	Verified
ORD02847	CUST0817	SELL090	2023-07-10	2023-07-17	Delivered	199684.92	Verified
ORD02849	CUST0817	SELL052	2024-06-06	2024-06-10	Delivered	982884.07	Verified
ORD02853	CUST0818	SELL045	2024-09-15	2024-09-17	Delivered	194669.49	Verified
ORD02854	CUST0818	SELL035	2024-11-10	2024-11-19	Delivered	61048.20	Verified
ORD02856	CUST0818	SELL004	2024-10-21	2024-10-29	Delivered	539592.87	Verified
ORD02857	CUST0818	SELL089	2024-09-11	2024-09-20	Delivered	1557795.44	Verified
ORD02861	CUST0819	SELL013	2024-08-10	2024-08-20	Delivered	508025.72	Verified
ORD02865	CUST0820	SELL004	2024-01-19	2024-02-02	Delivered	602198.00	Verified
ORD02866	CUST0821	SELL029	2024-08-19	2024-08-25	Delivered	1633.04	Verified
ORD02868	CUST0821	SELL056	2024-08-26	2024-08-29	Delivered	262877.04	Verified
ORD02870	CUST0821	SELL011	2024-09-14	2024-09-16	Delivered	193988.83	Verified
ORD02871	CUST0822	SELL066	2024-10-13	2024-10-20	Delivered	1454233.82	Verified
ORD02872	CUST0822	SELL073	2024-09-20	2024-09-25	Delivered	36035.42	Verified
ORD02873	CUST0822	SELL073	2024-10-11	2024-10-17	Delivered	236487.25	Verified
ORD02876	CUST0823	SELL040	2024-10-30	2024-11-04	Delivered	1698546.23	Verified
ORD02878	CUST0824	SELL059	2024-12-29	2024-12-31	Delivered	247085.24	Verified
ORD02879	CUST0824	SELL033	2023-10-22	2023-10-24	Delivered	687406.40	Verified
ORD02882	CUST0825	SELL083	2024-02-10	2024-02-17	Delivered	43501.45	Verified
ORD02885	CUST0825	SELL082	2024-03-03	2024-03-09	Delivered	26206.57	Verified
ORD02888	CUST0825	SELL028	2024-03-16	2024-03-19	Delivered	113221.27	Verified
ORD02889	CUST0826	SELL058	2024-07-07	2024-07-10	Delivered	776806.99	Verified
ORD02890	CUST0826	SELL068	2024-01-03	2024-01-06	Delivered	240879.20	Verified
ORD02892	CUST0827	SELL081	2024-07-15	2024-07-21	Delivered	527670.35	Verified
ORD02894	CUST0829	SELL054	2024-05-05	2024-05-12	Delivered	114123.99	Verified
ORD02897	CUST0830	SELL055	2024-07-20	2024-07-25	Delivered	573477.05	Verified
ORD02898	CUST0830	SELL073	2024-12-25	2025-01-01	Delivered	126318.52	Verified
ORD02899	CUST0830	SELL013	2024-06-27	2024-06-28	Delivered	606004.23	Verified
ORD02900	CUST0830	SELL044	2024-08-17	2024-08-22	Delivered	1110784.70	Verified
ORD02903	CUST0830	SELL076	2024-08-23	2024-08-24	Delivered	581859.80	Verified
ORD02907	CUST0830	SELL004	2024-11-03	2024-11-08	Delivered	1583210.41	Verified
ORD02909	CUST0831	SELL026	2024-03-11	2024-03-14	Delivered	88105.02	Verified
ORD02911	CUST0831	SELL029	2024-10-27	2024-11-02	Delivered	64966.29	Verified
ORD02912	CUST0831	SELL012	2024-03-22	2024-03-26	Delivered	649434.60	Verified
ORD02913	CUST0831	SELL057	2024-12-04	2024-12-11	Delivered	32521.50	Verified
ORD02915	CUST0831	SELL016	2024-09-03	2024-09-05	Delivered	1458423.30	Verified
ORD02919	CUST0833	SELL075	2024-08-26	2024-08-31	Delivered	758332.90	Verified
ORD02921	CUST0833	SELL014	2024-07-28	2024-08-03	Delivered	145167.24	Verified
ORD02922	CUST0833	SELL021	2024-12-20	2024-12-21	Delivered	38929.45	Verified
ORD02923	CUST0833	SELL089	2024-08-26	2024-08-27	Delivered	952072.75	Verified
ORD02924	CUST0833	SELL076	2024-11-07	2024-11-13	Delivered	8757.97	Verified
ORD02925	CUST0833	SELL021	2024-08-27	2024-09-01	Delivered	290501.34	Verified
ORD02928	CUST0833	SELL025	2024-10-29	2024-11-01	Delivered	44137.50	Verified
ORD02933	CUST0835	SELL028	2024-11-14	2024-11-19	Delivered	69517.54	Verified
ORD02934	CUST0835	SELL030	2024-10-02	2024-10-04	Delivered	24683.24	Verified
ORD02936	CUST0836	SELL082	2024-12-10	2024-12-15	Delivered	81118.15	Verified
ORD02938	CUST0836	SELL035	2024-11-10	2024-11-11	Delivered	18483.24	Verified
ORD02939	CUST0836	SELL041	2024-10-16	2024-10-21	Delivered	69610.56	Verified
ORD02940	CUST0836	SELL057	2024-11-15	2024-11-20	Delivered	246866.05	Verified
ORD02942	CUST0836	SELL032	2024-10-22	2024-10-26	Delivered	494813.66	Verified
ORD02988	CUST0852	SELL020	2023-12-24	2023-12-28	Delivered	184236.40	imputed verfied
ORD02946	CUST0836	SELL057	2024-08-30	2024-08-31	Delivered	110681.85	Verified
ORD02945	CUST0836	SELL077	2024-07-28	2024-07-30	Delivered	222324.51	imputed verfied
ORD02949	CUST0837	SELL075	2024-07-06	2024-07-13	Delivered	646154.12	Verified
ORD02950	CUST0837	SELL068	2024-09-07	2024-09-08	Delivered	132529.29	Verified
ORD02968	CUST0843	SELL047	2024-08-31	2024-09-03	Delivered	666665.37	imputed verfied
ORD02952	CUST0838	SELL064	2024-12-29	2025-01-03	Delivered	118060.60	Verified
ORD02955	CUST0839	SELL016	2024-12-01	2024-12-05	Delivered	29614.02	Verified
ORD02964	CUST0843	SELL055	2024-05-30	2024-06-03	Delivered	8757.97	Verified
ORD02937	CUST0836	SELL001	2024-09-01	2024-09-07	Delivered	45902.74	mismatch price
ORD02958	CUST0840	SELL051	2024-01-13	2024-01-19	Delivered	11276.02	imputed verfied
ORD02969	CUST0843	SELL060	2024-08-02	2024-08-03	Delivered	150550.83	Verified
ORD02954	CUST0839	SELL058	2024-09-16	2024-09-18	Delivered	456816.78	mismatch price
ORD02972	CUST0844	SELL003	2024-09-12	2024-09-16	Delivered	1446927.23	Verified
ORD02966	CUST0843	SELL017	2024-10-21	2024-10-27	Delivered	782053.66	mismatch price
ORD02974	CUST0845	SELL066	2024-07-11	2024-07-14	Delivered	937404.21	Verified
ORD02970	CUST0843	SELL047	2024-05-06	2024-05-12	Delivered	16010.80	mismatch price
ORD02976	CUST0847	SELL003	2024-10-16	2024-10-26	Delivered	3849.92	Verified
ORD02977	CUST0847	SELL088	2024-10-30	2024-11-01	Delivered	70592.32	Verified
ORD02978	CUST0847	SELL076	2024-10-03	2024-10-05	Delivered	73176.91	Verified
ORD02979	CUST0847	SELL038	2024-08-15	2024-08-25	Delivered	12599.24	Verified
ORD02980	CUST0847	SELL034	2024-09-05	2024-09-12	Delivered	202145.72	Verified
ORD02981	CUST0849	SELL021	2024-05-25	2024-06-01	Delivered	140213.78	mismatch price
ORD02983	CUST0849	SELL005	2024-07-15	2024-07-19	Delivered	194757.85	Verified
ORD02984	CUST0850	SELL037	2024-10-17	2024-10-20	Delivered	233857.94	Verified
ORD02997	CUST0858	SELL084	2024-03-09	2024-03-10	Delivered	126350.44	mismatch price
ORD03000	CUST0859	SELL041	2024-02-15	2024-02-16	Delivered	1071290.74	mismatch price
ORD02987	CUST0851	SELL056	2024-08-27	2024-08-31	Delivered	300935.13	Verified
ORD02989	CUST0852	SELL081	2024-05-30	2024-06-01	Delivered	26929.28	Verified
ORD03003	CUST0861	SELL017	2024-10-22	2024-10-26	Delivered	29754.99	mismatch price
ORD02991	CUST0852	SELL040	2023-11-06	2023-11-08	Delivered	249606.15	Verified
ORD02992	CUST0854	SELL020	2024-01-07	2024-01-09	Delivered	213156.97	Verified
ORD03007	CUST0861	SELL026	2024-11-06	2024-11-09	Delivered	854934.30	mismatch price
ORD02996	CUST0857	SELL016	2024-04-29	2024-05-03	Delivered	756814.31	Verified
ORD02998	CUST0858	SELL018	2023-08-07	2023-08-11	Delivered	150088.30	Verified
ORD03001	CUST0860	SELL019	2023-03-24	2023-03-27	Delivered	361991.39	Verified
ORD03006	CUST0861	SELL072	2024-11-18	2024-11-22	Delivered	697032.82	Verified
ORD03008	CUST0862	SELL062	2024-11-30	2024-12-01	Delivered	423407.40	Verified
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (payment_id, order_id, payment_method, amount, payment_date) FROM stdin;
PAY00002	ORD00003	Cash on Delivery	343428.55	2024-09-07 19:00:00
PAY00003	ORD00004	Cash on Delivery	26203.69	2023-12-11 15:00:00
PAY00001	ORD00002	Mobile Money	5416.29	2024-09-10 16:00:00
PAY00005	ORD00006	Cash on Delivery	2257228.05	2024-06-29 03:00:00
PAY00044	ORD00059	Mobile Money	1721730.29	2024-10-05 07:00:00
PAY00007	ORD00009	Mobile Money	1260295.96	2024-04-28 04:00:00
PAY00016	ORD00018	Mobile Money	636190.87	2024-04-19 16:00:00
PAY00010	ORD00012	Card	314953.64	2024-05-25 18:00:00
PAY00011	ORD00013	Card	78337.96	2024-12-29 09:00:00
PAY00012	ORD00014	Cash on Delivery	580632.46	2024-02-15 06:00:00
PAY00013	ORD00015	Card	316660.38	2024-07-17 14:00:00
PAY00014	ORD00016	Card	2019.05	2024-08-21 05:00:00
PAY00015	ORD00017	Card	18690.33	2024-01-10 21:00:00
PAY00017	ORD00019	Cash on Delivery	1154125.19	2023-10-30 04:00:00
PAY00075	ORD00101	Card	338696.40	2024-11-27 00:00:00
PAY00087	ORD00119	Cash on Delivery	30282.75	2024-02-07 20:00:00
PAY00020	ORD00024	Card	202012.48	2023-09-23 14:00:00
PAY00021	ORD00026	Card	641461.84	2023-11-06 02:00:00
PAY00022	ORD00027	Card	63031.03	2024-11-15 23:00:00
PAY00023	ORD00028	Mobile Money	387229.75	2023-10-10 15:00:00
PAY00024	ORD00029	Card	610496.92	2024-09-08 15:00:00
PAY00027	ORD00032	Card	742823.21	2024-10-08 06:00:00
PAY00028	ORD00033	Card	87218.76	2024-06-28 23:00:00
PAY00081	ORD00110	Cash on Delivery	73744.65	2023-09-21 20:00:00
PAY00031	ORD00037	Card	418860.68	2024-11-12 18:00:00
PAY00032	ORD00038	Cash on Delivery	50969.15	2024-11-19 06:00:00
PAY00033	ORD00040	Card	181459.05	2024-08-19 09:00:00
PAY00035	ORD00042	Mobile Money	386969.63	2023-09-29 07:00:00
PAY00036	ORD00045	Mobile Money	37115.57	2023-07-07 22:00:00
PAY00037	ORD00047	Bank Transfer	397308.38	2023-12-24 20:00:00
PAY00038	ORD00048	Bank Transfer	620263.73	2023-11-04 09:00:00
PAY00039	ORD00049	Bank Transfer	8921.75	2023-12-09 09:00:00
PAY00041	ORD00056	Mobile Money	55822.24	2024-09-29 15:00:00
PAY00042	ORD00057	Bank Transfer	44075.43	2024-10-15 20:00:00
PAY00045	ORD00060	Mobile Money	719457.16	2024-09-08 08:00:00
PAY00046	ORD00062	Card	841181.08	2024-07-24 19:00:00
PAY00048	ORD00065	Bank Transfer	568676.24	2024-09-03 04:00:00
PAY00050	ORD00068	Mobile Money	59207.10	2024-10-15 00:00:00
PAY00052	ORD00070	Bank Transfer	14849.13	2024-07-07 17:00:00
PAY00054	ORD00072	Card	28219.20	2023-12-22 00:00:00
PAY00055	ORD00074	Mobile Money	85134.06	2024-12-29 05:00:00
PAY00060	ORD00082	Cash on Delivery	68811.36	2024-07-06 09:00:00
PAY00061	ORD00083	Mobile Money	221349.29	2024-07-10 05:00:00
PAY00062	ORD00084	Bank Transfer	156675.92	2024-09-07 20:00:00
PAY00063	ORD00088	Card	317920.43	2023-10-29 03:00:00
PAY00064	ORD00089	Cash on Delivery	11561.20	2024-02-08 12:00:00
PAY00065	ORD00091	Mobile Money	290642.30	2023-09-13 17:00:00
PAY00066	ORD00092	Bank Transfer	172118.10	2023-06-12 18:00:00
PAY00067	ORD00093	Mobile Money	150879.51	2023-07-22 22:00:00
PAY00068	ORD00094	Bank Transfer	113579.08	2024-04-15 04:00:00
PAY00069	ORD00095	Bank Transfer	105588.96	2023-11-01 18:00:00
PAY00071	ORD00097	Mobile Money	15165.36	2024-05-25 11:00:00
PAY00074	ORD00100	Card	1216584.61	2024-11-22 01:00:00
PAY00077	ORD00103	Bank Transfer	541867.09	2024-08-25 18:00:00
PAY00078	ORD00104	Cash on Delivery	47715.49	2024-08-30 05:00:00
PAY00079	ORD00107	Card	163173.87	2024-10-29 01:00:00
PAY00080	ORD00109	Card	95695.43	2024-08-11 14:00:00
PAY00084	ORD00114	Bank Transfer	116631.80	2023-07-12 07:00:00
PAY00086	ORD00118	Cash on Delivery	3808.56	2023-05-12 03:00:00
PAY00089	ORD00121	Cash on Delivery	361871.41	2023-06-23 06:00:00
PAY00090	ORD00123	Card	286796.28	2024-03-24 17:00:00
PAY00091	ORD00124	Card	17894.71	2024-09-28 19:00:00
PAY00092	ORD00125	Card	1308986.59	2024-08-09 15:00:00
PAY00093	ORD00126	Mobile Money	17879.04	2024-03-10 00:00:00
PAY00096	ORD00130	Mobile Money	409790.96	2024-06-06 20:00:00
PAY00097	ORD00131	Card	36567.08	2024-11-15 07:00:00
PAY00098	ORD00132	Mobile Money	387334.01	2024-03-22 14:00:00
PAY00101	ORD00136	Card	121358.37	2024-12-06 07:00:00
PAY00103	ORD00138	Mobile Money	90240.52	2024-07-19 17:00:00
PAY00104	ORD00139	Card	61679.19	2024-12-03 03:00:00
PAY00105	ORD00144	Card	20387.66	2024-08-05 06:00:00
PAY00107	ORD00146	Bank Transfer	67971.18	2023-11-18 15:00:00
PAY00109	ORD00148	Bank Transfer	424510.83	2023-09-10 03:00:00
PAY00110	ORD00149	Cash on Delivery	165983.83	2024-02-24 12:00:00
PAY00111	ORD00150	Cash on Delivery	923063.39	2023-08-21 23:00:00
PAY00112	ORD00152	Card	381529.84	2024-11-24 01:00:00
PAY00113	ORD00154	Mobile Money	44137.50	2023-12-24 17:00:00
PAY00114	ORD00155	Mobile Money	407731.20	2024-08-19 22:00:00
PAY00115	ORD00156	Cash on Delivery	28748.14	2023-12-30 22:00:00
PAY00116	ORD00157	Bank Transfer	1837779.82	2024-03-10 02:00:00
PAY00117	ORD00159	Card	8939.52	2024-11-05 12:00:00
PAY00118	ORD00161	Cash on Delivery	198883.60	2024-07-29 17:00:00
PAY00119	ORD00163	Card	272069.49	2024-07-01 01:00:00
PAY00121	ORD00165	Mobile Money	72273.39	2024-07-20 16:00:00
PAY00122	ORD00166	Card	241237.25	2024-12-05 03:00:00
PAY00125	ORD00170	Bank Transfer	445715.05	2024-08-11 16:00:00
PAY00124	ORD00169	Card	74101.71	2024-08-26 20:00:00
PAY00126	ORD00172	Mobile Money	140456.88	2024-04-19 11:00:00
PAY00127	ORD00173	Card	10045.04	2024-05-25 15:00:00
PAY00128	ORD00175	Bank Transfer	1362565.60	2024-03-28 23:00:00
PAY00129	ORD00176	Cash on Delivery	463018.78	2024-03-12 08:00:00
PAY00130	ORD00178	Cash on Delivery	12927.06	2023-07-15 07:00:00
PAY00131	ORD00179	Mobile Money	361242.00	2024-04-04 07:00:00
PAY00134	ORD00183	Bank Transfer	1118704.60	2024-11-15 11:00:00
PAY00135	ORD00184	Card	1110784.70	2024-12-18 08:00:00
PAY00132	ORD00181	Mobile Money	13862.43	2024-04-30 14:00:00
PAY00137	ORD00186	Card	68811.36	2024-10-07 22:00:00
PAY00138	ORD00187	Bank Transfer	279610.57	2024-09-05 07:00:00
PAY00182	ORD00246	Mobile Money	73882.44	2024-02-09 11:00:00
PAY00140	ORD00190	Bank Transfer	205354.87	2024-12-16 05:00:00
PAY00141	ORD00191	Mobile Money	11170.68	2023-10-31 07:00:00
PAY00142	ORD00192	Card	51341.16	2024-12-14 09:00:00
PAY00143	ORD00194	Mobile Money	1633.04	2024-12-23 14:00:00
PAY00177	ORD00240	Cash on Delivery	210685.32	2024-09-25 06:00:00
PAY00145	ORD00196	Cash on Delivery	1906549.00	2024-12-24 19:00:00
PAY00146	ORD00197	Cash on Delivery	1106566.77	2023-10-04 16:00:00
PAY00147	ORD00198	Card	637741.33	2024-01-07 15:00:00
PAY00183	ORD00247	Mobile Money	125704.93	2023-06-29 09:00:00
PAY00149	ORD00200	Card	15864.45	2023-05-22 15:00:00
PAY00150	ORD00202	Card	415783.66	2023-09-27 21:00:00
PAY00152	ORD00205	Cash on Delivery	184222.10	2024-08-09 21:00:00
PAY00153	ORD00206	Bank Transfer	207195.58	2024-12-08 17:00:00
PAY00155	ORD00208	Mobile Money	463513.16	2024-10-27 23:00:00
PAY00156	ORD00210	Card	1046114.96	2024-12-26 14:00:00
PAY00158	ORD00212	Mobile Money	97186.64	2024-12-20 11:00:00
PAY00160	ORD00215	Cash on Delivery	1067633.73	2024-09-28 22:00:00
PAY00161	ORD00216	Cash on Delivery	104715.98	2024-04-26 19:00:00
PAY00162	ORD00220	Cash on Delivery	1821077.11	2024-08-06 13:00:00
PAY00163	ORD00223	Card	81177.59	2024-03-02 06:00:00
PAY00164	ORD00225	Bank Transfer	68706.68	2024-02-26 04:00:00
PAY00165	ORD00226	Card	340737.24	2024-01-08 06:00:00
PAY00167	ORD00228	Mobile Money	19060.11	2024-10-13 11:00:00
PAY00169	ORD00230	Card	18140.90	2024-11-30 18:00:00
PAY00170	ORD00231	Bank Transfer	299658.88	2024-09-18 10:00:00
PAY00171	ORD00232	Bank Transfer	114557.57	2024-05-27 08:00:00
PAY00173	ORD00234	Mobile Money	869814.44	2024-10-16 09:00:00
PAY00175	ORD00238	Mobile Money	2985.64	2024-07-24 00:00:00
PAY00176	ORD00239	Card	8185.56	2024-08-09 13:00:00
PAY00179	ORD00243	Card	34836.28	2024-11-17 09:00:00
PAY00181	ORD00245	Bank Transfer	87303.72	2024-01-13 03:00:00
PAY00185	ORD00252	Cash on Delivery	53834.42	2024-10-26 06:00:00
PAY00186	ORD00254	Cash on Delivery	90661.69	2024-05-29 04:00:00
PAY00190	ORD00259	Mobile Money	1008375.05	2024-09-30 23:00:00
PAY00191	ORD00260	Card	21046.98	2024-01-01 06:00:00
PAY00192	ORD00261	Card	1033526.75	2024-01-20 03:00:00
PAY00194	ORD00266	Mobile Money	39485.36	2024-09-06 20:00:00
PAY00195	ORD00267	Cash on Delivery	1337468.88	2024-08-10 07:00:00
PAY00196	ORD00268	Cash on Delivery	1040455.46	2024-12-24 20:00:00
PAY00197	ORD00270	Bank Transfer	13380.15	2024-12-06 20:00:00
PAY00199	ORD00272	Bank Transfer	57378.28	2023-12-15 11:00:00
PAY00200	ORD00273	Mobile Money	688797.69	2024-06-04 08:00:00
PAY00201	ORD00274	Mobile Money	21686.24	2023-07-16 11:00:00
PAY00202	ORD00275	Mobile Money	795534.40	2024-08-12 09:00:00
PAY00203	ORD00276	Cash on Delivery	189891.12	2024-06-19 08:00:00
PAY00204	ORD00277	Card	565928.04	2024-11-04 07:00:00
PAY00205	ORD00278	Bank Transfer	36834.84	2024-12-05 00:00:00
PAY00207	ORD00281	Card	11957.92	2024-06-21 04:00:00
PAY00208	ORD00282	Card	163963.66	2024-09-07 18:00:00
PAY00209	ORD00284	Bank Transfer	24967.78	2023-09-15 15:00:00
PAY00210	ORD00285	Cash on Delivery	21301.38	2023-05-05 01:00:00
PAY00211	ORD00286	Card	1482049.93	2023-10-08 07:00:00
PAY00212	ORD00289	Bank Transfer	838831.71	2023-10-06 20:00:00
PAY00213	ORD00291	Mobile Money	8834.25	2024-04-03 14:00:00
PAY00215	ORD00293	Mobile Money	511280.86	2024-02-17 06:00:00
PAY00216	ORD00294	Mobile Money	52451.70	2023-03-08 21:00:00
PAY00217	ORD00296	Cash on Delivery	95114.76	2023-11-12 15:00:00
PAY00218	ORD00297	Mobile Money	375751.75	2023-07-21 12:00:00
PAY00219	ORD00298	Cash on Delivery	392099.74	2023-05-16 07:00:00
PAY00221	ORD00301	Bank Transfer	1006562.43	2024-06-02 07:00:00
PAY00222	ORD00302	Mobile Money	72273.39	2024-10-07 01:00:00
PAY00223	ORD00303	Mobile Money	541298.27	2024-10-17 13:00:00
PAY00224	ORD00305	Cash on Delivery	23962.00	2024-12-04 00:00:00
PAY00225	ORD00307	Bank Transfer	124012.95	2024-09-30 09:00:00
PAY00238	ORD00331	Mobile Money	643433.84	2024-07-05 14:00:00
PAY00220	ORD00300	Cash on Delivery	60582.65	2024-06-21 05:00:00
PAY00228	ORD00312	Cash on Delivery	517459.78	2024-06-11 19:00:00
PAY00229	ORD00313	Card	649434.60	2024-09-23 06:00:00
PAY00230	ORD00314	Card	331970.24	2024-11-11 20:00:00
PAY00261	ORD00368	Card	92322.49	2024-06-15 09:00:00
PAY00232	ORD00317	Mobile Money	1015340.04	2024-11-13 14:00:00
PAY00234	ORD00324	Bank Transfer	20703.44	2024-07-24 04:00:00
PAY00235	ORD00325	Card	1024046.49	2024-11-19 01:00:00
PAY00236	ORD00329	Bank Transfer	1056588.38	2023-07-27 23:00:00
PAY00237	ORD00330	Mobile Money	237701.88	2024-11-19 06:00:00
PAY00240	ORD00333	Cash on Delivery	1038583.27	2024-03-05 10:00:00
PAY00242	ORD00335	Mobile Money	11561.20	2024-11-29 23:00:00
PAY00243	ORD00337	Cash on Delivery	118777.43	2024-09-04 20:00:00
PAY00244	ORD00338	Card	835660.76	2023-11-09 23:00:00
PAY00249	ORD00345	Cash on Delivery	12341.62	2024-09-01 23:00:00
PAY00250	ORD00347	Mobile Money	1135166.90	2024-05-20 02:00:00
PAY00251	ORD00348	Bank Transfer	80565.33	2024-04-13 00:00:00
PAY00253	ORD00351	Mobile Money	905369.04	2024-08-09 20:00:00
PAY00254	ORD00353	Mobile Money	1747386.06	2024-03-08 15:00:00
PAY00255	ORD00360	Bank Transfer	579273.29	2024-06-17 04:00:00
PAY00256	ORD00361	Cash on Delivery	81869.66	2024-06-22 16:00:00
PAY00258	ORD00363	Card	58042.90	2024-12-19 00:00:00
PAY00260	ORD00367	Mobile Money	71357.08	2024-03-31 17:00:00
PAY00262	ORD00369	Bank Transfer	135890.25	2024-08-04 00:00:00
PAY00264	ORD00372	Card	9954.82	2024-11-15 22:00:00
PAY00265	ORD00374	Card	68757.46	2024-09-27 09:00:00
PAY00267	ORD00376	Card	33000.44	2024-06-23 23:00:00
PAY00271	ORD00383	Cash on Delivery	8999.40	2024-12-26 12:00:00
PAY00272	ORD00385	Mobile Money	1340872.79	2024-12-01 14:00:00
PAY00273	ORD00386	Cash on Delivery	549925.12	2024-12-04 08:00:00
PAY00274	ORD00389	Mobile Money	170398.32	2024-11-24 06:00:00
PAY00275	ORD00390	Cash on Delivery	46462.10	2024-12-19 11:00:00
PAY00276	ORD00391	Cash on Delivery	73400.14	2024-10-03 11:00:00
PAY00277	ORD00393	Cash on Delivery	487075.95	2024-12-21 21:00:00
PAY00278	ORD00394	Cash on Delivery	1174.07	2024-09-20 06:00:00
PAY00279	ORD00395	Cash on Delivery	392693.70	2024-06-02 04:00:00
PAY00285	ORD00409	Cash on Delivery	208766.75	2024-01-29 15:00:00
PAY00287	ORD00412	Card	100026.32	2024-05-01 00:00:00
PAY00288	ORD00413	Card	227426.90	2024-11-07 18:00:00
PAY00291	ORD00416	Mobile Money	73579.33	2024-11-06 16:00:00
PAY00294	ORD00423	Bank Transfer	168960.56	2024-10-28 15:00:00
PAY00297	ORD00427	Bank Transfer	142692.85	2024-12-08 14:00:00
PAY00299	ORD00431	Mobile Money	899321.45	2024-04-22 12:00:00
PAY00300	ORD00433	Bank Transfer	132923.54	2023-06-14 19:00:00
PAY00301	ORD00437	Bank Transfer	284037.06	2024-03-18 12:00:00
PAY00304	ORD00441	Bank Transfer	1817749.85	2023-07-15 16:00:00
PAY00309	ORD00447	Card	11561.20	2024-04-09 18:00:00
PAY00311	ORD00450	Bank Transfer	115950.03	2024-11-15 06:00:00
PAY00312	ORD00453	Card	67579.57	2024-11-14 02:00:00
PAY00313	ORD00454	Card	1300172.97	2024-11-15 09:00:00
PAY00314	ORD00455	Mobile Money	792677.46	2024-12-17 10:00:00
PAY00315	ORD00456	Card	701886.30	2024-12-15 10:00:00
PAY00316	ORD00457	Card	1255316.56	2024-11-29 03:00:00
PAY00317	ORD00458	Card	166388.35	2024-08-17 20:00:00
PAY00319	ORD00460	Mobile Money	160987.02	2024-11-07 14:00:00
PAY00333	ORD00479	Mobile Money	130549.90	2024-06-29 05:00:00
PAY00322	ORD00463	Mobile Money	7172.97	2024-09-17 07:00:00
PAY00323	ORD00468	Bank Transfer	231544.96	2024-06-12 07:00:00
PAY00325	ORD00470	Card	816829.96	2024-06-15 04:00:00
PAY00326	ORD00471	Cash on Delivery	167987.24	2024-10-16 16:00:00
PAY00327	ORD00472	Mobile Money	37254.90	2024-05-29 22:00:00
PAY00398	ORD00571	Card	49774.10	2024-09-20 06:00:00
PAY00331	ORD00477	Card	117508.45	2024-06-30 06:00:00
PAY00332	ORD00478	Bank Transfer	3149.21	2024-02-05 17:00:00
PAY00335	ORD00481	Mobile Money	924212.96	2024-10-26 20:00:00
PAY00336	ORD00482	Cash on Delivery	515180.54	2024-03-22 18:00:00
PAY00337	ORD00484	Card	508341.61	2024-12-11 16:00:00
PAY00347	ORD00496	Bank Transfer	73744.65	2024-09-08 01:00:00
PAY00343	ORD00490	Cash on Delivery	22192.46	2024-08-02 18:00:00
PAY00345	ORD00493	Cash on Delivery	118235.75	2024-08-21 21:00:00
PAY00346	ORD00494	Bank Transfer	876039.35	2024-12-13 00:00:00
PAY00348	ORD00497	Bank Transfer	20993.04	2024-11-07 13:00:00
PAY00349	ORD00498	Mobile Money	82041.04	2024-12-13 10:00:00
PAY00350	ORD00500	Mobile Money	26343.44	2023-12-30 08:00:00
PAY00351	ORD00501	Mobile Money	354085.10	2024-06-01 09:00:00
PAY00352	ORD00502	Mobile Money	929593.33	2024-07-28 19:00:00
PAY00353	ORD00504	Mobile Money	200052.64	2023-10-22 03:00:00
PAY00354	ORD00505	Mobile Money	734614.02	2024-09-30 17:00:00
PAY00355	ORD00506	Bank Transfer	108353.68	2023-12-31 23:00:00
PAY00356	ORD00509	Bank Transfer	72047.64	2024-06-08 01:00:00
PAY00357	ORD00511	Cash on Delivery	3485.44	2024-07-22 03:00:00
PAY00358	ORD00513	Card	198883.60	2024-11-12 16:00:00
PAY00359	ORD00514	Card	235009.16	2024-11-24 19:00:00
PAY00360	ORD00516	Card	589959.06	2024-06-03 11:00:00
PAY00361	ORD00517	Mobile Money	168325.37	2024-12-28 18:00:00
PAY00362	ORD00518	Card	125685.71	2024-07-18 03:00:00
PAY00364	ORD00522	Card	817839.94	2024-12-10 14:00:00
PAY00365	ORD00523	Bank Transfer	180380.35	2024-04-08 05:00:00
PAY00366	ORD00524	Card	339418.37	2024-07-07 17:00:00
PAY00367	ORD00525	Card	841301.64	2024-09-01 18:00:00
PAY00368	ORD00527	Cash on Delivery	1380886.77	2023-06-07 07:00:00
PAY00370	ORD00529	Cash on Delivery	27825.60	2024-01-06 19:00:00
PAY00371	ORD00530	Card	1120410.59	2023-05-05 14:00:00
PAY00375	ORD00534	Card	223383.08	2024-11-01 06:00:00
PAY00376	ORD00535	Cash on Delivery	193656.60	2024-11-13 04:00:00
PAY00379	ORD00538	Bank Transfer	451022.95	2023-12-22 06:00:00
PAY00380	ORD00541	Card	768841.50	2024-11-10 03:00:00
PAY00381	ORD00542	Mobile Money	926660.16	2024-12-03 00:00:00
PAY00383	ORD00545	Cash on Delivery	240142.74	2024-11-14 00:00:00
PAY00384	ORD00546	Mobile Money	181459.05	2024-12-24 15:00:00
PAY00385	ORD00548	Cash on Delivery	13409.28	2024-12-12 20:00:00
PAY00386	ORD00549	Bank Transfer	95430.98	2024-12-13 02:00:00
PAY00389	ORD00552	Mobile Money	1613502.06	2024-12-10 06:00:00
PAY00390	ORD00554	Bank Transfer	160848.97	2024-12-05 13:00:00
PAY00391	ORD00557	Bank Transfer	10095.25	2024-11-05 17:00:00
PAY00393	ORD00561	Bank Transfer	378503.96	2024-12-04 03:00:00
PAY00394	ORD00563	Mobile Money	65148.54	2024-12-15 00:00:00
PAY00395	ORD00567	Mobile Money	98560.00	2024-03-31 17:00:00
PAY00397	ORD00570	Card	43905.60	2024-05-01 12:00:00
PAY00400	ORD00573	Card	1564948.01	2024-05-31 10:00:00
PAY00402	ORD00575	Card	10095.25	2024-08-19 19:00:00
PAY00405	ORD00578	Card	146008.50	2024-01-27 08:00:00
PAY00406	ORD00580	Cash on Delivery	236830.69	2024-03-21 05:00:00
PAY00407	ORD00581	Mobile Money	109722.82	2024-01-13 01:00:00
PAY00409	ORD00583	Cash on Delivery	32894.08	2023-07-09 04:00:00
PAY00410	ORD00584	Cash on Delivery	76881.64	2023-09-16 17:00:00
PAY00411	ORD00586	Mobile Money	359728.58	2024-11-11 20:00:00
PAY00412	ORD00587	Mobile Money	655577.48	2024-11-19 09:00:00
PAY00416	ORD00593	Card	76726.04	2024-05-06 14:00:00
PAY00417	ORD00595	Cash on Delivery	649434.60	2024-11-02 09:00:00
PAY00419	ORD00598	Card	17607.17	2024-12-11 10:00:00
PAY00420	ORD00599	Mobile Money	58703.25	2024-11-27 03:00:00
PAY00421	ORD00600	Card	771760.08	2024-12-02 21:00:00
PAY00422	ORD00602	Mobile Money	656811.71	2024-10-29 14:00:00
PAY00423	ORD00603	Mobile Money	78576.78	2024-11-21 00:00:00
PAY00427	ORD00608	Cash on Delivery	25829.99	2023-09-27 04:00:00
PAY00428	ORD00609	Cash on Delivery	18483.24	2023-04-12 06:00:00
PAY00429	ORD00611	Cash on Delivery	45102.28	2023-08-12 17:00:00
PAY00453	ORD00638	Mobile Money	439020.25	2023-05-26 16:00:00
PAY00476	ORD00667	Card	126061.60	2024-04-10 16:00:00
PAY00432	ORD00615	Card	803078.39	2024-10-03 06:00:00
PAY00433	ORD00616	Card	24990.69	2024-02-10 22:00:00
PAY00434	ORD00617	Cash on Delivery	21709.68	2024-07-03 13:00:00
PAY00435	ORD00619	Bank Transfer	264786.66	2024-11-13 18:00:00
PAY00436	ORD00620	Bank Transfer	191420.62	2024-12-11 22:00:00
PAY00437	ORD00621	Card	30284.60	2024-11-26 01:00:00
PAY00531	ORD00745	Card	21878.24	2023-09-27 23:00:00
PAY00439	ORD00624	Card	45992.18	2024-11-25 20:00:00
PAY00440	ORD00625	Mobile Money	102447.74	2024-12-13 04:00:00
PAY00441	ORD00626	Mobile Money	85781.07	2024-12-05 17:00:00
PAY00526	ORD00740	Card	254137.17	2024-01-14 20:00:00
PAY00443	ORD00628	Bank Transfer	1022886.92	2024-12-03 07:00:00
PAY00445	ORD00630	Mobile Money	152795.70	2024-10-07 04:00:00
PAY00450	ORD00635	Card	204981.37	2024-07-14 04:00:00
PAY00452	ORD00637	Bank Transfer	918620.89	2024-10-24 10:00:00
PAY00454	ORD00639	Cash on Delivery	274071.30	2024-06-07 04:00:00
PAY00457	ORD00643	Bank Transfer	988437.53	2024-11-19 20:00:00
PAY00461	ORD00648	Mobile Money	167249.52	2024-11-25 01:00:00
PAY00462	ORD00649	Cash on Delivery	8700.29	2024-09-10 19:00:00
PAY00463	ORD00652	Cash on Delivery	534704.88	2024-07-28 20:00:00
PAY00464	ORD00653	Bank Transfer	138579.52	2024-11-09 21:00:00
PAY00466	ORD00655	Bank Transfer	24463.34	2024-11-29 16:00:00
PAY00469	ORD00658	Mobile Money	409790.96	2024-02-11 17:00:00
PAY00470	ORD00660	Bank Transfer	872071.33	2024-03-21 07:00:00
PAY00472	ORD00663	Card	739180.57	2024-11-24 08:00:00
PAY00474	ORD00665	Cash on Delivery	564791.35	2024-11-19 17:00:00
PAY00475	ORD00666	Cash on Delivery	286980.91	2024-12-22 16:00:00
PAY00477	ORD00668	Mobile Money	1755792.32	2023-07-20 02:00:00
PAY00478	ORD00669	Bank Transfer	130533.42	2024-09-02 00:00:00
PAY00479	ORD00671	Bank Transfer	100327.02	2024-03-27 06:00:00
PAY00481	ORD00675	Card	78955.84	2024-02-02 11:00:00
PAY00482	ORD00676	Bank Transfer	3568.70	2024-02-15 00:00:00
PAY00483	ORD00677	Bank Transfer	2985.64	2024-01-19 01:00:00
PAY00484	ORD00678	Mobile Money	507804.25	2024-02-19 18:00:00
PAY00487	ORD00681	Card	178295.72	2024-10-22 20:00:00
PAY00489	ORD00685	Bank Transfer	1607599.10	2024-01-08 17:00:00
PAY00491	ORD00692	Mobile Money	191405.76	2024-07-05 07:00:00
PAY00494	ORD00698	Bank Transfer	112612.34	2024-04-19 14:00:00
PAY00495	ORD00699	Card	283877.97	2024-08-31 02:00:00
PAY00497	ORD00704	Bank Transfer	526844.32	2024-04-20 04:00:00
PAY00498	ORD00706	Card	877534.55	2024-03-11 04:00:00
PAY00502	ORD00710	Mobile Money	32300.05	2024-10-25 02:00:00
PAY00503	ORD00712	Cash on Delivery	1018573.95	2024-09-27 16:00:00
PAY00505	ORD00716	Bank Transfer	70228.44	2024-08-25 14:00:00
PAY00507	ORD00718	Cash on Delivery	431300.41	2024-09-14 03:00:00
PAY00508	ORD00719	Cash on Delivery	361931.70	2024-09-17 05:00:00
PAY00509	ORD00720	Card	473129.95	2024-12-31 01:00:00
PAY00510	ORD00721	Card	1017025.87	2024-11-20 05:00:00
PAY00511	ORD00722	Bank Transfer	569557.84	2024-10-31 22:00:00
PAY00515	ORD00726	Bank Transfer	537796.40	2024-08-25 23:00:00
PAY00518	ORD00730	Card	89136.44	2023-11-10 20:00:00
PAY00519	ORD00731	Mobile Money	330791.24	2024-07-03 11:00:00
PAY00520	ORD00732	Card	41020.52	2023-10-14 13:00:00
PAY00522	ORD00735	Mobile Money	260806.91	2024-01-03 09:00:00
PAY00523	ORD00736	Card	166699.15	2024-01-17 11:00:00
PAY00524	ORD00737	Mobile Money	1015740.44	2024-08-31 10:00:00
PAY00527	ORD00741	Card	582824.76	2023-09-27 12:00:00
PAY00528	ORD00742	Mobile Money	122312.70	2024-05-04 02:00:00
PAY00529	ORD00743	Mobile Money	63585.10	2024-12-23 17:00:00
PAY00530	ORD00744	Mobile Money	1283879.52	2024-07-24 16:00:00
PAY00534	ORD00748	Card	603998.75	2024-11-22 08:00:00
PAY00591	ORD00825	Cash on Delivery	512561.00	2024-06-10 04:00:00
PAY00536	ORD00751	Bank Transfer	54346.36	2023-12-07 10:00:00
PAY00537	ORD00752	Card	462984.69	2024-06-23 18:00:00
PAY00605	ORD00844	Bank Transfer	34248.48	2024-11-01 13:00:00
PAY00577	ORD00809	Card	17694.90	2024-12-17 12:00:00
PAY00540	ORD00757	Card	63131.92	2024-07-23 15:00:00
PAY00541	ORD00758	Cash on Delivery	13409.28	2024-03-25 23:00:00
PAY00542	ORD00761	Mobile Money	359728.58	2024-12-14 15:00:00
PAY00543	ORD00763	Cash on Delivery	684591.89	2024-12-16 04:00:00
PAY00635	ORD00878	Card	354205.42	2024-11-23 16:00:00
PAY00545	ORD00766	Card	147425.86	2024-10-23 12:00:00
PAY00546	ORD00767	Bank Transfer	169258.32	2024-11-16 22:00:00
PAY00547	ORD00768	Card	53790.15	2024-12-28 23:00:00
PAY00549	ORD00770	Card	17287.41	2024-10-06 00:00:00
PAY00550	ORD00771	Card	110258.32	2024-03-05 09:00:00
PAY00552	ORD00773	Card	66595.50	2024-03-06 02:00:00
PAY00554	ORD00779	Card	271470.00	2024-04-27 15:00:00
PAY00556	ORD00782	Bank Transfer	30345.96	2024-07-14 17:00:00
PAY00559	ORD00786	Card	70957.82	2024-10-23 07:00:00
PAY00561	ORD00788	Card	71048.06	2024-08-08 10:00:00
PAY00562	ORD00789	Card	37830.93	2024-08-08 15:00:00
PAY00565	ORD00795	Cash on Delivery	103294.81	2024-07-23 20:00:00
PAY00566	ORD00796	Bank Transfer	51096.45	2024-06-12 21:00:00
PAY00567	ORD00797	Mobile Money	816.52	2024-06-22 14:00:00
PAY00568	ORD00798	Bank Transfer	460779.85	2024-07-19 07:00:00
PAY00570	ORD00801	Mobile Money	74516.28	2024-11-17 06:00:00
PAY00571	ORD00802	Bank Transfer	1032680.62	2024-12-04 18:00:00
PAY00572	ORD00803	Bank Transfer	643024.25	2024-12-31 03:00:00
PAY00573	ORD00805	Bank Transfer	177974.85	2024-12-29 23:00:00
PAY00574	ORD00806	Card	8480.78	2024-12-06 16:00:00
PAY00575	ORD00807	Card	103538.61	2024-12-28 17:00:00
PAY00576	ORD00808	Cash on Delivery	87610.75	2024-12-21 05:00:00
PAY00579	ORD00812	Mobile Money	194607.91	2024-12-08 03:00:00
PAY00580	ORD00813	Cash on Delivery	5416.29	2024-12-01 15:00:00
PAY00581	ORD00814	Bank Transfer	246012.35	2024-12-10 07:00:00
PAY00582	ORD00815	Card	91572.30	2024-05-25 10:00:00
PAY00583	ORD00816	Cash on Delivery	60039.89	2024-05-30 18:00:00
PAY00585	ORD00819	Cash on Delivery	397793.53	2024-12-04 20:00:00
PAY00586	ORD00820	Card	24825.96	2023-05-12 22:00:00
PAY00587	ORD00821	Cash on Delivery	142890.79	2024-08-15 23:00:00
PAY00589	ORD00823	Bank Transfer	33288.69	2024-02-20 03:00:00
PAY00590	ORD00824	Card	15571.78	2024-08-14 16:00:00
PAY00593	ORD00827	Cash on Delivery	29001.62	2024-01-10 22:00:00
PAY00594	ORD00828	Cash on Delivery	527527.80	2024-05-25 15:00:00
PAY00595	ORD00829	Cash on Delivery	576056.05	2024-10-24 09:00:00
PAY00596	ORD00830	Cash on Delivery	2248.73	2024-10-27 01:00:00
PAY00598	ORD00833	Cash on Delivery	308147.91	2024-01-01 21:00:00
PAY00600	ORD00835	Cash on Delivery	93330.92	2024-04-19 17:00:00
PAY00606	ORD00845	Card	176253.29	2024-04-17 05:00:00
PAY00607	ORD00846	Card	325875.84	2024-05-17 12:00:00
PAY00610	ORD00849	Card	110640.11	2024-05-18 12:00:00
PAY00612	ORD00851	Mobile Money	570375.48	2024-04-27 07:00:00
PAY00614	ORD00853	Cash on Delivery	545501.09	2024-02-11 20:00:00
PAY00615	ORD00854	Mobile Money	140041.10	2024-01-06 12:00:00
PAY00616	ORD00855	Card	48024.83	2024-06-08 13:00:00
PAY00617	ORD00856	Cash on Delivery	885861.21	2024-10-21 19:00:00
PAY00618	ORD00857	Card	120073.18	2024-11-23 19:00:00
PAY00621	ORD00862	Bank Transfer	32819.40	2023-12-26 17:00:00
PAY00622	ORD00863	Cash on Delivery	20590.75	2024-04-26 00:00:00
PAY00626	ORD00868	Cash on Delivery	234388.12	2024-12-24 04:00:00
PAY00627	ORD00869	Mobile Money	179864.29	2024-06-16 02:00:00
PAY00632	ORD00874	Mobile Money	135102.64	2024-09-01 06:00:00
PAY00633	ORD00875	Card	16199.28	2024-07-14 09:00:00
PAY00634	ORD00877	Mobile Money	104703.44	2024-09-23 21:00:00
PAY00637	ORD00880	Card	552557.03	2024-10-03 03:00:00
PAY00639	ORD00882	Bank Transfer	109517.52	2023-10-24 17:00:00
PAY00640	ORD00884	Cash on Delivery	337069.86	2024-05-25 10:00:00
PAY00641	ORD00885	Card	183062.91	2024-09-12 08:00:00
PAY00642	ORD00886	Bank Transfer	55373.35	2024-02-08 12:00:00
PAY00643	ORD00888	Cash on Delivery	15006.39	2024-07-19 13:00:00
PAY00644	ORD00890	Card	2057186.68	2023-11-14 09:00:00
PAY00645	ORD00891	Mobile Money	114528.20	2023-08-14 09:00:00
PAY00690	ORD00948	Bank Transfer	1243467.40	2023-05-09 07:00:00
PAY00667	ORD00917	Bank Transfer	478987.84	2024-10-15 04:00:00
PAY00648	ORD00895	Mobile Money	365253.79	2023-10-12 13:00:00
PAY00733	ORD01003	Cash on Delivery	92369.52	2024-02-27 00:00:00
PAY00650	ORD00898	Mobile Money	364555.47	2024-09-14 23:00:00
PAY00651	ORD00899	Mobile Money	163247.70	2024-04-03 01:00:00
PAY00652	ORD00900	Cash on Delivery	14011.65	2024-10-01 08:00:00
PAY00653	ORD00901	Bank Transfer	90584.94	2024-08-20 17:00:00
PAY00654	ORD00902	Card	24376.32	2024-11-14 12:00:00
PAY00655	ORD00903	Card	252137.68	2024-08-31 19:00:00
PAY00730	ORD01000	Card	332153.37	2023-07-02 23:00:00
PAY00657	ORD00905	Card	38299.46	2024-10-09 12:00:00
PAY00658	ORD00906	Cash on Delivery	73288.78	2024-12-18 01:00:00
PAY00659	ORD00908	Card	1320381.28	2024-12-31 09:00:00
PAY00660	ORD00909	Bank Transfer	1887115.40	2024-11-09 07:00:00
PAY00661	ORD00910	Cash on Delivery	731989.14	2024-12-18 10:00:00
PAY00662	ORD00911	Card	377173.89	2024-11-25 17:00:00
PAY00666	ORD00916	Mobile Money	14427.90	2024-11-24 15:00:00
PAY00668	ORD00918	Cash on Delivery	71972.01	2024-09-24 11:00:00
PAY00671	ORD00921	Card	72469.92	2024-08-31 09:00:00
PAY00674	ORD00924	Card	95695.43	2024-09-05 12:00:00
PAY00675	ORD00926	Bank Transfer	134560.35	2024-06-26 20:00:00
PAY00676	ORD00929	Bank Transfer	1580460.04	2024-08-04 05:00:00
PAY00677	ORD00930	Mobile Money	310936.87	2024-04-12 00:00:00
PAY00678	ORD00931	Cash on Delivery	291536.08	2024-09-26 04:00:00
PAY00683	ORD00938	Card	1192178.97	2023-10-02 01:00:00
PAY00684	ORD00940	Mobile Money	21340.87	2024-01-10 00:00:00
PAY00685	ORD00941	Card	170268.12	2024-08-26 09:00:00
PAY00686	ORD00944	Bank Transfer	12341.62	2024-04-07 21:00:00
PAY00687	ORD00945	Bank Transfer	746747.97	2023-08-10 04:00:00
PAY00688	ORD00946	Card	945114.90	2024-06-18 09:00:00
PAY00691	ORD00949	Mobile Money	250844.04	2024-07-19 15:00:00
PAY00693	ORD00952	Bank Transfer	12278.28	2024-10-20 07:00:00
PAY00694	ORD00953	Mobile Money	632732.68	2024-06-30 00:00:00
PAY00695	ORD00954	Card	14845.55	2024-10-10 14:00:00
PAY00697	ORD00957	Bank Transfer	213274.88	2024-07-03 07:00:00
PAY00699	ORD00960	Cash on Delivery	266180.98	2024-10-22 17:00:00
PAY00700	ORD00961	Card	320608.15	2024-06-17 03:00:00
PAY00702	ORD00963	Card	387335.12	2024-03-17 17:00:00
PAY00704	ORD00965	Card	100048.28	2024-03-05 04:00:00
PAY00707	ORD00969	Card	176857.47	2023-11-02 03:00:00
PAY00708	ORD00972	Cash on Delivery	1061481.88	2024-11-12 21:00:00
PAY00711	ORD00977	Mobile Money	36581.64	2024-04-01 12:00:00
PAY00712	ORD00978	Bank Transfer	11097.43	2024-06-29 10:00:00
PAY00715	ORD00982	Card	67894.35	2024-07-07 16:00:00
PAY00716	ORD00983	Card	1602.14	2024-11-01 04:00:00
PAY00717	ORD00984	Bank Transfer	1323987.05	2024-07-25 11:00:00
PAY00718	ORD00986	Card	13171.72	2024-02-17 13:00:00
PAY00720	ORD00989	Mobile Money	62992.61	2024-01-26 14:00:00
PAY00721	ORD00990	Cash on Delivery	337561.86	2023-10-11 22:00:00
PAY00724	ORD00993	Card	243429.47	2024-12-09 05:00:00
PAY00725	ORD00994	Card	556868.36	2024-12-01 23:00:00
PAY00726	ORD00995	Mobile Money	117897.53	2024-11-26 03:00:00
PAY00728	ORD00997	Cash on Delivery	1067500.41	2023-11-07 19:00:00
PAY00729	ORD00999	Mobile Money	734304.98	2024-07-29 02:00:00
PAY00734	ORD01004	Cash on Delivery	391595.61	2025-01-01 03:00:00
PAY00735	ORD01005	Mobile Money	50868.08	2023-04-16 02:00:00
PAY00736	ORD01006	Bank Transfer	12650.30	2024-12-06 00:00:00
PAY00738	ORD01008	Mobile Money	99842.46	2024-05-07 20:00:00
PAY00740	ORD01011	Cash on Delivery	309288.39	2024-10-01 06:00:00
PAY00741	ORD01012	Bank Transfer	137727.03	2024-12-06 01:00:00
PAY00742	ORD01014	Mobile Money	76142.09	2024-10-28 07:00:00
PAY00743	ORD01015	Bank Transfer	40632.15	2023-05-17 17:00:00
PAY00744	ORD01016	Bank Transfer	1018903.35	2023-11-01 00:00:00
PAY00745	ORD01017	Card	680880.78	2023-11-09 21:00:00
PAY00746	ORD01018	Mobile Money	467178.97	2024-03-17 11:00:00
PAY00747	ORD01019	Bank Transfer	23990.67	2024-12-22 05:00:00
PAY00853	ORD01155	Card	527944.80	2024-01-30 00:00:00
PAY00748	ORD01020	Bank Transfer	66459.48	2024-02-02 03:00:00
PAY00785	ORD01067	Mobile Money	67971.18	2025-01-01 21:00:00
PAY00750	ORD01023	Bank Transfer	5399.76	2024-11-02 23:00:00
PAY00751	ORD01024	Bank Transfer	227279.12	2024-12-10 12:00:00
PAY00752	ORD01025	Cash on Delivery	26396.73	2024-07-23 04:00:00
PAY00753	ORD01026	Card	21604.29	2024-10-05 18:00:00
PAY00755	ORD01029	Cash on Delivery	1316488.47	2024-07-28 18:00:00
PAY00756	ORD01030	Cash on Delivery	24006.66	2024-06-13 09:00:00
PAY00843	ORD01144	Card	231284.04	2024-06-04 09:00:00
PAY00758	ORD01036	Cash on Delivery	75976.50	2024-09-30 05:00:00
PAY00759	ORD01037	Bank Transfer	135063.48	2023-11-01 16:00:00
PAY00760	ORD01039	Bank Transfer	45557.08	2024-02-16 17:00:00
PAY00807	ORD01099	Bank Transfer	39482.24	2024-10-11 17:00:00
PAY00762	ORD01041	Card	952072.75	2024-10-17 19:00:00
PAY00766	ORD01045	Cash on Delivery	254267.42	2024-09-12 08:00:00
PAY00844	ORD01146	Cash on Delivery	147489.30	2024-10-06 02:00:00
PAY00769	ORD01048	Card	1229781.35	2024-10-26 22:00:00
PAY00770	ORD01049	Bank Transfer	679049.30	2024-10-13 07:00:00
PAY00772	ORD01051	Card	34973.36	2024-10-17 04:00:00
PAY00773	ORD01052	Bank Transfer	58767.24	2024-10-21 10:00:00
PAY00775	ORD01054	Bank Transfer	1038425.47	2024-10-02 00:00:00
PAY00777	ORD01057	Bank Transfer	42901.95	2024-06-15 22:00:00
PAY00778	ORD01058	Bank Transfer	39168.98	2024-12-21 15:00:00
PAY00779	ORD01059	Bank Transfer	407731.20	2024-12-27 14:00:00
PAY00780	ORD01060	Card	101388.10	2024-03-29 17:00:00
PAY00781	ORD01061	Mobile Money	118084.60	2023-12-07 14:00:00
PAY00782	ORD01062	Mobile Money	193997.28	2024-06-14 09:00:00
PAY00784	ORD01066	Card	57025.35	2024-08-21 07:00:00
PAY00786	ORD01068	Bank Transfer	931864.34	2024-12-20 06:00:00
PAY00787	ORD01069	Cash on Delivery	108201.85	2024-12-31 16:00:00
PAY00789	ORD01071	Card	412524.16	2024-10-26 23:00:00
PAY00790	ORD01072	Cash on Delivery	26917.21	2024-10-23 18:00:00
PAY00791	ORD01073	Bank Transfer	1464648.35	2024-03-08 02:00:00
PAY00793	ORD01076	Cash on Delivery	335910.17	2023-12-31 14:00:00
PAY00794	ORD01077	Mobile Money	515070.46	2024-12-21 18:00:00
PAY00795	ORD01078	Mobile Money	48285.65	2023-11-12 10:00:00
PAY00796	ORD01080	Card	305515.78	2023-07-11 00:00:00
PAY00797	ORD01081	Card	4792.40	2023-10-04 08:00:00
PAY00800	ORD01087	Bank Transfer	44389.86	2024-12-20 11:00:00
PAY00801	ORD01088	Mobile Money	609401.78	2024-12-31 00:00:00
PAY00802	ORD01092	Cash on Delivery	1013423.02	2024-03-06 12:00:00
PAY00803	ORD01094	Cash on Delivery	87002.20	2024-06-29 09:00:00
PAY00804	ORD01096	Cash on Delivery	1139763.44	2024-11-22 19:00:00
PAY00805	ORD01097	Bank Transfer	35488.70	2024-04-29 22:00:00
PAY00806	ORD01098	Mobile Money	182319.68	2024-03-18 14:00:00
PAY00808	ORD01101	Bank Transfer	199930.87	2024-08-20 20:00:00
PAY00810	ORD01103	Cash on Delivery	852463.48	2024-12-06 22:00:00
PAY00813	ORD01107	Mobile Money	1144574.29	2023-09-12 17:00:00
PAY00815	ORD01110	Bank Transfer	16739.67	2023-08-31 22:00:00
PAY00816	ORD01111	Card	141950.72	2024-07-08 10:00:00
PAY00817	ORD01112	Cash on Delivery	162894.00	2024-10-09 04:00:00
PAY00818	ORD01113	Card	120150.56	2024-09-04 09:00:00
PAY00819	ORD01114	Mobile Money	41341.72	2024-07-10 05:00:00
PAY00821	ORD01117	Card	58514.20	2023-03-22 13:00:00
PAY00822	ORD01118	Mobile Money	52971.75	2024-01-28 05:00:00
PAY00824	ORD01120	Mobile Money	12460.22	2024-11-30 17:00:00
PAY00826	ORD01123	Card	127390.86	2023-10-13 04:00:00
PAY00828	ORD01125	Bank Transfer	343450.84	2023-09-16 12:00:00
PAY00830	ORD01127	Mobile Money	291464.46	2024-06-20 14:00:00
PAY00832	ORD01129	Card	8016.63	2024-07-24 23:00:00
PAY00834	ORD01131	Card	349632.08	2024-09-01 18:00:00
PAY00835	ORD01136	Mobile Money	6230.11	2024-10-08 17:00:00
PAY00837	ORD01138	Card	940331.68	2024-07-11 12:00:00
PAY00838	ORD01139	Bank Transfer	74632.08	2024-07-15 19:00:00
PAY00839	ORD01140	Card	36749.26	2024-08-14 19:00:00
PAY00840	ORD01141	Card	686857.19	2024-05-10 14:00:00
PAY00841	ORD01142	Bank Transfer	247851.46	2024-12-29 04:00:00
PAY00845	ORD01147	Card	900.70	2024-09-15 20:00:00
PAY00848	ORD01150	Bank Transfer	1255094.75	2024-07-22 06:00:00
PAY00850	ORD01152	Card	69170.64	2023-05-07 17:00:00
PAY00851	ORD01153	Bank Transfer	16326.25	2024-04-26 14:00:00
PAY00854	ORD01156	Mobile Money	481758.40	2024-06-30 03:00:00
PAY00859	ORD01163	Mobile Money	161549.82	2023-10-05 22:00:00
PAY00857	ORD01161	Mobile Money	75449.74	2024-12-12 02:00:00
PAY00858	ORD01162	Card	28971.39	2023-10-19 19:00:00
PAY00901	ORD01222	Bank Transfer	521312.75	2023-05-31 05:00:00
PAY00862	ORD01167	Cash on Delivery	72583.62	2023-09-03 07:00:00
PAY00863	ORD01169	Bank Transfer	171956.04	2024-05-08 14:00:00
PAY00864	ORD01171	Mobile Money	271932.37	2024-05-04 17:00:00
PAY00869	ORD01179	Mobile Money	15970.44	2024-05-19 19:00:00
PAY00870	ORD01180	Bank Transfer	29611.68	2024-05-15 07:00:00
PAY00871	ORD01181	Bank Transfer	169836.89	2024-12-08 00:00:00
PAY00872	ORD01183	Card	31522.68	2024-05-31 08:00:00
PAY00874	ORD01185	Mobile Money	482209.15	2024-08-28 22:00:00
PAY00875	ORD01186	Card	15761.34	2024-03-21 13:00:00
PAY00876	ORD01187	Cash on Delivery	232908.60	2024-05-07 18:00:00
PAY00877	ORD01189	Card	509325.39	2024-06-19 14:00:00
PAY00923	ORD01248	Card	294978.60	2024-08-29 03:00:00
PAY00948	ORD01280	Bank Transfer	21674.25	2024-07-31 13:00:00
PAY00881	ORD01194	Card	14427.90	2023-08-17 17:00:00
PAY00883	ORD01196	Card	80525.21	2024-04-28 16:00:00
PAY00886	ORD01200	Mobile Money	33329.69	2024-05-11 04:00:00
PAY00888	ORD01202	Bank Transfer	10088.47	2023-04-23 18:00:00
PAY00889	ORD01204	Card	271042.29	2024-11-03 00:00:00
PAY00890	ORD01205	Cash on Delivery	200327.57	2024-12-21 19:00:00
PAY00892	ORD01208	Bank Transfer	2348.14	2024-03-24 01:00:00
PAY00894	ORD01210	Cash on Delivery	88519.54	2024-05-23 01:00:00
PAY00895	ORD01212	Mobile Money	7077.96	2024-12-15 17:00:00
PAY00897	ORD01216	Bank Transfer	277797.81	2024-11-23 15:00:00
PAY00902	ORD01223	Card	14402.86	2024-02-13 17:00:00
PAY00903	ORD01224	Card	80161.95	2023-07-15 20:00:00
PAY00904	ORD01225	Card	506570.74	2024-05-24 17:00:00
PAY00905	ORD01226	Bank Transfer	13862.43	2023-10-01 01:00:00
PAY00907	ORD01228	Mobile Money	94467.68	2024-02-26 06:00:00
PAY00912	ORD01234	Mobile Money	88545.48	2024-12-17 03:00:00
PAY00914	ORD01237	Mobile Money	282271.60	2024-09-15 02:00:00
PAY00915	ORD01238	Bank Transfer	125277.25	2024-09-11 21:00:00
PAY00916	ORD01240	Bank Transfer	855219.84	2024-11-08 05:00:00
PAY00918	ORD01243	Mobile Money	3204.28	2024-09-21 18:00:00
PAY00919	ORD01244	Mobile Money	184897.87	2024-04-10 07:00:00
PAY00921	ORD01246	Card	14402.86	2024-06-05 12:00:00
PAY00924	ORD01249	Cash on Delivery	627213.66	2024-01-31 14:00:00
PAY00925	ORD01250	Card	1532854.95	2023-08-03 05:00:00
PAY00931	ORD01257	Mobile Money	338489.64	2024-07-23 15:00:00
PAY00932	ORD01258	Cash on Delivery	67518.08	2024-04-14 05:00:00
PAY00933	ORD01260	Card	12699.55	2024-10-29 04:00:00
PAY00934	ORD01261	Cash on Delivery	98293.53	2024-07-27 08:00:00
PAY00936	ORD01264	Card	95128.44	2024-03-27 21:00:00
PAY00938	ORD01266	Card	127598.57	2024-03-08 16:00:00
PAY00939	ORD01267	Card	96202.74	2024-01-05 15:00:00
PAY00942	ORD01272	Card	8028.09	2024-04-20 08:00:00
PAY00943	ORD01273	Mobile Money	60582.65	2024-06-11 00:00:00
PAY00944	ORD01275	Bank Transfer	308912.61	2023-11-09 12:00:00
PAY00945	ORD01276	Cash on Delivery	73629.38	2024-03-10 20:00:00
PAY00951	ORD01284	Mobile Money	430462.89	2024-12-24 09:00:00
PAY00952	ORD01286	Card	63045.36	2024-03-15 10:00:00
PAY00953	ORD01287	Card	509055.94	2023-09-24 18:00:00
PAY00957	ORD01292	Cash on Delivery	1759452.55	2024-06-24 17:00:00
PAY00958	ORD01293	Card	151263.40	2024-02-28 13:00:00
PAY00959	ORD01294	Card	13409.28	2024-08-25 12:00:00
PAY00960	ORD01295	Cash on Delivery	668077.43	2024-06-21 10:00:00
PAY00961	ORD01297	Cash on Delivery	1090050.21	2024-06-05 17:00:00
PAY00970	ORD01309	Card	513753.00	2024-07-30 11:00:00
PAY00985	ORD01330	Cash on Delivery	158863.16	2024-05-09 19:00:00
PAY00964	ORD01301	Mobile Money	1343803.78	2024-06-13 01:00:00
PAY00989	ORD01335	Cash on Delivery	108692.72	2024-11-15 03:00:00
PAY00966	ORD01303	Card	182439.52	2024-11-18 19:00:00
PAY00967	ORD01304	Card	44912.78	2024-10-10 22:00:00
PAY01049	ORD01416	Mobile Money	15970.44	2024-07-18 06:00:00
PAY00969	ORD01306	Mobile Money	110900.42	2024-11-08 15:00:00
PAY00971	ORD01310	Cash on Delivery	29570.18	2024-09-29 21:00:00
PAY00972	ORD01311	Cash on Delivery	217322.84	2023-06-21 19:00:00
PAY00973	ORD01313	Mobile Money	265518.94	2023-09-10 10:00:00
PAY00974	ORD01314	Cash on Delivery	68157.62	2024-11-18 08:00:00
PAY00976	ORD01319	Card	261871.45	2024-02-10 09:00:00
PAY00978	ORD01322	Cash on Delivery	49812.90	2024-08-20 16:00:00
PAY00981	ORD01326	Mobile Money	90042.32	2024-06-02 10:00:00
PAY00984	ORD01329	Mobile Money	53108.20	2023-09-29 22:00:00
PAY00986	ORD01331	Mobile Money	117469.19	2023-05-25 06:00:00
PAY00988	ORD01334	Card	3849.92	2023-05-29 18:00:00
PAY00990	ORD01336	Cash on Delivery	47472.78	2023-10-14 23:00:00
PAY00995	ORD01345	Mobile Money	60942.63	2024-12-05 06:00:00
PAY00996	ORD01346	Mobile Money	5755.30	2024-12-18 22:00:00
PAY00997	ORD01347	Bank Transfer	408079.72	2024-04-21 11:00:00
PAY00998	ORD01349	Cash on Delivery	103986.26	2024-01-14 12:00:00
PAY00999	ORD01350	Cash on Delivery	9207.08	2024-06-03 01:00:00
PAY01000	ORD01353	Card	2149209.07	2024-11-03 15:00:00
PAY01001	ORD01354	Bank Transfer	324717.30	2024-08-07 04:00:00
PAY01002	ORD01355	Card	1317086.90	2024-05-07 00:00:00
PAY01005	ORD01359	Card	135696.91	2024-04-25 18:00:00
PAY01006	ORD01360	Mobile Money	528191.14	2024-04-11 16:00:00
PAY01007	ORD01361	Card	100004.00	2024-09-04 10:00:00
PAY01009	ORD01364	Cash on Delivery	888627.76	2024-08-27 20:00:00
PAY01010	ORD01365	Cash on Delivery	191900.83	2023-12-12 01:00:00
PAY01012	ORD01367	Bank Transfer	289357.03	2024-11-23 06:00:00
PAY01013	ORD01368	Card	18080.28	2024-06-24 23:00:00
PAY01014	ORD01370	Mobile Money	154882.11	2024-05-23 15:00:00
PAY01016	ORD01372	Card	7092.62	2024-06-01 13:00:00
PAY01018	ORD01374	Card	1027134.30	2024-12-06 20:00:00
PAY01019	ORD01375	Bank Transfer	515070.46	2024-12-15 14:00:00
PAY01020	ORD01377	Card	41043.57	2024-12-01 20:00:00
PAY01023	ORD01382	Card	336920.80	2024-01-21 03:00:00
PAY01024	ORD01385	Cash on Delivery	604011.00	2024-02-23 12:00:00
PAY01026	ORD01387	Card	409790.96	2024-08-18 20:00:00
PAY01027	ORD01389	Card	499557.85	2023-11-12 09:00:00
PAY01028	ORD01390	Bank Transfer	64814.68	2024-11-18 09:00:00
PAY01029	ORD01391	Bank Transfer	3628.18	2024-03-12 02:00:00
PAY01033	ORD01397	Bank Transfer	407337.51	2024-11-09 23:00:00
PAY01034	ORD01398	Mobile Money	24825.96	2024-07-01 00:00:00
PAY01035	ORD01399	Mobile Money	1042211.85	2024-12-13 08:00:00
PAY01038	ORD01403	Bank Transfer	92706.45	2024-09-09 08:00:00
PAY01040	ORD01405	Bank Transfer	305798.40	2023-10-31 05:00:00
PAY01042	ORD01407	Bank Transfer	104826.28	2024-09-25 16:00:00
PAY01044	ORD01409	Mobile Money	9563.86	2024-12-25 18:00:00
PAY01045	ORD01411	Card	505004.26	2024-08-24 21:00:00
PAY01048	ORD01414	Cash on Delivery	207598.77	2024-07-07 04:00:00
PAY01050	ORD01417	Cash on Delivery	602922.95	2023-09-05 20:00:00
PAY01052	ORD01421	Bank Transfer	267736.80	2024-01-16 11:00:00
PAY01053	ORD01422	Cash on Delivery	409790.96	2024-11-13 11:00:00
PAY01054	ORD01423	Mobile Money	69992.67	2024-04-18 14:00:00
PAY01055	ORD01424	Bank Transfer	504390.28	2024-07-26 00:00:00
PAY01056	ORD01426	Card	14239.20	2024-07-31 20:00:00
PAY01058	ORD01429	Mobile Money	201503.45	2023-11-14 00:00:00
PAY01059	ORD01430	Card	52539.60	2024-01-04 07:00:00
PAY01060	ORD01431	Cash on Delivery	58923.21	2024-05-05 00:00:00
PAY01063	ORD01434	Mobile Money	199354.44	2023-11-08 16:00:00
PAY01065	ORD01436	Mobile Money	63394.81	2024-04-05 00:00:00
PAY01066	ORD01437	Card	278279.64	2024-10-16 04:00:00
PAY01067	ORD01438	Mobile Money	57981.42	2023-12-03 00:00:00
PAY01068	ORD01441	Mobile Money	74245.65	2024-06-11 12:00:00
PAY01134	ORD01528	Card	33635.54	2023-12-09 09:00:00
PAY01070	ORD01443	Card	326360.99	2024-08-03 02:00:00
PAY01071	ORD01445	Mobile Money	164719.61	2024-12-11 09:00:00
PAY01072	ORD01446	Mobile Money	22051.24	2024-11-15 15:00:00
PAY01073	ORD01448	Card	130265.75	2023-11-10 13:00:00
PAY01074	ORD01449	Mobile Money	695495.94	2024-11-25 00:00:00
PAY01075	ORD01450	Card	276291.22	2023-08-11 08:00:00
PAY01076	ORD01452	Card	129981.66	2023-12-13 06:00:00
PAY01077	ORD01453	Card	1281402.50	2023-07-28 17:00:00
PAY01078	ORD01455	Cash on Delivery	103319.96	2024-12-26 00:00:00
PAY01079	ORD01456	Mobile Money	437118.57	2024-12-02 17:00:00
PAY01153	ORD01558	Mobile Money	307188.74	2024-05-14 02:00:00
PAY01081	ORD01458	Mobile Money	11561.20	2024-11-05 00:00:00
PAY01082	ORD01459	Cash on Delivery	85496.84	2024-03-19 13:00:00
PAY01083	ORD01460	Card	358922.60	2024-06-01 10:00:00
PAY01084	ORD01462	Mobile Money	842568.75	2024-03-28 00:00:00
PAY01085	ORD01463	Bank Transfer	169891.58	2024-06-19 08:00:00
PAY01086	ORD01464	Card	337069.86	2024-08-10 00:00:00
PAY01087	ORD01465	Card	155573.74	2024-08-30 05:00:00
PAY01088	ORD01467	Cash on Delivery	555466.70	2024-10-16 06:00:00
PAY01173	ORD01582	Card	260280.99	2023-07-04 14:00:00
PAY01090	ORD01469	Cash on Delivery	31709.48	2024-08-12 02:00:00
PAY01091	ORD01471	Card	173260.79	2024-11-13 21:00:00
PAY01092	ORD01472	Mobile Money	110269.71	2024-12-27 18:00:00
PAY01158	ORD01564	Card	43789.85	2023-11-13 08:00:00
PAY01094	ORD01474	Card	772605.69	2023-04-04 07:00:00
PAY01095	ORD01475	Cash on Delivery	296286.45	2023-08-01 21:00:00
PAY01096	ORD01476	Bank Transfer	49605.18	2024-10-30 02:00:00
PAY01163	ORD01569	Card	103389.13	2023-07-19 23:00:00
PAY01099	ORD01482	Bank Transfer	32529.36	2024-08-21 03:00:00
PAY01100	ORD01483	Card	76292.93	2024-09-12 19:00:00
PAY01101	ORD01484	Cash on Delivery	628381.84	2024-09-20 13:00:00
PAY01104	ORD01487	Card	442560.44	2024-10-09 07:00:00
PAY01107	ORD01492	Card	114532.41	2024-11-30 14:00:00
PAY01108	ORD01493	Bank Transfer	573477.05	2024-11-18 14:00:00
PAY01109	ORD01495	Card	1042351.76	2023-10-28 00:00:00
PAY01110	ORD01498	Mobile Money	243727.04	2023-09-29 19:00:00
PAY01111	ORD01499	Card	180153.97	2024-03-09 08:00:00
PAY01112	ORD01500	Card	420883.00	2024-03-02 04:00:00
PAY01114	ORD01503	Card	651736.73	2024-02-25 15:00:00
PAY01115	ORD01504	Card	407731.20	2023-07-05 20:00:00
PAY01118	ORD01507	Cash on Delivery	93330.92	2024-04-24 16:00:00
PAY01119	ORD01508	Cash on Delivery	68942.67	2024-11-07 05:00:00
PAY01120	ORD01509	Card	18117.48	2024-07-16 11:00:00
PAY01121	ORD01511	Cash on Delivery	804733.40	2024-06-10 12:00:00
PAY01123	ORD01516	Bank Transfer	716689.83	2023-06-09 04:00:00
PAY01126	ORD01520	Cash on Delivery	32412.37	2024-06-30 12:00:00
PAY01127	ORD01521	Cash on Delivery	61852.40	2024-09-11 13:00:00
PAY01131	ORD01525	Cash on Delivery	152620.50	2024-06-16 00:00:00
PAY01132	ORD01526	Mobile Money	1741171.42	2024-04-06 05:00:00
PAY01133	ORD01527	Card	1506030.00	2024-02-27 01:00:00
PAY01135	ORD01531	Card	13409.28	2023-08-13 16:00:00
PAY01136	ORD01532	Card	14771.68	2023-09-17 20:00:00
PAY01137	ORD01533	Bank Transfer	1602.14	2023-08-22 00:00:00
PAY01141	ORD01539	Bank Transfer	46665.46	2024-11-06 21:00:00
PAY01142	ORD01541	Cash on Delivery	465301.97	2024-08-11 04:00:00
PAY01144	ORD01544	Bank Transfer	321721.45	2024-09-26 07:00:00
PAY01145	ORD01545	Bank Transfer	1738086.01	2024-09-06 23:00:00
PAY01146	ORD01546	Bank Transfer	610317.96	2024-06-30 21:00:00
PAY01147	ORD01547	Card	40190.19	2024-10-13 08:00:00
PAY01149	ORD01550	Bank Transfer	51604.24	2024-11-18 13:00:00
PAY01150	ORD01551	Bank Transfer	47284.02	2024-06-05 09:00:00
PAY01152	ORD01556	Bank Transfer	263606.60	2023-10-18 21:00:00
PAY01156	ORD01561	Bank Transfer	204806.12	2024-12-17 23:00:00
PAY01160	ORD01566	Card	56009.43	2024-12-01 19:00:00
PAY01161	ORD01567	Card	99076.62	2024-04-20 05:00:00
PAY01162	ORD01568	Card	339257.53	2023-07-01 15:00:00
PAY01165	ORD01571	Card	458781.64	2024-08-03 16:00:00
PAY01166	ORD01572	Card	25061.13	2024-12-08 23:00:00
PAY01167	ORD01573	Mobile Money	5914.40	2024-12-07 21:00:00
PAY01168	ORD01574	Card	540458.75	2024-01-29 23:00:00
PAY01170	ORD01579	Mobile Money	739805.40	2023-07-28 14:00:00
PAY01172	ORD01581	Bank Transfer	38342.82	2023-10-04 06:00:00
PAY01175	ORD01586	Card	825680.81	2024-11-30 22:00:00
PAY01176	ORD01587	Bank Transfer	100339.89	2024-12-10 07:00:00
PAY01177	ORD01588	Mobile Money	1781841.04	2024-11-23 10:00:00
PAY01178	ORD01590	Bank Transfer	454316.32	2024-05-15 06:00:00
PAY01183	ORD01597	Mobile Money	46244.80	2024-07-22 19:00:00
PAY01180	ORD01594	Bank Transfer	33479.34	2024-03-02 17:00:00
PAY01214	ORD01639	Card	12053.52	2024-10-12 11:00:00
PAY01182	ORD01596	Mobile Money	52346.95	2023-12-17 18:00:00
PAY01207	ORD01629	Mobile Money	581145.86	2023-06-06 18:00:00
PAY01228	ORD01656	Card	108751.49	2024-10-23 02:00:00
PAY01187	ORD01601	Bank Transfer	106784.91	2023-10-20 16:00:00
PAY01188	ORD01602	Bank Transfer	978096.05	2023-04-30 07:00:00
PAY01189	ORD01604	Cash on Delivery	28812.35	2024-12-09 14:00:00
PAY01190	ORD01605	Mobile Money	31477.40	2024-12-08 14:00:00
PAY01191	ORD01607	Card	96615.35	2024-06-06 18:00:00
PAY01192	ORD01609	Card	199233.48	2024-02-27 09:00:00
PAY01186	ORD01600	Mobile Money	140237.76	2024-12-13 10:00:00
PAY01194	ORD01612	Mobile Money	22960.29	2024-12-27 13:00:00
PAY01264	ORD01699	Card	35280.59	2024-09-30 20:00:00
PAY01196	ORD01614	Bank Transfer	1272167.51	2024-10-01 23:00:00
PAY01237	ORD01667	Card	102447.74	2024-04-24 07:00:00
PAY01198	ORD01617	Cash on Delivery	40465.27	2024-12-04 16:00:00
PAY01199	ORD01619	Cash on Delivery	638415.97	2024-06-10 03:00:00
PAY01200	ORD01620	Card	865087.23	2024-04-10 06:00:00
PAY01201	ORD01622	Cash on Delivery	45708.85	2024-07-30 16:00:00
PAY01202	ORD01623	Card	7172.97	2023-06-07 08:00:00
PAY01203	ORD01624	Cash on Delivery	215711.20	2024-04-15 16:00:00
PAY01204	ORD01625	Bank Transfer	310749.90	2024-06-22 15:00:00
PAY01206	ORD01627	Cash on Delivery	767003.95	2024-09-28 09:00:00
PAY01208	ORD01630	Cash on Delivery	380329.47	2024-08-31 12:00:00
PAY01210	ORD01634	Bank Transfer	77315.50	2024-05-10 00:00:00
PAY01212	ORD01636	Bank Transfer	84100.44	2024-02-10 18:00:00
PAY01215	ORD01640	Bank Transfer	40877.16	2024-08-19 22:00:00
PAY01217	ORD01642	Cash on Delivery	168353.89	2023-12-17 00:00:00
PAY01219	ORD01645	Mobile Money	11386.20	2024-07-27 17:00:00
PAY01221	ORD01647	Card	629898.03	2024-05-11 00:00:00
PAY01222	ORD01648	Mobile Money	141953.36	2024-05-25 15:00:00
PAY01223	ORD01650	Cash on Delivery	1462057.55	2024-10-18 00:00:00
PAY01226	ORD01654	Card	160108.43	2024-06-10 06:00:00
PAY01227	ORD01655	Cash on Delivery	809604.90	2024-06-13 00:00:00
PAY01231	ORD01660	Card	187646.29	2024-12-02 03:00:00
PAY01232	ORD01662	Bank Transfer	141135.80	2023-06-02 03:00:00
PAY01233	ORD01663	Cash on Delivery	87482.09	2024-09-20 19:00:00
PAY01234	ORD01664	Bank Transfer	1158907.10	2024-05-20 12:00:00
PAY01235	ORD01665	Card	211679.32	2024-01-11 05:00:00
PAY01236	ORD01666	Bank Transfer	182560.65	2024-09-05 13:00:00
PAY01238	ORD01669	Card	1280228.45	2024-12-26 16:00:00
PAY01242	ORD01673	Bank Transfer	53762.13	2024-03-26 19:00:00
PAY01245	ORD01676	Cash on Delivery	86284.48	2024-11-17 12:00:00
PAY01247	ORD01680	Bank Transfer	129842.64	2024-10-05 14:00:00
PAY01249	ORD01682	Bank Transfer	530860.46	2024-03-21 07:00:00
PAY01250	ORD01683	Cash on Delivery	25910.95	2024-01-23 18:00:00
PAY01251	ORD01684	Bank Transfer	78806.70	2024-09-21 14:00:00
PAY01254	ORD01688	Card	54388.50	2023-05-12 09:00:00
PAY01255	ORD01689	Bank Transfer	584934.80	2023-08-08 13:00:00
PAY01257	ORD01691	Bank Transfer	425267.89	2024-10-26 06:00:00
PAY01258	ORD01692	Cash on Delivery	441078.84	2024-08-27 22:00:00
PAY01259	ORD01693	Card	339524.65	2024-08-01 00:00:00
PAY01260	ORD01694	Bank Transfer	5712.84	2024-06-13 17:00:00
PAY01263	ORD01698	Card	23616.92	2024-09-23 11:00:00
PAY01265	ORD01702	Card	499862.83	2024-03-25 23:00:00
PAY01270	ORD01707	Cash on Delivery	497712.95	2024-12-06 14:00:00
PAY01271	ORD01708	Cash on Delivery	130015.70	2024-11-25 19:00:00
PAY01272	ORD01709	Mobile Money	1220840.69	2024-11-26 12:00:00
PAY01273	ORD01710	Cash on Delivery	333752.14	2024-11-28 02:00:00
PAY01274	ORD01711	Cash on Delivery	4038.10	2024-11-23 06:00:00
PAY01275	ORD01712	Cash on Delivery	23765.62	2024-12-01 19:00:00
PAY01276	ORD01713	Cash on Delivery	5323.48	2024-12-26 04:00:00
PAY01278	ORD01715	Mobile Money	70505.99	2024-07-26 08:00:00
PAY01279	ORD01716	Bank Transfer	82979.02	2024-11-15 11:00:00
PAY01282	ORD01720	Mobile Money	194600.30	2024-04-24 06:00:00
PAY01283	ORD01721	Card	675417.62	2023-12-17 17:00:00
PAY01284	ORD01723	Card	994838.80	2024-02-14 23:00:00
PAY01285	ORD01725	Card	34157.64	2024-08-26 18:00:00
PAY01286	ORD01726	Card	16961.56	2024-06-28 02:00:00
PAY01287	ORD01728	Bank Transfer	629332.63	2024-08-31 09:00:00
PAY01288	ORD01729	Card	501907.37	2024-07-07 04:00:00
PAY01294	ORD01736	Card	5762.47	2024-07-13 10:00:00
PAY01290	ORD01731	Bank Transfer	32574.27	2024-07-25 23:00:00
PAY01291	ORD01732	Card	324828.96	2024-07-10 04:00:00
PAY01292	ORD01733	Bank Transfer	21912.74	2024-09-07 05:00:00
PAY01293	ORD01734	Bank Transfer	64122.63	2024-09-18 01:00:00
PAY01295	ORD01737	Mobile Money	135283.44	2024-09-26 14:00:00
PAY01322	ORD01779	Cash on Delivery	79126.56	2024-06-07 21:00:00
PAY01297	ORD01740	Card	813081.63	2024-12-01 22:00:00
PAY01298	ORD01741	Card	1657410.01	2024-10-02 19:00:00
PAY01299	ORD01742	Bank Transfer	129271.75	2024-12-31 12:00:00
PAY01300	ORD01743	Cash on Delivery	1416912.17	2024-08-06 01:00:00
PAY01341	ORD01802	Cash on Delivery	94334.30	2024-05-20 10:00:00
PAY01339	ORD01799	Card	1313271.46	2023-08-09 01:00:00
PAY01303	ORD01751	Cash on Delivery	33297.75	2024-12-22 17:00:00
PAY01304	ORD01752	Mobile Money	44306.32	2024-11-14 14:00:00
PAY01305	ORD01754	Cash on Delivery	195934.03	2024-10-31 19:00:00
PAY01306	ORD01755	Card	351805.72	2024-08-09 08:00:00
PAY01307	ORD01756	Bank Transfer	8076.20	2023-12-22 01:00:00
PAY01308	ORD01757	Card	395222.81	2023-09-01 09:00:00
PAY01310	ORD01759	Card	136573.70	2024-06-30 04:00:00
PAY01311	ORD01761	Mobile Money	654050.30	2024-06-28 00:00:00
PAY01312	ORD01763	Card	1746773.40	2024-07-03 18:00:00
PAY01313	ORD01764	Bank Transfer	130130.84	2024-07-18 11:00:00
PAY01314	ORD01767	Mobile Money	476073.93	2024-06-02 03:00:00
PAY01315	ORD01771	Card	18080.28	2024-11-29 20:00:00
PAY01316	ORD01772	Bank Transfer	192990.07	2024-12-07 10:00:00
PAY01319	ORD01776	Cash on Delivery	41117.60	2024-10-31 05:00:00
PAY01321	ORD01778	Mobile Money	5762.47	2024-07-25 09:00:00
PAY01323	ORD01780	Card	390298.12	2024-02-13 17:00:00
PAY01324	ORD01781	Mobile Money	411387.98	2024-01-07 17:00:00
PAY01325	ORD01782	Mobile Money	56480.82	2024-06-12 01:00:00
PAY01326	ORD01783	Card	292210.30	2024-05-19 13:00:00
PAY01327	ORD01785	Card	30581.49	2023-09-19 11:00:00
PAY01329	ORD01788	Card	439754.74	2024-05-13 22:00:00
PAY01330	ORD01789	Cash on Delivery	257364.90	2023-10-20 20:00:00
PAY01331	ORD01790	Card	335067.63	2024-11-07 20:00:00
PAY01332	ORD01791	Cash on Delivery	116573.24	2023-11-30 04:00:00
PAY01337	ORD01797	Mobile Money	263054.64	2024-07-01 15:00:00
PAY01338	ORD01798	Cash on Delivery	145973.64	2023-01-26 22:00:00
PAY01340	ORD01800	Card	782873.27	2024-01-01 19:00:00
PAY01343	ORD01804	Cash on Delivery	68037.48	2024-05-08 21:00:00
PAY01345	ORD01806	Card	355773.52	2024-08-30 11:00:00
PAY01347	ORD01810	Card	1158331.97	2024-12-30 17:00:00
PAY01348	ORD01811	Bank Transfer	101960.16	2024-10-20 12:00:00
PAY01349	ORD01812	Mobile Money	378503.96	2024-11-19 03:00:00
PAY01350	ORD01813	Bank Transfer	132157.53	2024-08-25 11:00:00
PAY01352	ORD01815	Card	247824.46	2024-09-12 22:00:00
PAY01355	ORD01822	Mobile Money	180084.64	2024-10-18 02:00:00
PAY01356	ORD01823	Mobile Money	528573.66	2024-12-28 08:00:00
PAY01358	ORD01825	Mobile Money	337665.56	2024-06-27 19:00:00
PAY01360	ORD01827	Cash on Delivery	722299.05	2024-12-02 20:00:00
PAY01361	ORD01828	Mobile Money	61579.68	2024-07-16 04:00:00
PAY01364	ORD01832	Bank Transfer	137710.20	2024-02-03 11:00:00
PAY01365	ORD01833	Cash on Delivery	63364.03	2023-12-24 18:00:00
PAY01367	ORD01835	Mobile Money	42025.94	2024-09-17 00:00:00
PAY01369	ORD01837	Card	19742.68	2024-03-25 11:00:00
PAY01371	ORD01839	Card	557510.13	2024-10-23 04:00:00
PAY01373	ORD01842	Card	695331.56	2024-11-21 02:00:00
PAY01375	ORD01845	Bank Transfer	43905.60	2025-01-01 19:00:00
PAY01376	ORD01846	Cash on Delivery	97853.36	2024-12-06 15:00:00
PAY01381	ORD01851	Mobile Money	1707225.31	2024-09-09 19:00:00
PAY01382	ORD01853	Mobile Money	2943847.83	2024-05-02 23:00:00
PAY01383	ORD01854	Cash on Delivery	43372.48	2023-11-19 08:00:00
PAY01384	ORD01856	Card	987015.13	2024-06-25 06:00:00
PAY01387	ORD01859	Card	185673.25	2024-06-09 14:00:00
PAY01390	ORD01862	Card	242330.60	2024-06-27 10:00:00
PAY01392	ORD01864	Bank Transfer	15152.82	2024-08-20 00:00:00
PAY01393	ORD01865	Cash on Delivery	630266.76	2024-06-20 17:00:00
PAY01394	ORD01866	Card	549230.53	2024-08-21 00:00:00
PAY01395	ORD01867	Cash on Delivery	6170.81	2024-05-10 07:00:00
PAY01461	ORD01954	Bank Transfer	377278.82	2024-07-17 12:00:00
PAY01397	ORD01870	Mobile Money	563919.29	2023-12-13 13:00:00
PAY01398	ORD01871	Bank Transfer	215711.20	2023-11-03 01:00:00
PAY01399	ORD01872	Mobile Money	7533.78	2024-04-06 14:00:00
PAY01400	ORD01873	Cash on Delivery	6230.11	2024-08-13 00:00:00
PAY01402	ORD01875	Card	76433.95	2024-07-12 22:00:00
PAY01403	ORD01876	Cash on Delivery	24463.34	2024-06-19 07:00:00
PAY01404	ORD01879	Mobile Money	118653.08	2024-06-28 03:00:00
PAY01405	ORD01880	Mobile Money	220539.42	2024-09-16 00:00:00
PAY01406	ORD01881	Cash on Delivery	430288.80	2024-10-06 20:00:00
PAY01407	ORD01882	Cash on Delivery	402816.45	2024-11-30 02:00:00
PAY01408	ORD01885	Card	12706.74	2024-11-07 13:00:00
PAY01410	ORD01887	Mobile Money	21709.68	2024-02-03 13:00:00
PAY01411	ORD01888	Card	126473.94	2024-06-22 05:00:00
PAY01413	ORD01892	Card	586047.25	2023-11-18 23:00:00
PAY01414	ORD01893	Card	100933.34	2024-12-10 02:00:00
PAY01415	ORD01898	Bank Transfer	1213753.37	2024-10-30 23:00:00
PAY01416	ORD01899	Card	705677.44	2024-10-28 06:00:00
PAY01417	ORD01900	Card	19741.12	2024-09-15 16:00:00
PAY01418	ORD01901	Cash on Delivery	48037.37	2024-01-12 00:00:00
PAY01419	ORD01902	Mobile Money	471590.12	2024-02-03 18:00:00
PAY01421	ORD01904	Bank Transfer	20698.80	2024-01-14 21:00:00
PAY01423	ORD01906	Mobile Money	63091.21	2023-11-19 18:00:00
PAY01424	ORD01907	Mobile Money	78955.84	2024-12-27 00:00:00
PAY01425	ORD01908	Mobile Money	85470.14	2024-04-15 00:00:00
PAY01426	ORD01909	Card	986407.20	2024-10-24 19:00:00
PAY01428	ORD01912	Card	15003.67	2024-11-20 01:00:00
PAY01429	ORD01913	Mobile Money	281964.48	2023-11-12 18:00:00
PAY01430	ORD01915	Card	889298.04	2024-07-02 14:00:00
PAY01431	ORD01916	Mobile Money	2019.05	2024-06-10 08:00:00
PAY01433	ORD01918	Bank Transfer	358222.29	2024-02-06 00:00:00
PAY01434	ORD01920	Bank Transfer	470699.26	2024-07-04 21:00:00
PAY01437	ORD01924	Card	1418267.19	2024-08-04 11:00:00
PAY01438	ORD01926	Card	53953.43	2023-09-24 15:00:00
PAY01441	ORD01930	Card	456035.22	2024-01-17 03:00:00
PAY01442	ORD01931	Mobile Money	795566.29	2024-10-09 22:00:00
PAY01443	ORD01933	Cash on Delivery	120268.52	2024-09-04 05:00:00
PAY01444	ORD01934	Card	424884.05	2024-12-14 02:00:00
PAY01446	ORD01936	Bank Transfer	643395.88	2023-06-17 19:00:00
PAY01448	ORD01939	Mobile Money	1401938.78	2023-10-13 07:00:00
PAY01449	ORD01941	Bank Transfer	359579.20	2024-06-17 04:00:00
PAY01450	ORD01942	Bank Transfer	398397.28	2024-05-21 10:00:00
PAY01451	ORD01943	Bank Transfer	180749.37	2024-04-25 13:00:00
PAY01452	ORD01944	Mobile Money	1428725.36	2024-12-13 20:00:00
PAY01454	ORD01946	Cash on Delivery	492031.74	2024-10-10 12:00:00
PAY01455	ORD01947	Bank Transfer	118084.60	2024-04-23 20:00:00
PAY01456	ORD01948	Card	173901.38	2024-06-20 15:00:00
PAY01457	ORD01949	Bank Transfer	48466.70	2024-08-30 06:00:00
PAY01458	ORD01950	Card	54215.60	2024-06-29 00:00:00
PAY01462	ORD01955	Cash on Delivery	31579.12	2024-11-26 19:00:00
PAY01463	ORD01956	Bank Transfer	127824.90	2024-06-14 03:00:00
PAY01464	ORD01959	Card	868327.05	2024-09-30 07:00:00
PAY01465	ORD01960	Bank Transfer	1372231.16	2024-04-15 07:00:00
PAY01466	ORD01961	Bank Transfer	259751.90	2024-12-07 18:00:00
PAY01467	ORD01962	Card	24920.44	2024-10-26 08:00:00
PAY01468	ORD01964	Cash on Delivery	1073842.93	2023-11-21 14:00:00
PAY01471	ORD01967	Mobile Money	28370.48	2024-01-07 07:00:00
PAY01472	ORD01969	Cash on Delivery	363859.64	2023-09-08 14:00:00
PAY01474	ORD01973	Card	433699.07	2024-03-17 15:00:00
PAY01476	ORD01976	Bank Transfer	1016135.30	2023-05-26 09:00:00
PAY01479	ORD01979	Card	135777.09	2024-12-30 07:00:00
PAY01480	ORD01980	Card	156645.15	2024-10-16 03:00:00
PAY01482	ORD01982	Bank Transfer	186774.13	2024-11-02 09:00:00
PAY01484	ORD01985	Cash on Delivery	47930.68	2024-02-21 19:00:00
PAY01485	ORD01987	Mobile Money	82713.56	2024-02-14 20:00:00
PAY01487	ORD01990	Cash on Delivery	1375465.84	2023-12-10 18:00:00
PAY01488	ORD01992	Card	18117.48	2024-09-24 17:00:00
PAY01490	ORD01995	Card	51228.88	2023-11-21 22:00:00
PAY01491	ORD01997	Mobile Money	133191.00	2024-09-08 04:00:00
PAY01492	ORD01998	Cash on Delivery	957676.93	2024-08-15 05:00:00
PAY01494	ORD02001	Cash on Delivery	1228137.40	2024-01-28 20:00:00
PAY01495	ORD02002	Bank Transfer	643395.88	2024-09-01 15:00:00
PAY01496	ORD02003	Bank Transfer	209097.61	2024-09-02 00:00:00
PAY01497	ORD02005	Card	1235650.44	2024-01-18 10:00:00
PAY01498	ORD02006	Mobile Money	164442.78	2023-09-01 01:00:00
PAY01499	ORD02007	Card	219422.34	2024-05-01 14:00:00
PAY01501	ORD02009	Mobile Money	275127.81	2024-08-10 10:00:00
PAY01502	ORD02013	Card	991771.17	2024-05-27 22:00:00
PAY01503	ORD02015	Cash on Delivery	1124082.02	2024-04-30 12:00:00
PAY01500	ORD02008	Cash on Delivery	27271.36	2024-09-01 01:00:00
PAY01505	ORD02017	Mobile Money	242070.75	2024-09-19 11:00:00
PAY01506	ORD02018	Card	34967.80	2024-10-17 04:00:00
PAY01507	ORD02019	Bank Transfer	1720355.06	2024-02-03 06:00:00
PAY01508	ORD02021	Card	69996.63	2024-10-31 19:00:00
PAY01586	ORD02121	Card	905769.62	2024-07-25 20:00:00
PAY01510	ORD02023	Card	2802.33	2024-08-20 06:00:00
PAY01548	ORD02071	Bank Transfer	120137.06	2024-07-18 21:00:00
PAY01536	ORD02057	Card	57109.46	2024-06-28 19:00:00
PAY01513	ORD02028	Card	46035.40	2024-08-28 01:00:00
PAY01574	ORD02101	Card	98900.82	2023-12-26 00:00:00
PAY01515	ORD02030	Cash on Delivery	271616.18	2024-12-11 10:00:00
PAY01516	ORD02031	Cash on Delivery	2017488.79	2024-08-20 12:00:00
PAY01517	ORD02034	Mobile Money	58333.34	2024-07-17 08:00:00
PAY01518	ORD02035	Mobile Money	548636.31	2024-10-10 09:00:00
PAY01519	ORD02036	Cash on Delivery	45302.42	2024-11-16 16:00:00
PAY01520	ORD02038	Card	369351.72	2024-10-21 17:00:00
PAY01521	ORD02039	Card	191629.85	2024-08-26 20:00:00
PAY01545	ORD02068	Mobile Money	578743.00	2024-12-29 09:00:00
PAY01523	ORD02041	Bank Transfer	867436.59	2024-11-04 17:00:00
PAY01524	ORD02043	Cash on Delivery	212476.89	2024-02-02 06:00:00
PAY01551	ORD02075	Card	104228.31	2024-10-26 04:00:00
PAY01528	ORD02047	Cash on Delivery	1018541.18	2024-03-09 08:00:00
PAY01529	ORD02048	Cash on Delivery	150697.55	2023-10-23 01:00:00
PAY01531	ORD02051	Bank Transfer	407731.20	2024-01-22 20:00:00
PAY01533	ORD02054	Mobile Money	870698.52	2024-01-14 14:00:00
PAY01534	ORD02055	Bank Transfer	25484.84	2024-03-27 14:00:00
PAY01535	ORD02056	Card	40877.16	2023-04-25 05:00:00
PAY01540	ORD02062	Card	1517372.93	2024-03-23 05:00:00
PAY01542	ORD02064	Mobile Money	83437.72	2024-09-15 12:00:00
PAY01543	ORD02065	Cash on Delivery	33029.61	2024-12-09 15:00:00
PAY01546	ORD02069	Mobile Money	47233.84	2024-08-22 16:00:00
PAY01547	ORD02070	Card	51993.13	2024-08-10 00:00:00
PAY01549	ORD02072	Cash on Delivery	1057590.73	2024-12-14 12:00:00
PAY01550	ORD02073	Bank Transfer	770041.63	2024-12-02 23:00:00
PAY01553	ORD02079	Mobile Money	857314.46	2024-07-31 07:00:00
PAY01555	ORD02081	Bank Transfer	184401.52	2023-11-26 13:00:00
PAY01556	ORD02082	Bank Transfer	195886.35	2023-11-21 23:00:00
PAY01557	ORD02083	Bank Transfer	80339.85	2024-11-23 18:00:00
PAY01558	ORD02084	Cash on Delivery	207992.10	2024-07-06 18:00:00
PAY01562	ORD02088	Cash on Delivery	111904.54	2024-12-15 14:00:00
PAY01563	ORD02089	Mobile Money	86352.92	2024-04-13 15:00:00
PAY01564	ORD02090	Bank Transfer	5261.71	2024-11-30 14:00:00
PAY01565	ORD02091	Card	56642.17	2024-04-21 13:00:00
PAY01566	ORD02092	Bank Transfer	17515.94	2024-09-20 21:00:00
PAY01567	ORD02093	Mobile Money	169273.30	2024-12-31 11:00:00
PAY01569	ORD02096	Bank Transfer	45926.31	2024-11-09 18:00:00
PAY01571	ORD02098	Mobile Money	48285.65	2024-08-26 08:00:00
PAY01572	ORD02099	Mobile Money	11209.32	2024-09-26 08:00:00
PAY01575	ORD02105	Cash on Delivery	770562.66	2024-10-18 19:00:00
PAY01576	ORD02106	Cash on Delivery	15315.45	2024-02-08 23:00:00
PAY01578	ORD02108	Cash on Delivery	65858.60	2024-11-11 16:00:00
PAY01579	ORD02112	Card	661180.78	2024-06-21 20:00:00
PAY01580	ORD02113	Card	62292.43	2024-05-09 22:00:00
PAY01581	ORD02115	Cash on Delivery	24288.60	2024-04-13 15:00:00
PAY01584	ORD02119	Mobile Money	345924.48	2024-11-10 13:00:00
PAY01585	ORD02120	Card	580632.46	2024-09-24 15:00:00
PAY01588	ORD02123	Mobile Money	711191.81	2024-10-10 16:00:00
PAY01589	ORD02124	Bank Transfer	246601.80	2024-12-06 08:00:00
PAY01592	ORD02127	Mobile Money	575752.52	2024-12-12 13:00:00
PAY01593	ORD02128	Card	446216.60	2023-11-02 03:00:00
PAY01595	ORD02132	Bank Transfer	137481.28	2023-11-16 19:00:00
PAY01596	ORD02133	Cash on Delivery	19738.96	2024-09-21 02:00:00
PAY01597	ORD02136	Card	1633.04	2024-11-15 22:00:00
PAY01598	ORD02137	Card	14077.14	2024-12-28 11:00:00
PAY01599	ORD02138	Card	52507.89	2024-10-25 00:00:00
PAY01602	ORD02141	Bank Transfer	85978.02	2023-09-03 00:00:00
PAY01603	ORD02142	Bank Transfer	402619.27	2023-10-10 19:00:00
PAY01604	ORD02143	Card	31766.85	2024-09-22 22:00:00
PAY01605	ORD02144	Card	616971.17	2024-01-27 20:00:00
PAY01606	ORD02145	Bank Transfer	177974.85	2024-03-01 14:00:00
PAY01640	ORD02190	Card	612117.14	2024-04-17 11:00:00
PAY01608	ORD02147	Cash on Delivery	47233.84	2023-12-10 19:00:00
PAY01614	ORD02156	Card	171216.94	2024-06-20 12:00:00
PAY01610	ORD02149	Mobile Money	562883.38	2023-12-07 11:00:00
PAY01611	ORD02150	Bank Transfer	88185.56	2024-04-18 09:00:00
PAY01612	ORD02153	Cash on Delivery	29665.75	2024-01-15 12:00:00
PAY01635	ORD02184	Mobile Money	670530.77	2024-11-22 17:00:00
PAY01615	ORD02158	Bank Transfer	2195798.60	2024-10-12 11:00:00
PAY01616	ORD02159	Card	23616.92	2024-04-16 23:00:00
PAY01617	ORD02160	Mobile Money	6970.88	2024-12-20 19:00:00
PAY01618	ORD02162	Card	63753.88	2024-10-28 16:00:00
PAY01683	ORD02249	Card	151222.66	2024-12-17 06:00:00
PAY01620	ORD02166	Card	327229.73	2023-11-25 02:00:00
PAY01621	ORD02167	Card	156709.08	2023-09-25 23:00:00
PAY01622	ORD02168	Card	22657.06	2024-02-11 13:00:00
PAY01711	ORD02281	Card	191024.43	2024-10-26 06:00:00
PAY01679	ORD02244	Mobile Money	63768.87	2024-08-04 17:00:00
PAY01689	ORD02256	Card	34106.30	2024-07-18 02:00:00
PAY01626	ORD02173	Mobile Money	2511.26	2024-05-11 02:00:00
PAY01710	ORD02280	Card	226321.39	2024-04-13 06:00:00
PAY01628	ORD02176	Mobile Money	121527.21	2024-10-25 08:00:00
PAY01629	ORD02177	Card	506005.84	2023-11-14 13:00:00
PAY01630	ORD02179	Bank Transfer	50265.21	2024-06-09 18:00:00
PAY01633	ORD02182	Card	124125.36	2024-12-19 15:00:00
PAY01634	ORD02183	Cash on Delivery	370104.20	2024-11-25 16:00:00
PAY01636	ORD02185	Card	86352.92	2024-11-17 16:00:00
PAY01637	ORD02186	Card	87588.60	2024-10-26 10:00:00
PAY01639	ORD02189	Cash on Delivery	91572.30	2024-11-08 00:00:00
PAY01642	ORD02192	Mobile Money	1322728.85	2024-12-28 16:00:00
PAY01643	ORD02194	Cash on Delivery	109628.52	2024-04-23 03:00:00
PAY01644	ORD02196	Mobile Money	8968.44	2024-04-12 01:00:00
PAY01645	ORD02198	Card	49985.97	2024-02-05 06:00:00
PAY01648	ORD02203	Card	13938.18	2024-12-28 20:00:00
PAY01650	ORD02205	Bank Transfer	13912.80	2024-07-24 00:00:00
PAY01651	ORD02206	Cash on Delivery	5971.28	2024-08-25 00:00:00
PAY01652	ORD02207	Card	20220.48	2024-03-01 16:00:00
PAY01653	ORD02208	Card	12989.38	2024-09-03 05:00:00
PAY01654	ORD02210	Bank Transfer	116663.65	2024-07-08 02:00:00
PAY01655	ORD02211	Bank Transfer	926737.83	2024-10-12 18:00:00
PAY01656	ORD02213	Mobile Money	458267.45	2024-07-16 00:00:00
PAY01657	ORD02215	Card	189651.37	2024-09-06 02:00:00
PAY01658	ORD02216	Cash on Delivery	181209.68	2024-12-21 18:00:00
PAY01659	ORD02219	Bank Transfer	332973.30	2024-10-30 15:00:00
PAY01661	ORD02221	Bank Transfer	45054.25	2024-08-18 00:00:00
PAY01663	ORD02223	Cash on Delivery	35007.70	2023-10-03 03:00:00
PAY01664	ORD02224	Cash on Delivery	48314.36	2023-10-11 05:00:00
PAY01665	ORD02225	Card	923433.55	2024-04-16 05:00:00
PAY01666	ORD02227	Bank Transfer	564648.56	2023-09-29 10:00:00
PAY01669	ORD02232	Mobile Money	61391.40	2024-07-15 06:00:00
PAY01672	ORD02235	Cash on Delivery	370314.78	2024-04-23 22:00:00
PAY01674	ORD02238	Card	251980.85	2023-10-30 21:00:00
PAY01676	ORD02240	Mobile Money	27621.24	2024-06-14 14:00:00
PAY01677	ORD02242	Card	167564.56	2024-05-22 16:00:00
PAY01678	ORD02243	Mobile Money	780584.55	2024-04-13 16:00:00
PAY01681	ORD02247	Cash on Delivery	518985.79	2023-08-14 13:00:00
PAY01684	ORD02250	Card	417590.00	2024-08-29 01:00:00
PAY01687	ORD02254	Bank Transfer	84659.35	2024-11-27 01:00:00
PAY01688	ORD02255	Bank Transfer	20510.26	2024-06-17 11:00:00
PAY01690	ORD02257	Card	41020.52	2024-05-26 05:00:00
PAY01691	ORD02258	Card	135100.29	2024-11-19 22:00:00
PAY01692	ORD02259	Mobile Money	464020.29	2024-12-10 15:00:00
PAY01693	ORD02260	Card	142379.88	2024-12-31 21:00:00
PAY01694	ORD02261	Card	105159.48	2024-06-14 09:00:00
PAY01695	ORD02263	Cash on Delivery	98694.80	2024-11-28 06:00:00
PAY01696	ORD02265	Cash on Delivery	876706.12	2023-11-08 16:00:00
PAY01697	ORD02266	Cash on Delivery	9866.86	2024-03-14 22:00:00
PAY01698	ORD02267	Cash on Delivery	61685.11	2024-04-18 11:00:00
PAY01699	ORD02268	Bank Transfer	17265.90	2024-05-23 19:00:00
PAY01700	ORD02269	Cash on Delivery	54814.26	2024-11-02 03:00:00
PAY01701	ORD02270	Mobile Money	11129.13	2023-11-17 16:00:00
PAY01702	ORD02272	Bank Transfer	5399.76	2024-10-18 16:00:00
PAY01703	ORD02273	Cash on Delivery	108471.43	2024-10-31 20:00:00
PAY01704	ORD02274	Card	118094.97	2024-10-16 20:00:00
PAY01705	ORD02275	Card	89272.26	2024-10-10 23:00:00
PAY01706	ORD02276	Card	44745.78	2024-06-04 20:00:00
PAY01707	ORD02277	Cash on Delivery	202825.74	2024-03-25 20:00:00
PAY01708	ORD02278	Mobile Money	32284.63	2024-10-20 06:00:00
PAY01712	ORD02283	Bank Transfer	711932.45	2024-02-06 05:00:00
PAY01713	ORD02284	Bank Transfer	8406.99	2024-12-17 14:00:00
PAY01714	ORD02285	Card	77977.95	2024-10-30 21:00:00
PAY01715	ORD02286	Card	24750.33	2024-11-24 12:00:00
PAY01795	ORD02386	Cash on Delivery	134284.48	2024-12-21 18:00:00
PAY01803	ORD02397	Card	770116.84	2024-12-01 05:00:00
PAY01718	ORD02290	Card	175369.76	2024-11-16 03:00:00
PAY01765	ORD02348	Cash on Delivery	23512.41	2024-09-29 22:00:00
PAY01720	ORD02293	Card	180084.64	2024-09-01 15:00:00
PAY01774	ORD02360	Card	768841.50	2024-05-12 17:00:00
PAY01722	ORD02295	Mobile Money	1169138.42	2024-06-15 12:00:00
PAY01723	ORD02296	Card	1597548.44	2024-11-10 11:00:00
PAY01808	ORD02402	Mobile Money	1457210.64	2024-07-04 21:00:00
PAY01726	ORD02299	Card	158270.04	2024-09-27 06:00:00
PAY01731	ORD02305	Cash on Delivery	2395014.01	2024-07-02 19:00:00
PAY01733	ORD02308	Bank Transfer	57806.00	2024-11-29 19:00:00
PAY01734	ORD02309	Mobile Money	2989.48	2024-05-01 04:00:00
PAY01735	ORD02310	Bank Transfer	11608.58	2024-03-15 06:00:00
PAY01737	ORD02314	Mobile Money	325573.42	2024-10-29 09:00:00
PAY01738	ORD02315	Mobile Money	506890.19	2024-11-23 07:00:00
PAY01739	ORD02316	Cash on Delivery	229390.82	2024-12-20 21:00:00
PAY01741	ORD02318	Bank Transfer	57806.00	2024-12-08 14:00:00
PAY01742	ORD02319	Card	185321.91	2024-12-27 19:00:00
PAY01745	ORD02322	Bank Transfer	1147155.41	2024-12-25 13:00:00
PAY01746	ORD02323	Bank Transfer	572061.17	2024-12-23 01:00:00
PAY01747	ORD02324	Card	179452.02	2023-10-16 00:00:00
PAY01749	ORD02328	Card	316366.34	2024-05-30 18:00:00
PAY01751	ORD02330	Mobile Money	86986.03	2024-10-14 03:00:00
PAY01752	ORD02331	Cash on Delivery	40185.68	2024-10-04 09:00:00
PAY01753	ORD02333	Bank Transfer	35221.95	2024-04-01 17:00:00
PAY01754	ORD02334	Card	297926.52	2024-08-09 15:00:00
PAY01756	ORD02338	Card	64122.63	2024-07-27 04:00:00
PAY01758	ORD02340	Cash on Delivery	105588.96	2024-04-29 20:00:00
PAY01760	ORD02342	Cash on Delivery	245349.52	2024-12-02 10:00:00
PAY01761	ORD02343	Card	13642.52	2024-04-20 01:00:00
PAY01763	ORD02346	Mobile Money	1086701.68	2024-10-22 08:00:00
PAY01766	ORD02349	Cash on Delivery	117531.81	2024-09-20 21:00:00
PAY01768	ORD02351	Cash on Delivery	187599.69	2024-04-17 19:00:00
PAY01769	ORD02352	Card	166393.68	2023-04-11 09:00:00
PAY01771	ORD02356	Bank Transfer	109628.52	2023-08-14 11:00:00
PAY01772	ORD02357	Cash on Delivery	67745.32	2024-05-07 18:00:00
PAY01776	ORD02362	Bank Transfer	38151.06	2024-11-14 16:00:00
PAY01777	ORD02363	Bank Transfer	395756.90	2023-10-17 03:00:00
PAY01778	ORD02364	Card	1461335.07	2023-12-12 08:00:00
PAY01781	ORD02367	Mobile Money	373173.62	2023-03-11 04:00:00
PAY01783	ORD02371	Mobile Money	23357.67	2023-07-05 09:00:00
PAY01784	ORD02372	Card	80530.64	2023-11-09 16:00:00
PAY01785	ORD02374	Cash on Delivery	962.48	2024-06-25 16:00:00
PAY01786	ORD02376	Cash on Delivery	55939.01	2024-08-30 01:00:00
PAY01787	ORD02378	Bank Transfer	11275.57	2024-09-15 16:00:00
PAY01788	ORD02379	Mobile Money	159247.16	2024-09-26 02:00:00
PAY01789	ORD02380	Card	631738.02	2024-12-01 10:00:00
PAY01790	ORD02381	Card	8224.90	2024-10-05 14:00:00
PAY01791	ORD02382	Card	111972.04	2024-10-05 11:00:00
PAY01792	ORD02383	Cash on Delivery	1116444.00	2024-12-03 10:00:00
PAY01794	ORD02385	Cash on Delivery	1019787.06	2024-11-25 08:00:00
PAY01796	ORD02388	Mobile Money	718474.40	2024-09-21 10:00:00
PAY01798	ORD02390	Bank Transfer	15172.98	2024-09-01 15:00:00
PAY01799	ORD02391	Card	138284.58	2024-10-28 20:00:00
PAY01802	ORD02395	Mobile Money	2457784.65	2024-07-29 02:00:00
PAY01804	ORD02398	Mobile Money	1162569.20	2024-12-31 18:00:00
PAY01805	ORD02399	Cash on Delivery	70846.58	2024-11-04 10:00:00
PAY01807	ORD02401	Bank Transfer	965244.47	2024-12-15 09:00:00
PAY01809	ORD02403	Cash on Delivery	287162.35	2023-12-21 05:00:00
PAY01810	ORD02405	Cash on Delivery	73459.05	2024-09-28 04:00:00
PAY01811	ORD02406	Mobile Money	465732.88	2024-05-13 20:00:00
PAY01812	ORD02408	Card	140423.37	2024-12-24 21:00:00
PAY01813	ORD02409	Bank Transfer	106282.78	2024-09-17 00:00:00
PAY01816	ORD02415	Card	359945.69	2024-08-19 18:00:00
PAY01817	ORD02418	Mobile Money	4792.40	2024-09-16 00:00:00
PAY01820	ORD02422	Cash on Delivery	20728.76	2024-12-24 15:00:00
PAY01821	ORD02423	Card	2690559.32	2024-07-27 23:00:00
PAY01896	ORD02540	Card	288317.26	2024-02-16 02:00:00
PAY01823	ORD02425	Card	27425.31	2024-08-16 20:00:00
PAY01910	ORD02557	Mobile Money	79945.84	2024-05-04 08:00:00
PAY01912	ORD02559	Card	445358.44	2024-10-30 12:00:00
PAY01828	ORD02431	Cash on Delivery	164442.78	2023-09-29 00:00:00
PAY01829	ORD02433	Card	124099.07	2024-06-23 10:00:00
PAY01830	ORD02434	Bank Transfer	513753.00	2024-08-18 09:00:00
PAY01831	ORD02437	Card	54574.89	2023-12-30 00:00:00
PAY01832	ORD02439	Cash on Delivery	15152.82	2023-04-16 21:00:00
PAY01833	ORD02440	Card	441311.10	2024-12-25 09:00:00
PAY01834	ORD02441	Card	567444.59	2024-11-05 09:00:00
PAY01836	ORD02444	Mobile Money	51056.48	2024-11-05 03:00:00
PAY01837	ORD02445	Bank Transfer	2365.76	2024-11-09 00:00:00
PAY01839	ORD02447	Mobile Money	180785.23	2024-12-28 12:00:00
PAY01841	ORD02450	Mobile Money	678774.80	2024-12-04 00:00:00
PAY01842	ORD02451	Card	166842.38	2024-11-12 07:00:00
PAY01843	ORD02453	Cash on Delivery	492503.63	2024-11-20 20:00:00
PAY01844	ORD02454	Mobile Money	16768.75	2024-09-03 11:00:00
PAY01845	ORD02456	Cash on Delivery	1611658.56	2024-09-21 19:00:00
PAY01848	ORD02461	Bank Transfer	23275.64	2024-11-25 09:00:00
PAY01849	ORD02462	Cash on Delivery	177033.40	2024-07-23 21:00:00
PAY01851	ORD02464	Mobile Money	42851.74	2024-07-21 00:00:00
PAY01852	ORD02465	Mobile Money	1456956.16	2024-08-01 16:00:00
PAY01854	ORD02469	Card	128378.51	2024-12-23 14:00:00
PAY01856	ORD02471	Card	32317.65	2024-09-18 23:00:00
PAY01858	ORD02473	Card	253301.20	2024-12-02 08:00:00
PAY01859	ORD02475	Card	11018.01	2024-12-05 17:00:00
PAY01860	ORD02476	Card	513753.00	2023-11-16 14:00:00
PAY01861	ORD02477	Card	50986.52	2024-12-25 18:00:00
PAY01862	ORD02478	Card	127701.09	2024-09-28 11:00:00
PAY01864	ORD02483	Mobile Money	81994.48	2024-02-26 05:00:00
PAY01866	ORD02485	Bank Transfer	190414.55	2024-10-04 19:00:00
PAY01868	ORD02488	Card	7571.15	2024-12-29 20:00:00
PAY01869	ORD02489	Card	245132.44	2023-09-28 02:00:00
PAY01871	ORD02493	Mobile Money	34344.46	2024-11-13 06:00:00
PAY01873	ORD02495	Cash on Delivery	21115.71	2024-08-21 15:00:00
PAY01876	ORD02504	Mobile Money	965078.43	2024-12-14 17:00:00
PAY01877	ORD02507	Cash on Delivery	82134.60	2024-12-29 02:00:00
PAY01878	ORD02508	Cash on Delivery	44547.39	2024-04-06 11:00:00
PAY01879	ORD02509	Mobile Money	148168.66	2023-09-25 01:00:00
PAY01880	ORD02510	Card	337634.60	2024-07-19 01:00:00
PAY01881	ORD02512	Card	55613.62	2024-08-12 11:00:00
PAY01883	ORD02515	Cash on Delivery	33482.97	2024-08-19 05:00:00
PAY01884	ORD02518	Cash on Delivery	46511.08	2024-06-29 07:00:00
PAY01885	ORD02520	Card	14461.31	2023-07-18 00:00:00
PAY01886	ORD02522	Bank Transfer	38612.32	2024-04-06 04:00:00
PAY01887	ORD02524	Cash on Delivery	20703.44	2024-03-07 15:00:00
PAY01890	ORD02527	Mobile Money	110269.71	2023-11-30 11:00:00
PAY01894	ORD02536	Cash on Delivery	40996.15	2023-12-18 21:00:00
PAY01899	ORD02545	Card	140361.00	2024-06-22 08:00:00
PAY01901	ORD02547	Bank Transfer	563928.96	2024-09-26 06:00:00
PAY01903	ORD02549	Card	1810580.04	2024-10-06 05:00:00
PAY01904	ORD02550	Bank Transfer	199058.95	2024-09-05 03:00:00
PAY01907	ORD02554	Mobile Money	38310.15	2024-04-15 19:00:00
PAY01909	ORD02556	Mobile Money	251501.84	2024-06-30 19:00:00
PAY01911	ORD02558	Card	351651.77	2024-04-15 08:00:00
PAY01915	ORD02562	Bank Transfer	207023.97	2023-12-23 03:00:00
PAY01917	ORD02567	Card	198153.24	2024-07-17 06:00:00
PAY01919	ORD02569	Card	125318.47	2024-11-29 21:00:00
PAY01920	ORD02571	Mobile Money	131993.61	2024-10-24 00:00:00
PAY01921	ORD02572	Card	17641.20	2024-12-06 22:00:00
PAY01922	ORD02573	Mobile Money	353048.88	2024-11-22 17:00:00
PAY01925	ORD02578	Cash on Delivery	341616.01	2024-10-24 03:00:00
PAY01928	ORD02581	Card	32929.20	2023-12-03 08:00:00
PAY01929	ORD02583	Mobile Money	2087573.62	2024-09-25 16:00:00
PAY01930	ORD02584	Card	87684.88	2024-07-19 18:00:00
PAY01931	ORD02586	Cash on Delivery	342501.25	2024-10-07 07:00:00
PAY01932	ORD02587	Cash on Delivery	219122.04	2024-11-27 02:00:00
PAY01933	ORD02588	Mobile Money	127701.09	2024-11-10 13:00:00
PAY01934	ORD02589	Card	198852.85	2024-11-15 03:00:00
PAY01988	ORD02665	Bank Transfer	1325786.96	2023-10-29 08:00:00
PAY01936	ORD02592	Card	130707.25	2024-05-06 13:00:00
PAY01937	ORD02593	Cash on Delivery	101814.33	2024-10-16 10:00:00
PAY01938	ORD02595	Bank Transfer	804244.85	2024-08-01 23:00:00
PAY01939	ORD02596	Card	403051.28	2024-05-31 12:00:00
PAY01940	ORD02597	Card	39288.15	2024-09-24 09:00:00
PAY01941	ORD02599	Mobile Money	25947.77	2024-11-15 15:00:00
PAY01942	ORD02602	Mobile Money	700393.60	2023-11-25 18:00:00
PAY01943	ORD02604	Mobile Money	81167.53	2024-07-17 05:00:00
PAY01944	ORD02605	Bank Transfer	108875.43	2024-12-24 22:00:00
PAY01945	ORD02606	Card	180084.64	2024-10-11 06:00:00
PAY01946	ORD02607	Card	33826.71	2024-10-23 20:00:00
PAY01947	ORD02608	Card	223132.14	2024-11-10 12:00:00
PAY01948	ORD02609	Bank Transfer	71981.01	2024-08-21 10:00:00
PAY01969	ORD02639	Mobile Money	20918.69	2024-12-27 10:00:00
PAY01995	ORD02676	Card	70351.26	2024-11-27 04:00:00
PAY02026	ORD02725	Cash on Delivery	175369.76	2024-06-01 15:00:00
PAY02019	ORD02716	Card	152620.50	2024-10-31 13:00:00
PAY01953	ORD02620	Mobile Money	651771.68	2024-12-26 16:00:00
PAY01954	ORD02622	Card	87218.15	2024-12-19 20:00:00
PAY02034	ORD02740	Bank Transfer	7224.75	2024-09-11 02:00:00
PAY01956	ORD02624	Card	1198474.16	2024-06-22 01:00:00
PAY01957	ORD02625	Cash on Delivery	34507.56	2024-06-08 09:00:00
PAY01958	ORD02628	Mobile Money	26230.02	2024-12-27 00:00:00
PAY01997	ORD02681	Mobile Money	191568.69	2024-12-03 07:00:00
PAY01960	ORD02630	Card	15371.06	2024-12-16 12:00:00
PAY01961	ORD02631	Mobile Money	290642.30	2024-12-19 16:00:00
PAY01962	ORD02632	Mobile Money	70682.86	2024-12-23 20:00:00
PAY01963	ORD02633	Mobile Money	716591.83	2024-08-31 02:00:00
PAY01964	ORD02634	Cash on Delivery	160965.44	2024-12-28 20:00:00
PAY02003	ORD02690	Card	368723.25	2024-06-23 02:00:00
PAY01966	ORD02636	Cash on Delivery	468450.06	2024-11-28 07:00:00
PAY01967	ORD02637	Cash on Delivery	871926.90	2024-01-13 16:00:00
PAY01968	ORD02638	Card	586313.81	2024-07-18 19:00:00
PAY01982	ORD02658	Bank Transfer	368723.25	2024-09-03 11:00:00
PAY01971	ORD02642	Card	1459370.17	2024-12-23 06:00:00
PAY01973	ORD02644	Card	245007.21	2024-07-25 15:00:00
PAY01975	ORD02647	Card	45816.72	2024-10-31 13:00:00
PAY01977	ORD02650	Mobile Money	255676.46	2024-01-24 16:00:00
PAY01978	ORD02652	Mobile Money	427359.18	2024-06-17 12:00:00
PAY01979	ORD02653	Card	340737.24	2024-10-15 09:00:00
PAY01980	ORD02654	Mobile Money	38292.36	2024-10-30 18:00:00
PAY01983	ORD02659	Card	6057.15	2024-07-01 13:00:00
PAY01984	ORD02660	Bank Transfer	430074.55	2024-08-15 18:00:00
PAY01985	ORD02662	Card	288258.95	2024-10-15 02:00:00
PAY01986	ORD02663	Card	7958.84	2024-04-10 03:00:00
PAY01987	ORD02664	Cash on Delivery	86513.92	2024-01-21 16:00:00
PAY01990	ORD02668	Mobile Money	1118094.17	2024-03-17 07:00:00
PAY01991	ORD02669	Mobile Money	8076.20	2023-02-24 17:00:00
PAY01996	ORD02678	Mobile Money	10193.83	2024-07-08 13:00:00
PAY01998	ORD02682	Cash on Delivery	100741.91	2024-07-17 09:00:00
PAY02000	ORD02685	Mobile Money	294318.98	2024-06-26 22:00:00
PAY02001	ORD02686	Card	95598.42	2024-06-08 06:00:00
PAY02002	ORD02689	Mobile Money	14928.20	2024-02-27 18:00:00
PAY02004	ORD02691	Mobile Money	46511.08	2024-05-18 18:00:00
PAY02006	ORD02697	Bank Transfer	45877.96	2024-05-19 09:00:00
PAY02007	ORD02698	Bank Transfer	173094.92	2024-05-06 21:00:00
PAY02008	ORD02700	Card	68496.96	2023-11-21 10:00:00
PAY02009	ORD02701	Bank Transfer	313387.28	2024-01-27 22:00:00
PAY02010	ORD02702	Bank Transfer	18690.33	2023-10-06 15:00:00
PAY02011	ORD02703	Card	38061.27	2024-06-27 04:00:00
PAY02014	ORD02710	Mobile Money	74227.75	2023-07-20 06:00:00
PAY02015	ORD02711	Mobile Money	19732.78	2024-05-22 12:00:00
PAY02016	ORD02712	Card	140246.84	2024-04-22 02:00:00
PAY02017	ORD02714	Card	24463.34	2024-11-08 18:00:00
PAY02018	ORD02715	Card	219581.43	2024-04-19 22:00:00
PAY02020	ORD02717	Card	527912.66	2023-08-11 09:00:00
PAY02024	ORD02723	Cash on Delivery	48431.34	2024-10-23 23:00:00
PAY02025	ORD02724	Bank Transfer	818092.87	2024-03-19 12:00:00
PAY02027	ORD02726	Bank Transfer	110331.26	2024-12-04 01:00:00
PAY02029	ORD02729	Card	44730.34	2024-05-20 05:00:00
PAY02031	ORD02737	Card	403980.41	2024-05-19 21:00:00
PAY02032	ORD02738	Bank Transfer	280143.99	2023-08-19 22:00:00
PAY02033	ORD02739	Card	161331.95	2024-11-12 00:00:00
PAY02036	ORD02743	Card	21790.46	2024-04-16 23:00:00
PAY02037	ORD02744	Cash on Delivery	1006071.55	2024-09-06 12:00:00
PAY02039	ORD02746	Cash on Delivery	494280.20	2024-04-03 15:00:00
PAY02040	ORD02747	Mobile Money	1097468.41	2024-07-06 02:00:00
PAY02098	ORD02822	Card	48753.27	2024-03-22 10:00:00
PAY02042	ORD02749	Cash on Delivery	4809.30	2024-12-25 15:00:00
PAY02043	ORD02751	Cash on Delivery	22153.16	2023-12-13 13:00:00
PAY02044	ORD02754	Mobile Money	168684.73	2024-01-12 05:00:00
PAY02045	ORD02755	Bank Transfer	16538.43	2024-09-08 09:00:00
PAY02139	ORD02875	Card	89507.96	2024-11-27 14:00:00
PAY02047	ORD02757	Cash on Delivery	232342.08	2023-12-12 09:00:00
PAY02122	ORD02854	Bank Transfer	61048.20	2024-11-11 18:00:00
PAY02050	ORD02764	Mobile Money	356067.36	2024-08-02 08:00:00
PAY02052	ORD02766	Card	636407.49	2024-07-25 14:00:00
PAY02053	ORD02768	Card	23962.00	2024-11-15 01:00:00
PAY02054	ORD02769	Mobile Money	38177.68	2024-04-09 20:00:00
PAY02055	ORD02772	Cash on Delivery	6169.57	2024-07-01 12:00:00
PAY02058	ORD02776	Cash on Delivery	57745.17	2024-07-12 03:00:00
PAY02059	ORD02777	Mobile Money	170697.47	2024-09-11 12:00:00
PAY02060	ORD02778	Bank Transfer	298987.09	2024-03-29 21:00:00
PAY02061	ORD02779	Card	789376.88	2024-10-01 20:00:00
PAY02062	ORD02780	Cash on Delivery	2388424.82	2024-10-29 07:00:00
PAY02065	ORD02783	Card	88011.45	2024-12-04 00:00:00
PAY02066	ORD02784	Bank Transfer	102447.74	2024-10-07 10:00:00
PAY02067	ORD02785	Bank Transfer	3329.98	2024-10-22 14:00:00
PAY02068	ORD02786	Card	504259.73	2024-08-27 23:00:00
PAY02070	ORD02789	Card	622086.94	2024-10-09 17:00:00
PAY02071	ORD02790	Mobile Money	97086.56	2024-12-04 01:00:00
PAY02073	ORD02792	Card	772795.08	2024-05-22 12:00:00
PAY02074	ORD02794	Mobile Money	31709.48	2024-08-01 21:00:00
PAY02075	ORD02795	Bank Transfer	760793.62	2024-03-01 10:00:00
PAY02077	ORD02797	Mobile Money	27918.16	2023-11-21 18:00:00
PAY02078	ORD02798	Mobile Money	305522.26	2023-12-18 10:00:00
PAY02079	ORD02799	Mobile Money	273170.78	2023-11-17 05:00:00
PAY02083	ORD02803	Card	43039.35	2024-10-03 10:00:00
PAY02084	ORD02804	Bank Transfer	644680.18	2023-08-10 12:00:00
PAY02085	ORD02805	Mobile Money	656895.94	2024-12-13 12:00:00
PAY02087	ORD02807	Card	4038.10	2024-01-22 14:00:00
PAY02088	ORD02809	Card	181459.05	2023-09-05 07:00:00
PAY02090	ORD02811	Bank Transfer	17976.54	2024-08-05 02:00:00
PAY02091	ORD02812	Mobile Money	5994.32	2024-11-17 17:00:00
PAY02093	ORD02816	Card	158091.35	2023-10-30 09:00:00
PAY02094	ORD02818	Card	52486.04	2024-09-22 04:00:00
PAY02095	ORD02819	Card	22093.77	2023-08-26 17:00:00
PAY02096	ORD02820	Mobile Money	619843.72	2024-01-25 14:00:00
PAY02097	ORD02821	Mobile Money	117073.40	2024-06-25 22:00:00
PAY02099	ORD02823	Mobile Money	87588.60	2024-07-16 12:00:00
PAY02101	ORD02829	Bank Transfer	286376.81	2024-12-19 21:00:00
PAY02102	ORD02830	Bank Transfer	153518.44	2024-11-17 14:00:00
PAY02103	ORD02831	Card	105815.87	2024-09-29 08:00:00
PAY02105	ORD02833	Bank Transfer	841978.87	2024-12-22 15:00:00
PAY02106	ORD02834	Card	21277.86	2024-09-23 02:00:00
PAY02107	ORD02835	Mobile Money	614201.88	2024-10-05 21:00:00
PAY02109	ORD02837	Mobile Money	142961.41	2024-07-20 11:00:00
PAY02110	ORD02838	Bank Transfer	52486.04	2023-10-20 08:00:00
PAY02111	ORD02840	Mobile Money	44862.34	2024-05-20 19:00:00
PAY02113	ORD02842	Bank Transfer	272051.99	2024-07-13 04:00:00
PAY02115	ORD02846	Card	553178.86	2024-01-06 19:00:00
PAY02116	ORD02847	Card	199684.92	2023-07-11 16:00:00
PAY02117	ORD02849	Card	982884.07	2024-06-07 15:00:00
PAY02121	ORD02853	Mobile Money	194669.49	2024-09-15 08:00:00
PAY02124	ORD02856	Card	539592.87	2024-10-22 16:00:00
PAY02125	ORD02857	Card	1557795.44	2024-09-12 16:00:00
PAY02129	ORD02861	Cash on Delivery	508025.72	2024-08-11 03:00:00
PAY02130	ORD02865	Cash on Delivery	602198.00	2024-01-20 17:00:00
PAY02131	ORD02866	Bank Transfer	1633.04	2024-08-20 12:00:00
PAY02132	ORD02868	Bank Transfer	262877.04	2024-08-27 23:00:00
PAY02134	ORD02870	Card	193988.83	2024-09-14 17:00:00
PAY02135	ORD02871	Card	1454233.82	2024-10-13 20:00:00
PAY02136	ORD02872	Bank Transfer	36035.42	2024-09-20 09:00:00
PAY02137	ORD02873	Card	236487.25	2024-10-12 22:00:00
PAY02140	ORD02876	Cash on Delivery	1698546.23	2024-10-31 18:00:00
PAY02141	ORD02878	Bank Transfer	247085.24	2024-12-29 13:00:00
PAY02142	ORD02879	Card	687406.40	2023-10-23 21:00:00
PAY02145	ORD02882	Mobile Money	43501.45	2024-02-10 01:00:00
PAY02148	ORD02885	Card	26206.57	2024-03-03 23:00:00
PAY02150	ORD02888	Card	113221.27	2024-03-17 04:00:00
PAY02151	ORD02889	Cash on Delivery	776806.99	2024-07-08 04:00:00
PAY02152	ORD02890	Mobile Money	240879.20	2024-01-03 18:00:00
PAY02154	ORD02892	Card	527670.35	2024-07-16 05:00:00
PAY02155	ORD02894	Mobile Money	114123.99	2024-05-06 05:00:00
PAY02165	ORD02905	Card	231179.36	2024-09-27 12:00:00
PAY02149	ORD02886	Bank Transfer	51096.45	2024-03-24 01:00:00
PAY02158	ORD02897	Bank Transfer	573477.05	2024-07-20 18:00:00
PAY02159	ORD02898	Cash on Delivery	126318.52	2024-12-26 01:00:00
PAY02160	ORD02899	Card	606004.23	2024-06-27 08:00:00
PAY02161	ORD02900	Mobile Money	1110784.70	2024-08-18 06:00:00
PAY02189	ORD02936	Bank Transfer	81118.15	2024-12-10 20:00:00
PAY02163	ORD02903	Card	581859.80	2024-08-23 04:00:00
PAY02229	ORD02988	Mobile Money	184236.40	2023-12-24 05:00:00
PAY02166	ORD02907	Mobile Money	1583210.41	2024-11-03 18:00:00
PAY02197	ORD02945	Card	222324.51	2024-07-28 01:00:00
PAY02168	ORD02909	Mobile Money	88105.02	2024-03-11 01:00:00
PAY02169	ORD02911	Card	64966.29	2024-10-27 03:00:00
PAY02170	ORD02912	Cash on Delivery	649434.60	2024-03-22 04:00:00
PAY02171	ORD02913	Cash on Delivery	32521.50	2024-12-04 17:00:00
PAY02172	ORD02915	Card	1458423.30	2024-09-03 01:00:00
PAY02214	ORD02968	Card	666665.37	2024-08-31 12:00:00
PAY02175	ORD02919	Card	758332.90	2024-08-26 02:00:00
PAY02177	ORD02921	Bank Transfer	145167.24	2024-07-29 17:00:00
PAY02178	ORD02922	Cash on Delivery	38929.45	2024-12-21 09:00:00
PAY02179	ORD02923	Bank Transfer	952072.75	2024-08-26 21:00:00
PAY02180	ORD02924	Mobile Money	8757.97	2024-11-07 07:00:00
PAY02181	ORD02925	Cash on Delivery	290501.34	2024-08-28 05:00:00
PAY02183	ORD02928	Card	44137.50	2024-10-30 00:00:00
PAY02186	ORD02933	Mobile Money	69517.54	2024-11-14 06:00:00
PAY02187	ORD02934	Mobile Money	24683.24	2024-10-03 15:00:00
PAY02190	ORD02937	Card	45902.74	2024-09-02 20:00:00
PAY02191	ORD02938	Card	18483.24	2024-11-10 20:00:00
PAY02192	ORD02939	Card	69610.56	2024-10-17 20:00:00
PAY02193	ORD02940	Card	246866.05	2024-11-15 04:00:00
PAY02195	ORD02942	Cash on Delivery	494813.66	2024-10-23 17:00:00
PAY02198	ORD02946	Card	110681.85	2024-08-30 02:00:00
PAY02176	ORD02920	Cash on Delivery	5638.01	2024-06-20 03:00:00
PAY02200	ORD02949	Bank Transfer	646154.12	2024-07-06 14:00:00
PAY02201	ORD02950	Card	132529.29	2024-09-07 06:00:00
PAY02202	ORD02952	Bank Transfer	118060.60	2024-12-30 13:00:00
PAY02203	ORD02954	Mobile Money	456816.78	2024-09-16 15:00:00
PAY02204	ORD02955	Bank Transfer	29614.02	2024-12-02 13:00:00
PAY02207	ORD02958	Mobile Money	11276.02	2024-01-14 08:00:00
PAY02211	ORD02964	Card	8757.97	2024-05-30 19:00:00
PAY02213	ORD02966	Card	782053.66	2024-10-21 09:00:00
PAY02215	ORD02969	Card	150550.83	2024-08-02 02:00:00
PAY02216	ORD02970	Card	16010.80	2024-05-07 17:00:00
PAY02218	ORD02972	Mobile Money	1446927.23	2024-09-13 01:00:00
PAY02219	ORD02974	Bank Transfer	937404.21	2024-07-12 11:00:00
PAY02220	ORD02976	Cash on Delivery	3849.92	2024-10-16 21:00:00
PAY02221	ORD02977	Mobile Money	70592.32	2024-10-31 12:00:00
PAY02222	ORD02978	Cash on Delivery	73176.91	2024-10-04 05:00:00
PAY02223	ORD02979	Card	12599.24	2024-08-15 01:00:00
PAY02224	ORD02980	Card	202145.72	2024-09-06 07:00:00
PAY02225	ORD02981	Card	140213.78	2024-05-26 00:00:00
PAY02226	ORD02983	Card	194757.85	2024-07-15 00:00:00
PAY02227	ORD02984	Card	233857.94	2024-10-17 08:00:00
PAY02228	ORD02987	Cash on Delivery	300935.13	2024-08-28 15:00:00
PAY02230	ORD02989	Bank Transfer	26929.28	2024-05-30 14:00:00
PAY02231	ORD02991	Mobile Money	249606.15	2023-11-06 22:00:00
PAY02232	ORD02992	Card	213156.97	2024-01-08 11:00:00
PAY02234	ORD02996	Bank Transfer	756814.31	2024-04-30 00:00:00
PAY02235	ORD02997	Cash on Delivery	126350.44	2024-03-10 04:00:00
PAY02236	ORD02998	Bank Transfer	150088.30	2023-08-08 13:00:00
PAY02238	ORD03000	Card	1071290.74	2024-02-16 01:00:00
PAY02239	ORD03001	Mobile Money	361991.39	2023-03-25 02:00:00
PAY02241	ORD03003	Bank Transfer	29754.99	2024-10-22 01:00:00
PAY02244	ORD03006	Mobile Money	697032.82	2024-11-19 06:00:00
PAY02245	ORD03007	Card	854934.30	2024-11-08 00:00:00
PAY02246	ORD03008	Mobile Money	423407.40	2024-12-01 02:00:00
PAY02251	ORD00390	Cash on Delivery	46462.10	2024-12-19 01:00:00
PAY02252	ORD00930	Cash on Delivery	310936.87	2024-04-11 02:00:00
PAY02259	ORD00969	Mobile Money	176857.47	2023-11-02 23:00:00
PAY02262	ORD01723	Cash on Delivery	994838.80	2024-02-13 11:00:00
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (product_id, product_name, category, unit_price, seller_id) FROM stdin;
PROD0043	Ladies' Bodycon Dress Floral	Fashion	16739.67	SELL074
PROD0044	Men's Chinos Slim Fit Trouser	Fashion	32574.27	SELL032
PROD0046	Unisex Sneakers Nike Air Max	Fashion	5762.47	SELL053
PROD0049	Boys' School Uniform Set	Fashion	27088.42	SELL051
PROD0051	Men's Agbada Senator Suit Set	Fashion	33329.69	SELL021
PROD0052	Women's Gele Head Tie Aso-Oke	Fashion	23501.69	SELL059
PROD0053	Unisex Denim Jacket Blue	Fashion	43609.38	SELL068
PROD0054	Men's Polo Shirt Slim Fit	Fashion	31709.48	SELL005
PROD0246	Oxford Advanced Learner Dictionary	Books & Stationery	5399.76	SELL005
PROD0247	Accounting Principles Textbook	Books & Stationery	5416.29	SELL082
PROD0248	Biology for Senior Secondary	Books & Stationery	4809.30	SELL007
PROD0249	Ballpoint Pens Blue Box of 50	Books & Stationery	774.24	SELL026
PROD0250	Ruled Exercise Books Pack of 10	Books & Stationery	4620.81	SELL012
PROD0251	Stapler Heavy Duty 24/6	Books & Stationery	5175.86	SELL044
PROD0252	Scientific Calculator Casio FX-991	Books & Stationery	8223.52	SELL013
PROD0253	A4 Printing Paper 80gsm 500 Sheets	Books & Stationery	8743.34	SELL066
PROD0254	Spiral Notebook Hardcover A5	Books & Stationery	9824.37	SELL081
PROD0255	Highlighter Set 6 Colours	Books	7571.15	SELL051
PROD0257	English Grammar in Use Murphy	Books & Stationery	2248.73	SELL041
PROD0259	Sticky Notes Set 4 Colours 400PC	Books & Stationery	7869.35	SELL009
PROD0260	Atlas of Nigeria Schools Edition	Books & Stationery	5050.94	SELL064
PROD0261	Things Fall Apart Chinua Achebe - v2	Books & Stationery	8607.87	SELL073
PROD0262	Purple Hibiscus Chimamanda Adichie - v2	Books	3172.89	SELL042
PROD0263	Half of a Yellow Sun Adichie - v2	Books & Stationery	8199.23	SELL089
PROD0266	Oxford Advanced Learner Dictionary - v2	Books	408.26	SELL058
PROD0267	Accounting Principles Textbook - v2	Books & Stationery	6230.11	SELL065
PROD0270	Ruled Exercise Books Pack of 10 - v2	Books & Stationery	907.09	SELL038
PROD0271	Stapler Heavy Duty 24/6 - v2	Books & Stationery	1989.71	SELL005
PROD0082	Blender Juicer 1.5L 600W	Home & Garden	54346.36	SELL019
PROD0086	Bed Sheet Set Queen Size Cotton	Home & Garden	49202.47	SELL071
PROD0092	Indoor Plant Pot Set Ceramic	Home & Garden	140982.24	SELL055
PROD0094	Microwave Oven 20L Digital	Home & Garden	117897.53	SELL008
PROD0001	Samsung Galaxy A54 Smartphone 128GB	Electronics	279610.57	SELL021
PROD0004	HP Pavilion 15 Laptop Intel i5	Electronics	39811.79	SELL064
PROD0005	Lenovo IdeaPad 3 Laptop 8GB RAM	Electronics	85978.02	SELL003
PROD0006	JBL Bluetooth Speaker Portable	Electronics	308912.61	SELL021
PROD0007	Anker PowerBank 20000mAh USB-C	Electronics	290642.30	SELL005
PROD0008	TP-Link WiFi Router AC1200	Electronics	121518.49	SELL030
PROD0009	Canon PIXMA Inkjet Printer	Electronics	198883.60	SELL044
PROD0240	Zobo Hibiscus Drink 1.5L - v2	Food & Beverages	10219.29	SELL060
PROD0010	Sony WH-1000XM5 Headphones	Electronics	270434.00	SELL072
PROD0011	Apple AirPods Pro 2nd Gen	Electronics	314229.61	SELL066
PROD0269	Ballpoint Pens Blue Box of 50 - v2	Books & Stationery	2989.48	SELL032
PROD0194	Pull Up Bar Door Frame - v2	Sports & Fitness	24802.59	SELL039
PROD0195	Tennis Racket Beginner Aluminium - v2	Sports & Fitness	24091.13	SELL018
PROD0201	Milo Chocolate Drink 900g Tin	Food & Beverages	10976.40	SELL011
PROD0204	Lipton Yellow Label Tea 100 Bags	Food & Beverages	5933.15	SELL017
PROD0032	Samsung 43 inch Smart TV - v2	Electronics	246601.80	SELL027
PROD0033	Hisense 32 inch LED TV - v2	Electronics	245627.48	SELL084
PROD0100	Doormat Anti-Slip Rubber	Home & Garden	110269.71	SELL041
PROD0101	Non-Stick Cooking Pot Set 5PC - v2	Home & Garden	114695.41	SELL058
PROD0102	Blender Juicer 1.5L 600W - v2	Home & Garden	45021.16	SELL044
PROD0103	Pressure Cooker 7 Litre Stainless - v2	Home & Garden	83304.08	SELL003
PROD0106	Bed Sheet Set Queen Size Cotton - v2	Home & Garden	137481.28	SELL084
PROD0241	Things Fall Apart Chinua Achebe	Books & Stationery	1174.07	SELL057
PROD0242	Purple Hibiscus Chimamanda Adichie	Books & Stationery	5755.30	SELL021
PROD0244	WAEC Past Questions Math 2023	Books & Stationery	1664.99	SELL022
PROD0120	Doormat Anti-Slip Rubber - v2	Home & Garden	35341.43	SELL089
PROD0121	Shea Butter Moisturiser 500ml	Beauty	17176.67	SELL001
PROD0123	Vitamin C Face Serum 30ml	Beauty & Personal Care	11097.43	SELL036
PROD0124	Argan Oil Hair Treatment 100ml	Beauty & Personal Care	17164.25	SELL047
PROD0125	Electric Face Cleanser Brush	Beauty	22153.16	SELL036
PROD0126	Men's Grooming Kit 8 Piece	Beauty & Personal Care	13544.05	SELL051
PROD0127	Natural Deodorant Roll-On 75ml	Beauty & Personal Care	8700.29	SELL004
PROD0128	Teeth Whitening Kit LED Light	Beauty & Personal Care	24463.34	SELL010
PROD0129	Facial Sunscreen SPF50 50ml	Beauty & Personal Care	5323.48	SELL009
PROD0131	Lip Gloss Set 12 Colours	Beauty & Personal Care	21092.44	SELL061
PROD0132	Foundation Stick Matte Finish	Beauty & Personal Care	23990.67	SELL043
PROD0133	Lash & Brow Growth Serum	Beauty	23616.92	SELL080
PROD0134	Body Scrub Sugar Vanilla 300g	Beauty & Personal Care	19220.41	SELL075
PROD0135	Perfume Eau de Toilette 100ml	Beauty	2595.60	SELL005
PROD0136	Nail Polish Set 24 Colours	Beauty & Personal Care	8175.35	SELL009
PROD0138	Charcoal Peel Off Face Mask	Beauty & Personal Care	15463.10	SELL014
PROD0139	Hair Relaxer Cream Mild 500g	Beauty	14201.82	SELL049
PROD0140	Beard Oil & Balm Combo Pack	Beauty & Personal Care	2847.84	SELL030
PROD0141	Shea Butter Moisturiser 500ml - v2	Beauty & Personal Care	11608.58	SELL055
PROD0045	Women's High Waist Palazzo Pants	Fashion	15761.34	SELL047
PROD0142	African Black Soap Bar 200g - v2	Beauty	8820.60	SELL004
PROD0143	Vitamin C Face Serum 30ml - v2	Beauty & Personal Care	13171.72	SELL014
PROD0144	Argan Oil Hair Treatment 100ml - v2	Beauty & Personal Care	801.07	SELL076
PROD0146	Men's Grooming Kit 8 Piece - v2	Beauty	9207.08	SELL080
PROD0147	Natural Deodorant Roll-On 75ml - v2	Beauty & Personal Care	5055.12	SELL006
PROD0149	Facial Sunscreen SPF50 50ml - v2	Beauty & Personal Care	8124.11	SELL019
PROD0151	Lip Gloss Set 12 Colours - v2	Beauty & Personal Care	24271.64	SELL085
PROD0152	Foundation Stick Matte Finish - v2	Beauty & Personal Care	1904.28	SELL072
PROD0153	Lash & Brow Growth Serum - v2	Beauty & Personal Care	10840.50	SELL026
PROD0154	Body Scrub Sugar Vanilla 300g - v2	Beauty	19738.96	SELL086
PROD0157	Rose Water Toner 200ml - v2	Beauty & Personal Care	10758.03	SELL059
PROD0158	Charcoal Peel Off Face Mask - v2	Beauty & Personal Care	12650.30	SELL082
PROD0159	Hair Relaxer Cream Mild 500g - v2	Beauty & Personal Care	17483.90	SELL028
PROD0162	Resistance Bands Set 5 Levels	Sports & Fitness	2672.21	SELL072
PROD0166	Football Size 5 Adidas	Sports & Fitness	101932.80	SELL026
PROD0167	Basketball Indoor Outdoor Size 7	Sports & Fitness	22365.17	SELL013
PROD0168	Badminton Racket Set 2 Player	Sports & Fitness	100026.32	SELL084
PROD0169	Swimming Goggles Anti-Fog	Sports & Fitness	41598.42	SELL059
PROD0170	Cycling Helmet Adjustable	Sports	45302.42	SELL022
PROD0171	Gym Gloves Weightlifting Pair	Sports & Fitness	105588.96	SELL019
PROD0173	Exercise Bike Magnetic Resistance	Sports & Fitness	39177.27	SELL082
PROD0056	Kids' Rain Boots Waterproof	Fashion	6299.62	SELL038
PROD0057	Women's Handbag Leather Tote	Fashion	24240.82	SELL040
PROD0058	Men's Wristwatch Stainless Steel	Fashion	14691.81	SELL019
PROD0059	Unisex Baseball Cap Adjustable	Fashion	35594.97	SELL040
PROD0060	Women's Sunglasses UV400	Fashion	10877.79	SELL063
PROD0062	Women's Lace Blouse Embroidered - v2	Fashion	22431.17	SELL058
PROD0063	Ladies' Bodycon Dress Floral - v2	Fashion	35488.70	SELL078
PROD0065	Women's High Waist Palazzo Pants - v2	Fashion	30524.10	SELL042
PROD0067	Men's Leather Oxford Shoes - v2	Fashion	11627.77	SELL070
PROD0068	Women's Block Heel Sandals - v2	Fashion	43176.46	SELL036
PROD0069	Boys' School Uniform Set - v2	Fashion	39168.98	SELL074
PROD0070	Girls' Party Dress Tulle - v2	Fashion	25905.43	SELL072
PROD0071	Men's Agbada Senator Suit Set - v2	Fashion	9870.56	SELL074
PROD0072	Women's Gele Head Tie Aso-Oke - v2	Fashion	43142.24	SELL061
PROD0073	Unisex Denim Jacket Blue - v2	Fashion	6732.32	SELL024
PROD0076	Kids' Rain Boots Waterproof - v2	Fashion	27116.85	SELL003
PROD0077	Women's Handbag Leather Tote - v2	Fashion	20510.26	SELL068
PROD0078	Men's Wristwatch Stainless Steel - v2	Fashion	18117.48	SELL013
PROD0095	Electric Kettle 1.8L Stainless	Home & Garden	49921.23	SELL088
PROD0105	Wall Clock Modern Minimalist - v2	Home & Garden	162358.65	SELL053
PROD0107	Curtain Blackout Window 2 Panels - v2	Home & Garden	97418.23	SELL086
PROD0110	Wooden Bookshelf 5-Tier - v2	Home & Garden	23332.73	SELL025
PROD0115	Electric Kettle 1.8L Stainless - v2	Home & Garden	2277.24	SELL082
PROD0174	Pull Up Bar Door Frame	Sports & Fitness	110640.11	SELL076
PROD0176	Sports Compression Shorts	Sports & Fitness	30789.84	SELL036
PROD0177	Foam Roller Muscle Recovery	Sports & Fitness	102403.06	SELL063
PROD0178	Treadmill Foldable Electric 1HP	Sports & Fitness	87684.88	SELL085
PROD0181	Yoga Mat Non-Slip 6mm Thick - v2	Sports	63768.87	SELL064
PROD0182	Resistance Bands Set 5 Levels - v2	Sports & Fitness	33297.75	SELL075
PROD0183	Adjustable Dumbbell Set 20KG - v2	Sports & Fitness	26053.15	SELL058
PROD0184	Jump Rope Speed Adjustable - v2	Sports & Fitness	48414.15	SELL049
PROD0185	Nike Air Zoom Running Shoes - v2	Sports & Fitness	112356.62	SELL071
PROD0189	Swimming Goggles Anti-Fog - v2	Sports & Fitness	96833.78	SELL049
PROD0191	Gym Gloves Weightlifting Pair - v2	Sports & Fitness	44052.51	SELL065
PROD0192	Protein Shaker Bottle 700ml - v2	Sports & Fitness	94625.99	SELL013
PROD0196	Sports Compression Shorts - v2	Sports	2511.26	SELL045
PROD0197	Foam Roller Muscle Recovery - v2	Sports & Fitness	113579.08	SELL084
PROD0198	Treadmill Foldable Electric 1HP - v2	Sports	57432.47	SELL020
PROD0199	Boxing Gloves 12oz Leather - v2	Sports	28468.05	SELL027
PROD0200	Volleyball Beach Ball Set - v2	Sports	29196.20	SELL071
PROD0024	HP Pavilion 15 Laptop Intel i5 - v2	Electronics	321716.92	SELL067
PROD0025	Lenovo IdeaPad 3 Laptop 8GB RAM - v2	Electronics	330590.39	SELL002
PROD0027	Anker PowerBank 20000mAh USB-C - v2	Electronics	26206.57	SELL085
PROD0028	TP-Link WiFi Router AC1200 - v2	Electronics	316366.34	SELL081
PROD0029	Canon PIXMA Inkjet Printer - v2	Electronics	149660.33	SELL090
PROD0030	Sony WH-1000XM5 Headphones - v2	Electronics	253935.11	SELL045
PROD0031	Apple AirPods Pro 2nd Gen - v2	Electronics	290316.23	SELL079
PROD0034	Xiaomi Mi Band 7 Smartwatch - v2	Electronics	272513.12	SELL011
PROD0035	Garmin Forerunner 255 Watch - v2	Electronics	190414.55	SELL017
PROD0036	Seagate 1TB External Hard Drive - v2	Electronics	78738.41	SELL040
PROD0037	Kingston 256GB USB Flash Drive - v2	Electronics	266180.98	SELL004
PROD0116	Iron Box Steam 2400W Dry - v2	Home & Garden	20859.43	SELL065
PROD0122	African Black Soap Bar 200g	Beauty & Personal Care	16203.67	SELL007
PROD0130	Keratin Hair Straightener Brush	Beauty & Personal Care	1182.88	SELL004
PROD0202	Golden Morn Maize Cereal 1KG	Food	12764.12	SELL090
PROD0203	Indomie Noodles Instant 40 Pack	Food & Beverages	3538.98	SELL072
PROD0206	Organic Honey Raw Unfiltered 500g	Food	5427.42	SELL088
PROD0208	Tomato Paste Canned 400g x6	Food & Beverages	9010.85	SELL005
PROD0209	Bournvita Malted Drink 900g	Food	2728.52	SELL043
PROD0210	Peak Whole Milk Powder 900g	Food & Beverages	14712.50	SELL051
PROD0212	Dates Medjool Premium 500g	Food & Beverages	8757.97	SELL039
PROD0213	Garri White Fine 10KG Bag	Food & Beverages	2985.64	SELL023
PROD0214	Semovita Semolina 5KG Bag	Food & Beverages	12483.89	SELL004
PROD0216	Egusi Ground Melon Seeds 500g	Food & Beverages	3485.44	SELL068
PROD0217	Crayfish Dried Ground 200g	Food & Beverages	7092.62	SELL002
PROD0218	Suya Spice Mix Authentic 100g	Food & Beverages	5238.20	SELL051
PROD0079	Unisex Baseball Cap Adjustable - v2	Fashion	13912.80	SELL012
PROD0080	Women's Sunglasses UV400 - v2	Fashion	14845.55	SELL022
PROD0081	Non-Stick Cooking Pot Set 5PC	Home & Garden	110991.10	SELL004
PROD0160	Beard Oil & Balm Combo Pack - v2	Beauty	12278.28	SELL043
PROD0083	Pressure Cooker 7 Litre Stainless	Home & Garden	160848.97	SELL016
PROD0089	Ceramic Dinner Set 24 Piece	Home & Garden	45090.58	SELL017
PROD0090	Wooden Bookshelf 5-Tier	Home & Garden	102715.97	SELL082
PROD0243	Half of a Yellow Sun Adichie	Books & Stationery	10094.25	SELL023
PROD0256	Geometry Set Complete Maths	Books & Stationery	1625.49	SELL046
PROD0265	JAMB CBT Practice Questions - v2	Books & Stationery	11740.65	SELL009
PROD0268	Biology for Senior Secondary - v2	Books & Stationery	2944.75	SELL016
PROD0003	Infinix Hot 30 Play Smartphone	Electronics	49538.31	SELL078
PROD0012	Samsung 43 inch Smart TV	Electronics	248709.70	SELL057
PROD0016	Seagate 1TB External Hard Drive	Electronics	256280.50	SELL065
PROD0018	Logitech MX Master 3 Mouse	Electronics	120439.60	SELL026
PROD0022	Tecno Camon 20 Pro Phone - v2	Electronics	222156.94	SELL068
PROD0023	Infinix Hot 30 Play Smartphone - v2	Electronics	276589.43	SELL055
PROD0026	JBL Bluetooth Speaker Portable - v2	Electronics	34248.48	SELL022
PROD0104	Standing Fan 18 inch 5-Speed - v2	Home & Garden	73744.65	SELL061
PROD0088	Kitchen Knife Set 7 Piece	Home & Garden	73744.65	SELL071
PROD0205	Ribena Blackcurrant Drink 1L	Food & Beverages	7224.75	SELL085
PROD0245	JAMB CBT Practice Questions	Books & Stationery	5638.01	SELL035
PROD0075	Women's Ankara Maxi Skirt - v2	Fashion	5182.19	SELL042
PROD0273	A4 Printing Paper 80gsm 500 Sheets - v2	Books	1784.35	SELL006
PROD0274	Spiral Notebook Hardcover A5 - v2	Books & Stationery	7846.95	SELL004
PROD0275	Highlighter Set 6 Colours - v2	Books & Stationery	10193.83	SELL032
PROD0276	Geometry Set Complete Maths - v2	Books & Stationery	6563.88	SELL086
PROD0277	English Grammar in Use Murphy - v2	Books	9657.13	SELL029
PROD0278	Business Law Nigerian Edition - v2	Books & Stationery	6353.37	SELL081
PROD0279	Sticky Notes Set 4 Colours 400PC - v2	Books & Stationery	962.48	SELL025
PROD0280	Atlas of Nigeria Schools Edition - v2	Books & Stationery	7685.53	SELL027
PROD0272	Scientific Calculator Casio FX-991 - v2	Books & Stationery	11096.23	SELL057
PROD0228	Tomato Paste Canned 400g x6 - v2	Food	6170.81	SELL023
PROD0229	Bournvita Malted Drink 900g - v2	Food	4112.45	SELL056
PROD0230	Peak Whole Milk Powder 900g - v2	Food & Beverages	6077.64	SELL090
PROD0231	Cashew Nuts Premium 500g Pack - v2	Food & Beverages	6206.49	SELL031
PROD0232	Dates Medjool Premium 500g - v2	Food & Beverages	4469.76	SELL038
PROD0233	Garri White Fine 10KG Bag - v2	Food	10621.64	SELL028
PROD0235	Ofada Rice Local Premium 10KG - v2	Food	1609.74	SELL042
PROD0236	Egusi Ground Melon Seeds 500g - v2	Food & Beverages	7038.57	SELL065
PROD0237	Crayfish Dried Ground 200g - v2	Food	7201.43	SELL089
PROD0238	Suya Spice Mix Authentic 100g - v2	Food	6026.76	SELL025
PROD0019	Mechanical Keyboard RGB Backlit	Electronics	339524.65	SELL001
PROD0020	Ring Doorbell Video Security Cam	Electronics	293010.61	SELL037
PROD0021	Samsung Galaxy A54 Smartphone 128GB - v2	Electronics	34405.68	SELL054
PROD0156	Nail Polish Set 24 Colours - v2	Beauty & Personal Care	21374.21	SELL043
PROD0161	Yoga Mat Non-Slip 6mm Thick	Sports & Fitness	25829.99	SELL001
PROD0163	Adjustable Dumbbell Set 20KG	Sports & Fitness	18374.63	SELL081
PROD0164	Jump Rope Speed Adjustable	Sports & Fitness	6702.72	SELL026
PROD0165	Nike Air Zoom Running Shoes	Sports & Fitness	22136.37	SELL023
PROD0172	Protein Shaker Bottle 700ml	Sports & Fitness	95695.43	SELL049
PROD0002	Tecno Camon 20 Pro Phone	Electronics	102447.74	SELL086
PROD0099	Air Purifier HEPA Filter	Home & Garden	130788.21	SELL056
PROD0175	Tennis Racket Beginner Aluminium	Sports & Fitness	102750.60	SELL020
PROD0179	Boxing Gloves 12oz Leather	Sports & Fitness	21340.87	SELL083
PROD0180	Volleyball Beach Ball Set	Sports & Fitness	60582.65	SELL042
PROD0186	Football Size 5 Adidas - v2	Sports & Fitness	17418.14	SELL057
PROD0187	Basketball Indoor Outdoor Size 7 - v2	Sports & Fitness	28776.04	SELL066
PROD0188	Badminton Racket Set 2 Player - v2	Sports & Fitness	51993.13	SELL053
PROD0193	Exercise Bike Magnetic Resistance - v2	Sports & Fitness	9954.82	SELL026
PROD0207	Groundnut Oil Refined 5 Litres	Food & Beverages	11561.20	SELL039
PROD0211	Cashew Nuts Premium 500g Pack	Food & Beverages	8250.11	SELL014
PROD0084	Standing Fan 18 inch 5-Speed	Home & Garden	37258.14	SELL076
PROD0085	Wall Clock Modern Minimalist	Home & Garden	89243.32	SELL050
PROD0087	Curtain Blackout Window 2 Panels	Home & Garden	12717.02	SELL082
PROD0091	Garden Hose 30m Expandable	Home & Garden	141135.80	SELL070
PROD0093	LED Desk Lamp USB Rechargeable	Home & Garden	8480.78	SELL080
PROD0096	Iron Box Steam 2400W Dry	Home & Garden	179864.29	SELL028
PROD0097	Washing Machine 7KG Front Load	Home & Garden	9141.77	SELL073
PROD0098	Refrigerator 200L Double Door	Home & Garden	54814.26	SELL016
PROD0137	Rose Water Toner 200ml	Beauty & Personal Care	2019.05	SELL008
PROD0145	Electric Face Cleanser Brush - v2	Beauty & Personal Care	22657.06	SELL066
PROD0148	Teeth Whitening Kit LED Light - v2	Beauty & Personal Care	3628.18	SELL066
PROD0150	Keratin Hair Straightener Brush - v2	Beauty & Personal Care	12003.33	SELL038
PROD0155	Perfume Eau de Toilette 100ml - v2	Beauty & Personal Care	17522.15	SELL077
PROD0047	Men's Leather Oxford Shoes	Fashion	5512.81	SELL017
PROD0048	Women's Block Heel Sandals	Fashion	10843.12	SELL087
PROD0050	Girls' Party Dress Tulle	Fashion	26917.21	SELL057
PROD0038	Logitech MX Master 3 Mouse - v2	Electronics	88262.22	SELL055
PROD0039	Mechanical Keyboard RGB Backlit - v2	Electronics	257535.23	SELL034
PROD0041	Men's Ankara Print Kaftan XL	Fashion	14461.31	SELL059
PROD0042	Women's Lace Blouse Embroidered	Fashion	44258.35	SELL075
PROD0055	Women's Ankara Maxi Skirt	Fashion	42567.03	SELL016
PROD0258	Business Law Nigerian Edition	Books & Stationery	4792.40	SELL009
PROD0264	WAEC Past Questions Math 2023 - v2	Books & Stationery	4118.15	SELL089
PROD0190	Cycling Helmet Adjustable - v2	Sports & Fitness	22778.54	SELL083
PROD0040	Ring Doorbell Video Security Cam - v2	Electronics	47715.49	SELL016
PROD0061	Men's Ankara Print Kaftan XL - v2	Fashion	6821.26	SELL006
PROD0064	Men's Chinos Slim Fit Trouser - v2	Fashion	34644.88	SELL059
PROD0066	Unisex Sneakers Nike Air Max - v2	Fashion	36291.81	SELL053
PROD0074	Men's Polo Shirt Slim Fit - v2	Fashion	13460.87	SELL075
PROD0219	Palm Oil Red Refined 5L	Food	14849.13	SELL054
PROD0220	Zobo Hibiscus Drink 1.5L	Food & Beverages	11275.57	SELL027
PROD0221	Milo Chocolate Drink 900g Tin - v2	Food	13121.51	SELL086
PROD0222	Golden Morn Maize Cereal 1KG - v2	Food & Beverages	2802.33	SELL040
PROD0223	Indomie Noodles Instant 40 Pack - v2	Food & Beverages	7785.89	SELL036
PROD0224	Lipton Yellow Label Tea 100 Bags - v2	Food	607.93	SELL009
PROD0225	Ribena Blackcurrant Drink 1L - v2	Food	9270.30	SELL043
PROD0108	Kitchen Knife Set 7 Piece - v2	Home & Garden	121332.02	SELL049
PROD0109	Ceramic Dinner Set 24 Piece - v2	Home & Garden	70228.44	SELL090
PROD0111	Garden Hose 30m Expandable - v2	Home & Garden	2676.03	SELL036
PROD0112	Indoor Plant Pot Set Ceramic - v2	Home & Garden	35280.59	SELL081
PROD0113	LED Desk Lamp USB Rechargeable - v2	Home & Garden	145706.19	SELL064
PROD0114	Microwave Oven 20L Digital - v2	Home & Garden	7586.49	SELL078
PROD0117	Washing Machine 7KG Front Load - v2	Home & Garden	31515.40	SELL073
PROD0118	Refrigerator 200L Double Door - v2	Home & Garden	12699.55	SELL009
PROD0119	Air Purifier HEPA Filter - v2	Home & Garden	47472.78	SELL030
PROD0013	Hisense 32 inch LED TV	Electronics	337113.25	SELL014
PROD0014	Xiaomi Mi Band 7 Smartwatch	Electronics	289145.53	SELL014
PROD0015	Garmin Forerunner 255 Watch	Electronics	222324.51	SELL047
PROD0017	Kingston 256GB USB Flash Drive	Electronics	257730.40	SELL083
PROD0215	Ofada Rice Local Premium 10KG	Food & Beverages	3385.48	SELL050
PROD0226	Organic Honey Raw Unfiltered 500g - v2	Food & Beverages	7172.97	SELL012
PROD0227	Groundnut Oil Refined 5 Litres - v2	Food & Beverages	9871.34	SELL045
PROD0234	Semovita Semolina 5KG Bag - v2	Food & Beverages	6463.53	SELL016
PROD0239	Palm Oil Red Refined 5L - v2	Food & Beverages	1047.73	SELL018
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (review_id, product_id, customer_id, order_id, rating, review_date) FROM stdin;
REV00001	PROD0247	CUST0002	ORD00002	4	2024-09-21
REV00002	PROD0247	CUST0003	ORD00004	2	2023-12-22
REV00003	PROD0060	CUST0004	ORD00009	4	2024-05-12
REV00004	PROD0036	CUST0004	ORD00012	4	2024-06-03
REV00005	PROD0069	CUST0004	ORD00013	1	2024-12-31
REV00006	PROD0031	CUST0004	ORD00014	4	2024-02-22
REV00007	PROD0267	CUST0004	ORD00017	5	2024-01-16
REV00008	PROD0244	CUST0008	ORD00024	4	2023-09-28
REV00009	PROD0189	CUST0008	ORD00026	4	2023-11-08
REV00010	PROD0114	CUST0008	ORD00027	2	2024-11-16
REV00011	PROD0075	CUST0009	ORD00028	5	2023-10-14
REV00012	PROD0053	CUST0012	ORD00033	5	2024-06-29
REV00013	PROD0275	CUST0014	ORD00038	4	2024-11-30
REV00014	PROD0066	CUST0014	ORD00040	3	2024-08-21
REV00015	PROD0275	CUST0017	ORD00045	3	2023-07-17
REV00016	PROD0034	CUST0018	ORD00047	5	2024-01-04
REV00017	PROD0058	CUST0022	ORD00057	3	2024-10-23
REV00018	PROD0056	CUST0024	ORD00062	1	2024-08-04
REV00019	PROD0219	CUST0029	ORD00070	1	2024-07-15
REV00020	PROD0021	CUST0031	ORD00082	2	2024-07-17
REV00021	PROD0108	CUST0031	ORD00083	4	2024-07-16
REV00022	PROD0197	CUST0034	ORD00094	4	2024-04-16
REV00023	PROD0171	CUST0034	ORD00095	3	2023-11-09
REV00024	PROD0147	CUST0034	ORD00097	3	2024-06-06
REV00025	PROD0140	CUST0040	ORD00107	4	2024-11-06
REV00026	PROD0172	CUST0040	ORD00109	4	2024-08-20
REV00027	PROD0104	CUST0040	ORD00110	3	2023-10-02
REV00028	PROD0119	CUST0040	ORD00114	3	2023-07-12
REV00029	PROD0152	CUST0041	ORD00118	5	2023-05-24
REV00030	PROD0243	CUST0041	ORD00119	3	2024-02-18
REV00031	PROD0192	CUST0041	ORD00121	5	2023-06-26
REV00032	PROD0206	CUST0044	ORD00123	4	2024-04-06
REV00033	PROD0075	CUST0044	ORD00124	1	2024-10-04
REV00034	PROD0232	CUST0044	ORD00126	2	2024-03-15
REV00035	PROD0002	CUST0046	ORD00130	5	2024-06-09
REV00036	PROD0190	CUST0047	ORD00132	3	2024-03-23
REV00037	PROD0004	CUST0049	ORD00138	5	2024-07-22
REV00038	PROD0145	CUST0052	ORD00146	3	2023-11-25
REV00039	PROD0082	CUST0054	ORD00149	5	2024-03-03
REV00040	PROD0016	CUST0055	ORD00150	1	2023-09-02
REV00041	PROD0160	CUST0058	ORD00152	3	2024-11-27
REV00042	PROD0166	CUST0058	ORD00155	1	2024-08-29
REV00043	PROD0034	CUST0058	ORD00157	5	2024-03-22
REV00044	PROD0232	CUST0059	ORD00159	5	2024-11-05
REV00045	PROD0009	CUST0059	ORD00161	5	2024-08-03
REV00046	PROD0195	CUST0061	ORD00165	4	2024-07-24
REV00047	PROD0212	CUST0061	ORD00166	4	2024-12-12
REV00048	PROD0097	CUST0061	ORD00170	5	2024-08-13
REV00049	PROD0196	CUST0062	ORD00173	3	2024-05-25
REV00050	PROD0088	CUST0063	ORD00179	4	2024-04-12
REV00051	PROD0185	CUST0064	ORD00183	5	2024-11-27
REV00052	PROD0022	CUST0065	ORD00184	5	2024-12-25
REV00053	PROD0001	CUST0066	ORD00187	2	2024-09-10
REV00054	PROD0155	CUST0067	ORD00190	5	2024-12-18
REV00055	PROD0266	CUST0069	ORD00194	4	2024-12-31
REV00056	PROD0028	CUST0069	ORD00196	5	2024-12-28
REV00057	PROD0035	CUST0071	ORD00197	3	2023-10-07
REV00058	PROD0093	CUST0072	ORD00205	5	2024-08-23
REV00059	PROD0130	CUST0075	ORD00208	4	2024-11-05
REV00060	PROD0037	CUST0076	ORD00210	5	2024-12-31
REV00061	PROD0169	CUST0077	ORD00215	4	2024-10-11
REV00062	PROD0121	CUST0081	ORD00225	4	2024-03-10
REV00063	PROD0278	CUST0081	ORD00228	4	2024-10-16
REV00064	PROD0148	CUST0081	ORD00230	5	2024-12-02
REV00065	PROD0186	CUST0082	ORD00232	5	2024-06-09
REV00066	PROD0226	CUST0083	ORD00234	5	2024-10-22
REV00067	PROD0209	CUST0083	ORD00239	5	2024-08-14
REV00068	PROD0109	CUST0084	ORD00240	4	2024-10-05
REV00069	PROD0276	CUST0087	ORD00245	4	2024-01-25
REV00070	PROD0161	CUST0090	ORD00254	3	2024-06-02
REV00071	PROD0136	CUST0093	ORD00260	5	2024-01-02
REV00072	PROD0223	CUST0093	ORD00261	2	2024-01-29
REV00073	PROD0048	CUST0099	ORD00274	4	2023-07-26
REV00074	PROD0009	CUST0099	ORD00275	1	2024-08-20
REV00075	PROD0119	CUST0100	ORD00276	5	2024-06-21
REV00076	PROD0160	CUST0100	ORD00278	4	2024-12-16
REV00077	PROD0269	CUST0100	ORD00281	3	2024-07-03
REV00078	PROD0235	CUST0101	ORD00285	3	2023-05-08
REV00079	PROD0001	CUST0102	ORD00289	5	2023-10-06
REV00080	PROD0268	CUST0102	ORD00291	4	2024-04-15
REV00081	PROD0008	CUST0105	ORD00298	4	2023-05-29
REV00082	PROD0180	CUST0105	ORD00300	4	2024-07-03
REV00083	PROD0096	CUST0106	ORD00301	4	2024-06-05
REV00084	PROD0195	CUST0107	ORD00302	3	2024-10-21
REV00085	PROD0258	CUST0107	ORD00305	3	2024-12-18
REV00086	PROD0194	CUST0107	ORD00307	3	2024-10-11
REV00087	PROD0105	CUST0110	ORD00313	4	2024-09-29
REV00088	PROD0202	CUST0111	ORD00314	4	2024-11-22
REV00089	PROD0278	CUST0114	ORD00325	4	2024-11-22
REV00090	PROD0125	CUST0116	ORD00330	1	2024-11-29
REV00091	PROD0033	CUST0116	ORD00333	4	2024-03-13
REV00092	PROD0207	CUST0117	ORD00335	5	2024-12-05
REV00093	PROD0082	CUST0119	ORD00338	2	2023-11-16
REV00094	PROD0274	CUST0121	ORD00347	4	2024-05-25
REV00095	PROD0156	CUST0123	ORD00353	5	2024-03-21
REV00096	PROD0101	CUST0123	ORD00360	1	2024-06-20
REV00097	PROD0141	CUST0124	ORD00363	5	2024-12-24
REV00098	PROD0214	CUST0126	ORD00367	5	2024-04-09
REV00099	PROD0158	CUST0126	ORD00368	3	2024-06-27
REV00100	PROD0193	CUST0127	ORD00372	4	2024-11-22
REV00101	PROD0112	CUST0129	ORD00385	5	2024-12-14
REV00102	PROD0106	CUST0129	ORD00386	2	2024-12-08
REV00103	PROD0182	CUST0130	ORD00389	5	2024-11-30
REV00104	PROD0242	CUST0130	ORD00390	5	2024-12-21
REV00105	PROD0266	CUST0130	ORD00391	4	2024-10-15
REV00106	PROD0241	CUST0131	ORD00394	5	2024-10-03
REV00107	PROD0087	CUST0131	ORD00395	4	2024-06-10
REV00108	PROD0154	CUST0134	ORD00409	4	2024-02-04
REV00109	PROD0153	CUST0135	ORD00413	5	2024-11-11
REV00110	PROD0129	CUST0137	ORD00416	4	2024-11-10
REV00111	PROD0050	CUST0139	ORD00433	2	2023-06-21
REV00112	PROD0043	CUST0145	ORD00450	5	2024-11-16
REV00113	PROD0261	CUST0145	ORD00453	5	2024-11-17
REV00114	PROD0190	CUST0148	ORD00460	5	2024-11-20
REV00115	PROD0185	CUST0149	ORD00468	5	2024-06-25
REV00116	PROD0208	CUST0149	ORD00470	3	2024-06-27
REV00117	PROD0212	CUST0150	ORD00472	4	2024-05-31
REV00118	PROD0052	CUST0152	ORD00477	4	2024-07-01
REV00119	PROD0241	CUST0152	ORD00478	3	2024-02-15
REV00120	PROD0182	CUST0152	ORD00481	4	2024-10-27
REV00121	PROD0013	CUST0152	ORD00482	5	2024-04-02
REV00122	PROD0007	CUST0156	ORD00494	2	2024-12-26
REV00123	PROD0088	CUST0157	ORD00496	4	2024-09-09
REV00124	PROD0238	CUST0157	ORD00497	1	2024-11-18
REV00125	PROD0143	CUST0158	ORD00500	4	2024-01-11
REV00126	PROD0252	CUST0158	ORD00502	3	2024-07-28
REV00127	PROD0100	CUST0159	ORD00505	3	2024-10-02
REV00128	PROD0049	CUST0159	ORD00506	3	2024-01-10
REV00129	PROD0009	CUST0162	ORD00513	5	2024-11-23
REV00130	PROD0106	CUST0163	ORD00525	3	2024-09-08
REV00131	PROD0098	CUST0165	ORD00527	3	2023-06-21
REV00132	PROD0079	CUST0169	ORD00529	4	2024-01-12
REV00133	PROD0007	CUST0169	ORD00530	5	2023-05-11
REV00134	PROD0184	CUST0170	ORD00535	3	2024-11-24
REV00135	PROD0060	CUST0171	ORD00538	1	2023-12-25
REV00136	PROD0184	CUST0171	ORD00542	4	2024-12-09
REV00137	PROD0233	CUST0173	ORD00545	1	2024-11-14
REV00138	PROD0232	CUST0174	ORD00548	3	2024-12-24
REV00139	PROD0040	CUST0174	ORD00549	3	2024-12-19
REV00140	PROD0044	CUST0175	ORD00563	5	2024-12-24
REV00141	PROD0136	CUST0178	ORD00567	4	2024-04-11
REV00142	PROD0201	CUST0178	ORD00570	5	2024-05-08
REV00143	PROD0036	CUST0181	ORD00573	3	2024-06-13
REV00144	PROD0198	CUST0183	ORD00578	3	2024-02-06
REV00145	PROD0269	CUST0183	ORD00580	4	2024-03-24
REV00146	PROD0207	CUST0183	ORD00581	2	2024-01-25
REV00147	PROD0252	CUST0183	ORD00583	4	2023-07-19
REV00148	PROD0096	CUST0185	ORD00586	4	2024-11-17
REV00149	PROD0121	CUST0187	ORD00587	3	2024-11-29
REV00150	PROD0196	CUST0188	ORD00593	1	2024-05-14
REV00151	PROD0267	CUST0190	ORD00598	4	2024-12-19
REV00152	PROD0260	CUST0190	ORD00600	4	2024-12-10
REV00153	PROD0078	CUST0190	ORD00602	1	2024-11-01
REV00154	PROD0161	CUST0193	ORD00608	5	2023-10-04
REV00155	PROD0270	CUST0196	ORD00615	5	2024-10-12
REV00156	PROD0255	CUST0196	ORD00616	5	2024-02-11
REV00157	PROD0038	CUST0198	ORD00619	5	2024-11-13
REV00158	PROD0143	CUST0198	ORD00624	2	2024-11-25
REV00159	PROD0002	CUST0198	ORD00625	2	2024-12-25
REV00160	PROD0098	CUST0200	ORD00639	1	2024-06-12
REV00161	PROD0049	CUST0203	ORD00648	5	2024-12-02
REV00162	PROD0127	CUST0203	ORD00649	4	2024-09-12
REV00163	PROD0096	CUST0207	ORD00665	5	2024-11-23
REV00164	PROD0117	CUST0207	ORD00667	2	2024-04-23
REV00165	PROD0023	CUST0207	ORD00668	2	2023-07-28
REV00166	PROD0004	CUST0209	ORD00671	4	2024-04-09
REV00167	PROD0154	CUST0209	ORD00675	5	2024-02-08
REV00168	PROD0213	CUST0209	ORD00677	4	2024-02-02
REV00169	PROD0058	CUST0210	ORD00681	1	2024-11-03
REV00170	PROD0016	CUST0211	ORD00685	4	2024-01-14
REV00171	PROD0192	CUST0212	ORD00699	5	2024-09-08
REV00172	PROD0019	CUST0216	ORD00712	2	2024-10-02
REV00173	PROD0109	CUST0217	ORD00716	3	2024-09-05
REV00174	PROD0074	CUST0217	ORD00718	3	2024-09-25
REV00176	PROD0012	CUST0220	ORD00726	4	2024-08-28
REV00177	PROD0223	CUST0220	ORD00730	4	2023-11-21
REV00178	PROD0008	CUST0220	ORD00731	4	2024-07-05
REV00179	PROD0268	CUST0221	ORD00736	5	2024-01-29
REV00180	PROD0030	CUST0221	ORD00737	4	2024-09-08
REV00181	PROD0088	CUST0222	ORD00740	5	2024-01-16
REV00182	PROD0193	CUST0223	ORD00742	2	2024-05-08
REV00183	PROD0087	CUST0223	ORD00743	2	2024-12-31
REV00184	PROD0082	CUST0223	ORD00751	1	2023-12-08
REV00185	PROD0047	CUST0225	ORD00757	4	2024-08-03
REV00186	PROD0094	CUST0227	ORD00763	4	2024-12-24
REV00187	PROD0157	CUST0228	ORD00768	4	2024-12-31
REV00188	PROD0046	CUST0228	ORD00770	3	2024-10-08
REV00189	PROD0110	CUST0229	ORD00771	3	2024-03-07
REV00190	PROD0182	CUST0229	ORD00773	2	2024-03-09
REV00191	PROD0119	CUST0231	ORD00779	4	2024-05-07
REV00192	PROD0213	CUST0232	ORD00786	4	2024-10-26
REV00193	PROD0240	CUST0236	ORD00796	4	2024-06-21
REV00194	PROD0266	CUST0236	ORD00797	4	2024-06-30
REV00195	PROD0013	CUST0238	ORD00802	4	2024-12-06
REV00196	PROD0213	CUST0238	ORD00803	5	2024-12-31
REV00197	PROD0059	CUST0238	ORD00805	4	2024-12-31
REV00198	PROD0093	CUST0238	ORD00806	5	2024-12-07
REV00199	PROD0271	CUST0238	ORD00807	4	2024-12-31
REV00200	PROD0155	CUST0238	ORD00808	4	2024-12-22
REV00201	PROD0203	CUST0238	ORD00809	5	2024-12-29
REV00202	PROD0277	CUST0244	ORD00812	5	2024-12-18
REV00203	PROD0086	CUST0244	ORD00814	4	2024-12-22
REV00204	PROD0065	CUST0245	ORD00815	2	2024-05-26
REV00205	PROD0114	CUST0245	ORD00816	5	2024-06-10
REV00206	PROD0023	CUST0245	ORD00819	5	2024-12-12
REV00207	PROD0231	CUST0246	ORD00820	3	2023-05-25
REV00208	PROD0272	CUST0247	ORD00823	5	2024-02-28
REV00209	PROD0223	CUST0247	ORD00824	2	2024-08-18
REV00210	PROD0016	CUST0248	ORD00825	5	2024-06-18
REV00211	PROD0071	CUST0248	ORD00827	4	2024-01-16
REV00212	PROD0257	CUST0249	ORD00830	3	2024-11-10
REV00213	PROD0090	CUST0250	ORD00833	5	2024-01-09
REV00214	PROD0110	CUST0250	ORD00835	4	2024-04-30
REV00215	PROD0171	CUST0252	ORD00846	4	2024-05-21
REV00216	PROD0174	CUST0253	ORD00849	3	2024-05-31
REV00217	PROD0022	CUST0254	ORD00851	1	2024-05-01
REV00218	PROD0184	CUST0254	ORD00853	4	2024-02-12
REV00219	PROD0206	CUST0254	ORD00854	3	2024-01-07
REV00220	PROD0220	CUST0254	ORD00855	2	2024-06-19
REV00221	PROD0034	CUST0254	ORD00856	4	2024-10-29
REV00222	PROD0140	CUST0254	ORD00857	4	2024-11-27
REV00223	PROD0276	CUST0255	ORD00862	4	2023-12-30
REV00224	PROD0167	CUST0259	ORD00877	4	2024-09-24
REV00225	PROD0170	CUST0260	ORD00882	2	2023-11-02
REV00226	PROD0185	CUST0261	ORD00884	5	2024-06-06
REV00227	PROD0112	CUST0261	ORD00885	4	2024-09-22
REV00228	PROD0193	CUST0261	ORD00888	1	2024-07-27
REV00229	PROD0201	CUST0261	ORD00890	3	2023-11-19
REV00230	PROD0207	CUST0264	ORD00895	4	2023-10-18
REV00231	PROD0008	CUST0267	ORD00898	3	2024-09-20
REV00232	PROD0249	CUST0267	ORD00901	4	2024-08-28
REV00233	PROD0122	CUST0268	ORD00902	3	2024-11-19
REV00234	PROD0164	CUST0272	ORD00908	3	2024-12-31
REV00235	PROD0010	CUST0272	ORD00909	3	2024-11-09
REV00236	PROD0258	CUST0272	ORD00910	4	2024-12-25
REV00237	PROD0265	CUST0272	ORD00911	5	2024-11-27
REV00238	PROD0151	CUST0273	ORD00917	1	2024-10-18
REV00239	PROD0132	CUST0273	ORD00918	1	2024-09-26
REV00240	PROD0277	CUST0275	ORD00926	5	2024-07-08
REV00241	PROD0043	CUST0275	ORD00929	1	2024-08-10
REV00242	PROD0227	CUST0275	ORD00931	4	2024-10-01
REV00243	PROD0179	CUST0277	ORD00940	3	2024-01-12
REV00244	PROD0055	CUST0277	ORD00941	5	2024-09-05
REV00245	PROD0228	CUST0277	ORD00944	2	2024-04-12
REV00246	PROD0231	CUST0277	ORD00945	2	2023-08-11
REV00247	PROD0181	CUST0278	ORD00948	3	2023-05-16
REV00248	PROD0160	CUST0280	ORD00952	1	2024-10-26
REV00249	PROD0028	CUST0280	ORD00953	4	2024-07-02
REV00250	PROD0080	CUST0280	ORD00954	5	2024-10-13
REV00251	PROD0066	CUST0280	ORD00957	1	2024-07-05
REV00252	PROD0037	CUST0280	ORD00960	3	2024-10-31
REV00253	PROD0030	CUST0281	ORD00972	3	2024-11-13
REV00254	PROD0261	CUST0285	ORD00977	5	2024-04-08
REV00255	PROD0254	CUST0288	ORD00982	5	2024-07-16
REV00256	PROD0144	CUST0289	ORD00983	2	2024-11-11
REV00257	PROD0256	CUST0289	ORD00984	5	2024-07-30
REV00258	PROD0112	CUST0290	ORD00989	4	2024-01-30
REV00259	PROD0091	CUST0290	ORD00990	5	2023-10-15
REV00260	PROD0255	CUST0291	ORD00994	5	2024-12-06
REV00261	PROD0094	CUST0291	ORD00995	5	2024-12-08
REV00262	PROD0073	CUST0292	ORD00997	4	2023-11-13
REV00263	PROD0063	CUST0292	ORD01000	3	2023-07-10
REV00264	PROD0176	CUST0293	ORD01003	5	2024-03-04
REV00265	PROD0165	CUST0293	ORD01004	4	2024-12-31
REV00266	PROD0087	CUST0293	ORD01005	2	2023-04-26
REV00267	PROD0231	CUST0296	ORD01014	4	2024-11-09
REV00268	PROD0126	CUST0297	ORD01015	4	2023-05-26
REV00269	PROD0005	CUST0297	ORD01017	3	2023-11-15
REV00270	PROD0125	CUST0298	ORD01020	5	2024-02-07
REV00271	PROD0246	CUST0299	ORD01023	5	2024-11-15
REV00272	PROD0190	CUST0299	ORD01024	2	2024-12-15
REV00273	PROD0237	CUST0302	ORD01026	4	2024-10-11
REV00274	PROD0150	CUST0302	ORD01030	4	2024-06-15
REV00275	PROD0102	CUST0304	ORD01037	4	2023-11-07
REV00276	PROD0035	CUST0304	ORD01041	3	2024-10-18
REV00277	PROD0076	CUST0305	ORD01045	5	2024-09-14
REV00278	PROD0058	CUST0307	ORD01052	2	2024-11-03
REV00279	PROD0069	CUST0310	ORD01058	4	2024-12-24
REV00280	PROD0166	CUST0310	ORD01059	5	2024-12-31
REV00281	PROD0079	CUST0312	ORD01060	4	2024-04-08
REV00282	PROD0021	CUST0312	ORD01062	3	2024-06-26
REV00283	PROD0145	CUST0313	ORD01067	4	2024-12-31
REV00284	PROD0050	CUST0316	ORD01072	4	2024-11-01
REV00285	PROD0173	CUST0317	ORD01076	4	2023-12-31
REV00286	PROD0039	CUST0317	ORD01077	4	2024-12-31
REV00287	PROD0277	CUST0317	ORD01078	4	2023-11-20
REV00288	PROD0259	CUST0320	ORD01088	4	2024-12-31
REV00289	PROD0207	CUST0324	ORD01094	1	2024-07-06
REV00290	PROD0063	CUST0325	ORD01097	4	2024-05-11
REV00291	PROD0029	CUST0329	ORD01103	4	2024-12-08
REV00292	PROD0246	CUST0332	ORD01117	5	2023-03-30
REV00293	PROD0210	CUST0332	ORD01118	5	2024-02-02
REV00294	PROD0169	CUST0334	ORD01123	5	2023-10-13
REV00295	PROD0114	CUST0335	ORD01127	4	2024-06-20
REV00296	PROD0162	CUST0336	ORD01129	3	2024-07-31
REV00297	PROD0255	CUST0338	ORD01131	5	2024-09-03
REV00298	PROD0267	CUST0343	ORD01136	4	2024-10-15
REV00299	PROD0136	CUST0343	ORD01138	5	2024-07-18
REV00300	PROD0217	CUST0343	ORD01139	2	2024-07-21
REV00301	PROD0163	CUST0343	ORD01140	1	2024-08-23
REV00302	PROD0169	CUST0344	ORD01142	2	2024-12-31
REV00303	PROD0114	CUST0345	ORD01144	5	2024-06-18
REV00304	PROD0015	CUST0346	ORD01150	4	2024-07-27
REV00305	PROD0018	CUST0347	ORD01156	2	2024-07-11
REV00306	PROD0047	CUST0350	ORD01163	5	2023-10-17
REV00307	PROD0066	CUST0350	ORD01167	2	2023-09-12
REV00308	PROD0005	CUST0350	ORD01169	4	2024-05-12
REV00309	PROD0129	CUST0352	ORD01179	4	2024-05-24
REV00310	PROD0045	CUST0353	ORD01186	5	2024-03-28
REV00311	PROD0180	CUST0353	ORD01187	5	2024-05-12
REV00312	PROD0215	CUST0353	ORD01189	5	2024-06-28
REV00313	PROD0248	CUST0356	ORD01194	5	2023-08-29
REV00314	PROD0130	CUST0357	ORD01196	4	2024-05-07
REV00315	PROD0108	CUST0359	ORD01204	5	2024-11-14
REV00316	PROD0182	CUST0359	ORD01205	1	2024-12-23
REV00317	PROD0241	CUST0361	ORD01208	5	2024-03-28
REV00318	PROD0055	CUST0361	ORD01210	2	2024-05-28
REV00319	PROD0203	CUST0363	ORD01212	2	2024-12-20
REV00320	PROD0005	CUST0363	ORD01216	5	2024-12-06
REV00321	PROD0253	CUST0366	ORD01222	4	2023-06-11
REV00322	PROD0186	CUST0366	ORD01225	1	2024-05-24
REV00323	PROD0165	CUST0370	ORD01234	5	2024-12-25
REV00324	PROD0219	CUST0370	ORD01238	3	2024-09-15
REV00325	PROD0144	CUST0370	ORD01243	3	2024-09-25
REV00326	PROD0012	CUST0371	ORD01249	5	2024-02-10
REV00327	PROD0143	CUST0377	ORD01258	3	2024-04-24
REV00328	PROD0118	CUST0377	ORD01260	5	2024-11-02
REV00329	PROD0078	CUST0377	ORD01261	3	2024-08-08
REV00330	PROD0054	CUST0378	ORD01264	4	2024-04-02
REV00331	PROD0253	CUST0379	ORD01267	3	2024-01-05
REV00332	PROD0111	CUST0381	ORD01272	4	2024-04-28
REV00333	PROD0180	CUST0381	ORD01273	5	2024-06-20
REV00334	PROD0210	CUST0384	ORD01276	2	2024-03-20
REV00335	PROD0205	CUST0385	ORD01280	3	2024-08-06
REV00336	PROD0071	CUST0386	ORD01284	5	2024-12-25
REV00337	PROD0228	CUST0386	ORD01287	4	2023-09-26
REV00338	PROD0017	CUST0388	ORD01292	3	2024-07-02
REV00339	PROD0232	CUST0389	ORD01294	4	2024-09-01
REV00340	PROD0011	CUST0391	ORD01297	4	2024-06-10
REV00341	PROD0227	CUST0392	ORD01304	5	2024-10-20
REV00342	PROD0252	CUST0392	ORD01306	3	2024-11-20
REV00343	PROD0175	CUST0392	ORD01309	4	2024-07-30
REV00344	PROD0143	CUST0393	ORD01310	3	2024-10-08
REV00345	PROD0022	CUST0394	ORD01313	5	2023-09-20
REV00346	PROD0077	CUST0394	ORD01314	4	2024-11-22
REV00347	PROD0196	CUST0394	ORD01319	4	2024-02-15
REV00348	PROD0193	CUST0394	ORD01322	4	2024-09-01
REV00349	PROD0102	CUST0396	ORD01326	5	2024-06-07
REV00350	PROD0165	CUST0396	ORD01330	1	2024-05-16
REV00351	PROD0268	CUST0398	ORD01331	4	2023-06-01
REV00352	PROD0279	CUST0398	ORD01334	5	2023-06-01
REV00353	PROD0082	CUST0398	ORD01335	4	2024-11-22
REV00354	PROD0066	CUST0401	ORD01345	2	2024-12-14
REV00355	PROD0086	CUST0402	ORD01347	5	2024-05-01
REV00356	PROD0146	CUST0402	ORD01350	5	2024-06-06
REV00357	PROD0105	CUST0403	ORD01354	5	2024-08-16
REV00358	PROD0258	CUST0403	ORD01355	4	2024-05-14
REV00359	PROD0022	CUST0407	ORD01364	5	2024-09-01
REV00360	PROD0005	CUST0407	ORD01365	3	2023-12-20
REV00361	PROD0188	CUST0407	ORD01367	4	2024-12-06
REV00362	PROD0238	CUST0407	ORD01368	5	2024-07-07
REV00363	PROD0062	CUST0407	ORD01370	3	2024-06-05
REV00364	PROD0217	CUST0408	ORD01372	4	2024-06-11
REV00365	PROD0118	CUST0409	ORD01374	3	2024-12-16
REV00366	PROD0269	CUST0409	ORD01377	4	2024-12-11
REV00367	PROD0203	CUST0410	ORD01382	4	2024-02-02
REV00368	PROD0018	CUST0412	ORD01389	1	2023-11-17
REV00369	PROD0122	CUST0412	ORD01390	4	2024-11-24
REV00370	PROD0148	CUST0412	ORD01391	4	2024-03-20
REV00371	PROD0081	CUST0414	ORD01397	1	2024-11-11
REV00372	PROD0166	CUST0416	ORD01405	3	2023-11-07
REV00373	PROD0027	CUST0417	ORD01407	1	2024-10-05
REV00374	PROD0129	CUST0418	ORD01416	4	2024-07-28
REV00375	PROD0072	CUST0419	ORD01417	5	2023-09-12
REV00376	PROD0185	CUST0419	ORD01421	3	2024-01-17
REV00377	PROD0002	CUST0419	ORD01422	1	2024-11-15
REV00378	PROD0240	CUST0421	ORD01423	4	2024-04-28
REV00379	PROD0216	CUST0421	ORD01424	3	2024-08-04
REV00380	PROD0140	CUST0421	ORD01426	4	2024-08-01
REV00381	PROD0227	CUST0421	ORD01430	3	2024-01-18
REV00382	PROD0056	CUST0422	ORD01431	5	2024-05-10
REV00383	PROD0119	CUST0422	ORD01434	4	2023-11-09
REV00384	PROD0116	CUST0422	ORD01436	4	2024-04-09
REV00385	PROD0166	CUST0422	ORD01437	3	2024-10-22
REV00386	PROD0114	CUST0423	ORD01438	5	2023-12-16
REV00387	PROD0061	CUST0425	ORD01443	5	2024-08-09
REV00388	PROD0046	CUST0426	ORD01445	3	2024-12-14
REV00389	PROD0033	CUST0427	ORD01449	1	2024-11-26
REV00390	PROD0147	CUST0427	ORD01450	4	2023-08-23
REV00391	PROD0016	CUST0427	ORD01453	5	2023-07-29
REV00392	PROD0197	CUST0429	ORD01460	5	2024-06-13
REV00393	PROD0131	CUST0429	ORD01463	5	2024-06-20
REV00394	PROD0185	CUST0430	ORD01464	5	2024-08-23
REV00395	PROD0102	CUST0430	ORD01465	5	2024-09-06
REV00396	PROD0100	CUST0434	ORD01472	4	2024-12-31
REV00397	PROD0039	CUST0435	ORD01474	4	2023-04-13
REV00398	PROD0048	CUST0437	ORD01482	5	2024-08-28
REV00399	PROD0101	CUST0440	ORD01493	4	2024-11-22
REV00400	PROD0018	CUST0444	ORD01498	4	2023-10-09
REV00401	PROD0020	CUST0444	ORD01500	5	2024-03-05
REV00402	PROD0164	CUST0445	ORD01503	5	2024-03-03
REV00403	PROD0166	CUST0445	ORD01504	4	2023-07-17
REV00404	PROD0110	CUST0446	ORD01507	2	2024-05-05
REV00405	PROD0123	CUST0446	ORD01508	3	2024-11-07
REV00406	PROD0255	CUST0446	ORD01511	4	2024-06-17
REV00407	PROD0043	CUST0449	ORD01516	5	2023-06-13
REV00408	PROD0117	CUST0451	ORD01527	3	2024-03-06
REV00409	PROD0129	CUST0451	ORD01528	5	2023-12-13
REV00410	PROD0115	CUST0452	ORD01532	4	2023-09-26
REV00411	PROD0144	CUST0452	ORD01533	4	2023-08-31
REV00412	PROD0110	CUST0453	ORD01539	5	2024-11-06
REV00413	PROD0119	CUST0455	ORD01544	4	2024-10-08
REV00414	PROD0144	CUST0455	ORD01547	4	2024-10-23
REV00415	PROD0220	CUST0458	ORD01550	3	2024-11-30
REV00416	PROD0177	CUST0460	ORD01561	4	2024-12-29
REV00417	PROD0111	CUST0461	ORD01566	1	2024-12-12
REV00418	PROD0101	CUST0462	ORD01571	1	2024-08-05
REV00419	PROD0071	CUST0462	ORD01572	1	2024-12-19
REV00420	PROD0130	CUST0462	ORD01573	2	2024-12-19
REV00421	PROD0032	CUST0464	ORD01579	5	2023-08-02
REV00422	PROD0057	CUST0464	ORD01582	3	2023-07-04
REV00423	PROD0179	CUST0468	ORD01586	5	2024-12-12
REV00424	PROD0261	CUST0468	ORD01587	5	2024-12-12
REV00425	PROD0035	CUST0468	ORD01588	4	2024-12-03
REV00426	PROD0197	CUST0469	ORD01590	4	2024-05-16
REV00427	PROD0241	CUST0472	ORD01596	4	2023-12-26
REV00428	PROD0207	CUST0472	ORD01597	5	2024-07-28
REV00429	PROD0133	CUST0473	ORD01600	2	2024-12-27
REV00430	PROD0259	CUST0475	ORD01605	2	2024-12-14
REV00431	PROD0214	CUST0478	ORD01612	5	2024-12-31
REV00432	PROD0204	CUST0479	ORD01617	5	2024-12-09
REV00433	PROD0006	CUST0480	ORD01619	5	2024-06-19
REV00434	PROD0001	CUST0481	ORD01620	4	2024-04-10
REV00435	PROD0097	CUST0481	ORD01622	5	2024-07-31
REV00436	PROD0226	CUST0481	ORD01623	5	2023-06-09
REV00437	PROD0072	CUST0481	ORD01624	3	2024-04-28
REV00438	PROD0059	CUST0481	ORD01625	1	2024-06-28
REV00439	PROD0073	CUST0481	ORD01627	4	2024-10-09
REV00440	PROD0097	CUST0481	ORD01629	5	2023-06-06
REV00441	PROD0269	CUST0482	ORD01636	5	2024-02-18
REV00442	PROD0238	CUST0482	ORD01639	1	2024-10-20
REV00443	PROD0240	CUST0483	ORD01640	1	2024-08-22
REV00444	PROD0003	CUST0486	ORD01642	3	2023-12-20
REV00445	PROD0233	CUST0491	ORD01647	5	2024-05-23
REV00446	PROD0198	CUST0491	ORD01648	5	2024-05-30
REV00447	PROD0055	CUST0494	ORD01654	4	2024-06-24
REV00448	PROD0033	CUST0494	ORD01655	3	2024-06-23
REV00449	PROD0112	CUST0495	ORD01660	5	2024-12-06
REV00450	PROD0110	CUST0497	ORD01663	5	2024-09-24
REV00451	PROD0025	CUST0497	ORD01664	4	2024-05-29
REV00452	PROD0002	CUST0497	ORD01667	1	2024-05-07
REV00453	PROD0072	CUST0502	ORD01676	2	2024-11-27
REV00454	PROD0129	CUST0503	ORD01680	5	2024-10-05
REV00455	PROD0177	CUST0503	ORD01682	4	2024-03-30
REV00456	PROD0075	CUST0504	ORD01683	2	2024-02-01
REV00457	PROD0045	CUST0505	ORD01684	4	2024-09-30
REV00459	PROD0019	CUST0507	ORD01693	5	2024-07-31
REV00460	PROD0152	CUST0507	ORD01694	5	2024-06-22
REV00461	PROD0133	CUST0511	ORD01698	4	2024-09-25
REV00462	PROD0112	CUST0511	ORD01699	3	2024-10-04
REV00463	PROD0214	CUST0513	ORD01708	3	2024-12-08
REV00464	PROD0099	CUST0513	ORD01709	3	2024-12-07
REV00465	PROD0029	CUST0513	ORD01710	2	2024-12-07
REV00466	PROD0137	CUST0513	ORD01711	4	2024-12-06
REV00467	PROD0196	CUST0513	ORD01712	5	2024-12-14
REV00468	PROD0169	CUST0518	ORD01720	4	2024-04-30
REV00469	PROD0012	CUST0518	ORD01723	5	2024-02-22
REV00470	PROD0167	CUST0518	ORD01725	3	2024-08-31
REV00471	PROD0044	CUST0519	ORD01731	4	2024-08-05
REV00472	PROD0044	CUST0519	ORD01732	5	2024-07-24
REV00473	PROD0245	CUST0519	ORD01736	2	2024-07-13
REV00474	PROD0107	CUST0522	ORD01741	1	2024-10-06
REV00475	PROD0077	CUST0522	ORD01742	4	2024-12-31
REV00476	PROD0182	CUST0526	ORD01751	4	2024-12-31
REV00477	PROD0125	CUST0526	ORD01752	4	2024-11-23
REV00478	PROD0247	CUST0528	ORD01754	3	2024-11-10
REV00479	PROD0061	CUST0529	ORD01757	2	2023-09-12
REV00480	PROD0236	CUST0529	ORD01759	4	2024-07-02
REV00481	PROD0165	CUST0532	ORD01763	2	2024-07-16
REV00482	PROD0164	CUST0534	ORD01764	5	2024-07-22
REV00483	PROD0048	CUST0535	ORD01767	3	2024-06-12
REV00484	PROD0075	CUST0536	ORD01772	5	2024-12-09
REV00485	PROD0252	CUST0540	ORD01776	5	2024-11-04
REV00486	PROD0041	CUST0540	ORD01779	4	2024-06-19
REV00487	PROD0166	CUST0540	ORD01780	3	2024-02-21
REV00488	PROD0202	CUST0540	ORD01782	3	2024-06-22
REV00489	PROD0275	CUST0540	ORD01785	3	2023-10-01
REV00490	PROD0172	CUST0541	ORD01790	4	2024-11-19
REV00491	PROD0079	CUST0541	ORD01800	1	2024-01-12
REV00492	PROD0245	CUST0542	ORD01802	3	2024-05-22
REV00493	PROD0142	CUST0542	ORD01804	4	2024-05-22
REV00494	PROD0037	CUST0546	ORD01810	5	2024-12-31
REV00495	PROD0192	CUST0546	ORD01812	1	2024-11-20
REV00496	PROD0102	CUST0549	ORD01822	3	2024-10-20
REV00497	PROD0251	CUST0550	ORD01823	4	2024-12-29
REV00498	PROD0159	CUST0550	ORD01825	5	2024-07-07
REV00499	PROD0263	CUST0552	ORD01835	4	2024-09-22
REV00500	PROD0227	CUST0553	ORD01837	4	2024-04-05
REV00501	PROD0034	CUST0556	ORD01839	1	2024-10-25
REV00502	PROD0201	CUST0557	ORD01845	5	2024-12-31
REV00503	PROD0128	CUST0557	ORD01846	4	2024-12-09
REV00504	PROD0099	CUST0558	ORD01853	5	2024-05-13
REV00505	PROD0032	CUST0558	ORD01856	1	2024-07-03
REV00506	PROD0225	CUST0561	ORD01866	4	2024-09-03
REV00507	PROD0228	CUST0561	ORD01867	4	2024-05-22
REV00508	PROD0196	CUST0561	ORD01872	3	2024-04-17
REV00509	PROD0272	CUST0563	ORD01875	3	2024-07-14
REV00510	PROD0089	CUST0563	ORD01879	2	2024-07-07
REV00511	PROD0100	CUST0563	ORD01880	5	2024-09-30
REV00512	PROD0270	CUST0563	ORD01881	3	2024-10-12
REV00513	PROD0185	CUST0563	ORD01882	2	2024-12-05
REV00514	PROD0278	CUST0565	ORD01885	5	2024-11-15
REV00515	PROD0206	CUST0566	ORD01887	4	2024-02-04
REV00516	PROD0081	CUST0568	ORD01898	4	2024-11-02
REV00517	PROD0026	CUST0568	ORD01899	1	2024-11-06
REV00518	PROD0138	CUST0569	ORD01901	4	2024-01-20
REV00519	PROD0094	CUST0569	ORD01902	5	2024-02-14
REV00520	PROD0230	CUST0569	ORD01904	1	2024-01-19
REV00521	PROD0207	CUST0569	ORD01906	5	2023-11-20
REV00522	PROD0114	CUST0570	ORD01912	3	2024-11-22
REV00523	PROD0092	CUST0571	ORD01913	5	2023-11-17
REV00524	PROD0128	CUST0574	ORD01918	1	2024-02-19
REV00525	PROD0143	CUST0575	ORD01920	3	2024-07-14
REV00526	PROD0206	CUST0577	ORD01933	3	2024-09-12
REV00527	PROD0076	CUST0577	ORD01934	5	2024-12-20
REV00528	PROD0031	CUST0579	ORD01939	5	2023-10-16
REV00529	PROD0003	CUST0582	ORD01942	5	2024-05-27
REV00530	PROD0133	CUST0582	ORD01947	4	2024-05-06
REV00531	PROD0048	CUST0582	ORD01950	4	2024-07-06
REV00533	PROD0258	CUST0586	ORD01955	3	2024-11-29
REV00534	PROD0162	CUST0586	ORD01956	4	2024-06-27
REV00535	PROD0024	CUST0587	ORD01960	3	2024-04-28
REV00536	PROD0240	CUST0590	ORD01964	3	2023-12-01
REV00537	PROD0247	CUST0591	ORD01973	3	2024-03-28
REV00538	PROD0264	CUST0592	ORD01979	4	2024-12-31
REV00539	PROD0163	CUST0592	ORD01982	5	2024-11-06
REV00540	PROD0212	CUST0593	ORD01985	4	2024-02-29
REV00541	PROD0134	CUST0593	ORD01987	3	2024-02-20
REV00542	PROD0256	CUST0593	ORD01990	5	2023-12-20
REV00543	PROD0240	CUST0593	ORD01995	5	2023-11-29
REV00544	PROD0033	CUST0596	ORD02001	5	2024-02-07
REV00545	PROD0083	CUST0597	ORD02002	4	2024-09-12
REV00546	PROD0006	CUST0598	ORD02005	3	2024-01-27
REV00547	PROD0098	CUST0598	ORD02006	2	2023-09-15
REV00548	PROD0025	CUST0599	ORD02013	3	2024-06-08
REV00549	PROD0055	CUST0599	ORD02015	4	2024-05-14
REV00550	PROD0184	CUST0599	ORD02017	4	2024-09-27
REV00551	PROD0159	CUST0599	ORD02018	5	2024-10-23
REV00552	PROD0222	CUST0602	ORD02023	3	2024-08-27
REV00553	PROD0146	CUST0605	ORD02030	5	2024-12-21
REV00554	PROD0261	CUST0606	ORD02034	5	2024-07-19
REV00555	PROD0170	CUST0610	ORD02036	5	2024-11-26
REV00556	PROD0141	CUST0610	ORD02039	4	2024-09-03
REV00557	PROD0220	CUST0611	ORD02043	2	2024-02-11
REV00558	PROD0166	CUST0614	ORD02051	2	2024-01-26
REV00559	PROD0219	CUST0614	ORD02054	2	2024-01-24
REV00560	PROD0239	CUST0614	ORD02055	4	2024-03-29
REV00561	PROD0280	CUST0614	ORD02057	2	2024-07-10
REV00562	PROD0116	CUST0617	ORD02064	5	2024-09-16
REV00563	PROD0212	CUST0617	ORD02065	5	2024-12-10
REV00564	PROD0118	CUST0617	ORD02068	4	2024-12-31
REV00565	PROD0188	CUST0618	ORD02070	2	2024-08-14
REV00566	PROD0230	CUST0618	ORD02071	4	2024-07-20
REV00567	PROD0024	CUST0618	ORD02072	2	2024-12-18
REV00568	PROD0170	CUST0618	ORD02079	5	2024-08-02
REV00569	PROD0173	CUST0621	ORD02082	4	2023-12-04
REV00570	PROD0220	CUST0621	ORD02083	4	2024-12-02
REV00571	PROD0169	CUST0621	ORD02084	3	2024-07-19
REV00572	PROD0130	CUST0621	ORD02090	3	2024-12-08
REV00573	PROD0054	CUST0621	ORD02093	4	2024-12-31
REV00574	PROD0277	CUST0624	ORD02098	3	2024-09-07
REV00575	PROD0115	CUST0626	ORD02106	3	2024-02-08
REV00576	PROD0025	CUST0626	ORD02112	4	2024-07-03
REV00577	PROD0047	CUST0626	ORD02113	1	2024-05-13
REV00578	PROD0236	CUST0628	ORD02115	5	2024-04-23
REV00579	PROD0031	CUST0631	ORD02120	4	2024-10-02
REV00580	PROD0263	CUST0631	ORD02121	4	2024-08-06
REV00581	PROD0047	CUST0631	ORD02123	3	2024-10-13
REV00582	PROD0085	CUST0633	ORD02128	4	2023-11-15
REV00583	PROD0106	CUST0634	ORD02132	4	2023-11-23
REV00584	PROD0266	CUST0635	ORD02136	5	2024-11-22
REV00585	PROD0236	CUST0635	ORD02137	5	2024-12-31
REV00587	PROD0094	CUST0636	ORD02142	4	2023-10-20
REV00588	PROD0177	CUST0638	ORD02149	5	2023-12-16
REV00589	PROD0204	CUST0640	ORD02153	3	2024-01-15
REV00590	PROD0145	CUST0642	ORD02168	5	2024-02-19
REV00591	PROD0196	CUST0643	ORD02173	2	2024-05-12
REV00592	PROD0084	CUST0644	ORD02177	3	2023-11-15
REV00593	PROD0069	CUST0644	ORD02179	1	2024-06-19
REV00594	PROD0175	CUST0645	ORD02183	2	2024-12-01
REV00595	PROD0258	CUST0645	ORD02184	5	2024-12-05
REV00596	PROD0200	CUST0645	ORD02186	1	2024-11-02
REV00597	PROD0065	CUST0645	ORD02189	5	2024-11-18
REV00598	PROD0209	CUST0646	ORD02190	4	2024-04-24
REV00599	PROD0114	CUST0648	ORD02198	4	2024-02-06
REV00600	PROD0147	CUST0653	ORD02207	4	2024-03-01
REV00601	PROD0252	CUST0653	ORD02208	5	2024-09-14
REV00602	PROD0006	CUST0654	ORD02211	1	2024-10-13
REV00603	PROD0012	CUST0656	ORD02213	2	2024-07-27
REV00604	PROD0170	CUST0656	ORD02216	4	2024-12-22
REV00605	PROD0081	CUST0656	ORD02219	3	2024-10-31
REV00606	PROD0208	CUST0656	ORD02221	5	2024-08-20
REV00607	PROD0236	CUST0657	ORD02224	3	2023-10-24
REV00608	PROD0208	CUST0657	ORD02225	1	2024-04-27
REV00609	PROD0206	CUST0658	ORD02227	5	2023-10-01
REV00610	PROD0004	CUST0662	ORD02242	5	2024-05-30
REV00611	PROD0227	CUST0665	ORD02247	3	2023-08-15
REV00612	PROD0077	CUST0666	ORD02255	4	2024-06-23
REV00613	PROD0061	CUST0666	ORD02256	1	2024-07-28
REV00614	PROD0056	CUST0666	ORD02258	2	2024-11-21
REV00615	PROD0239	CUST0666	ORD02259	1	2024-12-23
REV00616	PROD0059	CUST0666	ORD02260	5	2024-12-31
REV00617	PROD0042	CUST0666	ORD02261	5	2024-06-16
REV00618	PROD0096	CUST0667	ORD02265	5	2023-11-12
REV00619	PROD0280	CUST0667	ORD02267	5	2024-04-24
REV00620	PROD0242	CUST0667	ORD02268	3	2024-06-02
REV00621	PROD0247	CUST0667	ORD02270	5	2023-11-19
REV00622	PROD0278	CUST0670	ORD02274	4	2024-10-26
REV00623	PROD0252	CUST0671	ORD02276	1	2024-06-07
REV00624	PROD0066	CUST0671	ORD02280	5	2024-04-20
REV00625	PROD0222	CUST0673	ORD02284	4	2024-12-26
REV00626	PROD0178	CUST0673	ORD02290	5	2024-11-29
REV00627	PROD0100	CUST0675	ORD02296	5	2024-11-24
REV00628	PROD0050	CUST0675	ORD02299	1	2024-10-07
REV00629	PROD0013	CUST0677	ORD02305	5	2024-07-11
REV00630	PROD0146	CUST0679	ORD02314	2	2024-11-12
REV00631	PROD0101	CUST0680	ORD02316	5	2024-12-30
REV00632	PROD0207	CUST0682	ORD02318	5	2024-12-13
REV00633	PROD0082	CUST0682	ORD02319	5	2024-12-31
REV00634	PROD0276	CUST0682	ORD02323	3	2024-12-31
REV00635	PROD0028	CUST0683	ORD02328	4	2024-06-11
REV00636	PROD0181	CUST0684	ORD02330	5	2024-10-21
REV00637	PROD0265	CUST0685	ORD02333	2	2024-04-14
REV00638	PROD0061	CUST0688	ORD02343	4	2024-05-02
REV00639	PROD0176	CUST0689	ORD02346	3	2024-10-27
REV00640	PROD0104	CUST0689	ORD02348	3	2024-10-08
REV00641	PROD0173	CUST0689	ORD02349	5	2024-09-24
REV00642	PROD0183	CUST0690	ORD02351	3	2024-04-29
REV00643	PROD0169	CUST0690	ORD02352	4	2023-04-14
REV00644	PROD0016	CUST0691	ORD02360	5	2024-05-23
REV00645	PROD0087	CUST0691	ORD02362	4	2024-11-18
REV00646	PROD0139	CUST0692	ORD02367	3	2023-03-22
REV00647	PROD0223	CUST0692	ORD02371	5	2023-07-13
REV00648	PROD0279	CUST0694	ORD02374	5	2024-06-26
REV00649	PROD0040	CUST0695	ORD02376	3	2024-09-03
REV00650	PROD0220	CUST0695	ORD02378	4	2024-09-17
REV00651	PROD0004	CUST0695	ORD02379	5	2024-10-02
REV00652	PROD0006	CUST0695	ORD02380	2	2024-12-08
REV00653	PROD0045	CUST0695	ORD02382	5	2024-10-15
REV00654	PROD0124	CUST0696	ORD02386	2	2024-12-31
REV00655	PROD0114	CUST0697	ORD02390	4	2024-09-06
REV00656	PROD0004	CUST0697	ORD02391	2	2024-10-30
REV00657	PROD0007	CUST0700	ORD02398	2	2024-12-31
REV00658	PROD0082	CUST0700	ORD02399	5	2024-11-11
REV00659	PROD0145	CUST0702	ORD02406	5	2024-05-18
REV00660	PROD0145	CUST0703	ORD02408	4	2024-12-31
REV00661	PROD0064	CUST0703	ORD02409	5	2024-09-22
REV00662	PROD0075	CUST0708	ORD02422	2	2024-12-31
REV00663	PROD0269	CUST0709	ORD02423	3	2024-07-31
REV00664	PROD0098	CUST0712	ORD02431	5	2023-10-13
REV00665	PROD0175	CUST0712	ORD02434	5	2024-08-26
REV00666	PROD0202	CUST0714	ORD02444	4	2024-11-14
REV00667	PROD0155	CUST0714	ORD02447	2	2024-12-31
REV00668	PROD0273	CUST0714	ORD02450	4	2024-12-13
REV00669	PROD0098	CUST0714	ORD02451	5	2024-11-15
REV00670	PROD0042	CUST0714	ORD02453	3	2024-11-20
REV00671	PROD0250	CUST0719	ORD02461	1	2024-12-05
REV00672	PROD0112	CUST0720	ORD02464	2	2024-07-25
REV00673	PROD0028	CUST0720	ORD02465	5	2024-08-12
REV00674	PROD0131	CUST0721	ORD02469	4	2024-12-25
REV00675	PROD0040	CUST0721	ORD02473	5	2024-12-11
REV00676	PROD0115	CUST0722	ORD02475	5	2024-12-05
REV00677	PROD0175	CUST0722	ORD02476	4	2023-11-19
REV00678	PROD0212	CUST0723	ORD02483	4	2024-03-11
REV00679	PROD0239	CUST0725	ORD02489	4	2023-10-04
REV00680	PROD0126	CUST0726	ORD02493	5	2024-11-15
REV00681	PROD0100	CUST0730	ORD02504	4	2024-12-25
REV00682	PROD0251	CUST0731	ORD02507	3	2024-12-31
REV00683	PROD0149	CUST0731	ORD02510	3	2024-07-24
REV00684	PROD0074	CUST0732	ORD02512	5	2024-08-20
REV00685	PROD0067	CUST0733	ORD02518	3	2024-07-07
REV00686	PROD0216	CUST0734	ORD02522	5	2024-04-10
REV00687	PROD0251	CUST0736	ORD02524	3	2024-03-14
REV00688	PROD0100	CUST0736	ORD02527	5	2023-12-12
REV00689	PROD0263	CUST0737	ORD02536	4	2023-12-18
REV00690	PROD0175	CUST0740	ORD02549	4	2024-10-14
REV00691	PROD0004	CUST0740	ORD02550	4	2024-09-09
REV00692	PROD0127	CUST0740	ORD02554	5	2024-04-24
REV00693	PROD0184	CUST0741	ORD02556	1	2024-07-10
REV00694	PROD0003	CUST0744	ORD02567	4	2024-07-21
REV00695	PROD0084	CUST0747	ORD02569	3	2024-12-03
REV00696	PROD0176	CUST0747	ORD02571	1	2024-11-03
REV00697	PROD0038	CUST0747	ORD02573	3	2024-11-25
REV00698	PROD0025	CUST0748	ORD02578	4	2024-11-06
REV00699	PROD0201	CUST0748	ORD02581	5	2023-12-05
REV00700	PROD0028	CUST0749	ORD02583	3	2024-10-08
REV00701	PROD0178	CUST0749	ORD02584	4	2024-07-21
REV00702	PROD0090	CUST0750	ORD02586	5	2024-10-11
REV00703	PROD0055	CUST0750	ORD02588	2	2024-11-19
REV00704	PROD0066	CUST0750	ORD02589	5	2024-11-28
REV00705	PROD0076	CUST0751	ORD02592	4	2024-05-11
REV00706	PROD0244	CUST0751	ORD02599	2	2024-11-22
REV00707	PROD0220	CUST0753	ORD02607	4	2024-10-25
REV00708	PROD0086	CUST0753	ORD02609	5	2024-08-26
REV00709	PROD0267	CUST0756	ORD02620	4	2024-12-31
REV00710	PROD0253	CUST0758	ORD02622	4	2024-12-31
REV00711	PROD0248	CUST0758	ORD02625	5	2024-06-14
REV00712	PROD0253	CUST0760	ORD02628	4	2024-12-27
REV00713	PROD0280	CUST0760	ORD02630	5	2024-12-17
REV00714	PROD0007	CUST0760	ORD02631	4	2024-12-30
REV00715	PROD0120	CUST0760	ORD02632	5	2024-12-27
REV00716	PROD0120	CUST0762	ORD02636	5	2024-12-10
REV00717	PROD0230	CUST0763	ORD02638	4	2024-07-22
REV00719	PROD0236	CUST0768	ORD02644	3	2024-08-03
REV00720	PROD0070	CUST0771	ORD02650	5	2024-02-04
REV00721	PROD0009	CUST0772	ORD02652	4	2024-06-27
REV00722	PROD0040	CUST0772	ORD02660	3	2024-08-17
REV00723	PROD0134	CUST0774	ORD02664	4	2024-01-23
REV00724	PROD0088	CUST0774	ORD02665	5	2023-11-04
REV00725	PROD0137	CUST0774	ORD02669	3	2023-03-02
REV00726	PROD0258	CUST0778	ORD02676	3	2024-12-10
REV00727	PROD0045	CUST0778	ORD02681	3	2024-12-10
REV00728	PROD0181	CUST0779	ORD02685	2	2024-07-08
REV00729	PROD0087	CUST0779	ORD02686	4	2024-06-14
REV00730	PROD0213	CUST0779	ORD02689	4	2024-02-29
REV00731	PROD0067	CUST0779	ORD02691	5	2024-05-23
REV00732	PROD0082	CUST0782	ORD02697	3	2024-05-26
REV00733	PROD0026	CUST0783	ORD02700	1	2023-11-24
REV00734	PROD0099	CUST0783	ORD02701	3	2024-02-02
REV00735	PROD0267	CUST0783	ORD02702	5	2023-10-10
REV00736	PROD0071	CUST0783	ORD02703	5	2024-07-01
REV00737	PROD0080	CUST0784	ORD02710	5	2023-07-29
REV00738	PROD0250	CUST0784	ORD02711	3	2024-06-03
REV00739	PROD0217	CUST0784	ORD02712	2	2024-04-25
REV00740	PROD0128	CUST0784	ORD02714	3	2024-11-18
REV00741	PROD0045	CUST0784	ORD02715	5	2024-04-28
REV00742	PROD0065	CUST0784	ORD02716	5	2024-10-31
REV00743	PROD0041	CUST0786	ORD02723	5	2024-10-27
REV00744	PROD0056	CUST0786	ORD02724	2	2024-03-30
REV00745	PROD0178	CUST0786	ORD02725	4	2024-06-12
REV00746	PROD0167	CUST0789	ORD02729	3	2024-05-21
REV00747	PROD0025	CUST0792	ORD02737	1	2024-05-30
REV00748	PROD0018	CUST0792	ORD02744	1	2024-09-14
REV00749	PROD0035	CUST0793	ORD02747	4	2024-07-13
REV00750	PROD0247	CUST0797	ORD02769	4	2024-04-16
REV00751	PROD0266	CUST0797	ORD02772	1	2024-07-12
REV00752	PROD0126	CUST0800	ORD02777	5	2024-09-23
REV00753	PROD0272	CUST0800	ORD02778	5	2024-03-30
REV00754	PROD0083	CUST0801	ORD02779	1	2024-10-07
REV00755	PROD0257	CUST0801	ORD02783	5	2024-12-11
REV00756	PROD0002	CUST0801	ORD02784	5	2024-10-10
REV00757	PROD0244	CUST0801	ORD02785	2	2024-10-28
REV00758	PROD0091	CUST0801	ORD02789	4	2024-10-16
REV00759	PROD0054	CUST0802	ORD02794	3	2024-08-13
REV00760	PROD0238	CUST0804	ORD02799	2	2023-11-26
REV00761	PROD0261	CUST0809	ORD02803	4	2024-10-13
REV00762	PROD0081	CUST0809	ORD02804	4	2023-08-13
REV00763	PROD0248	CUST0812	ORD02811	4	2024-08-19
REV00764	PROD0221	CUST0813	ORD02818	5	2024-09-28
REV00765	PROD0162	CUST0814	ORD02819	4	2023-09-04
REV00766	PROD0097	CUST0814	ORD02821	1	2024-07-02
REV00767	PROD0200	CUST0814	ORD02823	5	2024-07-19
REV00768	PROD0086	CUST0815	ORD02829	3	2024-12-31
REV00769	PROD0052	CUST0815	ORD02830	4	2024-11-30
REV00770	PROD0110	CUST0815	ORD02831	3	2024-10-08
REV00771	PROD0031	CUST0815	ORD02833	1	2024-12-31
REV00772	PROD0170	CUST0816	ORD02835	2	2024-10-10
REV00773	PROD0211	CUST0817	ORD02842	4	2024-07-26
REV00774	PROD0023	CUST0817	ORD02846	4	2024-01-08
REV00775	PROD0005	CUST0818	ORD02853	3	2024-09-29
REV00776	PROD0065	CUST0818	ORD02854	5	2024-11-12
REV00777	PROD0018	CUST0820	ORD02865	5	2024-01-30
REV00778	PROD0266	CUST0821	ORD02866	4	2024-08-29
REV00779	PROD0109	CUST0822	ORD02871	3	2024-10-14
REV00780	PROD0149	CUST0822	ORD02872	5	2024-09-21
REV00781	PROD0165	CUST0822	ORD02875	3	2024-12-05
REV00782	PROD0189	CUST0823	ORD02876	3	2024-11-03
REV00783	PROD0127	CUST0825	ORD02882	3	2024-02-15
REV00784	PROD0027	CUST0825	ORD02885	3	2024-03-11
REV00785	PROD0067	CUST0825	ORD02888	5	2024-03-24
REV00786	PROD0101	CUST0830	ORD02897	5	2024-07-23
REV00787	PROD0253	CUST0830	ORD02898	4	2024-12-30
REV00788	PROD0092	CUST0830	ORD02899	2	2024-06-29
REV00789	PROD0191	CUST0831	ORD02909	3	2024-03-16
REV00790	PROD0184	CUST0831	ORD02915	4	2024-09-10
REV00791	PROD0066	CUST0833	ORD02921	4	2024-08-02
REV00792	PROD0223	CUST0833	ORD02922	5	2024-12-31
REV00793	PROD0035	CUST0833	ORD02923	5	2024-09-09
REV00794	PROD0210	CUST0833	ORD02928	4	2024-10-31
REV00795	PROD0148	CUST0836	ORD02936	5	2024-12-14
REV00796	PROD0180	CUST0836	ORD02940	3	2024-11-26
REV00797	PROD0011	CUST0837	ORD02949	3	2024-07-13
REV00798	PROD0177	CUST0839	ORD02954	4	2024-09-21
REV00799	PROD0245	CUST0840	ORD02958	3	2024-01-22
REV00800	PROD0007	CUST0843	ORD02966	4	2024-11-04
REV00801	PROD0046	CUST0843	ORD02970	4	2024-05-20
REV00802	PROD0197	CUST0844	ORD02972	4	2024-09-16
REV00803	PROD0279	CUST0847	ORD02976	3	2024-10-23
REV00804	PROD0057	CUST0847	ORD02977	4	2024-11-05
REV00805	PROD0204	CUST0847	ORD02978	4	2024-10-08
REV00806	PROD0056	CUST0847	ORD02979	5	2024-08-25
REV00807	PROD0225	CUST0847	ORD02980	3	2024-09-14
REV00808	PROD0182	CUST0849	ORD02981	3	2024-06-02
REV00809	PROD0043	CUST0849	ORD02983	2	2024-07-22
REV00810	PROD0074	CUST0850	ORD02984	4	2024-10-30
REV00811	PROD0181	CUST0851	ORD02987	5	2024-09-08
REV00812	PROD0073	CUST0852	ORD02989	1	2024-06-10
REV00813	PROD0230	CUST0854	ORD02992	5	2024-01-15
REV00814	PROD0055	CUST0857	ORD02996	5	2024-05-10
REV00815	PROD0062	CUST0858	ORD02998	2	2023-08-13
REV00816	PROD0012	CUST0859	ORD03000	4	2024-02-26
REV00817	PROD0012	CUST0518	ORD01723	3	2024-02-17
REV00175	PROD0085	CUST0217	ORD00722	\N	2024-11-03
REV00458	PROD0230	CUST0506	ORD01689	\N	2023-08-17
REV00532	PROD0002	CUST0586	ORD01954	\N	2024-07-21
REV00718	PROD0232	CUST0764	ORD02639	\N	2024-12-31
REV00586	PROD0005	CUST0636	ORD02141	\N	2023-09-10
\.


--
-- Data for Name: sellers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sellers (seller_id, seller_name, onboarding_date, product_category, city, state, account_status) FROM stdin;
SELL003	GreenHome Stores	2022-06-29	Electronics	Lagos	Lagos	Active
SELL012	FreshFarm NG	2024-04-22	Electronics	Lagos	Lagos	Active
SELL009	StyleZone Lagos	2022-08-31	Books	Lagos	Lagos	Active
SELL052	TechZone NG	2023-11-03	Electronics	Lagos	Lagos	Active
SELL015	GadgetKing NG	2022-02-23	Books & Stationery	Kano	Kano	Active
SELL022	UrbanStyle NG	2022-09-26	Fashion	Ibadan	Oyo	Active
SELL017	OrganicLife NG	2022-06-11	Electronics	Abuja	FCT	Active
SELL030	WellnessHub NG	2023-04-15	Food	Abuja	FCT	Active
SELL032	ChicStyle NG	2022-03-16	Home & Garden	Kano	Kano	Active
SELL033	EcoHome NG	2023-04-28	Fashion	Lagos	Lagos	Active
SELL036	NaijaSnacks NG	2023-04-25	Home & Garden	Abuja	FCT	Active
SELL037	EduBooks NG	2022-11-17	Electronics	Lagos	Lagos	Suspended
SELL041	DigiTech NG	2023-10-14	Food & Beverages	Abuja	FCT	Active
SELL043	HomePlus NG	2022-04-29	Beauty	Kano	Kano	Active
SELL044	FitnessFirst NG	2023-07-29	Food	Abuja	FCT	Active
SELL049	VogueNG	2022-01-27	Home & Garden	Kano	Kano	Active
SELL050	SportsGear NG	2024-05-07	Electronics	Lagos	Lagos	Active
SELL053	ModaNG	2024-03-27	Food & Beverages	Ibadan	Oyo	Active
SELL057	AgriMart NG	2022-10-19	Beauty & Personal Care	Lagos	Lagos	Active
SELL060	AllFashion NG	2023-05-03	Beauty	Abuja	FCT	Active
SELL063	PureSkin NG	2023-05-23	Fashion	Kano	Kano	Active
SELL064	Naija Grains	2024-03-31	Electronics	Abuja	FCT	Active
SELL066	GadgetPro NG	2022-03-20	Sports & Fitness	Abuja	FCT	Active
SELL071	FarmFresh NG	2022-09-29	Books & Stationery	Abuja	FCT	Active
SELL072	ReadRight NG	2023-09-11	Food & Beverages	Lagos	Lagos	Active
SELL073	SmartShop NG	2023-02-09	Electronics	Abuja	FCT	Active
SELL074	TrendHub NG	2023-11-05	Beauty	Abuja	FCT	Active
SELL075	LivingPlus NG	2023-01-05	Sports	Kano	Kano	Active
SELL078	NaijaFoods NG	2024-05-28	Food & Beverages	Abuja	FCT	Active
SELL079	ScholarsNG	2022-06-01	Beauty & Personal Care	Lagos	Lagos	Active
SELL084	GlowBar NG	2023-06-10	Beauty	Abuja	FCT	Active
SELL086	KnowledgeHub NG	2023-03-04	Food & Beverages	Lagos	Lagos	Active
SELL087	TechBase NG	2022-12-22	Food	Kano	Kano	Active
SELL001	TechHub Nigeria	2023-09-07	Fashion	Port-Harcourt	Rivers	Active
SELL016	TrendyFash	2022-01-04	Fashion	Port-Harcourt	Rivers	Active
SELL018	ReadMore NG	2023-04-08	Home & Garden	Port-Harcourt	Rivers	Active
SELL046	LocalFarm NG	2024-05-04	Fashion	Port-Harcourt	Rivers	Active
SELL047	LearnMore NG	2022-08-06	Sports & Fitness	Port-Harcourt	Rivers	Active
SELL054	GreenSpace NG	2022-11-27	Home & Garden	Port-Harcourt	Rivers	Active
SELL038	PowerTech NG	2022-10-15	Books	Port-Harcourt	Rivers	Active
SELL006	FoodBasket NG	2023-01-12	Food & Beverages	Lagos	Lagos	Active
SELL034	RunFast NG	2023-01-26	Sports	Lagos	Lagos	Active
SELL042	StreetStyle NG	2022-07-07	Fashion	Lagos	Lagos	Suspended
SELL088	StyleKraft NG	2022-07-16	Food	Lagos	Lagos	Active
SELL007	BookWorld Nigeria	2022-02-05	Sports & Fitness	Ibadan	Oyo	Active
SELL055	GymPro NG	2022-04-05	Beauty & Personal Care	Ibadan	Oyo	Active
SELL056	SkinGlow NG	2023-02-13	Books & Stationery	Ibadan	Oyo	Active
SELL077	BeautyNation NG	2022-01-28	Books & Stationery	Ibadan	Oyo	Active
SELL010	NaturalGlow NG	2022-09-19	Beauty & Personal Care	Ibadan	Oyo	Active
SELL039	LuxeBeauty NG	2023-09-20	Home & Garden	Ibadan	Oyo	Active
SELL082	HomeNest NG	2022-02-22	Beauty & Personal Care	Port-Harcourt	Rivers	Active
SELL090	AthleticNG	2023-12-30	Food	Port-Harcourt	Rivers	Active
SELL062	ActiveLife NG	2022-12-16	Sports & Fitness	Lagos	Lagos	Active
SELL068	EarthHome NG	2024-02-27	Electronics	Lagos	Lagos	Active
SELL070	GlowUp NG	2022-11-01	Food	Lagos	Lagos	Active
SELL004	GlowBeauty Shop	2023-08-27	Books & Stationery	Abuja	FCT	Active
SELL014	HomeEssentials NG	2022-03-09	Sports & Fitness	Kano	Kano	Active
SELL051	HealthFood NG	2023-11-07	Food & Beverages	Abuja	FCT	Active
SELL065	BrightMinds NG	2024-05-11	Home & Garden	Kano	Kano	Active
SELL067	FreshStyle NG	2023-11-08	Beauty & Personal Care	Abuja	FCT	Active
SELL081	FashionKraft NG	2023-08-23	Beauty & Personal Care	Lagos	Lagos	Active
SELL083	FitZone NG	2023-05-23	Books & Stationery	Ibadan	Oyo	Active
SELL085	HarvestPlus NG	2022-01-20	Sports & Fitness	Kano	Kano	Active
SELL008	QuickTech NG	2022-11-13	Beauty & Personal Care	Lagos	Lagos	Active
SELL027	TechStore NG	2022-07-31	Books & Stationery	Lagos	Lagos	Active
SELL005	SportsPro Nigeria	2023-05-02	Beauty & Personal Care	Lagos	Lagos	Active
SELL019	ActiveWear NG	2024-04-26	Sports & Fitness	Lagos	Lagos	Active
SELL035	SkincareNG	2022-02-12	Sports & Fitness	Lagos	Lagos	Active
SELL058	PageTurner NG	2023-03-19	Books & Stationery	Lagos	Lagos	Active
SELL011	FitLife Nigeria	2023-03-26	Fashion	Lagos	Lagos	Active
SELL040	AfricanFoods NG	2022-11-20	Fashion	Abuja	FCT	Active
SELL069	SweatZone NG	2024-03-16	Fashion	Kano	Kano	Active
SELL080	UltraTech NG	2024-01-27	Fashion	Lagos	Lagos	Active
SELL020	TasteOfNigeria	2022-07-06	Home & Garden	Lagos	Lagos	Active
SELL089	GardenHouse NG	2023-12-03	Sports	Abuja	FCT	Active
SELL002	FashionVault NG	2023-02-04	Food & Beverages	Port-Harcourt	Rivers	Active
SELL031	ElectroMart NG	2023-02-12	Food	Port-Harcourt	Rivers	Active
SELL048	MaxGadget NG	2023-03-03	Fashion	Port-Harcourt	Rivers	Active
SELL061	CozyHome NG	2023-01-13	Books	Port-Harcourt	Rivers	Active
SELL021	SmartGadgets NG	2023-07-26	Electronics	Lagos	Lagos	Active
SELL023	CleanHome NG	2023-09-07	Beauty & Personal Care	Abuja	FCT	Active
SELL024	SportsCentral NG	2022-05-01	Sports	Lagos	Lagos	Suspended
SELL026	HealthyEats NG	2024-03-11	Books	Ibadan	Oyo	Active
SELL028	FashionHub NG	2022-07-04	Beauty & Personal Care	Kano	Kano	Active
SELL029	GardenPlus NG	2022-08-30	Home & Garden	Lagos	Lagos	Active
SELL013	KidsWorld NG	2022-12-07	Books & Stationery	Kano	Kano	Active
SELL059	TechPower NG	2023-11-13	Home & Garden	Kano	Kano	Active
SELL025	PureBeauty NG	2022-05-02	Beauty & Personal Care	Port-Harcourt	Rivers	Active
SELL045	BeautyBox NG	2022-06-01	Books & Stationery	Port-Harcourt	Rivers	Active
SELL076	SportNation NG	2022-01-15	Fashion	Lagos	Lagos	Active
\.


--
-- Name: order_items_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_items_item_id_seq', 6426, true);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (item_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (payment_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (review_id);


--
-- Name: sellers sellers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellers
    ADD CONSTRAINT sellers_pkey PRIMARY KEY (seller_id);


--
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);


--
-- Name: order_items order_items_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- Name: orders orders_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- Name: orders orders_seller_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_seller_id_fkey FOREIGN KEY (seller_id) REFERENCES public.sellers(seller_id);


--
-- Name: payments payments_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);


--
-- Name: products products_seller_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_seller_id_fkey FOREIGN KEY (seller_id) REFERENCES public.sellers(seller_id);


--
-- Name: reviews reviews_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- Name: reviews reviews_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- PostgreSQL database dump complete
--

\unrestrict 7TIDLyIYho7kkH03IKUedf4hyjMUImRjrotKEeXebA1jy5BSp4ConvznfXshnSi

