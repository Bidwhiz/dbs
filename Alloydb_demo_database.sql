--
-- PostgreSQL database dump
--

-- Dumped from database version 14.17
-- Dumped by pg_dump version 14.17

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers (
    customernumber integer NOT NULL,
    customername character varying(50) NOT NULL,
    contactlastname character varying(50) NOT NULL,
    contactfirstname character varying(50) NOT NULL,
    phone character varying(50) NOT NULL,
    addressline1 character varying(50) NOT NULL,
    addressline2 character varying(50) DEFAULT NULL::character varying,
    city character varying(50) NOT NULL,
    state character varying(50) DEFAULT NULL::character varying,
    postalcode character varying(15) DEFAULT NULL::character varying,
    country character varying(50) NOT NULL,
    salesrepemployeenumber integer,
    creditlimit numeric(10,2) DEFAULT NULL::numeric
);


--
-- Name: employees; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.employees (
    employeenumber integer NOT NULL,
    lastname character varying(50) NOT NULL,
    firstname character varying(50) NOT NULL,
    extension character varying(10) NOT NULL,
    email character varying(100) NOT NULL,
    officecode character varying(10) NOT NULL,
    reportsto integer,
    jobtitle character varying(50) NOT NULL
);


--
-- Name: offices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.offices (
    officecode character varying(10) NOT NULL,
    city character varying(50) NOT NULL,
    phone character varying(50) NOT NULL,
    addressline1 character varying(50) NOT NULL,
    addressline2 character varying(50) DEFAULT NULL::character varying,
    state character varying(50) DEFAULT NULL::character varying,
    country character varying(50) NOT NULL,
    postalcode character varying(15) NOT NULL,
    territory character varying(10) NOT NULL
);


--
-- Name: orderdetails; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orderdetails (
    ordernumber integer NOT NULL,
    productcode character varying(15) NOT NULL,
    quantityordered integer NOT NULL,
    priceeach numeric(10,2) NOT NULL,
    orderlinenumber smallint NOT NULL
);


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    ordernumber integer NOT NULL,
    orderdate date NOT NULL,
    requireddate date NOT NULL,
    shippeddate date,
    status character varying(15) NOT NULL,
    comments text,
    customernumber integer NOT NULL
);


--
-- Name: payments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payments (
    customernumber integer NOT NULL,
    checknumber character varying(50) NOT NULL,
    paymentdate date NOT NULL,
    amount numeric(10,2) NOT NULL
);


--
-- Name: productlines; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.productlines (
    productline character varying(50) NOT NULL,
    textdescription character varying(4000) DEFAULT NULL::character varying,
    htmldescription character varying(4000) DEFAULT NULL::character varying
);


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    productcode character varying(15) NOT NULL,
    productname character varying(70) DEFAULT NULL::character varying,
    productline character varying(50) DEFAULT NULL::character varying,
    productscale character varying(10) DEFAULT NULL::character varying,
    productvendor character varying(50) DEFAULT NULL::character varying,
    productdescription character varying(4000) DEFAULT NULL::character varying,
    quantityinstock smallint,
    buyprice numeric(10,2) DEFAULT NULL::numeric,
    msrp numeric(10,2) DEFAULT NULL::numeric
);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers (customernumber, customername, contactlastname, contactfirstname, phone, addressline1, addressline2, city, state, postalcode, country, salesrepemployeenumber, creditlimit) FROM stdin;
103	Atelier graphique	Schmitt	Carine 	40.32.2555	54, rue Royale	\N	Nantes	\N	44000	France	1370	21000.00
112	Signal Gift Stores	King	Jean	7025551838	8489 Strong St.	\N	Las Vegas	NV	83030	USA	1166	71800.00
114	Australian Collectors, Co.	Ferguson	Peter	03 9520 4555	636 St Kilda Road	Level 3	Melbourne	Victoria	3004	Australia	1611	117300.00
119	La Rochelle Gifts	Labrune	Janine 	40.67.8555	67, rue des Cinquante Otages	\N	Nantes	\N	44000	France	1370	118200.00
121	Baane Mini Imports	Bergulfsen	Jonas 	07-98 9555	Erling Skakkes gate 78	\N	Stavern	\N	4110	Norway	1504	81700.00
124	Mini Gifts Distributors Ltd.	Nelson	Susan	4155551450	5677 Strong St.	\N	San Rafael	CA	97562	USA	1165	210500.00
125	Havel & Zbyszek Co	Piestrzeniewicz	Zbyszek 	(26) 642-7555	ul. Filtrowa 68	\N	Warszawa	\N	01-012	Poland	\N	0.00
128	Blauer See Auto, Co.	Keitel	Roland	+49 69 66 90 2555	Lyonerstr. 34	\N	Frankfurt	\N	60528	Germany	1504	59700.00
129	Mini Wheels Co.	Murphy	Julie	6505555787	5557 North Pendale Street	\N	San Francisco	CA	94217	USA	1165	64600.00
131	Land of Toys Inc.	Lee	Kwai	2125557818	897 Long Airport Avenue	\N	NYC	NY	10022	USA	1323	114900.00
141	Euro+ Shopping Channel	Freyre	Diego 	(91) 555 94 44	C/ Moralzarzal, 86	\N	Madrid	\N	28034	Spain	1370	227600.00
144	Volvo Model Replicas, Co	Berglund	Christina 	0921-12 3555	Berguvsvägen  8	\N	Luleå	\N	S-958 22	Sweden	1504	53100.00
145	Danish Wholesale Imports	Petersen	Jytte 	31 12 3555	Vinbæltet 34	\N	Kobenhavn	\N	1734	Denmark	1401	83400.00
146	Saveley & Henriot, Co.	Saveley	Mary 	78.32.5555	2, rue du Commerce	\N	Lyon	\N	69004	France	1337	123900.00
148	Dragon Souveniers, Ltd.	Natividad	Eric	+65 221 7555	Bronz Sok.	Bronz Apt. 3/6 Tesvikiye	Singapore	\N	079903	Singapore	1621	103800.00
151	Muscle Machine Inc	Young	Jeff	2125557413	4092 Furth Circle	Suite 400	NYC	NY	10022	USA	1286	138500.00
157	Diecast Classics Inc.	Leong	Kelvin	2155551555	7586 Pompton St.	\N	Allentown	PA	70267	USA	1216	100600.00
161	Technics Stores Inc.	Hashimoto	Juri	6505556809	9408 Furth Circle	\N	Burlingame	CA	94217	USA	1165	84600.00
166	Handji Gifts& Co	Victorino	Wendy	+65 224 1555	106 Linden Road Sandown	2nd Floor	Singapore	\N	069045	Singapore	1612	97900.00
167	Herkku Gifts	Oeztan	Veysel	+47 2267 3215	Brehmen St. 121	PR 334 Sentrum	Bergen	\N	N 5804	Norway  	1504	96800.00
168	American Souvenirs Inc	Franco	Keith	2035557845	149 Spinnaker Dr.	Suite 101	New Haven	CT	97823	USA	1286	0.00
169	Porto Imports Co.	de Castro	Isabel 	(1) 356-5555	Estrada da saúde n. 58	\N	Lisboa	\N	1756	Portugal	\N	0.00
171	Daedalus Designs Imports	Rancé	Martine 	20.16.1555	184, chaussée de Tournai	\N	Lille	\N	59000	France	1370	82900.00
172	La Corne Dabondance, Co.	Bertrand	Marie	(1) 42.34.2555	265, boulevard Charonne	\N	Paris	\N	75012	France	1337	84300.00
173	Cambridge Collectables Co.	Tseng	Jerry	6175555555	4658 Baden Av.	\N	Cambridge	MA	51247	USA	1188	43400.00
175	Gift Depot Inc.	King	Julie	2035552570	25593 South Bay Ln.	\N	Bridgewater	CT	97562	USA	1323	84300.00
177	Osaka Souveniers Co.	Kentary	Mory	+81 06 6342 5555	1-6-20 Dojima	\N	Kita-ku	Osaka	 530-0003	Japan	1621	81200.00
181	Vitachrome Inc.	Frick	Michael	2125551500	2678 Kingston Rd.	Suite 101	NYC	NY	10022	USA	1286	76400.00
186	Toys of Finland, Co.	Karttunen	Matti	90-224 8555	Keskuskatu 45	\N	Helsinki	\N	21240	Finland	1501	96500.00
187	AV Stores, Co.	Ashworth	Rachel	(171) 555-1555	Fauntleroy Circus	\N	Manchester	\N	EC2 5NT	UK	1501	136800.00
189	Clover Collections, Co.	Cassidy	Dean	+353 1862 1555	25 Maiden Lane	Floor No. 4	Dublin	\N	2	Ireland	1504	69400.00
198	Auto-Moto Classics Inc.	Taylor	Leslie	6175558428	16780 Pompton St.	\N	Brickhaven	MA	58339	USA	1216	23000.00
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.employees (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle) FROM stdin;
1002	Murphy	Diane	x5800	dmurphy@classicmodelcars.com	1	\N	President
1056	Patterson	Mary	x4611	mpatterso@classicmodelcars.com	1	1002	VP Sales
1076	Firrelli	Jeff	x9273	jfirrelli@classicmodelcars.com	1	1002	VP Marketing
1088	Patterson	William	x4871	wpatterson@classicmodelcars.com	6	1056	Sales Manager (APAC)
1102	Bondur	Gerard	x5408	gbondur@classicmodelcars.com	4	1056	Sale Manager (EMEA)
1143	Bow	Anthony	x5428	abow@classicmodelcars.com	1	1056	Sales Manager (NA)
1165	Jennings	Leslie	x3291	ljennings@classicmodelcars.com	1	1143	Sales Rep
1166	Thompson	Leslie	x4065	lthompson@classicmodelcars.com	1	1143	Sales Rep
1188	Firrelli	Julie	x2173	jfirrelli@classicmodelcars.com	2	1143	Sales Rep
1216	Patterson	Steve	x4334	spatterson@classicmodelcars.com	2	1143	Sales Rep
1286	Tseng	Foon Yue	x2248	ftseng@classicmodelcars.com	3	1143	Sales Rep
1323	Vanauf	George	x4102	gvanauf@classicmodelcars.com	3	1143	Sales Rep
1337	Bondur	Loui	x6493	lbondur@classicmodelcars.com	4	1102	Sales Rep
1370	Hernandez	Gerard	x2028	ghernande@classicmodelcars.com	4	1102	Sales Rep
1401	Castillo	Pamela	x2759	pcastillo@classicmodelcars.com	4	1102	Sales Rep
1501	Bott	Larry	x2311	lbott@classicmodelcars.com	7	1102	Sales Rep
1504	Jones	Barry	x102	bjones@classicmodelcars.com	7	1102	Sales Rep
1611	Fixter	Andy	x101	afixter@classicmodelcars.com	6	1088	Sales Rep
1612	Marsh	Peter	x102	pmarsh@classicmodelcars.com	6	1088	Sales Rep
1619	King	Tom	x103	tking@classicmodelcars.com	6	1088	Sales Rep
1621	Nishi	Mami	x101	mnishi@classicmodelcars.com	5	1056	Sales Rep
1625	Kato	Yoshimi	x102	ykato@classicmodelcars.com	5	1621	Sales Rep
1702	Gerard	Martin	x2312	mgerard@classicmodelcars.com	4	1102	Sales Rep
\.


--
-- Data for Name: offices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.offices (officecode, city, phone, addressline1, addressline2, state, country, postalcode, territory) FROM stdin;
1	San Francisco	+1 650 219 4782	100 Market Street	Suite 300	CA	USA	94080	NA
2	Boston	+1 215 837 0825	1550 Court Place	Suite 102	MA	USA	02107	NA
3	NYC	+1 212 555 3000	523 East 53rd Street	apt. 5A	NY	USA	10022	NA
4	Paris	+33 14 723 4404	43 Rue Jouffroy Dabbans	\N	\N	France	75017	EMEA
5	Tokyo	+81 33 224 5000	4-1 Kioicho	\N	Chiyoda-Ku	Japan	102-8578	Japan
6	Sydney	+61 2 9264 2451	5-11 Wentworth Avenue	Floor #2	\N	Australia	NSW 2010	APAC
7	London	+44 20 7877 2041	25 Old Broad Street	Level 7	\N	UK	EC2N 1HN	EMEA
\.


--
-- Data for Name: orderdetails; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orderdetails (ordernumber, productcode, quantityordered, priceeach, orderlinenumber) FROM stdin;
10100	S18_1749	30	136.00	3
10100	S18_2248	50	55.09	2
10100	S18_4409	22	75.46	4
10100	S24_3969	49	35.29	1
10101	S18_2325	25	108.06	4
10101	S18_2795	26	167.06	1
10101	S24_1937	45	32.53	3
10101	S24_2022	46	44.35	2
10102	S18_1342	39	95.55	2
10102	S18_1367	41	43.13	1
10103	S10_1949	26	214.30	11
10103	S10_4962	42	119.67	4
10103	S12_1666	27	121.64	8
10103	S18_1097	35	94.50	10
10103	S18_2432	22	58.34	2
10103	S18_2949	27	92.19	12
10103	S18_2957	35	61.84	14
10103	S18_3136	25	86.92	13
10103	S18_3320	46	86.31	16
10103	S18_4600	36	98.07	5
10103	S18_4668	41	40.75	9
10103	S24_2300	36	107.34	1
10103	S24_4258	25	88.62	15
10103	S32_1268	31	92.46	3
10103	S32_3522	45	63.35	7
10103	S700_2824	42	94.07	6
10104	S12_3148	34	131.44	1
10104	S12_4473	41	111.39	9
10104	S18_2238	24	135.90	8
10104	S18_2319	29	122.73	12
10104	S18_3232	23	165.95	13
10104	S18_4027	38	119.20	3
10104	S24_1444	35	52.02	6
10104	S24_2840	44	30.41	10
10104	S24_4048	26	106.45	5
10104	S32_2509	35	51.95	11
10104	S32_3207	49	56.55	4
10104	S50_1392	33	114.59	7
10104	S50_1514	32	53.31	2
10105	S10_4757	50	127.84	2
10105	S12_1108	41	205.72	15
10105	S12_3891	29	141.88	14
10105	S18_3140	22	136.59	11
10105	S18_3259	38	87.73	13
10105	S18_4522	41	75.48	10
10105	S24_2011	43	117.97	9
10105	S24_3151	44	73.46	4
10105	S24_3816	50	75.47	1
10105	S700_1138	41	54.00	5
10105	S700_1938	29	86.61	12
10105	S700_2610	31	60.72	3
10105	S700_3505	39	92.16	6
10105	S700_3962	22	99.31	7
10105	S72_3212	25	44.77	8
10106	S18_1662	36	134.04	12
10106	S18_2581	34	81.10	2
10106	S18_3029	41	80.86	18
10106	S18_3856	41	94.22	17
10106	S24_1785	28	107.23	4
10106	S24_2841	49	65.77	13
10106	S24_3420	31	55.89	14
10106	S24_3949	50	55.96	11
10106	S24_4278	26	71.00	3
10106	S32_4289	33	65.35	5
10106	S50_1341	39	35.78	6
10106	S700_1691	31	91.34	7
10106	S700_2047	30	85.09	16
10106	S700_2466	34	99.72	9
10106	S700_2834	32	113.90	1
10106	S700_3167	44	76.00	8
10106	S700_4002	48	70.33	10
10106	S72_1253	48	43.70	15
10107	S10_1678	30	81.35	2
10107	S10_2016	39	105.86	5
10107	S10_4698	27	172.36	4
10107	S12_2823	21	122.00	1
10107	S18_2625	29	52.70	6
10107	S24_1578	25	96.92	3
10107	S24_2000	38	73.12	7
10107	S32_1374	20	88.90	8
10108	S12_1099	33	165.38	6
10108	S12_3380	45	96.30	4
10108	S12_3990	39	75.81	7
10108	S12_4675	36	107.10	3
10108	S18_1889	38	67.76	2
10108	S18_3278	26	73.17	9
10108	S18_3482	29	132.29	8
10108	S18_3782	43	52.84	12
10108	S18_4721	44	139.87	11
10108	S24_2360	35	64.41	15
10108	S24_3371	30	60.01	5
10108	S24_3856	40	132.00	1
10108	S24_4620	31	67.10	10
10108	S32_2206	27	36.21	13
10108	S32_4485	31	87.76	16
10108	S50_4713	34	74.85	14
10109	S18_1129	26	117.48	4
10109	S18_1984	38	137.98	3
10109	S18_2870	26	126.72	1
10109	S18_3232	46	160.87	5
10109	S18_3685	47	125.74	2
10109	S24_2972	29	32.10	6
10110	S18_1589	37	118.22	16
10110	S18_1749	42	153.00	7
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders (ordernumber, orderdate, requireddate, shippeddate, status, comments, customernumber) FROM stdin;
10100	2003-01-06	2003-01-13	2003-01-10	Shipped	\N	363
10101	2003-01-09	2003-01-18	2003-01-11	Shipped	Check on availability.	128
10102	2003-01-10	2003-01-18	2003-01-14	Shipped	\N	181
10103	2003-01-29	2003-02-07	2003-02-02	Shipped	\N	121
10104	2003-01-31	2003-02-09	2003-02-01	Shipped	\N	141
10105	2003-02-11	2003-02-21	2003-02-12	Shipped	\N	145
10106	2003-02-17	2003-02-24	2003-02-21	Shipped	\N	278
10107	2003-02-24	2003-03-03	2003-02-26	Shipped	Difficult to negotiate with customer. We need more marketing materials	131
10108	2003-03-03	2003-03-12	2003-03-08	Shipped	\N	385
10109	2003-03-10	2003-03-19	2003-03-11	Shipped	Customer requested that FedEx Ground is used for this shipping	486
10110	2003-03-18	2003-03-24	2003-03-20	Shipped	\N	187
10111	2003-03-25	2003-03-31	2003-03-30	Shipped	\N	129
10112	2003-03-24	2003-04-03	2003-03-29	Shipped	Customer requested that ad materials (such as posters, pamphlets) be included in the shippment	144
10113	2003-03-26	2003-04-02	2003-03-27	Shipped	\N	124
10114	2003-04-01	2003-04-07	2003-04-02	Shipped	\N	172
10115	2003-04-04	2003-04-12	2003-04-07	Shipped	\N	424
10116	2003-04-11	2003-04-19	2003-04-13	Shipped	\N	381
10117	2003-04-16	2003-04-24	2003-04-17	Shipped	\N	148
10118	2003-04-21	2003-04-29	2003-04-26	Shipped	Customer has worked with some of our vendors in the past and is aware of their MSRP	216
10119	2003-04-28	2003-05-05	2003-05-02	Shipped	\N	382
10120	2003-04-29	2003-05-08	2003-05-01	Shipped	\N	114
10121	2003-05-07	2003-05-13	2003-05-13	Shipped	\N	353
10122	2003-05-08	2003-05-16	2003-05-13	Shipped	\N	350
10123	2003-05-20	2003-05-29	2003-05-22	Shipped	\N	103
10124	2003-05-21	2003-05-29	2003-05-25	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	112
10125	2003-05-21	2003-05-27	2003-05-24	Shipped	\N	114
10126	2003-05-28	2003-06-07	2003-06-02	Shipped	\N	458
10127	2003-06-03	2003-06-09	2003-06-06	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	151
10128	2003-06-06	2003-06-12	2003-06-11	Shipped	\N	141
10129	2003-06-12	2003-06-18	2003-06-14	Shipped	\N	324
10130	2003-06-16	2003-06-24	2003-06-21	Shipped	\N	198
10131	2003-06-16	2003-06-25	2003-06-21	Shipped	\N	447
10132	2003-06-25	2003-07-01	2003-06-28	Shipped	\N	323
10133	2003-06-27	2003-07-04	2003-07-03	Shipped	\N	141
10134	2003-07-01	2003-07-10	2003-07-05	Shipped	\N	250
10135	2003-07-02	2003-07-12	2003-07-03	Shipped	\N	124
10136	2003-07-04	2003-07-14	2003-07-06	Shipped	Customer is interested in buying more Ferrari models	242
10137	2003-07-10	2003-07-20	2003-07-14	Shipped	\N	353
10138	2003-07-07	2003-07-16	2003-07-13	Shipped	\N	496
10139	2003-07-16	2003-07-23	2003-07-21	Shipped	\N	282
10140	2003-07-24	2003-08-02	2003-07-30	Shipped	\N	161
10141	2003-08-01	2003-08-09	2003-08-04	Shipped	\N	334
10142	2003-08-08	2003-08-16	2003-08-13	Shipped	\N	124
10143	2003-08-10	2003-08-18	2003-08-12	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	320
10144	2003-08-13	2003-08-21	2003-08-14	Shipped	\N	381
10145	2003-08-25	2003-09-02	2003-08-31	Shipped	\N	205
10146	2003-09-03	2003-09-13	2003-09-06	Shipped	\N	447
10147	2003-09-05	2003-09-12	2003-09-09	Shipped	\N	379
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.payments (customernumber, checknumber, paymentdate, amount) FROM stdin;
103	HQ336336	2004-10-19	6066.78
103	JM555205	2003-06-05	14571.44
103	OM314933	2004-12-18	1676.14
112	BO864823	2004-12-17	14191.12
112	HQ55022	2003-06-06	32641.98
112	ND748579	2004-08-20	33347.88
114	GG31455	2003-05-20	45864.03
114	MA765515	2004-12-15	82261.22
114	NP603840	2003-05-31	7565.08
114	NR27552	2004-03-10	44894.74
119	DB933704	2004-11-14	19501.82
119	LN373447	2004-08-08	47924.19
119	NG94694	2005-02-22	49523.67
121	DB889831	2003-02-16	50218.95
121	FD317790	2003-10-28	1491.38
121	KI831359	2004-11-04	17876.32
121	MA302151	2004-11-28	34638.14
124	AE215433	2005-03-05	101244.59
124	BG255406	2004-08-28	85410.87
124	CQ287967	2003-04-11	11044.30
124	ET64396	2005-04-16	83598.04
124	HI366474	2004-12-27	47142.70
124	HR86578	2004-11-02	55639.66
124	KI131716	2003-08-15	111654.40
124	LF217299	2004-03-26	43369.30
124	NT141748	2003-11-25	45084.38
128	DI925118	2003-01-28	10549.01
128	FA465482	2003-10-18	24101.81
128	FH668230	2004-03-24	33820.62
128	IP383901	2004-11-18	7466.32
129	DM826140	2004-12-08	26248.78
129	ID449593	2003-12-11	23923.93
129	PI42991	2003-04-09	16537.85
131	CL442705	2003-03-12	22292.62
131	MA724562	2004-12-02	50025.35
131	NB445135	2004-09-11	35321.97
141	AU364101	2003-07-19	36251.03
141	DB583216	2004-11-01	36140.38
141	DL460618	2005-05-19	46895.48
141	HJ32686	2004-01-30	59830.55
141	ID10962	2004-12-31	116208.40
141	IN446258	2005-03-25	65071.26
141	JE105477	2005-03-18	120166.58
141	JN355280	2003-10-26	49539.37
141	JN722010	2003-02-25	40206.20
141	KT52578	2003-12-09	63843.55
141	MC46946	2004-07-09	35420.74
141	MF629602	2004-08-16	20009.53
141	NU627706	2004-05-17	26155.91
144	IR846303	2004-12-12	36005.71
144	LA685678	2003-04-09	7674.94
145	CN328545	2004-07-03	4710.73
145	ED39322	2004-04-26	28211.70
145	HR182688	2004-12-01	20564.86
145	JJ246391	2003-02-20	53959.21
146	FP549817	2004-03-18	40978.53
146	FU793410	2004-01-16	49614.72
146	LJ160635	2003-12-10	39712.10
148	BI507030	2003-04-22	44380.15
148	DD635282	2004-08-11	2611.84
148	KM172879	2003-12-26	105743.00
148	ME497970	2005-03-27	3516.04
151	BF686658	2003-12-22	58793.53
151	GB852215	2004-07-26	20314.44
151	IP568906	2003-06-18	58841.35
151	KI884577	2004-12-14	39964.63
157	HI618861	2004-11-19	35152.12
157	NN711988	2004-09-07	63357.13
161	BR352384	2004-11-14	2434.25
161	BR478494	2003-11-18	50743.65
161	KG644125	2005-02-02	12692.19
161	NI908214	2003-08-05	38675.13
166	BQ327613	2004-09-16	38785.48
166	DC979307	2004-07-07	44160.92
166	LA318629	2004-02-28	22474.17
167	ED743615	2004-09-19	12538.01
167	GN228846	2003-12-03	85024.46
171	GB878038	2004-03-15	18997.89
171	IL104425	2003-11-22	42783.81
172	AD832091	2004-09-09	1960.80
172	CE51751	2004-12-04	51209.58
172	EH208589	2003-04-20	33383.14
173	GP545698	2004-05-13	11843.45
173	IG462397	2004-03-29	20355.24
175	CITI3434344	2005-05-19	28500.78
175	IO448913	2003-11-19	24879.08
175	PI15215	2004-07-10	42044.77
177	AU750837	2004-04-17	15183.63
177	CI381435	2004-01-19	47177.59
\.


--
-- Data for Name: productlines; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.productlines (productline, textdescription, htmldescription) FROM stdin;
Classic Cars	Attention car enthusiasts: Make your wildest car ownership dreams come true. Whether you are looking for classic muscle cars, dream sports cars or movie-inspired miniatures, you will find great choices in this category. These replicas feature superb attention to detail and craftsmanship and offer features such as working steering system, opening forward compartment, opening rear trunk with removable spare wheel, 4-wheel independent spring suspension, and so on. The models range in size from 1:10 to 1:24 scale and include numerous limited edition and several out-of-production vehicles. All models include a certificate of authenticity from their manufacturers and come fully assembled and ready for display in the home or office.	\N
Motorcycles	Our motorcycles are state of the art replicas of classic as well as contemporary motorcycle legends such as Harley Davidson, Ducati and Vespa. Models contain stunning details such as official logos, rotating wheels, working kickstand, front suspension, gear-shift lever, footbrake lever, and drive chain. Materials used include diecast and plastic. The models range in size from 1:10 to 1:50 scale and include numerous limited edition and several out-of-production vehicles. All models come fully assembled and ready for display in the home or office. Most include a certificate of authenticity.	\N
Planes	Unique, diecast airplane and helicopter replicas suitable for collections, as well as home, office or classroom decorations. Models contain stunning details such as official logos and insignias, rotating jet engines and propellers, retractable wheels, and so on. Most come fully assembled and with a certificate of authenticity from their manufacturers.	\N
Ships	The perfect holiday or anniversary gift for executives, clients, friends, and family. These handcrafted model ships are unique, stunning works of art that will be treasured for generations! They come fully assembled and ready for display in the home or office. We guarantee the highest quality, and best value.	\N
Trucks and Buses	The Truck and Bus models are realistic replicas of buses and specialized trucks produced from the early 1920s to present. The models range in size from 1:12 to 1:50 scale and include numerous limited edition and several out-of-production vehicles. Materials used include tin, diecast and plastic. All models include a certificate of authenticity from their manufacturers and are a perfect ornament for the home and office.	\N
Vintage Cars	Our Vintage Car models realistically portray automobiles produced from the early 1900s through the 1940s. Materials used include Bakelite, diecast, plastic and wood. Most of the replicas are in the 1:18 and 1:24 scale sizes, which provide the optimum in detail and accuracy. Prices range from $30.00 up to $180.00 for some special limited edition replicas. All models include a certificate of authenticity from their manufacturers and come fully assembled and ready for display in the home or office.	\N
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products (productcode, productname, productline, productscale, productvendor, productdescription, quantityinstock, buyprice, msrp) FROM stdin;
S10_1678	1969 Harley Davidson Ultimate Chopper	Motorcycles	1:10	Min Lin Diecast	This replica features working kickstand, front suspension, gear-shift lever, footbrake lever, drive chain, wheels and steering. All parts are particularly delicate due to their precise scale and require special care and attention.	7933	48.81	95.70
S10_1949	1952 Alpine Renault 1300	Classic Cars	1:10	Classic Metal Creations	Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.	7305	98.58	214.30
S10_2016	1996 Moto Guzzi 1100i	Motorcycles	1:10	Highway 66 Mini Classics	Official Moto Guzzi logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.	6625	68.99	118.94
S10_4698	2003 Harley-Davidson Eagle Drag Bike	Motorcycles	1:10	Red Start Diecast	Model features, official Harley Davidson logos and insignias, detachable rear wheelie bar, heavy diecast metal with resin parts, authentic multi-color tampo-printed graphics, separate engine drive belts, free-turning front fork, rotating tires and rear racing slick, certificate of authenticity, detailed engine, display stand\\r\\n, precision diecast replica, baked enamel finish, 1:10 scale model, removable fender, seat and tank cover piece for displaying the superior detail of the v-twin engine	5582	91.02	193.66
S10_4757	1972 Alfa Romeo GTA	Classic Cars	1:10	Motor City Art Classics	Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.	3252	85.68	136.00
S10_4962	1962 LanciaA Delta 16V	Classic Cars	1:10	Second Gear Diecast	Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.	6791	103.42	147.74
S12_1099	1968 Ford Mustang	Classic Cars	1:12	Autoart Studio Design	Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color dark green.	68	95.34	194.57
S12_1108	2001 Ferrari Enzo	Classic Cars	1:12	Second Gear Diecast	Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.	3619	95.59	207.80
S12_1666	1958 Setra Bus	Trucks and Buses	1:12	Welly Diecast Productions	Model features 30 windows, skylights & glare resistant glass, working steering system, original logos	1579	77.90	136.67
S12_2823	2002 Suzuki XREO	Motorcycles	1:12	Unimax Art Galleries	Official logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.	9997	66.27	150.62
S12_3148	1969 Corvair Monza	Classic Cars	1:18	Welly Diecast Productions	1:18 scale die-cast about 10\\" long doors open, hood opens, trunk opens and wheels roll	6906	89.14	151.08
S12_3380	1968 Dodge Charger	Classic Cars	1:12	Welly Diecast Productions	1:12 scale model of a 1968 Dodge Charger. Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color black	9123	75.16	117.44
\.


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customernumber);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employeenumber);


--
-- Name: offices offices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offices
    ADD CONSTRAINT offices_pkey PRIMARY KEY (officecode);


--
-- Name: orderdetails orderdetails_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderdetails
    ADD CONSTRAINT orderdetails_pkey PRIMARY KEY (ordernumber, productcode);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (ordernumber);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (customernumber, checknumber);


--
-- Name: productlines productlines_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.productlines
    ADD CONSTRAINT productlines_pkey PRIMARY KEY (productline);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (productcode);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

