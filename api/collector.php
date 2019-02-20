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

$method = $_GET['method'];
$res['state'] = 0;
$res['msg'] = "出错啦！";

if($method == "insert_collector"){
	$username = $_GET['username'];
	$aid = $_GET['aid'];
	$data = $connect->select("collector","*",[
	"user_name"=>$username,
	"aid"=>$aid]);
	if($data){
		$res['state'] = -1;
		$res['msg'] = "您已经收藏过这个案例了！";
		echo json_encode($res, JSON_UNESCAPED_UNICODE);
	  die();
	}
	$connect->insert("collector",[
	"user_name"=>$username,
	"aid"=>$aid]);
	$insertId = $connect->id();
	if($insertId){
		$res['state'] = 1;
		$res['msg'] = "收藏成功！";
	}else{
		$res['msg'] = "收藏失败！";
	}
	echo json_encode($res, JSON_UNESCAPED_UNICODE);
  die();
}

if($method == "get_user_info"){
	$userName = $_GET['userName'];
	$data = $connect -> select('user','*',['userName' => $userName]);
	if($data){
		$res['state'] = 1;
		$res['msg'] = "success!";
		$res['list']['uid'] = $data[0]["uid"];
		$res['list']['uname'] = $data[0]["userName"];
		$res['list']['psw'] = $data[0]["password"];
	}
	echo json_encode($res, JSON_UNESCAPED_UNICODE);
  die();
}

if($method == "delete_collector"){
	$userName = $_GET['username'];
	$aid = $_GET['aid'];

	$row = $connect -> delete("collector",[
		"AND" => [
			"user_name" => $userName,
			"aid" => $aid
		]
	])->rowCount();

	if($row){
		$res['state'] = 1;
		$res['msg'] = "删除成功！";
	}else{
		$res['state'] = -1;
		$res['msg'] = "删除失败！";
	}
	echo json_encode($res, JSON_UNESCAPED_UNICODE);
  die();
}

if($method == "get_collect_list"){
	$userName = $_GET['userName'];
	$res['state'] = 1;
	$res['msg'] = "success!";
	$datas = $connect -> select('collector',[
		"[>]caseInfo" => ["aid" => "articleId"]
	],['caseInfo.articleId','caseInfo.caseTitle','caseInfo.uid'],['collector.user_name' => $userName]);
	$res['list'] = [];
	if($datas){
		$index = 0;
		foreach ($datas as $data) {
			$res['list'][$index]['caseId'] = $data["uid"];
			$res['list'][$index]['aid'] = $data["articleId"];
			$res['list'][$index]['caseTitle'] = $data["caseTitle"];
			$index++;
		}
	}
	echo json_encode($res, JSON_UNESCAPED_UNICODE);
  die();
}
