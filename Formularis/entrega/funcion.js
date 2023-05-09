// selector de color

const colorInput = document.getElementById('color');
const colorBox = document.getElementById('PNGU');
const textoDiv = document.getElementById('canviant');

colorInput.addEventListener('change', function() {
  const selectedColor = colorInput.value;
  colorBox.style.backgroundColor = selectedColor;
  textoDiv.style.color = selectedColor;
});


// funcions dels botons

document.getElementById("start").style.display = "grid";
document.getElementById("part1").style.display = "none";
document.getElementById("part2").style.display = "none";
document.getElementById("send").style.display = "none";

// botons d'enviar
start.addEventListener("click", function() {
  document.getElementById("start").style.display = "none";
  document.getElementById("part1").style.display = "grid";
  document.getElementById("part2").style.display = "none";
  document.getElementById("send").style.display = "none";
});

nextBtn1.addEventListener("click", function() {
  document.getElementById("start").style.display = "none";
  document.getElementById("part1").style.display = "none";
  document.getElementById("part2").style.display = "grid";
  document.getElementById("send").style.display = "none";
});

nextBtn2.addEventListener("click", function() {
  document.getElementById("start").style.display = "none";
  document.getElementById("part1").style.display = "none";
  document.getElementById("part2").style.display = "none";
  document.getElementById("send").style.display = "grid";
});


// botons tornar arrera
prevBtn1.addEventListener("click", function() {
  document.getElementById("start").style.display = "grid";
  document.getElementById("part1").style.display = "none";
  document.getElementById("part2").style.display = "none";
  document.getElementById("send").style.display = "none";
});

prevBtn2.addEventListener("click", function() {
  document.getElementById("start").style.display = "none";
  document.getElementById("part1").style.display = "grid";
  document.getElementById("part2").style.display = "none";
  document.getElementById("send").style.display = "none";
});

prevBtn3.addEventListener("click", function() {
  document.getElementById("start").style.display = "none";
  document.getElementById("part1").style.display = "none";
  document.getElementById("part2").style.display = "grid";
  document.getElementById("send").style.display = "none";
});


