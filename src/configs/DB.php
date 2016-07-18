<?php  
namespace configs;
use RedBeanPHP\R as R;

//extendendo as atribuições do R(framework de manipulação de banco - RedBean) para a class DB
class DB extends R
{
	
	function __construct()
	{
		//como DB esta recebendo uma erança de R, uso o self para o retorno de conexão com o metodo "setup();" de forma statica
		self::setup('mysql:host=localhost;dbname=sysoncompiler','root','mysql');
	}
}