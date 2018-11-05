3--Оновити текст повідомлення, якщо його надіслали з телеграму

UPDATE CONTENT
SET content= 'new message'
WHERE content_id = (select id_content from message join messengers
ON message.message_id=messengers.mesenger_id
where messenger_name='Telegram');
