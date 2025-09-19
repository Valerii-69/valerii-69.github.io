async function loadAphorisms() {
  try {
    const response = await fetch('../js/aphorisms.json');
    const aphorisms = await response.json();
    const element = document.getElementById('aphorism');
    let index = 0;

    function showNext() {
      element.style.opacity = 0; // плавно скрываем
      setTimeout(() => {
        index = Math.floor(Math.random() * aphorisms.length);
        element.textContent = aphorisms[index];
        element.style.opacity = 1; // плавно показываем
      }, 2000); // 2 секунды на исчезновение
    }

    showNext(); // первый запуск
    setInterval(showNext, 20000); // смена каждые 20 секунд
  } catch (e) {
    console.error("Ошибка загрузки афоризмов:", e);
  }
}

loadAphorisms();
