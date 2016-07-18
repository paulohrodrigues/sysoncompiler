<?php
namespace controllers;
use configs\DB as DB;

class QuestoesController
{
	protected $app;
	function __construct($app)
	{
		$this->app=$app;
	}

	function index($request, $response){
		return $this->app->view->render($response, 'questoes.twig');
	}


	function select($request, $response,$args){
		
		$buscaQuestoes=DB::findOne("questoes","id=?",array($args["id"]));

		$arrayQuestoes=[];	
			array_push($arrayQuestoes,array(
				"id"=>$buscaQuestoes->id,
				"titulo"=>$buscaQuestoes->titulo,
				"pontos"=>$buscaQuestoes->pontos,
				"descricao"=>$buscaQuestoes->descricao,
				"descricao_entrada"=>$buscaQuestoes->descricao_entrada,
				"descricao_saida"=>$buscaQuestoes->descricao_saida,
				"entrada"=>$buscaQuestoes->entrada,
				"saida"=>$buscaQuestoes->saida
			));

			$this->app->view->getEnvironment()->addGlobal('dadosquestao',$arrayQuestoes);

			$submeteQuestao = new ValidaOAlgoritmoPythonController();
			
			if(isset($_POST["codigo"])){
				$this->app->view->getEnvironment()->addGlobal('acertou',$submeteQuestao->valida());
				new ControleDeAcoesUsuarioController($submeteQuestao->valida(),$args["id"]);
			}


			return $this->app->view->render($response, 'questao.twig');	
	}



}
