<?php
return [
    'settings' => [
        'displayErrorDetails' => true, // set to false in production

        // Monolog settings
        'logger' => [
            'name' => 'slim-app',
            'path' => __DIR__ . '/../logs/app.log',
        ],
    ],
];
