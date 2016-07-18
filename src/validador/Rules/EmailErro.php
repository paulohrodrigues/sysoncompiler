<?php 
namespace validador\Rules;
use Respect\Validation\Rules\AbstractRule;
use configs\DB as DB;

class EmailErro extends AbstractRule
{
	public function validate($entrada)
	{
		return (DB::findOne("usuario","email=?",array($entrada))==null) ? true : false;
	}
}