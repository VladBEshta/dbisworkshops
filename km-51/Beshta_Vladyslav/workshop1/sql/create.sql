create table User_  
(  
   user_id              NUMBER(6)            not null,  
   user_name            VARCHAR2(20)         not null,  
   user_phone           NUMBER(10)           not null,  
   constraint PK_USER primary key (user_id)  
);

create table Message   
(  
   to_user              NUMBER(6)            not null,  
   id_messanger         NUMBER(6)            not null,  
   from_user            NUMBER(6)            not null,  
   message_id           NUMBER(6)            not null,  
   id_content           NUMBER(6)            not null,  
   massage_time         DATE                 not null,  
   constraint PK_MESSAGE primary key (message_id)  
) ;
 
create table Content   
(  
   content_id           NUMBER(6)            not null,  
   content              CLOB                 not null,  
   constraint PK_CONTENT primary key (content_id)  
);

create table Messengers   
(  
   mesenger_id          NUMBER(6)            not null,  
   messenger_name       VARCHAR2(10)         not null,  
   constraint PK_MESSENGERS primary key (mesenger_id)  
);

ALTER TABLE user_  
    ADD CONSTRAINT user_id_chek CHECK (user_id>0);

ALTER TABLE user_  
    ADD CONSTRAINT user_name_chek CHECK ( REGEXP_LIKE (user_name,  
    '(\s?\w+)+' ) ) ;

ALTER TABLE user_  
    ADD CONSTRAINT user_phone_chek CHECK ( user_phone>0);

ALTER TABLE message  
    ADD CONSTRAINT to_user_chek CHECK (to_user>0);

ALTER TABLE message  
    ADD CONSTRAINT from_user_chek CHECK (from_user>0);

ALTER TABLE message  
    ADD CONSTRAINT id_message_chek CHECK (message_id>0);

ALTER TABLE message  
    ADD CONSTRAINT id_messanger_chek CHECK (id_messanger>0);

ALTER TABLE message  
    ADD CONSTRAINT id_content_chek CHECK (id_content>0);

ALTER TABLE content  
    ADD CONSTRAINT content_id_chek CHECK ( content_id>0);

ALTER TABLE content  
    ADD CONSTRAINT content_chek CHECK ( REGEXP_LIKE (content,  
    '(\s?\w+)+' ) );

ALTER TABLE messengers  
    ADD CONSTRAINT messenger_name_chek CHECK ( REGEXP_LIKE (messenger_name,  
    '(\s?\w+)+' ) );

ALTER TABLE messengers  
    ADD CONSTRAINT messenger_id_chek CHECK (MESENGER_ID>0);

alter table Message 
   add constraint "FK_MESSAGE_ONE CONTE_CONTENT" foreign key (id_content) 
      references Content (content_id);

alter table Message 
   add constraint "FK_MESSAGE_ONE MESSE_MESSENGE" foreign key (id_messanger) 
      references Messengers (mesenger_id);

alter table Message 
   add constraint "FK_to_user" foreign key (to_user) 
      references User_ (user_id);

alter table Message 
   add constraint "FK2_from_user" foreign key (from_user) 
      references User_ (user_id);
