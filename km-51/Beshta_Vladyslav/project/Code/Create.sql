/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     11.11.2018 21:38:38                          */
/*==============================================================*/


alter table Message_
   drop constraint "FK_MESSAGE__GETTING M_USER_";

alter table Message_
   drop constraint "FK_MESSAGE__ONE MESSE_MESSENGE";

alter table Message_
   drop constraint "FK_MESSAGE__SENDING M_USER_";

drop table Message_ cascade constraints;

drop table Messengers_ cascade constraints;

drop table User_ cascade constraints;

/*==============================================================*/
/* Table: Message_                                              */
/*==============================================================*/
create table Message_ 
(
   message_id           NUMBER(6)            not null,
   from_user            NUMBER(10)           not null,
   to_user              NUMBER(10)           not null,
   messenger_name       VARCHAR2(10)         not null,
   massage_time         DATE                 not null,
   status               VARCHAR2(30)         not null,
   content              VARCHAR2(2500)      not null,
   constraint PK_MESSAGE_ primary key (message_id)
);

/*==============================================================*/
/* Table: Messengers_                                           */
/*==============================================================*/
create table Messengers_ 
(
   messenger_name       VARCHAR2(10)         not null,
   version              NUMBER(6)            not null,
   constraint PK_MESSENGERS_ primary key (messenger_name)
);

/*==============================================================*/
/* Table: User_                                                 */
/*==============================================================*/
create table User_ 
(
   user_name            VARCHAR2(20)         not null,
   user_phone           NUMBER(10)           not null,
   constraint PK_USER_ primary key (user_phone)
);

alter table Message_
   add constraint "FK_MESSAGE__GETTING M_USER_" foreign key (to_user)
      references User_ (user_phone);

alter table Message_
   add constraint "FK_MESSAGE__ONE MESSE_MESSENGE" foreign key (messenger_name)
      references Messengers_ (messenger_name);

alter table Message_
   add constraint "FK_MESSAGE__SENDING M_USER_" foreign key (from_user)
      references User_ (user_phone);


	  
ALTER TABLE User_ 
    ADD CONSTRAINT user_name_chek CHECK ( REGEXP_LIKE (user_name, 
    '(\s?\w+)+' ) );

ALTER TABLE User_ 
    ADD CONSTRAINT user_phone_chek CHECK (user_phone>0);

ALTER TABLE Message_
    ADD CONSTRAINT to_user_chek CHECK (to_user>0);

ALTER TABLE Message_ 
    ADD CONSTRAINT from_user_chek CHECK (from_user>0);

ALTER TABLE Message_ 
    ADD CONSTRAINT id_message_chek CHECK (message_id>0);

ALTER TABLE Message_ 
    ADD CONSTRAINT messenger_name_chek CHECK ( REGEXP_LIKE (messenger_name, 
    '(\s?\w+)+' ) );

ALTER TABLE Message_ 
    ADD CONSTRAINT content_chek CHECK ( REGEXP_LIKE (content, 
    '(\s?\w+)+' ) );

ALTER TABLE Message_ 
    ADD CONSTRAINT status_chek CHECK ( REGEXP_LIKE (status, 
    '(\s?\w+)+' ) );

ALTER TABLE Messengers_
    ADD CONSTRAINT messengers_name_chek CHECK ( REGEXP_LIKE (messenger_name, 
    '(\s?\w+)+' ) );

ALTER TABLE Messengers_ 
    ADD CONSTRAINT messenger_version_chek CHECK (version>=0);
