// Obtenemos una referencia al formulario
var form = document.querySelector(".contact");

// Agregamos un evento de escucha para el envío del formulario
form.addEventListener("submit", function(event) {
  // Prevenimos el comportamiento predeterminado del envío del formulario
  event.preventDefault();

  // Mostramos el div #confirmation
  document.querySelector("#confirmation").style.display = "grid";
  document.querySelector(".contact").style.display = "none";
});
