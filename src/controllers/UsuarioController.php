<?php
namespace controllers;
use configs\DB as DB;
use Respect\Validation\Validator as Valida;


class UsuarioController
{
	protected $app;
	function __construct($app)
	{
		$this->app=$app;
	}

	public function add($request, $response){


		$validador=$this->app->validador->validar($request,[
			"emailC"=>Valida::noWhitespace()->notEmpty()->email()->EmailErro(),
			"nomeC"=>Valida::notEmpty(),
			"senhaC"=>Valida::noWhitespace()->notEmpty(),
			"senhaIIC"=>Valida::SenhasCorrespondentes($request->getParams()),
		]);

		if($validador->erro()){
			return $response->withRedirect($this->app->router->pathFor("login")."?erro=cad");
		}

			$usuario=DB::dispense('usuario');
			$usuario->email		=$_POST["emailC"];
			$usuario->senha		=$_POST["senhaC"];
			$usuario->nome 		=$_POST["nomeC"];
			$usuario->pontos 	=0;
			$usuario->submissoes=0;

			$id=DB::store($usuario);
			DB::close();

		unset($_SESSION["recarregaDados"]);
		return $response->withRedirect($this->app->router->pathFor("home"));
	}



}