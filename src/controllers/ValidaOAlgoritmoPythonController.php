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
			if(trim($submete::getRetorno())==trim($buscaSaida->valor)){
			}else{
				return "no";
			}
		}
		
		return "ok";
	}



}