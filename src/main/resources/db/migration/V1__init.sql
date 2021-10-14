create database if not exists computer_shop;

use computer_shop;

create table if not exists computer_case
(
    id             bigint auto_increment primary key,
    producer       varchar(50) not null,
    model          varchar(50) not null,
    case_type      varchar(50) not null,
    colour         varchar(50) not null,
    material       varchar(50) not null,
    section_number int         not null,
    price          double      not null
);

create table if not exists power_unit
(
    id          bigint auto_increment primary key,
    producer    varchar(50) not null,
    model       varchar(50) not null,
    power       double      not null,
    certificate varchar(50) not null,
    price       double      not null
);

create table if not exists mother_board
(
    id           bigint auto_increment primary key,
    producer     varchar(50) not null,
    model        varchar(50) not null,
    socket       varchar(50) not null,
    form_factor  varchar(50) not null,
    memory_type  varchar(50) not null,
    memory_slots int         not null,
    pci_version  varchar(50) not null,
    m_two        int         not null,
    price        double      not null
);

create table if not exists hdd
(
    id             bigint auto_increment primary key,
    producer       varchar(50) not null,
    model          varchar(50) not null,
    capacity       int         not null,
    form_factor    varchar(50) not null,
    hdd_interface  varchar(50) not null,
    buffer_size    int         not null,
    rotation_speed int         not null,
    price          double      not null
);

create table if not exists ssd
(
    id            bigint auto_increment primary key,
    producer      varchar(50) not null,
    model         varchar(50) not null,
    capacity      int         not null,
    form_factor   varchar(50) not null,
    ssd_interface varchar(50) not null,
    controller    varchar(50) not null,
    reading_speed int         not null,
    writing_speed int         not null,
    price         double      not null
);

create table if not exists processor
(
    id       bigint auto_increment primary key,
    producer varchar(50) not null,
    model    varchar(50) not null,
    core     varchar(50) not null,
    socket   varchar(50) not null,
    min_freq double      not null,
    max_freq double      not null,
    price    double      not null
);

create table if not exists graphics_card
(
    id                bigint auto_increment primary key,
    producer          varchar(50) not null,
    model             varchar(50) not null,
    gpu_producer      varchar(50) not null,
    gpu_model         varchar(50) not null,
    video_memory      int         not null,
    video_memory_type varchar(50) not null,
    price             double      not null
);

create table if not exists computer
(
    id               bigint auto_increment primary key,
    title            varchar(50),
    processor_id     bigint,
    graphics_card_id bigint,
    mother_board_id  bigint,
    ssd_id           bigint,
    hdd_id           bigint,
    power_unit_id    bigint,
    computer_case_id bigint,
    foreign key (processor_id) references processor (id),
    foreign key (graphics_card_id) references graphics_card (id),
    foreign key (mother_board_id) references mother_board (id),
    foreign key (ssd_id) references ssd (id),
    foreign key (hdd_id) references hdd (id),
    foreign key (power_unit_id) references power_unit (id),
    foreign key (computer_case_id) references computer_case (id)
);