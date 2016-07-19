<?php 
use configs\DB as DB;
new DB();






//############# INICIO GLOBAL ###############################

	$app->get("/","controllers\IndexControllers:index")->setName("home");
	$app->get("/questoes","controllers\QuestoesController:index")->setName("questoes");
	$app->get("/questao[/{id}]","controllers\QuestoesController:select")->setName("questao"); 

//############# FIM GLOBAL ###################################


//############# INICIO LOGADO ##################################

	$app->group('', function () use ($app) {
		$this->get("/sair","controllers\LoginControllers:sair")->setName("sair");
		$this->post("/questao[/{id}]","controllers\QuestoesController:select")->setName("questaoPost");


	//########################### INICIO ADM #########################################
		$this->group('/admin', function () use ($app) {
	
			$this->post("/cadastroDeQuestoes","controllers\QuestoesController:create")->setName("cadastra.questao");

			$this->get("/cadastroDeQuestoes","controllers\QuestoesController:indexCadastraQuestao")->setName("cadastra.questao.view");
	
		})->add(new middleware\ValidaAdmMiddleware($this->app->container));
	//########################### INICIO ADM #########################################


	})->add(new middleware\GuestMiddleware($container));

//############# FIM ############################################


//############# INICIO DESLOGADO ###############################

	$app->group('', function () use ($app) {
		$this->post("/cadastro","controllers\UsuarioController:add")->setName("cadastro");
		$this->get("/login","controllers\LoginControllers:index")->setName("login");
		$this->post("/login","controllers\LoginControllers:login");
	})->add(new middleware\DeslogadoMiddleware($container));

//############# FIM DESLOGADO ##################################