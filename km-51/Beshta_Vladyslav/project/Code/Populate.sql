INSERT INTO USER_ (USER_NAME, USER_PHONE) 
VALUES ('Vlad', '38096');

INSERT INTO USER_ (USER_NAME, USER_PHONE) 
VALUES ('Anton', '38067');

INSERT INTO USER_ (USER_NAME, USER_PHONE) 
VALUES ('Bill', '70254');

INSERT INTO MESSENGERS_ (MESSENGER_NAME, VERSION) 
VALUES ('Telegram', '1');

INSERT INTO MESSENGERS_ (MESSENGER_NAME, VERSION) 
VALUES ('VK', '7');

INSERT INTO MESSENGERS_ (MESSENGER_NAME, VERSION) 
VALUES ('Viber', '3');

INSERT INTO MESSAGE_ (MESSAGE_ID, FROM_USER, TO_USER, MESSENGER_NAME, MASSAGE_TIME, STATUS, CONTENT) 
VALUES ('1', '38096', '38067', 'Telegram', DATE '2018-10-10', 'received', 'Hello my friend');


INSERT INTO MESSAGE_ (MESSAGE_ID, FROM_USER, TO_USER, MESSENGER_NAME, MASSAGE_TIME, STATUS, CONTENT) 
VALUES ('2', '38067', '38096', 'Telegram', DATE '2018-10-10', 'received', 'Sup');

INSERT INTO MESSAGE_ (MESSAGE_ID, FROM_USER, TO_USER, MESSENGER_NAME, MASSAGE_TIME, STATUS, CONTENT) 
VALUES ('3', '38096', '38067', 'Telegram', DATE '2018-10-10', 'received', 'How are you?');