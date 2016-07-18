<?php 
namespace validador\Rules;
use Respect\Validation\Rules\AbstractRule;
use configs\DB as DB;

class LoginValidacao extends AbstractRule
{

	private $dados;

	function __construct($dados){
		$this->dados=$dados;
	}


	public function validate($entrada)
	{

		$busca=DB::findOne("usuario","email=? and senha=?",array($this->dados["email"],$this->dados["senha"]));
		$_SESSION["id"] 	=$busca->id;
		$_SESSION["nome"] 	=$busca->nome;
		$_SESSION["email"] 	=$busca->email;
		return ($busca!=null) ? true : false;
	}
}