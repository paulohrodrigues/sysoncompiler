<?php
namespace validador\Exceptions;
use Respect\Validation\Exceptions\ValidationException;

class LoginValidacaoException extends ValidationException
{
	public static $defaultTemplates=[

		self::MODE_DEFAULT=>[

			self::STANDARD =>'Opa! amigo pelo que parece vc digitou os dados errados, reveja e tente novamente!',

		],

	];
}