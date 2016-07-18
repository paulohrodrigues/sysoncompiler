<?php
if (PHP_SAPI == 'cli-server') {
    // To help the built-in PHP dev server, check if the request was actually for
    // something which should probably be served as a static file
    $file = __DIR__ . $_SERVER['REQUEST_URI'];
    if (is_file($file)) {
        return false;
    }
}

require __DIR__ . '/../vendor/autoload.php';

session_start();

// Instantiate the app
$settings = require __DIR__ . '/../src/settings.php';
$app = new \Slim\App($settings);

// Set up dependencies
require __DIR__ . '/../src/dependencies.php';

// Register middleware
require __DIR__ . '/../src/middleware.php';

// Register routes
//require __DIR__ . '/../src/routes.php';

//registra a biblioteca do Pague Seguro
require __DIR__.'/../src/libs/pagueSeguro/source/PagSeguroLibrary/PagSeguroLibrary.php';
//$pagueSeguro=new PagSeguroPaymentRequest();

//Register routes da front
require (__DIR__."/../src/routesBackEnd.php");

//Register routes da Back
require (__DIR__."/../src/routesFrontEnd.php");


// Run app
$app->run();
