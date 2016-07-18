<?php
namespace middleware;

class RecarregaDadosMiddleware extends Middleware
{
	
	public function __invoke($request, $response, $next){
		
		$this->container->view->getEnvironment()->addGlobal('recarregaDados',$_SESSION["recarregaDados"]);
		
		$this->container->view->getEnvironment()->addGlobal('dadosPessoais',[
			"id"=>$_SESSION["id"],
			"nome"=>$_SESSION["nome"],
			"email"=>$_SESSION["email"],
		]);

		$this->container->view->getEnvironment()->addGlobal('erroC',$_GET["erro"]);

		$_SESSION["recarregaDados"]=$request->getParams();

		return $next($request,$response);
	}
}