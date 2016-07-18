<?php
namespace validador\Exceptions;
use Respect\Validation\Exceptions\ValidationException;

class SenhasCorrespondentesException extends ValidationException
{
	public static $defaultTemplates=[

		self::MODE_DEFAULT=>[

			self::STANDARD =>'As senhas não correspondem',

		],

	];
}