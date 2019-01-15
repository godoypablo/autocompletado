
<!DOCTYPE html>
<html lang="es">
<head>
	<title>Autocompletado</title>
	<meta charset="UTF-8">
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/jquery-ui.js"></script>
	<script>
		$(function(){
			/*alert();*/
			$("#buscador").autocomplete({
				source: 'buscador.php'
			});
		});
	</script>
</head>
<body>
	<div id="buscar">
		<input type="text" name="buscador" id="buscador">
	</div>
    <div id="resultado"></div>
</body>
</html>