
create database shop_db;

use shop_db;

create table BC_COUNTRY (
                            id_ bigint(20) primary key auto_increment,
                            name_ varchar(100) not null,
                            phone_prefix_ varchar(5) not null
);

create table BC_PROVINCE (
                             id_ bigint(20) primary key auto_increment,
                             name_ varchar(100) not null,
                             country_id bigint(20) not null,
                             constraint fk_BC_PROVINCE_BC_COUTRY foreign key (country_id) references BC_COUNTRY(id_)
);

create table BC_USER_TYPE (
                              id_ bigint(20) primary key auto_increment,
                              name_ varchar(50) not null
);

--  CREAR HISTORIAL DE SESIONES
create table BC_USER (
                         id_ bigint(20) primary key auto_increment,
                         name_ varchar(50) not null,
                         surname_ varchar(75) not null,
                         email_ varchar(100) not null,
                         password_ varchar(255) not null,
                         phone_ varchar(15) not null,
                         ubication_id bigint(20) not null,
                         is_deleted_ tinyint(1) not null default 0,
                         constraint fk_BC_USER_BC_PROVINCE foreign key (ubication_id) references BC_PROVINCE(id_)
);

create table BC_TYPE_EVENT(
                              id_ bigint(20) primary key auto_increment,
                              name_ varchar(50) not null
);

create table BC_HISTORY (
                            id_ bigint(20) primary key auto_increment,
                            type_event_id bigint(20) not null,
                            datetime_event_ datetime not null,
                            user_id bigint(20) not null,
                            constraint fk_BC_HISTORY_BC_TYPE_EVENT foreign key (type_event_id) references BC_TYPE_EVENT(id_),
                            constraint fk_BC_HISTORY_BC_USER foreign key (user_id) references BC_USER(id_)
);

create table BC_TAX (
                        id_ bigint(20) primary key auto_increment,
                        quantity_tax_ int(3) not null,
                        province_id bigint(20) not null,
                        constraint fk_BC_TAX_BC_PROVINCE foreign key (province_id) references BC_PROVINCE(id_)
);

create table BC_PRODUCT_CATEGORY (
                                     id_ bigint(20) not null primary key auto_increment,
                                     name_ varchar(20) not null
);

create table BC_PRODUCCT (
                             id_ bigint(20) not null primary key auto_increment,
                             product_name_ varchar(200) not null,
                             description_ varchar(500) not null,
                             path_images_ json not null,
                             price_without_tax decimal(6, 2) not null,
                             quantity_stock int(5) not null,
                             is_sale tinyint(1) not null default 0,
                             percentage_discount int(2),
                             category_product_id bigint(20) not null,
                             constraint fk_BC_PRODUCT_BC_PRODUCT_CATEGORY foreign key (category_product_id) references BC_PRODUCT_CATEGORY(id_)
);

create table BC_SHIPPING_ADDRESS (
                                     id_ bigint(20) not null primary key auto_increment,
                                     address_line_1_ varchar(150) not null,
                                     address_line_2_ varchar(200) not null,
                                     city varchar(75) not null,
                                     postal_code varchar(20) not null,
                                     phone varchar(15) not null,
                                     province_id bigint(20) not null,
                                     country_id bigint(20) not null,
                                     user_id bigint(20) not null,
                                     constraint fk_BC_SHIPPING_ADDRESS_BC_PROVINCE foreign key (province_id) references BC_PROVINCE(id_),
                                     constraint fk_BC_SHIPPING_ADDRESS_BC_COUNTRY foreign key (country_id) references BC_COUNTRY(id_),
                                     constraint fk_BC_SHIPPING_ADDRESS_BC_USER foreign key (user_id) references BC_USER(id_)
);

create table BC_INVOICE_ADDRESS (
                                    id_ bigint(20) not null primary key auto_increment,
                                    business_name_ varchar(50),
                                    address_line_1_ varchar(150) not null,
                                    address_line_2_ varchar(200) not null,
                                    city varchar(75) not null,
                                    postal_code varchar(20) not null,
                                    phone varchar(15) not null,
                                    province_id bigint(20) not null,
                                    country_id bigint(20) not null,
                                    user_id bigint(20) not null,
                                    constraint fk_BC_INVOICE_ADDRESS_BC_PROVINCE foreign key (province_id) references BC_PROVINCE(id_),
                                    constraint fk_BC_INVOICE_ADDRESS_BC_COUNTRY foreign key (country_id) references BC_COUNTRY(id_),
                                    constraint fk_BC_INVOICE_ADDRESS_BC_USER foreign key (user_id) references BC_USER(id_)
);

create table BC_PAYMENT_METHOD (
                                   id_ bigint(20) not null primary key auto_increment,
                                   name_ varchar(25) not null
);

create table BC_SHOPPING_CART(
                                 user_id bigint(20) not null primary key auto_increment,
                                 product_id bigint(20) not null primary key auto_increment,
                                 datetime_add_product_ datetime not null,
                                 constraint fk_BC_SHOPPING_CART_BC_USER foreign key (user_id) references BC_USER(id_),
                                 constraint fk_BC_SHOPPING_CART_BC_PRODUCT foreign key (product_id) references BC_PRODUCT(id_)
);

create table BC_INVOICE(
                           id_ bigint(20) not null primary key auto_increment,
                           datetime_invoice datetime not null,
                           user_id bigint(20) not null,
                           payment_method_id bigint(20) not null,
                           constraint fk_BC_INVOICE_BC_USER foreign key (user_id) references BC_USER(id_),
                           constraint fk_BC_INVOICE_BC_PAYMENT_METHOD foreign key (payment_method_id) references BC_PAYMENT_METHOD(id_)
);

create table BC_INVOICE_LINE (
                                 id_ bigint(20) not null primary key auto_increment,
                                 product_id bigint(20) not null primary key auto_increment,
                                 quantity int(4) not null,
                                 price_whit_tax int(5) not null,
                                 datetime_add datetime not null,
                                 invoice_id bigint(20) not null,
                                 constraint fk_INVOICE_LINE_BC_INVOICE foreign key (invoice_id) references BC_INVOICE(id_)
);

create table BC_WISHLIST(
                            user_id bigint(20) not null primary key unique,
                            product_id bigint(20) not null primary key unique,
                            constraint fk_BC_WISHLIST_BC_USER foreign key (user_id) references BC_USER(id_),
                            constraint fk_BC_WISHLIST_BC_PRODUCT foreign key (product_id) references BC_PRODUCT(id_)
)


