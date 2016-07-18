<?php
namespace controllers;
use configs\DB as DB;

class ControleDeAcoesUsuarioController
{
	
	protected $id;
	function __construct($validacao,$id)
	{
		$this->id=$id;

		$this->cadastraSubmissaoUsuario();

		if($validacao=="ok" and $this->mudaStatus()){
			$this->cadastraPontosUsuario();
		}

	}

	function mudaStatus(){

		$busca=DB::findOne("relacaoquestaousuario","id_questao=? and id_usuario=?",
			array(
				$this->id,
				$_SESSION["id"]
			)
		);
		if($busca==null){
			$status=DB::dispense('relacaoquestaousuario');
			$status->id_usuario=$_SESSION["id"];
			$status->id_questao=$this->id;
			$id=DB::store($status);
			DB::close();
			return true;
		}
		return false;
	}

	function cadastraPontosUsuario(){
		$busca=DB::findOne("questoes","id=?",array($this->id));
		DB::exec("
			UPDATE usuario
			SET pontos=pontos+?
			WHERE id=?",
			array($busca->pontos,$_SESSION["id"])
		);
	} 

	function cadastraSubmissaoUsuario(){
	
		DB::exec("
			UPDATE usuario
			SET submissoes=submissoes+1
			WHERE id=?",
			array($_SESSION["id"])
		);

	}

}