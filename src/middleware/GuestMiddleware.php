<?php
namespace middleware;

class GuestMiddleware extends Middleware
{
	public function __invoke($request, $response, $next){
		if(!$_SESSION["id"]){
			return $response->withRedirect($this->container->router->pathFor("home"));
		}
		return $next($request,$response);
	}
}