<?php
namespace middleware;
use configs\DB as DB;
class QuestoesDadosMiddleware extends Middleware
{
	
	public function __invoke($request, $response, $next){
		
		$buscaQuestoes=DB::findAll("questoes");

		$arrayQuestoes=[];
		foreach ($buscaQuestoes as $questao) {
			array_push($arrayQuestoes,array(
				"id"=>$questao->id,
				"titulo"=>$questao->titulo,
				"pontos"=>$questao->pontos,
				"descricao"=>$questao->descricao,
				"descricao_entrada"=>$questao->descricao_entrada,
				"descricao_saida"=>$questao->descricao_saida,
				"entrada"=>$questao->entrada,
				"saida"=>$questao->saida,
				"status"=>
				(DB::findOne("relacaoquestaousuario","id_usuario=? and id_questao=?",
					array(
						$_SESSION["id"],
						$questao->id
					)
				)==null)?"Pendente":"Resolvida"
			));
		}

		$this->container->view->getEnvironment()->addGlobal('dadosQuestoes',$arrayQuestoes);

		return $next($request,$response);
	}
}