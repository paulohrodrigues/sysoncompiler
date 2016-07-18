<?php
namespace validador;
use Respect\Validation\Validator as Respect;
use Respect\Validation\Exceptions\NestedValidationException;

class Validador
{
	protected $erros;
	public function validar($request,array $rules)
	{

		foreach ($rules as $field => $rule) {
			try{
				$rule->setName(ucfirst($field))->assert($request->getParam($field));
			} catch(NestedValidationException $e){
				$this->erros[$field]=$e->getMessages();
			}
		}

		$_SESSION["erros"]=$this->erros;
		
		return $this;
	}

	public function erro(){
		return !empty($this->erros);
	}


}