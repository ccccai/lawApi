<?php
/**
 * Created by PhpStorm.
 * User: cc
 * Date: 2018/4/16
 * Time: 18:39
 */
require '../vendor/autoload.php';
require '../lib/whoops.php';
$connect = new \lib\Model();

if($_POST['method'] == "update_password"){
  $userName = htmlspecialchars($_POST['userName']);
  $password = MD5($_POST['newPsw']);
  $row = $connect->update("user",[
      "password"=>$password
  ],["userName"=>$userName])->rowCount();

  if ($row) {
      $result['msg'] = "修改成功！";
      $result['status'] =1;
      die(json_encode($result, JSON_UNESCAPED_UNICODE));
  } else {
      $result['msg'] = "修改失败！";
      $result['status'] = 0;
      die(json_encode($result, JSON_UNESCAPED_UNICODE));
  }
}
