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

	public function indexCadastraQuestao($request, $response,$args){

		return $this->app->view->render($response, 'admin.cadastra.questoes.twig');
	}

	public function create($request, $response,$args){

		$cad=DB::dispense('questoes');
	
			$cad->titulo 			=$_POST["titulo"];
			$cad->descricao 		=$_POST["descricao"];
			$cad->pontos 			=$_POST["pontos"];
			$cad->descricao_entrada =$_POST["descricaoDeEntrada"];
			$cad->descricao_saida 	=$_POST["descricaoDeSaida"];
			$cad->entrada 			=$_POST["demoEntrada"];
			$cad->saida 			=$_POST["demoSaida"];

		$id=DB::store($cad);


		if(isset($id)){
			$entrada =	$_POST["entrada"];
			$saida 	 =	explode(";",$_POST["saida"]);

			$entradas1=explode(";",$entrada);
			
			$i=0;
			foreach ($entradas1 as $value) {

				$cad=DB::dispense('listaentradasaida');
					$cad->id_questoes =$id;
				$idList=DB::store($cad);

				$cadSaida=DB::dispense('saida');
					$cadSaida->id_listadeentradasaida =$idList;
					$cadSaida->valor 				=$saida[$i];
					$i++;

				$idSaida=DB::store($cadSaida);

				foreach (explode(",",$value) as $value2) {
					
					$cadEntrada=DB::dispense('entrada');
						$cadEntrada->id_listadeentradasaida =$idList;
						$cadEntrada->valor 				  =$value2;
					$idEntrada=DB::store($cadEntrada);

				}

			}

		}




	}


}
