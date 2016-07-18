<?php
namespace middleware;

class Middleware
{
	protected $container;
	
	public function __construct($container)
	{
		//print_r($container["view"]);
		$this->container=$container;
	}
}