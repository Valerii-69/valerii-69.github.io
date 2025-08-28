ИНСТРУКЦИЯ ПО НАСТРОЙКЕ "МАРКЕРА ПРОСМОТРЕННОГО"

1. Создайте Google Таблицу с колонками:
   Дата | URL | Заголовок | Статус | Комментарий

2. Откройте "Extensions → Apps Script" и вставьте код:

function doPost(e) {
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();
  var data = JSON.parse(e.postData.contents);

  var lastRow = sheet.getLastRow();
  var range = sheet.getRange(2, 2, lastRow - 1, 1).getValues(); // колонка B = URL
  var exists = range.flat().includes(data.url);

  var status = exists ? "повтор" : "новый";

  if (!exists) {
    sheet.appendRow([new Date(), data.url, data.title, status, ""]);
  }

  return ContentService.createTextOutput(JSON.stringify({status: status}))
    .setMimeType(ContentService.MimeType.JSON);
}

3. Нажмите "Deploy → New Deployment → Web App".
   - Select "Anyone with the link".
   - Скопируйте полученную ссылку.

4. Откройте index.html в текстовом редакторе.
   - В строке const scriptURL = "..." вставьте свой URL.

5. Теперь откройте index.html в браузере.
   - Вводите URL и заголовок.
   - Нажимайте "Добавить".
   - В Google Таблице появятся новые строки.
