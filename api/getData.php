<?php
require '../vendor/autoload.php';
require '../lib/whoops.php';
$connect = new \lib\Model();

$method = $_GET['method'];
$result = [];
$result['status'] = 0;

if($method == "get_easySearch_list"){
  $flag = $_GET['flag'];
  if($flag == 1){
    $data = $connect -> select('searchType','*');
  }else{
    $data = $connect -> select('checkSearchType','*');
  }

  $result['list'] = $data;
  $result['status'] = 1;
  echo json_encode($result);
}

if($method == "get_case_list"){
  $data = $connect -> select('caseType','*');
  $result['list'] = $data;
  $result['status'] = 1;
  echo json_encode($result);
}

if($method == "get_instrument_list"){
  $data = $connect -> select('instrumentType','*');
  $result['list'] = $data;
  $result['status'] = 1;
  echo json_encode($result);
}

if($method == "get_courtLevel"){
  $data = $connect -> select('courtLevel','*');
  $result['list'] = $data;
  $result['status'] = 1;
  echo json_encode($result);
}

if($method == "get_litigant_list"){
  $data = $connect -> select('litigantType','*');
  $result['list'] = $data;
  $result['status'] = 1;
  echo json_encode($result);
}

if($method == "get_procedure"){
  $data = $connect -> select('procedure','*');
  $result['list'] = $data;
  $result['status'] = 1;
  echo json_encode($result);
}

if($method == "get_referenced_list"){
  $data = $connect -> select('referencedType','*');
  $result['list'] = $data;
  $result['status'] = 1;
  echo json_encode($result);
}

if($method == "get_sublibrary_num"){
  $count = $connect -> count('caseInfo',"*",["sublibraryId" => $_GET['sublibrary']]);
  $result['status'] = 1;
  $result['count'] = $count;
  die(json_encode($result));
}

?>
