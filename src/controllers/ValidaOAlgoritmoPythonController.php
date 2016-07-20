<?php
namespace controllers;
use configs\DB as DB; 

class ValidaOAlgoritmoPythonController
{	

	function valida(){

		$buscaListaDeEntrada=DB::findAll("listaentradasaida","id_questoes=?",array($_POST["id"]));

		foreach($buscaListaDeEntrada as $value) {
			$buscaEntrada=DB::findAll("entrada","id_listadeentradasaida=?",array($value->id));
			$buscaSaida=DB::findOne("saida","id_listadeentradasaida=?",array($value->id));
			$arrayEntrada=array();

			foreach ($buscaEntrada as $valueEntrada) {
				array_push($arrayEntrada,$valueEntrada->valor);
			}
			$submete=new Submete($_POST["codigo"],$arrayEntrada);
			
			$string1= utf8_encode(trim($submete::getRetorno()));
			$string2= utf8_encode(trim($buscaSaida->valor));

			if(strcmp(str_replace("\n","</br>",$string1),$string2)==0){
				
			}else{
				return "no";
			}	

		}
		
		return "ok";
	}



}