<?php
namespace lib;
use Medoo\Medoo;

class Model extends Medoo
{
    public $database = [];
    /**
     * model constructor.
     */
    public function __construct()
    {
        $database = $this->getConfig();
        try {
            parent::__construct($database);
        } catch (\PDOException $e) {
            var_dump($e->getMessage());
        }
    }

    public function getConfig()
    {
        return array(
            'database_type' => 'mysql',
            'database_name' => 'law',
            'server' => 'localhost',
            'username' => 'root',
            'password' => 'root123',
            'charset' => 'utf8',
        )  ;
    }
}
