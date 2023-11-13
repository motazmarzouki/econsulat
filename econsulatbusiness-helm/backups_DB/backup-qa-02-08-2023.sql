--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

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

SET default_with_oids = false;

--
-- Name: appointment; Type: TABLE; Schema: public; Owner: econsulatbusiness
--

CREATE TABLE public.appointment (
    id uuid NOT NULL,
    status character varying(255) NOT NULL,
    notes character varying(255),
    start_date_time timestamp without time zone NOT NULL,
    end_date_time timestamp without time zone NOT NULL,
    visit_id uuid NOT NULL,
    consular_service_id uuid NOT NULL,
    consular_agent_id uuid,
    citizen_id uuid
);


ALTER TABLE public.appointment OWNER TO econsulatbusiness;

--
-- Name: citizen; Type: TABLE; Schema: public; Owner: econsulatbusiness
--

CREATE TABLE public.citizen (
    id uuid NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    consular_registration character varying(255),
    country character varying(3) NOT NULL,
    city character varying(3) NOT NULL,
    login_id character varying(100)
);


ALTER TABLE public.citizen OWNER TO econsulatbusiness;

--
-- Name: consular_agent; Type: TABLE; Schema: public; Owner: econsulatbusiness
--

CREATE TABLE public.consular_agent (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    login_id character varying(100),
    consular_office_id uuid
);


ALTER TABLE public.consular_agent OWNER TO econsulatbusiness;

--
-- Name: consular_office; Type: TABLE; Schema: public; Owner: econsulatbusiness
--

CREATE TABLE public.consular_office (
    id uuid NOT NULL,
    address character varying(100),
    country character varying(3) NOT NULL,
    city character varying(3) NOT NULL,
    telephone_number character varying(255),
    telephone_code character varying(255),
    email character varying(255),
    distinction character varying(255),
    activated boolean NOT NULL
);


ALTER TABLE public.consular_office OWNER TO econsulatbusiness;

--
-- Name: consular_planning; Type: TABLE; Schema: public; Owner: econsulatbusiness
--

CREATE TABLE public.consular_planning (
    id uuid NOT NULL,
    slot_duration numeric(21,2) NOT NULL,
    planning_start_date timestamp without time zone NOT NULL,
    planning_end_date timestamp without time zone NOT NULL,
    consular_office_id uuid NOT NULL
);


ALTER TABLE public.consular_planning OWNER TO econsulatbusiness;

--
-- Name: consular_service; Type: TABLE; Schema: public; Owner: econsulatbusiness
--

CREATE TABLE public.consular_service (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    top_service boolean NOT NULL,
    service_duration integer NOT NULL,
    service_category_id uuid NOT NULL
);


ALTER TABLE public.consular_service OWNER TO econsulatbusiness;

--
-- Name: counter; Type: TABLE; Schema: public; Owner: econsulatbusiness
--

CREATE TABLE public.counter (
    id uuid NOT NULL,
    number integer NOT NULL,
    description character varying(255),
    room character varying(255),
    open boolean,
    consular_office_id uuid NOT NULL
);


ALTER TABLE public.counter OWNER TO econsulatbusiness;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: econsulatbusiness
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO econsulatbusiness;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: econsulatbusiness
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO econsulatbusiness;

--
-- Name: day_off; Type: TABLE; Schema: public; Owner: econsulatbusiness
--

CREATE TABLE public.day_off (
    id uuid NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    name character varying(255) NOT NULL,
    notes character varying(255),
    consular_planning_id uuid NOT NULL
);


ALTER TABLE public.day_off OWNER TO econsulatbusiness;

--
-- Name: ec_authority; Type: TABLE; Schema: public; Owner: econsulatbusiness
--

CREATE TABLE public.ec_authority (
    name character varying(50) NOT NULL
);


ALTER TABLE public.ec_authority OWNER TO econsulatbusiness;

--
-- Name: ec_user; Type: TABLE; Schema: public; Owner: econsulatbusiness
--

CREATE TABLE public.ec_user (
    id character varying(100) NOT NULL,
    login character varying(50) NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(191),
    image_url character varying(256),
    activated boolean NOT NULL,
    lang_key character varying(10),
    created_by character varying(50) NOT NULL,
    created_date timestamp without time zone,
    last_modified_by character varying(50),
    last_modified_date timestamp without time zone
);


ALTER TABLE public.ec_user OWNER TO econsulatbusiness;

--
-- Name: ec_user_authority; Type: TABLE; Schema: public; Owner: econsulatbusiness
--

CREATE TABLE public.ec_user_authority (
    user_id character varying(100) NOT NULL,
    authority_name character varying(50) NOT NULL
);


ALTER TABLE public.ec_user_authority OWNER TO econsulatbusiness;

--
-- Name: rel_counter__consular_service; Type: TABLE; Schema: public; Owner: econsulatbusiness
--

CREATE TABLE public.rel_counter__consular_service (
    consular_service_id uuid NOT NULL,
    counter_id uuid NOT NULL
);


ALTER TABLE public.rel_counter__consular_service OWNER TO econsulatbusiness;

--
-- Name: sequence_generator; Type: SEQUENCE; Schema: public; Owner: econsulatbusiness
--

CREATE SEQUENCE public.sequence_generator
    START WITH 1050
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sequence_generator OWNER TO econsulatbusiness;

--
-- Name: service_category; Type: TABLE; Schema: public; Owner: econsulatbusiness
--

CREATE TABLE public.service_category (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255)
);


ALTER TABLE public.service_category OWNER TO econsulatbusiness;

--
-- Name: slot; Type: TABLE; Schema: public; Owner: econsulatbusiness
--

CREATE TABLE public.slot (
    id uuid NOT NULL,
    start_date_time timestamp without time zone NOT NULL,
    end_date_time timestamp without time zone NOT NULL,
    counter_id uuid NOT NULL,
    appointment_id uuid
);


ALTER TABLE public.slot OWNER TO econsulatbusiness;

--
-- Name: time_off; Type: TABLE; Schema: public; Owner: econsulatbusiness
--

CREATE TABLE public.time_off (
    id uuid NOT NULL,
    start_date_time timestamp without time zone NOT NULL,
    end_date_time timestamp without time zone NOT NULL,
    notes character varying(255) NOT NULL,
    consular_agent_id uuid,
    counter_id uuid
);


ALTER TABLE public.time_off OWNER TO econsulatbusiness;

--
-- Name: visit; Type: TABLE; Schema: public; Owner: econsulatbusiness
--

CREATE TABLE public.visit (
    id uuid NOT NULL,
    notes character varying(255),
    citizen_id uuid NOT NULL
);


ALTER TABLE public.visit OWNER TO econsulatbusiness;

--
-- Name: work_interval; Type: TABLE; Schema: public; Owner: econsulatbusiness
--

CREATE TABLE public.work_interval (
    id uuid NOT NULL,
    work_day character varying(255) NOT NULL,
    day_session character varying(255),
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone NOT NULL,
    consular_planning_id uuid
);


ALTER TABLE public.work_interval OWNER TO econsulatbusiness;

--
-- Data for Name: appointment; Type: TABLE DATA; Schema: public; Owner: econsulatbusiness
--

COPY public.appointment (id, status, notes, start_date_time, end_date_time, visit_id, consular_service_id, consular_agent_id, citizen_id) FROM stdin;
da944673-fcf3-4f38-ac87-3258799a0af9	CANCELED	pfe	2023-07-31 16:01:00	2023-07-31 16:01:00	1f4a2a8a-1524-42ab-9dfc-c16b38e6906e	8e63776c-0c6a-4d07-98c7-b20998c2a57f	62bd4ae2-1a8a-40d4-bc19-eda120495e7a	43813aa2-cf3a-4cd2-a479-6025aa6521b0
8c314a21-161f-491a-bf20-88e7b44fe3d9	LOCKED	rdv visa	2023-08-20 15:59:00	2023-08-20 16:15:00	1f4a2a8a-1524-42ab-9dfc-c16b38e6906e	69660784-dfb2-4936-87ad-dd01529c1ecd	6a68f9bd-ae5d-4a88-92b4-a465a6e19854	43813aa2-cf3a-4cd2-a479-6025aa6521b0
dd15f0bf-5e5f-4207-8d56-76ee4c1129e0	LOCKED	cin perdue	2023-07-31 16:02:00	2023-07-31 16:02:00	1f4a2a8a-1524-42ab-9dfc-c16b38e6906e	69660784-dfb2-4936-87ad-dd01529c1ecd	62bd4ae2-1a8a-40d4-bc19-eda120495e7a	43813aa2-cf3a-4cd2-a479-6025aa6521b0
cfed59a8-20f8-4598-8590-3de24ecc8cf6	OPENED	passeport	2023-07-31 16:02:00	2023-07-31 16:02:00	1f4a2a8a-1524-42ab-9dfc-c16b38e6906e	69660784-dfb2-4936-87ad-dd01529c1ecd	62b74a0b-5ff5-4151-a303-c5561bb6f391	43813aa2-cf3a-4cd2-a479-6025aa6521b0
\.


--
-- Data for Name: citizen; Type: TABLE DATA; Schema: public; Owner: econsulatbusiness
--

COPY public.citizen (id, first_name, last_name, consular_registration, country, city, login_id) FROM stdin;
43813aa2-cf3a-4cd2-a479-6025aa6521b0	Mohamed	Ben Rabah	1	tun	tn	76204eac-b4d8-45d0-9cf0-aa8c8810fe29
\.


--
-- Data for Name: consular_agent; Type: TABLE DATA; Schema: public; Owner: econsulatbusiness
--

COPY public.consular_agent (id, name, code, login_id, consular_office_id) FROM stdin;
6a68f9bd-ae5d-4a88-92b4-a465a6e19854	Imen B	M4455004	76eece9c-cc0d-4e81-b928-9dcc27c64b48	f2a09563-8ca9-45f3-bf93-62700ae78897
62b74a0b-5ff5-4151-a303-c5561bb6f391	Mohamed B	L5545547	\N	0301a057-9d08-4457-8465-d782e5ea16d3
62bd4ae2-1a8a-40d4-bc19-eda120495e7a	Rawaa B	M4570014	\N	0301a057-9d08-4457-8465-d782e5ea16d3
334ca464-92e4-4800-bdf6-63290e75c635	Mariem	M4570014	31ec2e6f-d70b-400c-b2d6-bae5a12095c3	0301a057-9d08-4457-8465-d782e5ea16d3
a3f54da3-0a42-4e69-a919-ebbb3079b1a1	Mohamed Kilani	555dMMdd12	24d08105-dc04-40a6-a919-c841163750e0	0301a057-9d08-4457-8465-d782e5ea16d3
\.


--
-- Data for Name: consular_office; Type: TABLE DATA; Schema: public; Owner: econsulatbusiness
--

COPY public.consular_office (id, address, country, city, telephone_number, telephone_code, email, distinction, activated) FROM stdin;
f2a09563-8ca9-45f3-bf93-62700ae78897	Consulat Général de Tunisie à Paris, 17-19, rue de Lübeck; Paris 75016	FR	Poi	+33 1 53 70 69 10	\N	Paris-consulate@consulate.tn	\N	t
0301a057-9d08-4457-8465-d782e5ea16d3	UK city, Uk	uk	Rey	+455114751144	\N	uk.consulate@consulate.tn		t
13e717ec-fea8-4967-8aa3-e4b9712361e4	04 rue de kallala kram ouest	FR	FR	+21629323999	\N	afef.belhadj-ahmed@inetum.com	test123456	f
269d3422-8914-4916-a9cf-1769fc81716c	paris, rue 001	usa	Ami	22222222	\N	paris-conssulat@hotmail.tn	\N	t
\.


--
-- Data for Name: consular_planning; Type: TABLE DATA; Schema: public; Owner: econsulatbusiness
--

COPY public.consular_planning (id, slot_duration, planning_start_date, planning_end_date, consular_office_id) FROM stdin;
\.


--
-- Data for Name: consular_service; Type: TABLE DATA; Schema: public; Owner: econsulatbusiness
--

COPY public.consular_service (id, name, description, top_service, service_duration, service_category_id) FROM stdin;
69660784-dfb2-4936-87ad-dd01529c1ecd	 Inscription consulaire	\N	f	2	5b8f31ba-bbfd-4215-ab21-22a542efdaab
c41a36c4-b0c7-43cc-8d11-93a246766bbb	Etablissement  de carte consulaire	\N	f	1	5b8f31ba-bbfd-4215-ab21-22a542efdaab
f09593ed-b988-44cb-82e0-41636b5c9f55	Demande de la CIN	\N	f	1	c2ea802f-e0b6-47d2-85c2-bae4c7d0315b
5e975c0f-a240-491e-b328-ad1b99178716	 Etablissement de passeport	\N	f	2	c2ea802f-e0b6-47d2-85c2-bae4c7d0315b
8e63776c-0c6a-4d07-98c7-b20998c2a57f	 Demande de visas	\N	f	2	c2ea802f-e0b6-47d2-85c2-bae4c7d0315b
\.


--
-- Data for Name: counter; Type: TABLE DATA; Schema: public; Owner: econsulatbusiness
--

COPY public.counter (id, number, description, room, open, consular_office_id) FROM stdin;
2c683834-4165-4445-b930-25bed106aa37	52238	Afef Bel HAdj ahmed	123	f	f2a09563-8ca9-45f3-bf93-62700ae78897
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: econsulatbusiness
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
00000000000000	jhipster	config/liquibase/changelog/00000000000000_initial_schema.xml	2023-06-15 08:38:54.724366	1	EXECUTED	8:b8c27d9dc8db18b5de87cdb8c38a416b	createSequence sequenceName=sequence_generator		\N	4.15.0	\N	\N	6818334230
00000000000001	jhipster	config/liquibase/changelog/00000000000000_initial_schema.xml	2023-06-15 08:38:54.913212	2	EXECUTED	8:f4e52cecfe1770c9d2000cbc056752f2	createTable tableName=ec_user; createTable tableName=ec_authority; createTable tableName=ec_user_authority; addPrimaryKey tableName=ec_user_authority; addForeignKeyConstraint baseTableName=ec_user_authority, constraintName=fk_authority_name, refer...		\N	4.15.0	\N	\N	6818334230
20230606143432-1	jhipster	config/liquibase/changelog/20230606143432_added_entity_ConsularAgent.xml	2023-06-15 08:38:54.936214	3	EXECUTED	8:e1a1ce8ee2769994c1312012a077a30a	createTable tableName=consular_agent		\N	4.15.0	\N	\N	6818334230
20230606143532-1	jhipster	config/liquibase/changelog/20230606143532_added_entity_Citizen.xml	2023-06-15 08:38:54.957538	4	EXECUTED	8:00a22ab1a7628415faa55b138f654809	createTable tableName=citizen		\N	4.15.0	\N	\N	6818334230
20230606143632-1	jhipster	config/liquibase/changelog/20230606143632_added_entity_ConsularOffice.xml	2023-06-15 08:38:55.008658	5	EXECUTED	8:6ab7cf9e76128c1d9e4c7fb837b753ed	createTable tableName=consular_office		\N	4.15.0	\N	\N	6818334230
20230606143732-1	jhipster	config/liquibase/changelog/20230606143732_added_entity_ConsularPlanning.xml	2023-06-15 08:38:55.027288	6	EXECUTED	8:6ff51cdc9176fe8f770fedaaa9fa7fae	createTable tableName=consular_planning; dropDefaultValue columnName=planning_start_date, tableName=consular_planning; dropDefaultValue columnName=planning_end_date, tableName=consular_planning		\N	4.15.0	\N	\N	6818334230
20230606143832-1	jhipster	config/liquibase/changelog/20230606143832_added_entity_WorkInterval.xml	2023-06-15 08:38:55.046356	7	EXECUTED	8:d07c6c0461adc18e5ca7bcfb811f9b68	createTable tableName=work_interval; dropDefaultValue columnName=start_time, tableName=work_interval; dropDefaultValue columnName=end_time, tableName=work_interval		\N	4.15.0	\N	\N	6818334230
20230606143932-1	jhipster	config/liquibase/changelog/20230606143932_added_entity_Counter.xml	2023-06-15 08:38:55.068496	8	EXECUTED	8:777c56ded485aa38d068e2e46c097028	createTable tableName=counter		\N	4.15.0	\N	\N	6818334230
20230606143932-1-relations	jhipster	config/liquibase/changelog/20230606143932_added_entity_Counter.xml	2023-06-15 08:38:55.121715	9	EXECUTED	8:0cdc067279f2fc87a63941e0d9bad4fe	createTable tableName=rel_counter__consular_service; addPrimaryKey tableName=rel_counter__consular_service		\N	4.15.0	\N	\N	6818334230
20230606144032-1	jhipster	config/liquibase/changelog/20230606144032_added_entity_DayOff.xml	2023-06-15 08:38:55.14326	10	EXECUTED	8:634432e3d2b4706887e7d4b6b25aeea2	createTable tableName=day_off		\N	4.15.0	\N	\N	6818334230
20230606144132-1	jhipster	config/liquibase/changelog/20230606144132_added_entity_TimeOff.xml	2023-06-15 08:38:55.15721	11	EXECUTED	8:602764490197bbe215e1adb88c7fe5ed	createTable tableName=time_off; dropDefaultValue columnName=start_date_time, tableName=time_off; dropDefaultValue columnName=end_date_time, tableName=time_off		\N	4.15.0	\N	\N	6818334230
20230606144232-1	jhipster	config/liquibase/changelog/20230606144232_added_entity_Slot.xml	2023-06-15 08:38:55.172886	12	EXECUTED	8:c9fbaa3d02e7f0e58371cf0a4ea90d71	createTable tableName=slot; dropDefaultValue columnName=start_date_time, tableName=slot; dropDefaultValue columnName=end_date_time, tableName=slot		\N	4.15.0	\N	\N	6818334230
20230606144332-1	jhipster	config/liquibase/changelog/20230606144332_added_entity_ServiceCategory.xml	2023-06-15 08:38:55.209551	13	EXECUTED	8:1dfd68ec6cc85660803e044dd4a67d87	createTable tableName=service_category		\N	4.15.0	\N	\N	6818334230
20230606144432-1	jhipster	config/liquibase/changelog/20230606144432_added_entity_ConsularService.xml	2023-06-15 08:38:55.237046	14	EXECUTED	8:f1bf169f0b17c9b265057bdffcad2aac	createTable tableName=consular_service		\N	4.15.0	\N	\N	6818334230
20230606144532-1	jhipster	config/liquibase/changelog/20230606144532_added_entity_Appointment.xml	2023-06-15 08:38:55.267446	15	EXECUTED	8:9f9c59f718dfab9560521ec3ff58b37e	createTable tableName=appointment; dropDefaultValue columnName=start_date_time, tableName=appointment; dropDefaultValue columnName=end_date_time, tableName=appointment		\N	4.15.0	\N	\N	6818334230
20230606144632-1	jhipster	config/liquibase/changelog/20230606144632_added_entity_Visit.xml	2023-06-15 08:38:55.278448	16	EXECUTED	8:58f6ee9f7fd3100b883683e7ec68bdaf	createTable tableName=visit		\N	4.15.0	\N	\N	6818334230
20230606143432-2	jhipster	config/liquibase/changelog/20230606143432_added_entity_constraints_ConsularAgent.xml	2023-06-15 08:38:55.322039	17	EXECUTED	8:7aca3c0130b1254152606d735355a5d3	addForeignKeyConstraint baseTableName=consular_agent, constraintName=fk_consular_agent__login_id, referencedTableName=ec_user; addForeignKeyConstraint baseTableName=consular_agent, constraintName=fk_consular_agent__consular_office_id, referencedTa...		\N	4.15.0	\N	\N	6818334230
20230606143532-2	jhipster	config/liquibase/changelog/20230606143532_added_entity_constraints_Citizen.xml	2023-06-15 08:38:55.334989	18	EXECUTED	8:f5ec9e24491600ea880da6d401e24abc	addForeignKeyConstraint baseTableName=citizen, constraintName=fk_citizen__login_id, referencedTableName=ec_user		\N	4.15.0	\N	\N	6818334230
20230606143732-2	jhipster	config/liquibase/changelog/20230606143732_added_entity_constraints_ConsularPlanning.xml	2023-06-15 08:38:55.34541	19	EXECUTED	8:55998bf1db574c75b65a04614e43abcb	addForeignKeyConstraint baseTableName=consular_planning, constraintName=fk_consular_planning__consular_office_id, referencedTableName=consular_office		\N	4.15.0	\N	\N	6818334230
20230606143832-2	jhipster	config/liquibase/changelog/20230606143832_added_entity_constraints_WorkInterval.xml	2023-06-15 08:38:55.356622	20	EXECUTED	8:8cd9628100f2943fd2a8d5e1af9b65c7	addForeignKeyConstraint baseTableName=work_interval, constraintName=fk_work_interval__consular_planning_id, referencedTableName=consular_planning		\N	4.15.0	\N	\N	6818334230
20230606143932-2	jhipster	config/liquibase/changelog/20230606143932_added_entity_constraints_Counter.xml	2023-06-15 08:38:55.378058	21	EXECUTED	8:23238bed6545672fd7ecdff0a03c02b0	addForeignKeyConstraint baseTableName=counter, constraintName=fk_counter__consular_office_id, referencedTableName=consular_office; addForeignKeyConstraint baseTableName=rel_counter__consular_service, constraintName=fk_rel_counter__consular_service...		\N	4.15.0	\N	\N	6818334230
20230606144032-2	jhipster	config/liquibase/changelog/20230606144032_added_entity_constraints_DayOff.xml	2023-06-15 08:38:55.395466	22	EXECUTED	8:699efb401ffa6e2bdd7a78e3bc0d53bd	addForeignKeyConstraint baseTableName=day_off, constraintName=fk_day_off__consular_planning_id, referencedTableName=consular_planning		\N	4.15.0	\N	\N	6818334230
20230606144132-2	jhipster	config/liquibase/changelog/20230606144132_added_entity_constraints_TimeOff.xml	2023-06-15 08:38:55.410446	23	EXECUTED	8:85e7e58f2f46ef7ecf5086d4e265c671	addForeignKeyConstraint baseTableName=time_off, constraintName=fk_time_off__consular_agent_id, referencedTableName=consular_agent; addForeignKeyConstraint baseTableName=time_off, constraintName=fk_time_off__counter_id, referencedTableName=counter		\N	4.15.0	\N	\N	6818334230
20230606144232-2	jhipster	config/liquibase/changelog/20230606144232_added_entity_constraints_Slot.xml	2023-06-15 08:38:55.426535	24	EXECUTED	8:64046db073170dc71f2aa510a0dd3282	addForeignKeyConstraint baseTableName=slot, constraintName=fk_slot__counter_id, referencedTableName=counter; addForeignKeyConstraint baseTableName=slot, constraintName=fk_slot__appointment_id, referencedTableName=appointment		\N	4.15.0	\N	\N	6818334230
20230606144432-2	jhipster	config/liquibase/changelog/20230606144432_added_entity_constraints_ConsularService.xml	2023-06-15 08:38:55.437781	25	EXECUTED	8:e68b925cce9bb9cc7fc4e20f49005797	addForeignKeyConstraint baseTableName=consular_service, constraintName=fk_consular_service__service_category_id, referencedTableName=service_category		\N	4.15.0	\N	\N	6818334230
20230606144532-2	jhipster	config/liquibase/changelog/20230606144532_added_entity_constraints_Appointment.xml	2023-06-15 08:38:55.46182	26	EXECUTED	8:7ae68196c5493149f8b35651c2214c2e	addForeignKeyConstraint baseTableName=appointment, constraintName=fk_appointment__visit_id, referencedTableName=visit; addForeignKeyConstraint baseTableName=appointment, constraintName=fk_appointment__consular_service_id, referencedTableName=consu...		\N	4.15.0	\N	\N	6818334230
20230606144632-2	jhipster	config/liquibase/changelog/20230606144632_added_entity_constraints_Visit.xml	2023-06-15 08:38:55.471389	27	EXECUTED	8:1b3410d2217a5f03f8d25d5f0d8f5347	addForeignKeyConstraint baseTableName=visit, constraintName=fk_visit__citizen_id, referencedTableName=citizen		\N	4.15.0	\N	\N	6818334230
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: econsulatbusiness
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: day_off; Type: TABLE DATA; Schema: public; Owner: econsulatbusiness
--

COPY public.day_off (id, start_date, end_date, name, notes, consular_planning_id) FROM stdin;
\.


--
-- Data for Name: ec_authority; Type: TABLE DATA; Schema: public; Owner: econsulatbusiness
--

COPY public.ec_authority (name) FROM stdin;
ROLE_ADMIN
ROLE_USER
ROLE_CENTRAL_ADMIN
ROLE_CONSULAR_ADMIN
\.


--
-- Data for Name: ec_user; Type: TABLE DATA; Schema: public; Owner: econsulatbusiness
--

COPY public.ec_user (id, login, first_name, last_name, email, image_url, activated, lang_key, created_by, created_date, last_modified_by, last_modified_date) FROM stdin;
de5fc0e4-2a0d-4efd-9105-6a0a79c6c0b6	admin@qa.com	admin		admin@qa.com	\N	f	fr	admin@qa.com	2023-06-15 08:41:19.047202	admin@qa.com	2023-06-15 08:41:19.047202
24d08105-dc04-40a6-a919-c841163750e0	central-admin-1@consulate.tn	central-admin-1	central-admin-1	central-admin-1@consulate.tn	\N	t	fr	central-admin-1@consulate.tn	2023-07-04 17:17:10.392664	central-admin-1@consulate.tn	2023-07-04 17:17:10.392664
76eece9c-cc0d-4e81-b928-9dcc27c64b48	consular-admin-1@consulate.tn	consular-admin-1	consular-admin-1	consular-admin-1@consulate.tn	\N	t	fr	consular-admin-1@consulate.tn	2023-07-07 07:36:08.323827	consular-admin-1@consulate.tn	2023-07-07 07:36:08.323827
31ec2e6f-d70b-400c-b2d6-bae5a12095c3	test1@yopmail.com	test1	test1	test1@yopmail.com	\N	t	fr	test1@yopmail.com	2023-07-07 13:04:04.16862	test1@yopmail.com	2023-07-07 13:04:04.16862
7ca1e7db-dce1-4328-85e5-0f3d337ac6aa	rajaimen1@yopmail.com	test	test	rajaimen1@yopmail.com	\N	t	fr	rajaimen1@yopmail.com	2023-07-07 13:28:49.515006	rajaimen1@yopmail.com	2023-07-07 13:28:49.515006
a5b01bda-97f2-4bec-bb49-76b0523fa778	afef.belhadj-ahmed@inetum.com	Afef	bel hadj ahmed	afef.belhadj-ahmed@inetum.com	\N	t	fr	afef.belhadj-ahmed@inetum.com	2023-07-11 16:15:12.604469	afef.belhadj-ahmed@inetum.com	2023-07-11 16:15:12.604469
ae1cab19-a462-4139-ad07-732ff4914f71	faten.inetum@gmail.com	feten	feten	faten.inetum@gmail.com	\N	t	fr	faten.inetum@gmail.com	2023-07-21 09:28:19.462019	faten.inetum@gmail.com	2023-07-21 09:28:19.462019
4c973896-5761-41fc-8217-07c5d13a004b	admin	Admin	Administrator	admin@localhost	\N	t	fr	admin	2023-07-31 15:27:21.334603	admin	2023-07-31 15:27:21.334603
76204eac-b4d8-45d0-9cf0-aa8c8810fe29	citoyen@gmail.com	 citoyen nom	citoyen pre	citoyen@gmail.com	\N	t	fr	citoyen@gmail.com	2023-07-31 15:55:40.711199	citoyen@gmail.com	2023-07-31 15:55:40.711199
d1da5e6d-d6b3-4d86-b5e7-6c2b78e456a8	alt.eu-ab266ca@yopmail.com	faten.tre	faten.tre	alt.eu-ab266ca@yopmail.com	\N	t	fr	alt.eu-ab266ca@yopmail.com	2023-08-01 08:13:54.614778	alt.eu-ab266ca@yopmail.com	2023-08-01 08:13:54.614778
\.


--
-- Data for Name: ec_user_authority; Type: TABLE DATA; Schema: public; Owner: econsulatbusiness
--

COPY public.ec_user_authority (user_id, authority_name) FROM stdin;
de5fc0e4-2a0d-4efd-9105-6a0a79c6c0b6	ROLE_USER
de5fc0e4-2a0d-4efd-9105-6a0a79c6c0b6	ROLE_ADMIN
24d08105-dc04-40a6-a919-c841163750e0	ROLE_CENTRAL_ADMIN
76eece9c-cc0d-4e81-b928-9dcc27c64b48	ROLE_CONSULAR_ADMIN
4c973896-5761-41fc-8217-07c5d13a004b	ROLE_USER
4c973896-5761-41fc-8217-07c5d13a004b	ROLE_ADMIN
\.


--
-- Data for Name: rel_counter__consular_service; Type: TABLE DATA; Schema: public; Owner: econsulatbusiness
--

COPY public.rel_counter__consular_service (consular_service_id, counter_id) FROM stdin;
5e975c0f-a240-491e-b328-ad1b99178716	2c683834-4165-4445-b930-25bed106aa37
69660784-dfb2-4936-87ad-dd01529c1ecd	2c683834-4165-4445-b930-25bed106aa37
\.


--
-- Data for Name: service_category; Type: TABLE DATA; Schema: public; Owner: econsulatbusiness
--

COPY public.service_category (id, name, description) FROM stdin;
5b8f31ba-bbfd-4215-ab21-22a542efdaab	Immatriculation consulaire	\N
c2ea802f-e0b6-47d2-85c2-bae4c7d0315b	Services de chancellerie	\N
\.


--
-- Data for Name: slot; Type: TABLE DATA; Schema: public; Owner: econsulatbusiness
--

COPY public.slot (id, start_date_time, end_date_time, counter_id, appointment_id) FROM stdin;
3c58017a-70ec-42f2-911f-1f0f09b29e0c	2023-07-31 16:02:00	2023-07-31 16:02:00	2c683834-4165-4445-b930-25bed106aa37	8c314a21-161f-491a-bf20-88e7b44fe3d9
34761eb2-aedd-428d-80fe-5240a5b5cf49	2023-07-31 16:03:00	2023-07-31 16:03:00	2c683834-4165-4445-b930-25bed106aa37	dd15f0bf-5e5f-4207-8d56-76ee4c1129e0
78f29f1e-1d06-4e7f-a723-05f762afa133	2023-07-31 16:03:00	2023-07-31 16:03:00	2c683834-4165-4445-b930-25bed106aa37	cfed59a8-20f8-4598-8590-3de24ecc8cf6
f048c0c4-440b-4e5e-9ae7-48e35b82a66f	2023-07-31 16:03:00	2023-07-31 16:03:00	2c683834-4165-4445-b930-25bed106aa37	da944673-fcf3-4f38-ac87-3258799a0af9
2a75f18f-6ae1-40e6-b609-449bdce57fad	2023-07-31 16:03:00	2023-07-31 16:03:00	2c683834-4165-4445-b930-25bed106aa37	da944673-fcf3-4f38-ac87-3258799a0af9
\.


--
-- Data for Name: time_off; Type: TABLE DATA; Schema: public; Owner: econsulatbusiness
--

COPY public.time_off (id, start_date_time, end_date_time, notes, consular_agent_id, counter_id) FROM stdin;
\.


--
-- Data for Name: visit; Type: TABLE DATA; Schema: public; Owner: econsulatbusiness
--

COPY public.visit (id, notes, citizen_id) FROM stdin;
1f4a2a8a-1524-42ab-9dfc-c16b38e6906e	visit x	43813aa2-cf3a-4cd2-a479-6025aa6521b0
\.


--
-- Data for Name: work_interval; Type: TABLE DATA; Schema: public; Owner: econsulatbusiness
--

COPY public.work_interval (id, work_day, day_session, start_time, end_time, consular_planning_id) FROM stdin;
\.


--
-- Name: sequence_generator; Type: SEQUENCE SET; Schema: public; Owner: econsulatbusiness
--

SELECT pg_catalog.setval('public.sequence_generator', 1050, false);


--
-- Name: appointment appointment_pkey; Type: CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT appointment_pkey PRIMARY KEY (id);


--
-- Name: citizen citizen_pkey; Type: CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.citizen
    ADD CONSTRAINT citizen_pkey PRIMARY KEY (id);


--
-- Name: consular_agent consular_agent_pkey; Type: CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.consular_agent
    ADD CONSTRAINT consular_agent_pkey PRIMARY KEY (id);


--
-- Name: consular_office consular_office_pkey; Type: CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.consular_office
    ADD CONSTRAINT consular_office_pkey PRIMARY KEY (id);


--
-- Name: consular_planning consular_planning_pkey; Type: CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.consular_planning
    ADD CONSTRAINT consular_planning_pkey PRIMARY KEY (id);


--
-- Name: consular_service consular_service_pkey; Type: CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.consular_service
    ADD CONSTRAINT consular_service_pkey PRIMARY KEY (id);


--
-- Name: counter counter_pkey; Type: CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.counter
    ADD CONSTRAINT counter_pkey PRIMARY KEY (id);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: day_off day_off_pkey; Type: CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.day_off
    ADD CONSTRAINT day_off_pkey PRIMARY KEY (id);


--
-- Name: ec_authority ec_authority_pkey; Type: CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.ec_authority
    ADD CONSTRAINT ec_authority_pkey PRIMARY KEY (name);


--
-- Name: ec_user_authority ec_user_authority_pkey; Type: CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.ec_user_authority
    ADD CONSTRAINT ec_user_authority_pkey PRIMARY KEY (user_id, authority_name);


--
-- Name: ec_user ec_user_pkey; Type: CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.ec_user
    ADD CONSTRAINT ec_user_pkey PRIMARY KEY (id);


--
-- Name: rel_counter__consular_service rel_counter__consular_service_pkey; Type: CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.rel_counter__consular_service
    ADD CONSTRAINT rel_counter__consular_service_pkey PRIMARY KEY (counter_id, consular_service_id);


--
-- Name: service_category service_category_pkey; Type: CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.service_category
    ADD CONSTRAINT service_category_pkey PRIMARY KEY (id);


--
-- Name: slot slot_pkey; Type: CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.slot
    ADD CONSTRAINT slot_pkey PRIMARY KEY (id);


--
-- Name: time_off time_off_pkey; Type: CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.time_off
    ADD CONSTRAINT time_off_pkey PRIMARY KEY (id);


--
-- Name: citizen ux_citizen__login_id; Type: CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.citizen
    ADD CONSTRAINT ux_citizen__login_id UNIQUE (login_id);


--
-- Name: consular_agent ux_consular_agent__login_id; Type: CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.consular_agent
    ADD CONSTRAINT ux_consular_agent__login_id UNIQUE (login_id);


--
-- Name: ec_user ux_user_email; Type: CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.ec_user
    ADD CONSTRAINT ux_user_email UNIQUE (email);


--
-- Name: ec_user ux_user_login; Type: CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.ec_user
    ADD CONSTRAINT ux_user_login UNIQUE (login);


--
-- Name: visit visit_pkey; Type: CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.visit
    ADD CONSTRAINT visit_pkey PRIMARY KEY (id);


--
-- Name: work_interval work_interval_pkey; Type: CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.work_interval
    ADD CONSTRAINT work_interval_pkey PRIMARY KEY (id);


--
-- Name: appointment fk_appointment__citizen_id; Type: FK CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT fk_appointment__citizen_id FOREIGN KEY (citizen_id) REFERENCES public.citizen(id);


--
-- Name: appointment fk_appointment__consular_agent_id; Type: FK CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT fk_appointment__consular_agent_id FOREIGN KEY (consular_agent_id) REFERENCES public.consular_agent(id);


--
-- Name: appointment fk_appointment__consular_service_id; Type: FK CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT fk_appointment__consular_service_id FOREIGN KEY (consular_service_id) REFERENCES public.consular_service(id);


--
-- Name: appointment fk_appointment__visit_id; Type: FK CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT fk_appointment__visit_id FOREIGN KEY (visit_id) REFERENCES public.visit(id);


--
-- Name: ec_user_authority fk_authority_name; Type: FK CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.ec_user_authority
    ADD CONSTRAINT fk_authority_name FOREIGN KEY (authority_name) REFERENCES public.ec_authority(name);


--
-- Name: citizen fk_citizen__login_id; Type: FK CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.citizen
    ADD CONSTRAINT fk_citizen__login_id FOREIGN KEY (login_id) REFERENCES public.ec_user(id);


--
-- Name: consular_agent fk_consular_agent__consular_office_id; Type: FK CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.consular_agent
    ADD CONSTRAINT fk_consular_agent__consular_office_id FOREIGN KEY (consular_office_id) REFERENCES public.consular_office(id);


--
-- Name: consular_agent fk_consular_agent__login_id; Type: FK CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.consular_agent
    ADD CONSTRAINT fk_consular_agent__login_id FOREIGN KEY (login_id) REFERENCES public.ec_user(id);


--
-- Name: consular_planning fk_consular_planning__consular_office_id; Type: FK CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.consular_planning
    ADD CONSTRAINT fk_consular_planning__consular_office_id FOREIGN KEY (consular_office_id) REFERENCES public.consular_office(id);


--
-- Name: consular_service fk_consular_service__service_category_id; Type: FK CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.consular_service
    ADD CONSTRAINT fk_consular_service__service_category_id FOREIGN KEY (service_category_id) REFERENCES public.service_category(id);


--
-- Name: counter fk_counter__consular_office_id; Type: FK CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.counter
    ADD CONSTRAINT fk_counter__consular_office_id FOREIGN KEY (consular_office_id) REFERENCES public.consular_office(id);


--
-- Name: day_off fk_day_off__consular_planning_id; Type: FK CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.day_off
    ADD CONSTRAINT fk_day_off__consular_planning_id FOREIGN KEY (consular_planning_id) REFERENCES public.consular_planning(id);


--
-- Name: rel_counter__consular_service fk_rel_counter__consular_service__consular_service_id; Type: FK CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.rel_counter__consular_service
    ADD CONSTRAINT fk_rel_counter__consular_service__consular_service_id FOREIGN KEY (consular_service_id) REFERENCES public.consular_service(id);


--
-- Name: rel_counter__consular_service fk_rel_counter__consular_service__counter_id; Type: FK CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.rel_counter__consular_service
    ADD CONSTRAINT fk_rel_counter__consular_service__counter_id FOREIGN KEY (counter_id) REFERENCES public.counter(id);


--
-- Name: slot fk_slot__appointment_id; Type: FK CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.slot
    ADD CONSTRAINT fk_slot__appointment_id FOREIGN KEY (appointment_id) REFERENCES public.appointment(id);


--
-- Name: slot fk_slot__counter_id; Type: FK CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.slot
    ADD CONSTRAINT fk_slot__counter_id FOREIGN KEY (counter_id) REFERENCES public.counter(id);


--
-- Name: time_off fk_time_off__consular_agent_id; Type: FK CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.time_off
    ADD CONSTRAINT fk_time_off__consular_agent_id FOREIGN KEY (consular_agent_id) REFERENCES public.consular_agent(id);


--
-- Name: time_off fk_time_off__counter_id; Type: FK CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.time_off
    ADD CONSTRAINT fk_time_off__counter_id FOREIGN KEY (counter_id) REFERENCES public.counter(id);


--
-- Name: ec_user_authority fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.ec_user_authority
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public.ec_user(id);


--
-- Name: visit fk_visit__citizen_id; Type: FK CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.visit
    ADD CONSTRAINT fk_visit__citizen_id FOREIGN KEY (citizen_id) REFERENCES public.citizen(id);


--
-- Name: work_interval fk_work_interval__consular_planning_id; Type: FK CONSTRAINT; Schema: public; Owner: econsulatbusiness
--

ALTER TABLE ONLY public.work_interval
    ADD CONSTRAINT fk_work_interval__consular_planning_id FOREIGN KEY (consular_planning_id) REFERENCES public.consular_planning(id);


--
-- PostgreSQL database dump complete
--

