<?php
namespace middleware;
use configs\DB as DB;
class QuestaoDadosMiddleware extends Middleware
{
	
	public function __invoke($request, $response, $next){
		return $next($request,$response);
	}
}