<?php
require '../vendor/autoload.php';
require '../lib/whoops.php';
$connect = new \lib\Model();

$userName = htmlspecialchars($_POST['userName']);
$password = MD5($_POST['password']);
$res['state'] = 0;
$res['msg'] = '出错啦！';

function register_check($sql_str){
    return preg_match("/select|insert|update|delete|\'|\/\*|\*|\.\.\/|\.\/|union|into|load_file|outfile|%|eval|=|and|'|;|exec|count/i", $sql_str);    // 进行过滤,防止sql注入
}
if(!empty($_POST)){
    foreach ($_POST as $key => $value){
        if(register_check($value)){
            exit ('<script>alert("地址栏输入发现有非法字符，请重新输入！");history.go(-1);</script>');
            die ();
        }
    }
}

$data = $connect -> select('user','*',['userName' => $userName]);
if($data){
    $res['state'] = -2;
    $res['msg'] = '用户名已被注册！';
  }
  else{
    $row = $connect ->insert("user",["userName" => $userName,"password" => $password]) -> rowCount();
    if($row){
      $res['state'] = 1;
      $res['msg'] = '注册成功！';
    }else{
      $res['state'] = -1;
      $res['msg'] = '注册失败！';
    }
}
echo json_encode($res);
die();
