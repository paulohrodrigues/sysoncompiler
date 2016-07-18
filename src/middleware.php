<?php
use Respect\Validation\Validator as v;

$app->add(new middleware\ValidadorErrosMiddleware($container));
$app->add(new middleware\RecarregaDadosMiddleware($container));
$app->add(new middleware\CsrfViewMiddleware($container));
$app->add(new middleware\QuestoesDadosMiddleware($container));
$app->add($container->csrf);
//$app->add(new middleware\QuestaoDadosMiddleware($container));

v::with("validador\\Rules\\");