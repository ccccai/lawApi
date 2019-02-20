<?php
require '../vendor/autoload.php';
require '../lib/whoops.php';
$connect = new \lib\Model();

$userName = htmlspecialchars($_POST['username']);
$password = MD5($_POST['password']);
$res['state'] = 0;
$res['msg'] = '出错啦！';

function login_check($sql_str){
    return preg_match("/select|insert|update|delete|\'|\/\*|\*|\.\.\/|\.\/|union|into|load_file|outfile|%|eval|=|and|'|;|exec|count/i", $sql_str);    // 进行过滤,防止sql注入
}
if(!empty($_POST)){
    foreach ($_POST as $key => $value){
        if(login_check($value)){
            exit ('<script>alert("地址栏输入发现有非法字符，请重新输入！");history.go(-1);</script>');
            die ();
        }
    }
}

$row = $connect -> select('user','*',['userName' => $userName,'password' => $password]);
if ($row == null){
  $res['state'] = -1;
  $res['msg'] = '用户名或密码错误';
  echo json_encode($res);
  die();
}else{
  $res['state'] = 1;
  $res['msg'] = '登入成功';
  echo json_encode($res);
  die();
}
// $row = $connect -> select('user','*',['userName' => $userName]);
// if($row){
//   $row1 = $connect -> select('user','*',['userName' => $userName,'password' => $password]);
//   if($row1){
    // $res['state'] = 1;
    // $res['msg'] = '登入成功';
    // echo json_encode($res);
    // die();
//   }
//   else{
    // $res['state'] = -1;
    // $res['msg'] = '密码输入错误';
    // echo json_encode($res);
    // die();
//   }
// }
// else{
//   $res['state'] = -2;
//   $res['msg'] = '该用户不存在';
//   echo json_encode($res);
//   die();
// }
