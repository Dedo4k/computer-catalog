create database if not exists computer_shop;

use computer_shop;

create table if not exists computer_case
(
	id bigint auto_increment primary key ,
    producer varchar(50) not null ,
    model varchar(50) not null ,
    case_type varchar(50) not null ,
    colour varchar(50) not null ,
    material varchar(50) not null ,
    section_number int not null ,
    price double not null
);

create table if not exists power_unit
(
	id bigint auto_increment primary key ,
    producer varchar(50) not null ,
    model varchar(50) not null ,
    power double not null ,
    sertificate varchar(50) not null ,
    price double not null
);

create table if not exists mother_board
(
	id bigint auto_increment primary key ,
    producer varchar(50) not null ,
    model varchar(50) not null ,
    socket varchar(50) not null ,
    form_factor varchar(50) not null ,
    memory_type varchar(50) not null ,
    memory_slots int not null ,
    pci_version varchar(50) not null ,
    m_two int not null ,
    price double not null
);