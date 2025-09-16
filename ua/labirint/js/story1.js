const story1 = document.getElementById('story1');
story1.innerHTML = `
<h3>История 1: Змея спасает птенца</h3>
<p>Змея заметила маленького птенца, которого подстерегал ястреб. Своими плавными, волнообразными движениями она лавировала среди веток, корректируя траекторию, чтобы спасти птенца в последний момент.</p>
<div class="canvas-container">
<canvas id="snakeCanvas" width="800" height="300" style="border:1px solid #ccc; background:#fff;"></canvas><br>
<iframe src="zmeja.html" width="680" height="400" frameborder="0" marginheight="0" marginwidth="0">Загрузка…</iframe>
</div>
<p class="wish">Наблюдая за тем, как змея лавирует среди веток и спасает птенца, помните: даже самые сложные траектории можно понять, если смотреть внимательно и пытаться моделировать движение. Пусть ваша любознательность ведёт вас, как гибкое тело змеи, к новым открытиям!</p>
`;
/*
const snakeCanvas = document.getElementById("snakeCanvas");
const ctxSnake = snakeCanvas.getContext("2d");
let widthS = snakeCanvas.width;
let heightS = snakeCanvas.height;
let time = 0, amplitude = 20, wavelength = 100, segments = 50;
const chick = {x: widthS-150, y: heightS/2 - 20, radius:10, phase:0};

function updateChick() {
  chick.phase += 0.05;
  chick.y = heightS/2 - 20 + 20 * Math.sin(chick.phase);
}

function drawSnake() {
  ctxSnake.clearRect(0,0,widthS,heightS);
  updateChick();
  ctxSnake.beginPath();
  for (let i=0; i<segments; i++){
    let x = i * (widthS/segments);
    let y = heightS/2 + amplitude * Math.sin(2*Math.PI*(x/wavelength - time));
    if (i===0) ctxSnake.moveTo(x,y);
    else ctxSnake.lineTo(x,y);
  }
  ctxSnake.strokeStyle = "green";
  ctxSnake.lineWidth = 6;
  ctxSnake.stroke();
  ctxSnake.beginPath();
  ctxSnake.arc(chick.x, chick.y, chick.radius, 0, 2*Math.PI);
  ctxSnake.fillStyle = "orange";
  ctxSnake.fill();
  ctxSnake.strokeStyle="brown";
  ctxSnake.stroke();
  time += 0.02;
  requestAnimationFrame(drawSnake);
}

drawSnake();
*/

// ===== Симуляция змеи с птенцом и препятствиями + угроза ястреба =====
const canvas = document.getElementById("snakeCanvas");
const ctx = canvas.getContext("2d");
let width = canvas.width;
let height = canvas.height;

let time = 0;
let amplitude = 20;
let wavelength = 100;
let speed = 2;
let segments = 50;

const chick = {x: width-150, y: height/2 - 20, radius:10, phase:0};
const hawk = {x: width, y: 0, vy:1.2, active:false, timer:0};
let headPath = [];
const obstacles = [
  {x:200, y:height/2+10, w:10, h:80},
  {x:400, y:height/2-40, w:10, h:60},
  {x:600, y:height/2+30, w:10, h:70}
];

function updateChick() {
  chick.phase += 0.05;
  chick.y = height/2 - 20 + 20 * Math.sin(chick.phase);
}

function updateHawk() {
  hawk.timer += 1;
  if (hawk.timer % 300 === 0) hawk.active = true;
  if (hawk.active) {
    hawk.x -= 5;
    hawk.y = chick.y - 30;
    if (hawk.x < 0) {
      hawk.active = false;
      hawk.x = width;
      hawk.y = 0;
    }
  }
}

function drawObstacles() {
  ctx.fillStyle = "#8B4513";
  obstacles.forEach(obs => {
    ctx.fillRect(obs.x, obs.y, obs.w, obs.h);
  });
}

function drawHawk() {
  if (!hawk.active) return;
  ctx.beginPath();
  ctx.moveTo(hawk.x, hawk.y);
  ctx.lineTo(hawk.x-20, hawk.y+10);
  ctx.lineTo(hawk.x-20, hawk.y-10);
  ctx.closePath();
  ctx.fillStyle = "gray";
  ctx.fill();
}

function drawSnake() {
  ctx.clearRect(0,0,width,height);
  updateChick();
  updateHawk();
  drawObstacles();
  drawHawk();

  ctx.beginPath();
  ctx.arc(chick.x, chick.y, chick.radius, 0, 2*Math.PI);
  ctx.fillStyle = "orange";
  ctx.fill();
  ctx.strokeStyle="brown";
  ctx.stroke();

  ctx.beginPath();
  for (let i=0; i<segments; i++){
    let x = i * (width/segments);
    let targetShift = Math.max(0, chick.x - x)/width * Math.PI/2;
    let y = height/2 + amplitude * Math.sin(2*Math.PI*(x/wavelength - time) + targetShift);
    if (i===0) ctx.moveTo(x,y);
    else ctx.lineTo(x,y);
  }
  ctx.strokeStyle = "green";
  ctx.lineWidth = 6;
  ctx.lineCap = "round";
  ctx.stroke();

  let headX = 0;
  let headY = height/2 + amplitude * Math.sin(2*Math.PI*(0/wavelength - time) + Math.max(0, chick.x)/width * Math.PI/2);
  headY += (chick.y - headY) * 0.2;
  ctx.beginPath();
  ctx.arc(headX, headY, 8, 0, 2*Math.PI);
  ctx.fillStyle = "darkgreen";
  ctx.fill();

  headPath.push({x: headX, y: headY});
  if (headPath.length > 200) headPath.shift();

  ctx.beginPath();
  for (let i=0; i<headPath.length; i++){
    let alpha = i/headPath.length;
    ctx.strokeStyle = `rgba(0,100,0,${alpha})`;
    if (i===0) ctx.moveTo(headPath[i].x, headPath[i].y);
    else ctx.lineTo(headPath[i].x, headPath[i].y);
  }
  ctx.lineWidth = 2;
  ctx.stroke();
}

function animate() {
  time += 0.02 * speed;
  drawSnake();
  requestAnimationFrame(animate);
}

animate();
