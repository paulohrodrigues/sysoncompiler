<?php
// DIC configuration

$container = $app->getContainer();

// Register component on container
$container['view'] = function ($container) {
 
    $view = new \Slim\Views\Twig(array('templates'), []);
    $view->addExtension(new \Slim\Views\TwigExtension(
        $container['router'],
        $container['request']->getUri()
    ));

    return $view;
};

// monolog
$container['logger'] = function ($c) {
    $settings = $c->get('settings')['logger'];
    $logger = new Monolog\Logger($settings['name']);
    $logger->pushProcessor(new Monolog\Processor\UidProcessor());
    $logger->pushHandler(new Monolog\Handler\StreamHandler($settings['path'], Monolog\Logger::DEBUG));
    return $logger;
};

$container['csrf'] = function ($container) {
    return new \Slim\Csrf\Guard;
};

$container['validador'] = function ($container) {
    return new validador\Validador;
};




