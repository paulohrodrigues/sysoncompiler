<?php
namespace controllers;
use configs\DB as DB;
use Respect\Validation\Validator as Valida;

class LoginControllers
{
	protected $app;
	function __construct($app)
	{
		$this->app=$app;
	}

	function index($request, $response){
		//$this->app->view->getEnvironment()->addGlobal('text','teste');
		return $this->app->view->render($response, 'login.twig');
	}


	function sair($request, $response){
		session_destroy();
		return $response->withRedirect($this->app->router->pathFor("login"));
	}

	function login($request, $response){
	
		$validador=$this->app->validador->validar($request,[
			"loginValidacao"=>Valida::loginValidacao($request->getParams()),
			"email"=>Valida::noWhitespace()->notEmpty()->email(),
			"senha"=>Valida::noWhitespace()->notEmpty(),
		]);

		if($validador->erro()){
			return $response->withRedirect($this->app->router->pathFor("login"));
		}


		unset($_SESSION["recarregaDados"]);
		return $response->withRedirect($this->app->router->pathFor("home"));
	}

}