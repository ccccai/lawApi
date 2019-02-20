<?php
/**
 * Created by PhpStorm.
 * User: cc
 * Date: 2018/3/21
 * Time: 16:23
 */
require '../vendor/autoload.php';
require '../lib/whoops.php';
$connect = new \lib\Model();
//var_dump($_POST);
$res['list'] = [];
$res['state'] = 0;
$index = 0;

$textType = json_decode($_POST["textSearch"], true);
$pageBegin = $_POST['pageBegin'];
$litigantType = $_POST['litigantType'];
$litigantValue = $_POST['litigantValue'];
$caseTitle = $_POST['caseTitle'];
$caseNo = $_POST['caseNo'];
$instrumentTypeId = $_POST['instrumentTypeId'];
$caseType = $_POST['caseType'];
$procedureId = $_POST['procedureId'];
$caseReason = $_POST['caseReason'];
$courtLevel = $_POST['courtLevel'];
$courtName = $_POST['courtName'];
$referencedType = $_POST['referencedType'];
$judge = $_POST['judge'];
$lawyerFirm = $_POST['lawyerFirm'];
$lawyer = $_POST['lawyer'];
$judgementDateStart = $_POST['judgementDateStart'];
$judgementDateEnd = $_POST['judgementDateEnd'];
$lawClause = $_POST['lawClause'];

$select1 = "SELECT COUNT(DISTINCT 1) ";
$select2 = "SELECT
           *,GROUP_CONCAT(distinct uid) ";
$sql = "FROM
           artical AS a
         LEFT JOIN caseInfo AS b ON a.aid = b.articleId
         LEFT JOIN `procedure` AS c ON b.procedureId = c.procedureId
         LEFT JOIN instrumentType AS d ON b.instrumentTypeId = d.instrumentTypeId
         LEFT JOIN caseType AS e ON b.caseTypeId = e.caseTypeId
         LEFT JOIN litigantInfo AS f ON b.uid = f.caseInfoId
         WHERE b.uid > 0 ";

if ($caseTitle) {
    $sql .= "AND b.caseTitle LIKE '%" . $caseTitle . "%'";
}
if ($caseNo) {
    $sql .= "AND b.caseNO LIKE '%" . $caseNo . "%'";
}
if ($instrumentTypeId) {
    $sql .= "AND b.instrumentTypeId = '" . $instrumentTypeId . "'";
}
if ($caseType) {
    $sql .= "AND b.caseTypeId = '" . $caseType . "'";
}
if ($procedureId) {
    $sql .= "AND b.procedureId = '" . $procedureId . "'";
}
if ($caseReason) {
    $sql .= "AND b.caseReason LIKE '%" . $caseReason . "%'";
}
if ($courtLevel) {
    $sql .= "AND b.courtLevelId = '" . $courtLevel . "'";
}
if ($courtName) {
    $sql .= "AND b.courtName LIKE '%" . $courtName . "%'";
}
if ($referencedType) {
    $sql .= "AND b.referencedTypeId = '" . $referencedType . "'";
}
if ($judge) {
    $sql .= "AND b.judge LIKE '%" . $judge . "%'";
}
if ($lawyerFirm) {
    $sql .= "AND b.lawyerFirm LIKE '%" . $lawyerFirm . "%'";
}
if ($lawyer) {
    $sql .= "AND b.lawyer LIKE '%" . $lawyer . "%'";
}
if ($judgementDateStart) {
    $sql .= "AND b.judgementDateStart LIKE '" . $judgementDateStart . "'";
}
if ($judgementDateEnd) {
    $sql .= "AND b.judgementDateEnd LIKE '" . $judgementDateEnd . "'";
}
if ($lawClause) {
    $sql .= "AND b.lawClause LIKE '%" . $lawClause . "%'";
}

foreach ($textType as $value) {
//    echo $value['textType'];
    $word = $value['textValue'];
    if($word){
        switch ($value['textType']) {
            case "1":
                $sql .= "AND a.judicialGist LIKE '%" . $word . "%'";
                break;
            case "2":
                $sql .= "AND a.hearing LIKE '%" . $word . "%'";
                break;
            case "3":
                $sql .= "AND a.firstInstancePlaintiffAllegation LIKE '%" . $word . "%'";
                break;
            case "4":
                $sql .= "AND a.firstInstanceDefendantArgued LIKE '%" . $word . "%'";
                break;
            case "5":
                $sql .= "AND a.firstInstanceCourtDiscover LIKE '%" . $word . "%'";
                break;
            case "6":
                $sql .= "AND a.firstInstanceCourtBelieve LIKE '%" . $word . "%'";
                break;
            case "7":
                $sql .= "AND a.thisCourtDiscover LIKE '%" . $word . "%'";
                break;
            case "8":
                $sql .= "AND a.thisCourtBelieve LIKE '%" . $word . "%'";
                break;
            case "9":
                $sql .= "AND a.judicialResult LIKE '%" . $word . "%'";
                break;
            default:
                $sql .= "AND concat_ws(
                     '',
                     aid,
                     judicialGist,
                     hearing,
                     firstInstanceCourtBelieve,
                     firstInstanceCourtDiscover,
                     firstInstanceDefendantArgued,
                     firstInstancePlaintiffAllegation,
                     thisCourtBelieve,
                     thisCourtDiscover,
                     judicialResult
                   ) LIKE '%" . $word . "%'";
        }
    }
}

if ($litigantValue) {
    $sql .= "AND b.uid = ANY( SELECT caseInfoId FROM litigantInfo WHERE" . " `name` LIKE '%" . $litigantValue . "%'";
    if ($litigantType) {
        $sql .= " AND typeId = '" . $litigantType . "'";
    }
    $sql .= " )";
}
$sql .= " GROUP BY uid";
//echo $sql;

$countSql = $select1.$sql;
$sql .= " LIMIT 2 OFFSET ".$pageBegin;
//    $sql .= " LIMIT 2 OFFSET 0";
$searchSql = $select2.$sql;
$count = 0;
$countData= $connect->query($countSql)->fetchAll();
foreach ($countData as $value) {
  $count += $value[0];
}
$datas = $connect->query($searchSql)->fetchAll();
if ($datas) {
    $res['state'] = 1;
    $res['count'] = $count;
    foreach ($datas as $data) {
        $res['list'][$index]['hearing'] = str_replace("\r\n", "", $data['hearing']);
        $res['list'][$index]['litigant'] = $data['litigant'];
        $res['list'][$index]['judicialGist'] = str_replace("\r\n", "", $data['judicialGist']);
        $res['list'][$index]['aid'] = $data['aid'];
        $res['list'][$index]['procedureName'] = $data['procedureName'];
        $res['list'][$index]['instrumentTypeName'] = $data['instrumentTypeName'];
        $res['list'][$index]['caseTypeName'] = $data['caseTypeName'];
        $res['list'][$index]['courtName'] = $data['courtName'];
        $res['list'][$index]['caseTitle'] = $data['caseTitle'];
        $res['list'][$index]['keyWord'] = $data['keyWord'];
        $index++;
    }
}
echo json_encode($res, JSON_UNESCAPED_UNICODE);
die();
