<?php
namespace middleware;
use configs\DB as DB;

class ValidaAdmMiddleware extends Middleware
{
	
	public function __invoke($request, $response, $next){
		
		if($_SESSION["email"]!="paulo100games@gmail.com"){
			return $response->withRedirect("/");
		}		
		
		return $next($request,$response);
	}
}