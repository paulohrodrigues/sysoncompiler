<?php
namespace validador\Exceptions;
use Respect\Validation\Exceptions\ValidationException;

class EmailErroException extends ValidationException
{
	public static $defaultTemplates=[

		self::MODE_DEFAULT=>[

			self::STANDARD =>'Esse email já se encontra cadastrado',

		],

	];
}