<?php  
namespace controllers;
class Compilar
{
	static public $retorno;
	
	static public function validacao($retorno){
		self::$retorno=$retorno;
		return self::$retorno;
	}

	function __construct($arrayParametros)
	{
		$codigoShellCompiler="py python.py";

		for($i=0;$i<count($arrayParametros);$i++){
			$codigoShellCompiler=$codigoShellCompiler." ".$arrayParametros[$i];
		}
	
		$dados=shell_exec($codigoShellCompiler);
		self::validacao($dados);
	}
}