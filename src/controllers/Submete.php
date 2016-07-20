<?php
namespace controllers;
use controllers\Compilar as Compilar;
class Submete
{
	static private $retorno;
	static private $codigo;

	static private function edicaoDeCodigo($codigo){
		$codeEdit1="import sys\nnSysOnCompile=-1\ndef incremetSysOnCompile():\n\tglobal nSysOnCompile \n\tnSysOnCompile+=1 \n\treturn nSysOnCompile\n".$codigo;
		$codeEdit2=str_replace("raw_input()","sys.argv[1::][incremetSysOnCompile()]",$codeEdit1);
		$codeEdit2=str_replace("input()","sys.argv[1::][incremetSysOnCompile()]",$codeEdit2);

		self::$codigo=$codigo;		

		return $codeEdit2;
	}
	
	static private function setRetorno($retorno){
		self::$retorno=$retorno;
	} 
	static public function getRetorno(){
		return self::$retorno;
	} 

	static public function getCodigo(){
		return self::$codigo;
	} 

	function __construct($codigo,$entrada)
	{				
			$arquivo = fopen('python.py','w+');
			if ($arquivo) {
				if (fwrite($arquivo,self::edicaoDeCodigo($codigo))) {
					fclose($arquivo);
					$compilador=new Compilar($entrada);
					self::setRetorno($compilador::$retorno); 
				}
			}
	}
}