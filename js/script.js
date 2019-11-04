'use strict';


var string = $('#presentation').val();
var str = string.split("");
var el = document.getElementById('str');

(function animate() {
	str.length > 0 ? el.innerHTML += str.shift() : clearTimeout(running); 
	var running = setTimeout(animate, 90);
	})();

		
$('[name="lang"]').on('change',function(){ $(this).parent().submit(); });