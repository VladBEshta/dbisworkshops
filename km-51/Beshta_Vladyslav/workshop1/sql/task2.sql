2--Видалити повідомлення, що не дійшло/не має адресату.

DELETE FROM MESSAGE WHERE to_user=NULL;
