<?php
require '../vendor/autoload.php';
require '../lib/whoops.php';
$connect = new \lib\Model();
$method = $_GET['method'];
$res['list'] = [];
$res['state'] = 0;
$index = 0;

if ($method == "get_artical") {
    $aid = $_GET['aid'];
    $sql = "SELECT
           *
         FROM
           artical AS a
         LEFT JOIN caseInfo AS b ON a.aid = b.articleId
         LEFT JOIN `procedure` AS c ON b.procedureId = c.procedureId
         LEFT JOIN instrumentType AS d ON b.instrumentTypeId = d.instrumentTypeId
         LEFT JOIN caseType AS e ON b.caseTypeId = e.caseTypeId
         WHERE
           aid = '" . $aid . "'";
    // echo $sql;
    $datas = $connect->query($sql)->fetchAll();
    if ($datas) {
        $res['state'] = 1;
        foreach ($datas as $data) {
            $res['list']['procedureName'] = $data['procedureName'];
            $res['list']['instrumentTypeName'] = $data['instrumentTypeName'];
            $res['list']['caseTypeName'] = $data['caseTypeName'];
            $res['list']['courtName'] = $data['courtName'];
            $res['list']['caseTitle'] = $data['caseTitle'];
            $res['list']['caseNO'] = $data['caseNO'];
            $res['list']['plaintiff'] = $data['plaintiff'];
            $res['list']['defendant'] = $data['defendant'];
            $res['list']['lawClause'] = $data['lawClause'];
            $res['list']['keyWord'] = $data['keyWord'];
            $res['list']['aid'] = str_replace("\r\n", "", $data['aid']);
            $res['list']['judicialGist'] = str_replace("\r\n", "", $data['judicialGist']);
            $res['list']['litigant'] = $data['litigant'];
            $res['list']['hearing'] = str_replace("\r\n", "", $data['hearing']);
            $res['list']['firstInstancePlaintiffAllegation'] = str_replace("\r\n", "", $data['firstInstancePlaintiffAllegation']);
            $res['list']['firstInstanceDefendantArgued'] = str_replace("\r\n", "", $data['firstInstanceDefendantArgued']);
            $res['list']['firstInstanceCourtDiscover'] = str_replace("\r\n", "", $data['firstInstanceCourtDiscover']);
            $res['list']['firstInstanceCourtBelieve'] = str_replace("\r\n", "", $data['firstInstanceCourtBelieve']);
            $res['list']['thisCourtDiscover'] = str_replace("\r\n", "", $data['thisCourtDiscover']);
            $res['list']['thisCourtBelieve'] = str_replace("\r\n", "", $data['thisCourtBelieve']);
            $res['list']['judicialResult'] = str_replace("\r\n", "", $data['judicialResult']);
        }
    }
    echo json_encode($res, JSON_UNESCAPED_UNICODE);
    die();
}
