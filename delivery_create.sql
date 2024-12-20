-- Generated by Oracle SQL Developer Data Modeler 24.3.0.240.1210
--   at:        2024-12-03 14:12:28 MSK
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE
create database Delivery;
use Delivery;

CREATE TABLE address (
    address_id             INTEGER NOT NULL,
    house_id_house         INTEGER,
    apartment_apartment_id INTEGER,
    client_client_id       INTEGER NOT NULL
);

ALTER TABLE address
    ADD CONSTRAINT arc_1
        CHECK ( ( ( house_id_house IS NOT NULL )
                  AND ( apartment_apartment_id IS NULL ) )
                OR ( ( apartment_apartment_id IS NOT NULL )
                     AND ( house_id_house IS NULL ) )
                OR ( ( house_id_house IS NULL )
                     AND ( apartment_apartment_id IS NULL ) ) );

CREATE UNIQUE INDEX address__idx ON
    address (
        house_id_house
    ASC );

CREATE UNIQUE INDEX address__idxv1 ON
    address (
        apartment_apartment_id
    ASC );

ALTER TABLE address ADD CONSTRAINT address_pk PRIMARY KEY ( address_id );

CREATE TABLE apartment (
    apartment_id   INTEGER NOT NULL,
    apartment_num  INTEGER NOT NULL,
    house_id_house INTEGER NOT NULL
);

ALTER TABLE apartment ADD CONSTRAINT apartment_pk PRIMARY KEY ( apartment_id );

CREATE TABLE cart (
    cart_id         INTEGER NOT NULL,
    orders_order_id INTEGER NOT NULL,
    dish_dish_id    INTEGER NOT NULL,
    quantity        INTEGER NOT NULL
);

ALTER TABLE cart ADD CONSTRAINT cart_pk PRIMARY KEY ( cart_id );

CREATE TABLE category (
    category_id   INTEGER NOT NULL,
    category_name VARCHAR(30) NOT NULL
);

ALTER TABLE category ADD CONSTRAINT category_pk PRIMARY KEY ( category_id );

CREATE TABLE city (
    city_id   INTEGER NOT NULL,
    city_name VARCHAR(30) NOT NULL
);

ALTER TABLE city ADD CONSTRAINT city_pk PRIMARY KEY ( city_id );

CREATE TABLE client (
    client_id      INTEGER NOT NULL,
    client_name    VARCHAR(30) NOT NULL,
    client_surname VARCHAR(30) NOT NULL,
    phone_num      VARCHAR(30) NOT NULL,
    client_email   VARCHAR(255)
);

ALTER TABLE client ADD CONSTRAINT client_pk PRIMARY KEY ( client_id );

CREATE TABLE dish (
    dish_id              INTEGER NOT NULL,
    dish_name            VARCHAR(30) NOT NULL,
    dish_description     VARCHAR(255) NOT NULL,
    dish_price           INTEGER NOT NULL,
    category_category_id INTEGER NOT NULL,
    supplier_supplier_id INTEGER NOT NULL
);

ALTER TABLE dish ADD CONSTRAINT dish_pk PRIMARY KEY ( dish_id );

CREATE TABLE house (
    id_house         INTEGER NOT NULL,
    house_num        INTEGER NOT NULL,
    street_id_street INTEGER NOT NULL
);

ALTER TABLE house ADD CONSTRAINT house_pk PRIMARY KEY ( id_house );

CREATE TABLE order_status (
    order_status_id   INTEGER NOT NULL,
    order_status_name VARCHAR(30) NOT NULL
);

ALTER TABLE order_status ADD CONSTRAINT order_status_pk PRIMARY KEY ( order_status_id );

CREATE TABLE orders (
    order_id                     INTEGER NOT NULL,
    order_date                   DATETIME NOT NULL,
    required_date                DATETIME NOT NULL,
    address_address_id           INTEGER NOT NULL,
    order_status_order_status_id INTEGER NOT NULL,
    client_client_id             INTEGER NOT NULL,
    order_total_amount           INTEGER NOT NULL
);

ALTER TABLE orders ADD CONSTRAINT orders_pk PRIMARY KEY ( order_id );

CREATE TABLE street (
    id_street    INTEGER NOT NULL,
    street_name  VARCHAR(30) NOT NULL,
    city_city_id INTEGER NOT NULL
);

ALTER TABLE street ADD CONSTRAINT street_pk PRIMARY KEY ( id_street );

CREATE TABLE supplier (
    supplier_id   INTEGER NOT NULL,
    supplier_name VARCHAR(30) NOT NULL
);

ALTER TABLE supplier ADD CONSTRAINT supplier_pk PRIMARY KEY ( supplier_id );

ALTER TABLE address
    ADD CONSTRAINT address_apartment_fk FOREIGN KEY ( apartment_apartment_id )
        REFERENCES apartment ( apartment_id );

ALTER TABLE address
    ADD CONSTRAINT address_client_fk
        FOREIGN KEY ( client_client_id )
            REFERENCES client ( client_id )
                ON DELETE CASCADE;

ALTER TABLE address
    ADD CONSTRAINT address_house_fk FOREIGN KEY ( house_id_house )
        REFERENCES house ( id_house );

ALTER TABLE apartment
    ADD CONSTRAINT apartment_house_fk FOREIGN KEY ( house_id_house )
        REFERENCES house ( id_house );

ALTER TABLE cart
    ADD CONSTRAINT cart_dish_fk FOREIGN KEY ( dish_dish_id )
        REFERENCES dish ( dish_id );

ALTER TABLE cart
    ADD CONSTRAINT cart_orders_fk
        FOREIGN KEY ( orders_order_id )
            REFERENCES orders ( order_id )
                ON DELETE CASCADE;

ALTER TABLE dish
    ADD CONSTRAINT dish_category_fk FOREIGN KEY ( category_category_id )
        REFERENCES category ( category_id );

ALTER TABLE dish
    ADD CONSTRAINT dish_supplier_fk FOREIGN KEY ( supplier_supplier_id )
        REFERENCES supplier ( supplier_id );

ALTER TABLE house
    ADD CONSTRAINT house_street_fk FOREIGN KEY ( street_id_street )
        REFERENCES street ( id_street );

ALTER TABLE orders
    ADD CONSTRAINT orders_address_fk FOREIGN KEY ( address_address_id )
        REFERENCES address ( address_id );

ALTER TABLE orders
    ADD CONSTRAINT orders_client_fk FOREIGN KEY ( client_client_id )
        REFERENCES client ( client_id );

ALTER TABLE orders
    ADD CONSTRAINT orders_order_status_fk
        FOREIGN KEY ( order_status_order_status_id )
            REFERENCES order_status ( order_status_id )
                ON DELETE CASCADE;

ALTER TABLE street
    ADD CONSTRAINT street_city_fk FOREIGN KEY ( city_city_id )
        REFERENCES city ( city_id );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             2
-- ALTER TABLE                             26
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
