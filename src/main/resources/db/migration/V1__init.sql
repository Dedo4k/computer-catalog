create table component
(
    id       bigint           not null auto_increment,
    model    varchar(255)     not null,
    price    double precision not null,
    producer varchar(255)     not null,
    primary key (id)
) engine=InnoDB;

create table computer
(
    id               bigint not null auto_increment,
    title            varchar(255),
    computer_case_id bigint,
    graphics_card_id bigint,
    hdd_id           bigint,
    mother_board_id  bigint,
    power_unit_id    bigint,
    processor_id     bigint,
    ssd_id           bigint,
    ram_id           bigint,
    primary key (id)
) engine=InnoDB;

create table computer_case
(
    case_type      varchar(255) not null,
    colour         varchar(255) not null,
    material       varchar(255) not null,
    section_number integer      not null,
    id             bigint       not null,
    primary key (id)
) engine=InnoDB;

create table graphics_card
(
    gpu_model         varchar(255) not null,
    gpu_producer      varchar(255) not null,
    video_memory      integer      not null,
    video_memory_type varchar(255) not null,
    id                bigint       not null,
    primary key (id)
) engine=InnoDB;

create table hdd
(
    buffer_size    integer      not null,
    capacity       integer      not null,
    form_factor    varchar(255) not null,
    hdd_interface  varchar(255) not null,
    rotation_speed integer      not null,
    id             bigint       not null,
    primary key (id)
) engine=InnoDB;

create table mother_board
(
    pci_version  varchar(255) not null,
    form_factor  varchar(255) not null,
    m_two        integer      not null,
    memory_slots integer      not null,
    memory_type  varchar(255) not null,
    socket       varchar(255) not null,
    id           bigint       not null,
    primary key (id)
) engine=InnoDB;

create table power_unit
(
    certificate varchar(255),
    power       double precision not null,
    id          bigint           not null,
    primary key (id)
) engine=InnoDB;

create table processor
(
    core     varchar(255)     not null,
    max_freq double precision not null,
    min_freq double precision not null,
    socket   varchar(255)     not null,
    id       bigint           not null,
    primary key (id)
) engine=InnoDB;

create table review
(
    id           bigint       not null auto_increment,
    text         varchar(255) not null,
    component_id bigint,
    `user_id`    bigint,
    primary key (id)
) engine=InnoDB;

create table ssd
(
    capacity      integer      not null,
    controller    varchar(255) not null,
    form_factor   varchar(255) not null,
    reading_speed integer      not null,
    ssd_interface varchar(255) not null,
    writing_speed integer      not null,
    id            bigint       not null,
    primary key (id)
) engine=InnoDB;

create table `user`
(
    id         bigint       not null auto_increment,
    active     bit          not null,
    email      varchar(255) not null,
    first_name varchar(255) not null,
    last_name  varchar(255) not null,
    password   varchar(255) not null,
    role       varchar(255),
    primary key (id)
) engine=InnoDB;

create table ram
(
    capacity integer          not null,
    freq     double precision not null,
    type     varchar(255)     not null,
    id       bigint           not null,
    primary key (id)
) engine=InnoDB;

alter table `user`
    add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);
alter table computer
    add constraint FKkubegut30rbu863eusyw5qbhb foreign key (computer_case_id) references computer_case (id);
alter table computer
    add constraint FK960ox79k80njhjs3qn7kd4uyg foreign key (graphics_card_id) references graphics_card (id);
alter table computer
    add constraint FK2mu0pj2mfxf94mj4mamyry8vw foreign key (hdd_id) references hdd (id);
alter table computer
    add constraint FKv1f3qwccdsk6d6elcf506mdr foreign key (mother_board_id) references mother_board (id);
alter table computer
    add constraint FK5dqa2qrrllq4n3km9mi6ff9wu foreign key (power_unit_id) references power_unit (id);
alter table computer
    add constraint FK3jbp9x2se63ij7uswppbuiysx foreign key (processor_id) references processor (id);
alter table computer
    add constraint FK68p4gd0vd59m3tcx5wot2x1wg foreign key (ssd_id) references ssd (id);
alter table computer
    add constraint FKabkjlhe47hm3rmo3hwfd9071k foreign key (ram_id) references ram (id);
alter table computer_case
    add constraint FK8d7exexyolh995bng7c58j7d2 foreign key (id) references component (id);
alter table graphics_card
    add constraint FKqxgrtd8dhexnlm0vtw2vc2c2d foreign key (id) references component (id);
alter table hdd
    add constraint FK79neyx0qcmpwjemd95or8oapb foreign key (id) references component (id);
alter table mother_board
    add constraint FK53nb8cf534sjr1lmi8jlli7nv foreign key (id) references component (id);
alter table power_unit
    add constraint FK9ce1smmpb9aqpkj73l37ggbjd foreign key (id) references component (id);
alter table processor
    add constraint FK274strpejpcoky0bhvhqoclvr foreign key (id) references component (id);
alter table review
    add constraint FK3eyewefbogyvtiubue9sbo24 foreign key (component_id) references component (id);
alter table review
    add constraint FKdaoj96idm5vlb3qcon1sfn8c4 foreign key (`user_id`) references `user` (id);
alter table ssd
    add constraint FKdj06kge05plpeoskwatby6htf foreign key (id) references component (id);
alter table ram
    add constraint FKkagsjjneygn75kia2fvx3b0dc foreign key (id) references component (id);

