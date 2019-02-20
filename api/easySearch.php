<?php
require '../vendor/autoload.php';
require '../lib/whoops.php';
$connect = new \lib\Model();
$method = $_POST['method'];
$res['list'] = [];
$res['state'] = 0;
$index = 0;

if ($method == "get_case_list") {
    $formItem = json_decode($_POST["formItem"], true);
    $word = $formItem['easySearchInput'];
    $searchId = $formItem['selSimpleItem'];

    $select1 = "SELECT COUNT(1) ";
    $select2 = "SELECT * ";
    $sql = "FROM artical AS a
         LEFT JOIN caseInfo AS b ON a.aid = b.articleId
         LEFT JOIN `procedure` AS c ON b.procedureId = c.procedureId
         LEFT JOIN instrumentType AS d ON b.instrumentTypeId = d.instrumentTypeId
         LEFT JOIN caseType AS e ON b.caseTypeId = e.caseTypeId
         WHERE ";

    switch ($searchId) {
        case 1:
            $sql .= "b.caseTitle LIKE '%" . $word . "%'";
            break;
        case 2:
            $sql .= "b.caseNO LIKE '%" . $word . "%'";
            break;
        case 3:
            $sql .= "a.litigant LIKE '%" . $word . "%'";
            break;
        case 4:
            $sql .= "a.hearing LIKE '%" . $word . "%'";
            break;
        case 5:
            $sql .= "a.firstInstancePlaintiffAllegation LIKE '%" . $word . "%'";
            break;
        case 6:
            $sql .= "a.firstInstanceDefendantArgued LIKE '%" . $word . "%'";
            break;
        case 7:
            $sql .= "a.firstInstanceCourtDiscover LIKE '%" . $word . "%'";
            break;
        case 8:
            $sql .= "a.firstInstanceCourtBelieve LIKE '%" . $word . "%'";
            break;
        case 9:
            $sql .= "a.judicialResult LIKE '%" . $word . "%'";
            break;
        case 10:
            $sql .= "a.judicialGist LIKE '%" . $word . "%'";
            break;
        case 11:
            $sql .= "b.lawClause LIKE '%" . $word . "%'";
            break;
        default:
            $sql .= "concat_ws(
             '',
             aid,
             judicialGist,
             litigant,
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

    $countSql = $select1.$sql;
    $sql .= " LIMIT 2 OFFSET ".$formItem['pageBegin'];
//    $sql .= " LIMIT 2 OFFSET 0";
    $searchSql = $select2.$sql;

    $count = $connect->query($countSql)->fetchColumn();
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
}
