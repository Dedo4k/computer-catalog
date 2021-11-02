insert into component (id, model, producer, price) values (1, '11900K', 'Intel', 1509.00);
insert into processor (core, max_freq, min_freq, socket, id) values ('Core i9', 5.3, 3.5, 'LGA1200', 1);

insert into component (id, model, producer, price) values (2, '3600', 'AMD', 569.31);
insert into processor (core, max_freq, min_freq, socket, id) values ('Ryzen 5', 4.2, 3.6, 'AM4', 2);

insert into component (id, model, producer, price) values (3, '11400', 'Intel', 555.00);
insert into processor (core, max_freq, min_freq, socket, id) values ('Core i5', 4.4, 2.6, 'LGA1200', 3);

insert into component (id, model, producer, price) values (4, '3700X', 'AMD', 742.19);
insert into processor (core, max_freq, min_freq, socket, id) values ('Ryzen 7', 4.4, 3.6, 'AM4', 4);

insert into component (id, model, producer, price) values (5, '10700K', 'Intel', 923.47);
insert into processor (core, max_freq, min_freq, socket, id) values ('Core i7', 5.1, 3.8, 'LGA1200', 5);

insert into component (id, model, producer, price) values (6, 'DUAL', 'Palit', 2399.00);
insert into graphics_card (gpu_model, gpu_producer, video_memory, video_memory_type, id)
       values ('GeForce RTX 3060', 'NVIDEA', 12, 'GDDR6', 6);

insert into component (id, model, producer, price) values (7, 'D6 WINDFORCE OC', 'Gigabyte', 1030.19);
insert into graphics_card (gpu_model, gpu_producer, video_memory, video_memory_type, id)
       values ('GeForce GTX 1650', 'NVIDEA', 4, 'GDDR6', 7);

insert into component (id, model, producer, price) values (8, 'V2 OC Edition', 'ASUS ROG Strix', 2899.00);
insert into graphics_card (gpu_model, gpu_producer, video_memory, video_memory_type, id)
       values ('GeForce RTX 3060 Ti', 'NVIDEA', 8, 'GDDR6', 8);

insert into component (id, model, producer, price) values (9, 'Ventus XS OC', 'MSI', 2050.00);
insert into graphics_card (gpu_model, gpu_producer, video_memory, video_memory_type, id)
       values ('GeForce GTX 1660 Super', 'NVIDEA', 6, 'GDDR6', 9);

insert into component (id, model, producer, price) values (10, 'OC Edition', 'ASUS TUF Gaming', 5990.00);
insert into graphics_card (gpu_model, gpu_producer, video_memory, video_memory_type, id)
       values ('GeForce RTX 3080 Ti', 'NVIDEA', 12, 'GDDR6X', 10);



insert into component (id, model, producer, price) values (31, 'FURY Beast', 'Kingston', 218.40);
insert into ram (capacity, freq, type, id)
       values (16, 3200.0, 'DDR4 DIMM', 31);

insert into component (id, model, producer, price) values (32, 'Ballistix', 'Crucial', 238.0);
insert into ram (capacity, freq, type, id)
       values (16, 3200.0, 'DDR4 DIMM', 32);

insert into component (id, model, producer, price) values (33, 'Fury', 'HyperX', 280.58);
insert into ram (capacity, freq, type, id)
       values (16, 3200.0, 'DDR4 DIMM', 33);

insert into component (id, model, producer, price) values (34, 'Viper', 'Patriot', 201.73);
insert into ram (capacity, freq, type, id)
       values (16, 1600.0, 'DDR3 DIMM', 34);

insert into component (id, model, producer, price) values (35, 'Aegis', 'G.Skill', 110.66);
insert into ram (capacity, freq, type, id)
       values (8, 3200.0, 'DDR4 DIMM', 35);

insert into component (id, model, producer, price) values (36, 'Proton', 'Chieftec', 201.00);
insert into power_unit (sertificate, power, id)
       values ('bronze', 850.0, 36);

insert into component (id, model, producer, price) values (37, 'GigaMax', 'Zalman', 166.23);
insert into power_unit (sertificate, power, id)
       values ('bronze', 750.0, 37);

insert into component (id, model, producer, price) values (38, 'ECO', 'AeroCool', 60.00);
insert into power_unit (sertificate, power, id)
       values ('-', 500.0, 38);

insert into component (id, model, producer, price) values (39, 'System Power', 'be quiet!', 150.27);
insert into power_unit (sertificate, power, id)
       values ('bronze', 600.0, 39);

insert into component (id, model, producer, price) values (40, 'MVE', 'Cooler Master', 139.80);
insert into power_unit (sertificate, power, id)
       values ('basic', 600.0, 40);