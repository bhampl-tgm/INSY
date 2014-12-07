<?php

return [
    'propel' => [
        'database' => [
            'connections' => [
                'noticemanagement' => [
                    'adapter'    => 'mysql',
                    'classname'  =>
'Propel\Runtime\Connection\ConnectionWrapper',
                    'dsn'        =>
'mysql:host=localhost;dbname=noticemanagement',
                    'user'       => 'noticemanagement',
                    'password'   => 'noticemanagement',
                    'attributes' => []
                ]
            ]
        ],
        'runtime' => [
            'defaultConnection' => 'noticemanagement',
            'connections' => ['noticemanagement']
        ],
        'generator' => [
            'defaultConnection' => 'noticemanagement',
            'connections' => ['noticemanagement']
        ]
    ]
];

?>
