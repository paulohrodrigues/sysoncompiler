<?php
namespace middleware;

class ValidadorErrosMiddleware extends Middleware
{
	
	public function __invoke($request, $response, $next){
		$this->container->view->getEnvironment()->addGlobal('erros',$_SESSION["erros"]);
		unset($_SESSION["erros"]);

		return $next($request,$response);
	}
}