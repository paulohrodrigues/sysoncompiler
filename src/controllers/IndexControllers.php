<?php
namespace controllers;

class IndexControllers
{
	protected $app;
	function __construct($app){
		$this->app=$app;
	}
	public function index($request, $response){
		return $this->app->view->render($response, 'home.twig');
	}
}