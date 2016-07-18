<?php 
namespace validador\Rules;
use Respect\Validation\Rules\AbstractRule;
use configs\DB as DB;

class SenhasCorrespondentes extends AbstractRule
{

	private $dados;

	function __construct($dados){
		$this->dados=$dados;
	}


	public function validate($entrada)
	{
		return ($this->dados["senhaC"]==$this->dados["senhaIIC"]) ? true : false;
	}
}