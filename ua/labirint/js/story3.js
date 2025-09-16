const story3 = document.getElementById('story3');
story3.innerHTML = `
<h3>Історія 3: Частинки випадковості</h3>
<p>Спостерігайте за хаотичним рухом частинок. Додайте нові частинки та змінюйте силу магнітного поля, щоб побачити, як формуються кластери та вихори.</p>
<canvas id="particleCanvas" width="800" height="400"></canvas>
<div class="controls"> 
<label>Кількість частинок: <span id="numVal">50</span></label> 
<input type="range" id="numParticles" min="10" max="200" value="50"> 
<label>Сила поля: <span id="forceVal">1</span></label> 
<input type="range" id="forceField" min="-5" max="5" step="0.1" value="1"> 
<button id="addParticle">Додати частку</button> 
<button id="resetParticles">Скинути</button>
</div>
<p class="wish">Навіть у хаосі є закономірності. Дивіться на випадкові рухи як на маленьку модель реального світу: експериментуйте, змінюйте умови і математика покаже вам приховані структури.</p>`;

const particleCanvas = document.getElementById("particleCanvas");
const ctxParticle = particleCanvas.getContext("2d");
let widthP = particleCanvas.width, heightP = particleCanvas.height;
let particles = [];
let numParticles = 50, forceField = 1;

function initParticles(n){
  particles = [];
  for(let i=0;i<n;i++){
    particles.push({x:Math.random()*widthP, y:Math.random()*heightP, vx:(Math.random()-0.5)*2, vy:(Math.random()-0.5)*2});
  }
}
function updateParticles(){
  particles.forEach(p=>{
    let randAx=(Math.random()-0.5)*0.2, randAy=(Math.random()-0.5)*0.2;
    let dx=widthP/2 - p.x, dy=heightP/2 - p.y, dist=Math.sqrt(dx*dx+dy*dy);
    let ax=randAx+forceField*dx/(dist+10), ay=randAy+forceField*dy/(dist+10);
    p.vx+=ax; p.vy+=ay;
    let speed=Math.sqrt(p.vx*p.vx+p.vy*p.vy);
    if(speed>5){p.vx=(p.vx/speed)*5; p.vy=(p.vy/speed)*5;}
    p.x+=p.vx; p.y+=p.vy;
    if(p.x<0||p.x>widthP)p.vx*=-1;
    if(p.y<0||p.y>heightP)p.vy*=-1;
  });
}
function drawParticles(){
  ctxParticle.clearRect(0,0,widthP,heightP);
  particles.forEach(p=>{
    ctxParticle.beginPath();
    ctxParticle.arc(p.x,p.y,4,0,2*Math.PI);
    ctxParticle.fillStyle="blue";
    ctxParticle.fill();
  });
}
function animateParticles(){updateParticles(); drawParticles(); requestAnimationFrame(animateParticles);}
initParticles(numParticles);
animateParticles();

// Обработчики
document.getElementById("numParticles").addEventListener("input",e=>{
  numParticles=parseInt(e.target.value);
  document.getElementById("numVal").innerText=numParticles;
  initParticles(numParticles);
});
document.getElementById("forceField").addEventListener("input",e=>{
  forceField=parseFloat(e.target.value);
  document.getElementById("forceVal").innerText=forceField;
});
document.getElementById("addParticle").addEventListener("click",()=>{particles.push({x:Math.random()*widthP, y:Math.random()*heightP, vx:(Math.random()-0.5)*2, vy:(Math.random()-0.5)*2});});
document.getElementById("resetParticles").addEventListener("click",()=>{initParticles(numParticles);});
