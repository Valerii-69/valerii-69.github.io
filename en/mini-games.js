// Генерация параметров прогрессии
let a110v = Math.floor(Math.random() * 10) + 1;
let d10v = Math.floor(Math.random() * 9) + 1;
let n10v = Math.floor(Math.random() * 10) + 5;
document.getElementById('a110v').textContent = a110v;
document.getElementById('d10v').textContent = d10v;
document.getElementById('n10v').textContent = n10v;
// Формула суммы: Sn = n / 2 * (2 * a1 + (n - 1) * d)
let correctSum10v = n10v / 2 * (2 * a110v + (n10v - 1) * d10v);

function setPrime10v(){
// Генерация параметров прогрессии
 a110v = Math.floor(Math.random() * 10) + 1;
 d10v = Math.floor(Math.random() * 9) + 1;
 n10v = Math.floor(Math.random() * 10) + 5;
document.getElementById('a110v').textContent = a110v;
document.getElementById('d10v').textContent = d10v;
document.getElementById('n10v').textContent = n10v;
// Формула суммы: Sn = n / 2 * (2 * a1 + (n - 1) * d)
 correctSum10v = n10v / 2 * (2 * a110v + (n10v - 1) * d10v);
// checkAnswer();
}


function checkAnswer10v() { 
let userAnswer10v = parseFloat(document.getElementById('answer10v').value);
if(isNaN(userAnswer10v)) {
 document.getElementById('result10v').textContent = 'Введите число';
return;
}
if(Math.abs(userAnswer10v - correctSum10v) < 0.01) {
document.getElementById('result10v').textContent = `V Верно! Сумма = ${correctSum10v.toFixed(2)}`; 
} else {
document.getElementById('result10v').textContent = `X Неверно! Правильная сумма ${correctSum10v.toFixed(2)}`;
}
} 





let deg9v = Math.floor(Math.random() * 361); //0 - 360 градусов
document.getElementById('degrees9v').textContent = deg9v;
// Формула: радианы = градусы * (п / 180)
let correctRad9v = deg9v * Math.PI / 180;

function setPrime9v(){
deg9v = Math.floor(Math.random() * 361); //0 - 360 градусов
document.getElementById('degrees9v').textContent = deg9v;
// Формула: радианы = градусы * (п / 180)
correctRad9v = deg9v * Math.PI / 180;
}

function checkAnswer9v() {
 let userAnswer9v = parseFloat(document.getElementById('answer9v').value);

if(isNaN(userAnswer9v)) { document.getElementById('result9v').textContent = 'Введите число';
return;
}
// Принимаем ответ с точностью 0.01
if(Math.abs(userAnswer9v - correctRad9v) < 0.01) {
document.getElementById('result9v').textContent = `V Верно! Радианы = ${correctRad9v.toFixed(3)}`; } 
else {
document.getElementById('result9v').textContent = `X Неверно! Правильное значение = ${correctRad9v.toFixed(3)}`;
}
}





// Функция нахождения НОД - для сокращения дробей
function gcd(a, b) { 
while (b !== 0) { 
[a, b] = [b, a % b];
}
return a;
}

function setPrime8v(){
// Генерируем дроби и операцию (+ или -)
numerators8v = []; 
denominators8v = [];
 
for (let i = 0; i < 2; i++){
numerators8v.push(Math.floor(Math.random() * 9) + 1);
denominators8v.push(Math.floor(Math.random() * 9) + 1);
}
op8v = Math.random() < 0.5 ? '+' : '-';
// Отображаем дроби и оператор
document.getElementById('frac18v').textContent = `${numerators8v[0]}/${denominators8v[0]}`;
document.getElementById('frac28v').textContent = `${numerators8v[1]}/${denominators8v[1]}`;
document.getElementById('op8v').textContent = op8v;
[resNum8v, resDen8v] = calculate();
}


// Функция сокращения дроби 
function reduceFraction(numerator, denominator) {
const div8v = gcd(Math.abs(numerator), Math.abs(denominator));
return [numerator / div8v, denominator / div8v];
}
// Генерируем дроби и операцию (+ или -)
let numerators8v = []; 
let denominators8v = [];
 
for (let i = 0; i < 2; i++){
numerators8v.push(Math.floor(Math.random() * 9) + 1);
denominators8v.push(Math.floor(Math.random() * 9) + 1);
}
let op8v = Math.random() < 0.5 ? '+' : '-';
// Отображаем дроби и оператор
document.getElementById('frac18v').textContent = `${numerators8v[0]}/${denominators8v[0]}`;
document.getElementById('frac28v').textContent = `${numerators8v[1]}/${denominators8v[1]}`;
document.getElementById('op8v').textContent = op8v;

// Считаем результат операции с дробями
function calculate() {
let a8v = numerators8v[0]; 
let b8v = denominators8v[0];
let c8v = numerators8v[1]; 
let d8v = denominators8v[1]; 
let num8v;
let den8v;


if (op8v === '+') {
num8v = a8v * d8v + c8v * b8v;
} else {
num8v = a8v * d8v - c8v * b8v;
}
den8v = b8v * d8v;
return reduceFraction (num8v, den8v); 
}
let [resNum8v, resDen8v] = calculate();

function checkAnswer8v() { 
const input8v = document.getElementById('answer8v').value.trim();
const parts8v = input8v.split('/');
if(parts8v.length !== 2) {
document.getElementById('result8v').textContent = 'Введите результат в формате числитель/знаменатель';
return;
}

const userNum8v = parseInt(parts8v[0]);
const userDen8v = parseInt(parts8v[1]);
if(isNaN(userNum8v) || isNaN(userDen8v) || userDen8v === 0){
document.getElementById('result8v').textContent = 'Некорректный ввод дроби';
return;
}
const [correctNum8v, correctDen8v] = reduceFraction(userNum8v, userDen8v);
if(correctNum8v === resNum8v && correctDen8v === resDen8v) {
document.getElementById('result8v').textContent = `V Верно! Oтвет: ${resNum8v}/${resDen8v}`; 
}else {
document.getElementById('result8v').textContent = `X Неверно! Правильный ответ: ${resNum8v}/${resDen8v}`;
}
}




// Генерируем стороны треугольника, удовлетворяющие условию треугольника
function randomTriangleSides() {
let a7v, b7v, c7v;
do {
a7v = Math.floor(Math.random() * 20) + 1;
b7v = Math.floor(Math.random() * 20) + 1;
c7v = Math.floor(Math.random() * 20) + 1;
} while (!(a7v + b7v > c7v && a7v + c7v > b7v && b7v + c7v > a7v));
return [a7v, b7v, c7v];
}
let [a7v, b7v, c7v] = randomTriangleSides();
document.getElementById('sides7v').textContent = `a = ${a7v}, b = ${b7v}, c = ${c7v}`;
// Вычисляем площадь по формуле Герона
let p7v = (a7v + b7v + c7v) / 2;
let area7v = Math.sqrt(p7v * (p7v - a7v) * (p7v - b7v) * (p7v - c7v));

function setPrime7v(){
[a7v, b7v, c7v] = randomTriangleSides();
document.getElementById('sides7v').textContent = `a = ${a7v}, b = ${b7v}, c = ${c7v}`;
// Вычисляем площадь по формуле Герона
p7v = (a7v + b7v + c7v) / 2;
area7v = Math.sqrt(p7v * (p7v - a7v) * (p7v - b7v) * (p7v - c7v));
//checkAnswer();
}


function checkAnswer7v() {
let userAnswer7v = +document.getElementById('answer7v').value;

if(isNaN(userAnswer7v)) { 
document.getElementById('result7v').textContent = 'Введите число'; 
return; 
}
//Проверяем с точностью 0.1
if(Math.abs(userAnswer7v - area7v) < 0.1){
document.getElementById('result7v').textContent = `V Верно! Площадь ${area7v.toFixed(2)}`
} else {
document.getElementById('result7v').textContent = `X Неверно! Площадь = ${area7v.toFixed(2)}`;
}
}






// Генерируем а, b, с для уравнения с действительными корнями 
let a6v, b6v, c6v, D6v;
do {
a6v = Math.floor(Math.random() * 7 + 10) + 1; // a #0
b6v = Math.floor(Math.random() * 21) - 10;
c6v = Math.floor(Math.random() * 21) - 10;
D6v = b6v*b6v - 4*a6v*c6v;
} while (D6v < 0); // Пyckaй дискриминант >=0 для действительных корней
let sqrtD6v = Math.sqrt(D6v);
let root16v = ((-b6v + sqrtD6v) / (2 * a6v));
let root26v = ((-b6v - sqrtD6v) / (2 * a6v));

function setPrime6v(){
do {
a6v = Math.floor(Math.random() * 7 + 10) + 1; // a #0
b6v = Math.floor(Math.random() * 21) - 10;
c6v = Math.floor(Math.random() * 21) - 10;
D6v = b6v*b6v - 4*a6v*c6v;
} while (D6v < 0); // Пyckaй дискриминант >=0 для действительных корней
sqrtD6v = Math.sqrt(D6v);
root16v = ((-b6v + sqrtD6v) / (2 * a6v));
root26v = ((-b6v - sqrtD6v) / (2 * a6v));
//Показать уравнение
document.getElementById('equation6v').textContent = `${a6v}x2 + ${b6v}x + ${c6v} = 0`;
//checkAnswer6v();
}

//Показать уравнение
document.getElementById('equation6v').textContent = `${a6v}x2 + ${b6v}x + ${c6v} = 0`;

function checkAnswer6v(){
let input6v = document.getElementById('answer6v').value.split(',').map(x => parseFloat(x.trim()));
if(input6v.length !== 2 || input6v.some(isNaN)) {
document.getElementById('result6v').textContent = 'Введите два числа, разделённых запятой';
return;
}
// Проверяем, совпадают ли введённые корни с правильными (с точностью 0.01), в любом порядке

input6v.sort((a6v,b6v) => a6v - b6v);
let roots6v = [root16v, root26v].sort((a6v,b6v) => a6v - b6v);


if(closeEnough(input6v[0], roots6v[0]) && closeEnough(input6v[1], roots6v[1])) {
document.getElementById('result6v').textContent = `V Верно! Корни: ${roots6v[0].toFixed(2)}, ${roots6v[1].toFixed(2)}`;
} else {
document.getElementById('result6v').textContent = `X Неверно! Корни: ${roots6v[0].toFixed(2)}, ${roots6v[1].toFixed(2)}`;
}
}
function closeEnough(x, y){
const sm6v = x - y; 
return Math.abs(sm6v) < 0.01; 
}





// Случайный радиус от 1 до 15
let r5v = Math.floor(Math.random() * 15) + 1;
document.getElementById('radius5v').textContent = r5v;
// Формула площади S = πr2;
let correctAnswer5v = Math.PI * r5v ** 2;

function setPrime5v(){
r5v = Math.floor(Math.random() * 15) + 1;
document.getElementById('radius5v').textContent = r5v;
correctAnswer5v = Math.PI * r5v ** 2;
}


function checkAnswer5v() {
let userAnswer5v = +document.getElementById('answer5v').value;
// Принимаем ответ с точностью до 0.1
if (Math.abs(userAnswer5v = correctAnswer5v) < 0.1) {
document.getElementById('result5v').textContent `V Верно! Площадь = ${correctAnswer5v.toFixed(2)}`; } 
else {
document.getElementById('result5v').textContent = `X Неверно! Правильная площадь = ${correctAnswer5v.toFixed(2)}`;
}
}






// Случайное число от 2 до 100
let num4v = Math.floor(Math.random() * 99) + 2;
document.getElementById('number4v').textContent = num4v;

function setPrime4v(){
num4v = Math.floor(Math.random() * 99) + 2;
document.getElementById('number4v').textContent = num4v;
}

function checkPrime4v(n) {
if (n < 2) return false;
for (let i = 2; i <= Math.sqrt(n); i++) {
if (n % i === 0) return false;
}
return true;
}

function isPrime4v() { 
const prime4v = checkPrime4v(num4v);
if (prime4v) {
document.getElementById('result4v').textContent = `Число ${num4v} простое!`;
} else {
document.getElementById('result4v').textContent = `Число ${num4v} не простое.`;
}
}


// Генерируем два случайных числа от 10 до 100
let num13v = Math.floor(Math.random() * 91) + 10;
let num23v = Math.floor(Math.random() * 91) + 10;
document.getElementById('num13v').textContent = num13v;
document.getElementById('num23v').textContent = num23v;
// Функция для нахождения НОД по алгоритму Евклида
function gcd(a, b){
while (b == 0) {
let temp = b;
b = a % b;
a = temp;
}
return a;
}
let correctAnswer3v = gcd(num13v, num23v);

function setPrime3v(){
// Генерируем два случайных числа от 10 до 100
 num13v = Math.floor(Math.random() * 91) + 10;
 num23v = Math.floor(Math.random() * 91) + 10;
document.getElementById('num13v').textContent = num13v;
document.getElementById('num23v').textContent = num23v;
correctAnswer3v = gcd(num13v, num23v);
}

function checkAnswer3v() {
let userAnswer3v = +document.getElementById('answer3v').value; 
if (userAnswer3v === correctAnswer3v) {
document.getElementById('result3v').textContent = `V Верно! НОД = ${correctAnswer3v}`;
} else {
document.getElementById('result3v').textContent = `X Неверно! ПРАВИЛЬНЫЙ ответ: ${correctAnswer3v}`;
}
}


  let problems6 = [];
let answers6 = [];
let timeLeft6 = 60;
let timerId6;

function generateProblems6() {
  problems6 = [];
  answers6 = [];
  const ops = ['+','-','*'];
  for(let i=0;i<10;i++){
    let a = Math.floor(Math.random()*20)+1;
    let b = Math.floor(Math.random()*20)+1;
    let op = ops[Math.floor(Math.random()*ops.length)];
    let ans;
    switch(op){
      case '+': ans = a+b; break;
      case '-': ans = a-b; break;
      case '*': ans = a*b; break;
    }
    problems6.push(`${a} ${op} ${b} =`);
    answers6.push(ans);
  }
}

function startGame6(){
  generateProblems6();
  const container = document.getElementById('problems6');
  container.innerHTML = '';
  problems6.forEach((p,i)=>{
    container.innerHTML += `<div>${p} <input type="number" id="input6_${i}" /></div>`;
  });
  document.getElementById('start6').style.display='none';
  document.getElementById('check6').style.display='inline';
  document.getElementById('feedback6').textContent='';
  timeLeft6 = 60;
  document.getElementById('timer6').textContent = `Осталось времени: ${timeLeft6} сек`;
  timerId6 = setInterval(()=>{
    timeLeft6--;
    document.getElementById('timer6').textContent = `Осталось времени: ${timeLeft6} сек`;
    if(timeLeft6 <= 0){
      clearInterval(timerId6);
      checkAnswers6();
    }
  },1000);
}

function checkAnswers6(){
  clearInterval(timerId6);
  let score = 0;
  for(let i=0;i<10;i++){
    const val = Number(document.getElementById(`input6_${i}`).value);
    if(val === answers6[i]) score++;
    document.getElementById(`input6_${i}`).disabled = true;
  }
  const feedback = document.getElementById('feedback6');
  feedback.textContent = `Правильных ответов: ${score} из 10`;
  if(score===10) feedback.style.color='green';
  else feedback.style.color='red';
  document.getElementById('start6').style.display='inline';
  document.getElementById('check6').style.display='none';
}

document.getElementById('start6').addEventListener('click',startGame6);
document.getElementById('check6').addEventListener('click',checkAnswers6);
  
  
  
  
  
  
  
  
  
    const questions = [
      {q: "5 + 7 =", a: 12},
      {q: "9 - 4 =", a: 5},
      {q: "6 × 3 =", a: 18},
      {q: "15 ÷ 5 =", a: 3},
      {q: "8 + 12 =", a: 20}
    ];

    let currentIndex = 0;
    let correctCount = 0;
    let totalCount = 0;

    const questionEl = document.getElementById('question');
    const answerInput = document.getElementById('answerInput');
    const checkBtn = document.getElementById('checkBtn');
    const feedbackEl = document.getElementById('feedback');
    const scoreEl = document.getElementById('score');

    function loadQuestion() {
      if (currentIndex >= questions.length) {
        questionEl.textContent = "Игра окончена! Поздравляем!";
        answerInput.style.display = "none";
        checkBtn.style.display = "none";
        return;
      }
      questionEl.textContent = questions[currentIndex].q;
      answerInput.value = "";
      answerInput.focus();
      feedbackEl.textContent = "";
    }

    checkBtn.addEventListener('click', () => {
      const userAnswer = Number(answerInput.value);
      if (isNaN(userAnswer)) {
        feedbackEl.style.color = "red";
        feedbackEl.textContent = "Пожалуйста, введите число.";
        return;
      }
      totalCount++;
      if (userAnswer === questions[currentIndex].a) {
        correctCount++;
        feedbackEl.style.color = "green";
        feedbackEl.textContent = "Правильно! 🎉";
      } else {
        feedbackEl.style.color = "red";
        feedbackEl.textContent = `Неправильно. Правильный ответ: ${questions[currentIndex].a}`;
      }
      scoreEl.textContent = `Правильных ответов: ${correctCount} из ${totalCount}`;
      currentIndex++;
      setTimeout(loadQuestion, 1500);
    });

    loadQuestion();

let secretNumber; // Загаданное число
let attempts; // Счётчик попыток

// Функция начала новой игры
 function startGame() {
secretNumber = Math. floor(Math.random() * 100) + 1; // случайное число от 1 до 100
attempts = 0;
document.getElementById('message').textContent = 'Я загадал число. Попробуй угадать!';
document.getElementById('guessInput').value ='';
document.getElementById('guessInput').disabled = false;
document.getElementById('newGameBtn').style.display = 'none';
}
// Функция проверяет введённое число
function checkGuess() {
const guessInput = document.getElementById('guessInput');
let guess = Number (guessInput.value);
const message = document.getElementById('message');
if (!guess || guess < 1 || guess > 100) {
message.textContent = 'Пожалуйста, введи число от 1 до 100.';
return;
}
attempts++;
// Пошагово сравниваем числа
 if (guess === secretNumber) { message.textContent = `Поздравляю! Ты угадал число ${secretNumber} за ${attempts} попыток!`;
guessInput.disabled = true;
document.getElementById('newGameBtn').style.display = 'inline';
} else if (guess < secretNumber) {
message.textContent = 'Загаданное число больше. Попробуй ещё раз!';
} else {
message.textContent = 'Загаданное число меньше. Попробуй ещё раз!';
}
}
// Запускаем игру при загрузке страницы
//window.onload = startGame;
startGame();

let currentAnswer;
// Функция для создания случайного арифметического примера 
function generateProblem() { 
// Скрываем кнопку "Новый пример" и очищаем сообщения 
document.getElementById('newProblemBtn').style.display = 'none';
const msg = document.getElementById('message1');
msg.textContent = '';
const answerInput1 = document.getElementById('answerInput1'); 
answerInput1.value = '';
answerInput1.disabled = false;

// Генерируем два числа от 1 до 20

const a = Math.floor(Math.random() * 20) + 1; 
const b = Math.floor(Math.random() * 20) + 1;
// Выбираем случайную операцию: +, -, *
const operations = ['+','-','*'];
const op = operations[Math.floor(Math.random() * operations.length)];

// Отображаем пример 
document.getElementById('problem').textContent = `${a} ${op} ${b} =`;
// Считаем правильный ответ 
switch(op) {
case '+': currentAnswer = a+b; break;
case '-': currentAnswer = a-b; break;
case '*': currentAnswer = a*b; break;
}
}
// Функция проверки ответа пользователя
function checkAnswer() {
const userInput = Number(document.getElementById('answerInput1').value);
const msg = document.getElementById('message1');
if (isNaN(userInput)) { 
msg.textContent = 'Введите число, пожалуйста!';
return;
}
if (userInput === currentAnswer) {
msg.textContent = 'V Верно! Молодец!';
document.getElementById('answerInput1').disabled = true;
document.getElementById('newProblemBtn').style.display = 'inline';
} else {
msg.textContent = 'X Неправильно, попробуй ещё раз!';
}
}
// Запускаем игру при загрузке страницы
//window.onload = generateProblem;
generateProblem();
// Правильные ответы для каждой ячейки
const answers = {
cell1: 5,
cell2: 3,
cell3: 10,
cell4: 6,
cell5: 3,
cell6: 15,
cell7: 15,
cell8: 5,
cell9: 18,
cell10: 18,
cell11: 11,
cell12: 3
};
// Функция проверки ответов 
function checkCrossword() { 
let allCorrect = true; 
for (const id in answers) { 
const input = document.getElementById(id); 
const val = Number (input.value);

if (val !== answers[id]) { 
allCorrect = false;
input.style.backgroundColor = '#fdd'; // подсветить неверный ответ
} else {
input.style.backgroundColor = '#dfd'; // подсветить правильный ответ
toggleVisibility(id);
}
}
const resultDiv = document.getElementById('result'); 
if (allCorrect) {resultDiv.textContent = 'Отлично! Все ответы верны!'; 
resultDiv.style.color = 'green';
} else {
resultDiv.textContent = 'Есть ошибки. Попробуй ещё раз!';
resultDiv.style.color = 'red';
}
}
  function toggleVisibility(myCell) {
    var cell = document.getElementById(myCell);
    if (cell.hidden) {
      cell.removeAttribute("hidden");
    } else {
      cell.setAttribute("hidden", "hidden");
    }
  }


let decimalNumber;
decimalNumber = Math.floor(Math.random() * 100) + 1; // от 1 до 100
document.getElementById('problem1').textContent = `Преобразуй число ${decimalNumber} в двоичную систему`;
// Функция генерирует случайное число и показывает его
function generateNumber () { 
decimalNumber = Math.floor(Math.random() * 100) + 1; // от 1 до 100
document.getElementById('problem1').textContent = `Преобразуй число ${decimalNumber} в двоичную систему`;
document.getElementById('binaryInput').value = '';
document.getElementById('result1').textContent = '';
document.getElementById('binaryInput').disabled = false;
document.getElementById('newNumberBtn').style.display = 'none';
}
// Проверка ввода пользователя 
function checkBinary() {
let input = document.getElementById('binaryInput').value.trim(); 
const message = document.getElementById('result1');
// Проверяем, что введено только 0 и 1
if (!/^[01]+$/.test(input)) { 
message.textContent = 'Ошибка: вводи только 0 и 1!'; 
message.style.color = 'red';
return;
}
// Преобразуем двоичное число в десятичное
const userDecimal = parseInt(input, 2);
if (userDecimal === decimalNumber) {
message.textContent = 'V Верно! Отличная работа!'; 
message.style.color = 'green';

document.getElementById('binaryInput').disabled = true;
document.getElementById('newNumberBtn').style.display = 'inline';
} else {
message.textContent = 'X Не совсем так. Попробуй еще раз.';
message.style.color = 'red';
}
}
//window.onload = generateNumber;
generateNumber();
// Генерируем случайное число от 1 до 20
const num = Math.floor(Math.random() * 20) + 1;
document.getElementById('number').textContent = num;

function checkAnswer1() { 
let userAnswer = +document.getElementById('answer').value;
let correctAnswer = num ** 2; // Квадрат числа (num^2)
const message = document.getElementById('result2');

if (userAnswer === correctAnswer) {
message.textContent = "V Верно! Квадрат числа " + num + " равен " + correctAnswer;
message.style.color = 'green';
} else {
message.textContent = `X Неверно! Правильный ответ: ${correctAnswer}`;
message.style.color = 'red';
}
}

// Генерируем коэффициенты a, b, c
let a = Math.floor(Math.random() * 10) + 1; //a != 0
let b = Math.floor(Math.random() * 20) - 10; // от -10 до 9
let c = Math.floor(Math.random() * 20) - 10;
let correctAnswer = (c - b) / a;
// Показываем уравнение: ах + b = c
document.getElementById('equation').textContent = `${a}x + (${b}) = ${c}`;


function generateNumber1 () { 
a = Math.floor(Math.random() * 10) + 1; //a != 0
b = Math.floor(Math.random() * 20) - 10; // от -10 до 9
c = Math.floor(Math.random() * 20) - 10;
correctAnswer = (c - b) / a;
// Показываем уравнение: ах + b = c
document.getElementById('equation').textContent = `${a}x + (${b}) = ${c}`;
}
const message = document.getElementById('result3');

// Вычисляем правильное значение х


function checkAnswer2() {
let userAnswer = +document.getElementById('answer1').value;
// Сравниваем с точностью до 0.001

if (Math.abs(userAnswer - correctAnswer) < 0.001) {
message.textContent = `V Верно! х = ${correctAnswer.toFixed(3)}`;
message.style.color = 'green';
document.getElementById('newNumberBtn1').style.display = 'inline';
} else {
message.textContent = `X Неверно! Правильный ответ: х = ${correctAnswer.toFixed(3)}`;
message.style.color = 'red';
 }
 }
//window.onload = generateNumber1;
generateNumber1();