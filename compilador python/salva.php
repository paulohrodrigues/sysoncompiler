<?php
	session_start();
	$arquivo = fopen('python.py','w+');
	if ($arquivo) {
		if (!fwrite($arquivo, $_POST["texto"].PHP_EOL."#teste")) die('Não foi possível atualizar o arquivo.');
		echo 'Arquivo atualizado com sucesso';
		fclose($arquivo);
	}
?>