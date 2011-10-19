// функция рисует под углом линию из указанной точки длиной ln
function drawLine(x, y, ln, angle) {
  context.moveTo(x, y);
  context.lineTo(Math.round(x + ln * Math.cos(angle)), Math.round(y - ln * Math.sin(angle)));
}
// Функция рисует дерево
function drawTree(x, y, ln, minLn, angle) {
  if (ln > minLn) {
      ln = ln * 0.75;
      drawLine(x, y, ln, angle);
      x = Math.round(x + ln * Math.cos(angle));
      y = Math.round(y - ln * Math.sin(angle));
      drawTree(x, y, ln, minLn, angle + Math.PI/4);
      drawTree(x, y, ln, minLn, angle - Math.PI/5.5);
      // если поставить угол Math.PI/4 , то выйдет классическое дерево
  }
}
// Инициализация переменных
function init() {
  var canvas = document.getElementById("tree");
  console.log(canvas);
  context = canvas.getContext("2d");
  canvas.width = 740; // Ширина холста
  canvas.height = 640; // высота холста
  var x = canvas.width / 2;
  var y = canvas.height;
  var ln = 200; // начальная длина линии
  var minLn = 5; // минимальная длина до которой рисуются линии
  context.fillStyle = "#ddf"; // цвет фона
  context.strokeStyle = "#020"; //цвет линий
  context.fillRect(0, 0, canvas.width, canvas.height);
  context.lineWidth = 2; // ширина линий
  context.beginPath();
  drawTree(x, y, ln, minLn, Math.PI / 2);
  context.stroke();
}

  $(document).ready(function() {
    init();
  });