--
-- Generated by maven: mvn -P dev clean compile hibernate3:hbm2ddl
--

    create table countries (
        id integer not null auto_increment,
        created_at datetime not null,
        name varchar(50) not null unique,
        primary key (id)
    ) ENGINE=InnoDB;

    create table gibbons_catalog (
        id integer not null auto_increment,
        code varchar(4) unique,
        primary key (id)
    ) ENGINE=InnoDB;

    create table images (
        id integer not null auto_increment,
        image longblob not null,
        type varchar(4) not null,
        primary key (id)
    ) ENGINE=InnoDB;

    create table michel_catalog (
        id integer not null auto_increment,
        code varchar(4) unique,
        primary key (id)
    ) ENGINE=InnoDB;

    create table scott_catalog (
        id integer not null auto_increment,
        code varchar(4) unique,
        primary key (id)
    ) ENGINE=InnoDB;

    create table series (
        id integer not null auto_increment,
        comment varchar(255),
        created_at datetime not null,
        image_url varchar(255),
        perforated bit not null,
        quantity integer not null,
        released_at date,
        updated_at datetime not null,
        version bigint not null,
        country_id integer,
        primary key (id)
    ) ENGINE=InnoDB;

    create table series_gibbons_catalog (
        series_id integer not null,
        gibbons_id integer not null,
        primary key (series_id, gibbons_id)
    ) ENGINE=InnoDB;

    create table series_michel_catalog (
        series_id integer not null,
        michel_id integer not null,
        primary key (series_id, michel_id)
    ) ENGINE=InnoDB;

    create table series_scott_catalog (
        series_id integer not null,
        scott_id integer not null,
        primary key (series_id, scott_id)
    ) ENGINE=InnoDB;

    create table series_yvert_catalog (
        series_id integer not null,
        yvert_id integer not null,
        primary key (series_id, yvert_id)
    ) ENGINE=InnoDB;

    create table suspicious_activities (
        id integer not null auto_increment,
        ip varchar(15) not null,
        occured_at datetime not null,
        page varchar(100) not null,
        referer_page varchar(255) not null,
        user_agent varchar(255) not null,
        type_id integer not null,
        user_id integer,
        primary key (id)
    ) ENGINE=InnoDB;

    create table suspicious_activities_types (
        id integer not null auto_increment,
        name varchar(100) not null unique,
        primary key (id)
    ) ENGINE=InnoDB;

    create table users (
        id integer not null auto_increment,
        activated_at datetime not null,
        email varchar(255) not null,
        hash varchar(40) not null,
        login varchar(15) not null unique,
        name varchar(100) not null,
        registered_at datetime not null,
        salt varchar(10) not null,
        primary key (id)
    ) ENGINE=InnoDB;

    create table users_activation (
        act_key varchar(10) not null,
        created_at datetime not null,
        email varchar(255) not null,
        primary key (act_key)
    ) ENGINE=InnoDB;

    create table yvert_catalog (
        id integer not null auto_increment,
        code varchar(4) unique,
        primary key (id)
    ) ENGINE=InnoDB;

    alter table series 
        add index FKCA01FE77DF85B0F0 (country_id), 
        add constraint FKCA01FE77DF85B0F0 
        foreign key (country_id) 
        references countries (id);

    alter table series_gibbons_catalog 
        add index FK40EBC5A4FC1DFB59 (gibbons_id), 
        add constraint FK40EBC5A4FC1DFB59 
        foreign key (gibbons_id) 
        references gibbons_catalog (id);

    alter table series_gibbons_catalog 
        add index FK40EBC5A41F6A4A4 (series_id), 
        add constraint FK40EBC5A41F6A4A4 
        foreign key (series_id) 
        references series (id);

    alter table series_michel_catalog 
        add index FKD28C650A128BA359 (michel_id), 
        add constraint FKD28C650A128BA359 
        foreign key (michel_id) 
        references michel_catalog (id);

    alter table series_michel_catalog 
        add index FKD28C650A1F6A4A4 (series_id), 
        add constraint FKD28C650A1F6A4A4 
        foreign key (series_id) 
        references series (id);

    alter table series_scott_catalog 
        add index FK39AAAAF17555D7F (scott_id), 
        add constraint FK39AAAAF17555D7F 
        foreign key (scott_id) 
        references scott_catalog (id);

    alter table series_scott_catalog 
        add index FK39AAAAF11F6A4A4 (series_id), 
        add constraint FK39AAAAF11F6A4A4 
        foreign key (series_id) 
        references series (id);

    alter table series_yvert_catalog 
        add index FKA96A3A3C1F6A4A4 (series_id), 
        add constraint FKA96A3A3C1F6A4A4 
        foreign key (series_id) 
        references series (id);

    alter table series_yvert_catalog 
        add index FKA96A3A3CDA4206A9 (yvert_id), 
        add constraint FKA96A3A3CDA4206A9 
        foreign key (yvert_id) 
        references yvert_catalog (id);

    alter table suspicious_activities 
        add index FK35F0CA0F8D3FBEA4 (user_id), 
        add constraint FK35F0CA0F8D3FBEA4 
        foreign key (user_id) 
        references users (id);

    alter table suspicious_activities 
        add index FK35F0CA0FC005E970 (type_id), 
        add constraint FK35F0CA0FC005E970 
        foreign key (type_id) 
        references suspicious_activities_types (id);
