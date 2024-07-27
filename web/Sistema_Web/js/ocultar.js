document.getElementById('mostrarRegister').addEventListener('click', function(e) {
    e.preventDefault(); 
  
    var login = document.getElementById('login');
    var registers=document.getElementById('registro')
    login.style.display = 'none';
    registers.style.display = 'block';
  });
document.getElementById('mostrarLogin').addEventListener('click', function(e) {
    e.preventDefault();
  
    var login = document.getElementById('login');
    var registers=document.getElementById('registro')
    registers.style.display = 'none';
    login.style.display = 'block';
  });