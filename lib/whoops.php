<?php
$whoops = new \Whoops\Run();
$handler = new \Whoops\Handler\PrettyPageHandler();
$errorTitle = "哎呀，出错了";
$handler->setPageTitle($errorTitle);//设置报错页面的title
$whoops->pushHandler($handler);
if(Whoops\Util\Misc::isAjaxRequest()){//设置处理ajax报错的信息
    $whoops->pushHandler(new \Whoops\Handler\JsonResponseHandler());
}
$whoops->register();