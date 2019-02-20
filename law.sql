/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : law

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-04-16 18:55:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for artical
-- ----------------------------
DROP TABLE IF EXISTS `artical`;
CREATE TABLE `artical` (
  `aid` int(20) NOT NULL AUTO_INCREMENT,
  `judicialGist` text CHARACTER SET utf8 COMMENT '裁判要旨',
  `litigant` text CHARACTER SET utf8 COMMENT '当事人',
  `hearing` text CHARACTER SET utf8 COMMENT '审理经过',
  `firstInstancePlaintiffAllegation` text CHARACTER SET utf8 COMMENT '一审原告诉称',
  `firstInstanceDefendantArgued` text CHARACTER SET utf8 COMMENT '一审被告辩称',
  `firstInstanceCourtDiscover` text CHARACTER SET utf8 COMMENT '一审法院查明',
  `firstInstanceCourtBelieve` text CHARACTER SET utf8 COMMENT '一审法院认为',
  `thisCourtDiscover` text CHARACTER SET utf8 COMMENT '本院查明',
  `thisCourtBelieve` text CHARACTER SET utf8 COMMENT '本院认为',
  `judicialResult` text CHARACTER SET utf8 COMMENT '裁判结果',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of artical
-- ----------------------------
INSERT INTO `artical` VALUES ('1', '<p>根据刑法第二百六十三条和《最高人民法院关于审理抢劫案件具体应用法律若干问题的解释》第一条第一款的规定，被告人以假借购物为由，进入他人经营和生活区域缺乏明显隔离的商店抢劫财物的行为，虽构成抢劫罪，但不构成入户抢劫的情节。</p>', '<p>公诉机关：上海市嘉定区人民检察院。</p>\r\n<p>被告人：魏培明，男，32岁，河南省杞县邢口乡农民。2002年4月2日被逮捕。</p>\r\n<p>被告人：岳向海，男，28岁，河南省唯县西陵镇农民。2002年4月2日被逮捕。</p>\r\n<p>被告人：岳雷，男，23岁，河南省睢县西陵镇农民。2002年4月2日被逮捕。</p>', '<p>上海市嘉定区人民法院经审理认为：</p>\r\n<p>被告人魏培明、岳向海、岳雷以非法占有为目的，采用暴力手段抢劫公民财物的事实清楚，证据确实、充分，指控的罪名成立，魏培明3人抢劫对象为尚在营业中的商店，不属于法律规定的“户”之范畴，故岳雷的辩护人关于各被告人的行为不应认定为入户抢劫的辩护意见予以采纳。</p>\r\n<p>本案是一起有预谋有分工的共同犯罪，暴力程度相对较大，社会危害严重，故在量刑时酌情从重处罚；但魏培明3人归案后认罪态度尚好，量刑时亦应一并予以考虑。</p>\r\n<p>综上，上海市嘉定区人民法院依照刑法第二百六十三条、第五十六条第一款、第五十五条第一款、第五十三条、第六十四条、第二十五条第一款的规定，于2002年7月17日判决：被告人魏培明犯抢劫罪，判处有期徒刑八年，剥夺政治权利二年，并处罚金人民币2000元；被告人岳向海犯抢劫罪，判处有期徒刑八年，剥夺政治权利二年，并处罚金人民币2000元；被告人岳雷犯抢劫罪，判处有期徒刑八年，剥夺政治权利二年，并处罚金人民币2000元；判决后，魏培明3人均服判，没有提出上诉。</p>\r\n<p>上海市嘉定区人民检察院以一审判决没有按入户抢劫认定有误，对各被告人应处以十年以上有期徒刑为由提出抗诉，上海市第二中级人民法院依法受理了本案。</p>', '<p>起诉书指控：</p>\r\n<p>2002年3月19日晚，被告人魏培明和岳雷、岳向海3人持仿真玩具手枪和三棱刮刀等凶器，在上海市嘉定区马陆镇石岗村的芳芳商店内对在此经营和居住的陈云飞夫妇实施了抢劫，获取现金1350余元。后魏培明、岳向海被接警赶到的民警当场抓获，岳雷虽当时逃离现场，但于次日凌晨被抓获归案。</p>\r\n<p>起诉书认为，根据《中华人民共和国刑法》（以下简称刑法）第二百六十三条的规定，魏培明等人的行为已构成了入户抢劫财物，应依法予以惩处。</p>', '<p>被告人魏培明对公诉机关的指控无异议。</p>\r\n<p>被告人岳向海及辩护人均对公诉机关的指控无异议；但岳向海的辩护人认为，岳向海在共同犯罪中的作用要小于其他被告人，建议量刑时予以区别。</p>\r\n<p>被告人岳雷及辩护人均对公诉机关的指控无异议；但岳雷的辩护人认为，本案被告人抢劫的对象是商店，故不能认定为入户抢劫；此外，岳雷在共同犯罪中作用较小，建议对其从轻处罚。</p>', '<p>上海市嘉定区人民法院经审理查明：</p>\r\n<p>2002年3月19日，被告人魏培明、岳雷、岳向海3人预谋对位于上海市嘉定区马陆镇石岗村的芳芳商店进行抢劫，并为此准备了仿真玩具手枪、封箱胶带、尼龙绳和三棱刮刀等犯罪工具。当晚11时30分许，魏培明3人乘店内无顾客之机，携带犯罪工具进入商店后，用仿真玩具手枪、三棱刮刀顶住店主陈云飞头部及胸部，对其进行威胁，并强行将商店卷帘门关上，用透明封箱带捆住陈云飞，封住其嘴巴和眼睛，随即魏培明从该店营业箱内劫得现金450元。岳向海持三棱刮刀冲入商店的内侧卧室，对睡在床上的陈云飞妻子黄益芳进行威胁，逼其交出钱款，并在陈云飞的衣服口袋内及衣橱顶部劫得现金人民币900余元。这时，民警接报警后赶到，当场将魏培明、岳向海2人抓获，岳雷逃离现场后于次日凌晨被抓获归案。</p>', '<p>上海市嘉定区人民法院经审理认为：</p>\r\n<p>被告人魏培明、岳向海、岳雷以非法占有为目的，采用暴力手段抢劫公民财物的事实清楚，证据确实、充分，指控的罪名成立，魏培明3人抢劫对象为尚在营业中的商店，不属于法律规定的“户”之范畴，故岳雷的辩护人关于各被告人的行为不应认定为入户抢劫的辩护意见予以采纳。</p>\r\n<p>本案是一起有预谋有分工的共同犯罪，暴力程度相对较大，社会危害严重，故在量刑时酌情从重处罚；但魏培明3人归案后认罪态度尚好，量刑时亦应一并予以考虑。</p>\r\n<p>综上，上海市嘉定区人民法院依照刑法第二百六十三条、第五十六条第一款、第五十五条第一款、第五十三条、第六十四条、第二十五条第一款的规定，于2002年7月17日判决：被告人魏培明犯抢劫罪，判处有期徒刑八年，剥夺政治权利二年，并处罚金人民币2000元；被告人岳向海犯抢劫罪，判处有期徒刑八年，剥夺政治权利二年，并处罚金人民币2000元；被告人岳雷犯抢劫罪，判处有期徒刑八年，剥夺政治权利二年，并处罚金人民币2000元；判决后，魏培明3人均服判，没有提出上诉。</p>\r\n<p>上海市嘉定区人民检察院以一审判决没有按入户抢劫认定有误，对各被告人应处以十年以上有期徒刑为由提出抗诉，上海市第二中级人民法院依法受理了本案。</p>', '<p>上海市第二中级人民法院认为：从本案魏培明等人的犯罪动机和目的看，抢劫行为是针对被害人经营的店铺的。该店铺地处临街，采取的是随时服务的经营方式，魏培明等人就是以购物为由进入店铺的。且被害人的店铺中用于生活的区域处于非封闭状态，生活设施都是临时性的，同时还堆放有部分货物，与用于经营的区域缺乏明显的隔离，不具备刑法中“户”的主要特征，不能认定为“入户抢劫”，故对检察机关的抗诉意见不予支持。</p>\r\n<p>上海市第二中级人民法院依照刑事诉讼法第一百八十九条第（一）项和《最高人民法院关于审理抢劫案件具体应用法律若干问题的解释》第一条的规定，于2002年10月28日裁定：</p>', '<p>本案的争议焦点为：\r\n<p>被告人以假借购物为由，进入他人经营和生活区域缺乏明显隔离的店铺抢劫财物的行为，是否构成入户抢劫?\r\n<p>上海市第二中级人民法院认为：从本案魏培明等人的犯罪动机和目的看，抢劫行为是针对被害人经营的店铺的。该店铺地处临街，采取的是随时服务的经营方式，魏培明等人就是以购物为由进入店铺的。且被害人的店铺中用于生活的区域处于非封闭状态，生活设施都是临时性的，同时还堆放有部分货物，与用于经营的区域缺乏明显的隔离，不具备刑法中“户”的主要特征，不能认定为“入户抢劫”，故对检察机关的抗诉意见不予支持。</p>\r\n<p>上海市第二中级人民法院依照刑事诉讼法第一百八十九条第（一）项和《最高人民法院关于审理抢劫案件具体应用法律若干问题的解释》第一条的规定，于2002年10月28日裁定：', '<p>驳回抗诉，维持原判。</p>\r\n<p>二审裁定发生法律效力后，上海市人民检察院以上海市嘉定区人民法院和上海市第二中级人民法院的判决、裁定确有错误为由，于2003年4月4日再次以审判监督程序向上海市高级人民法院提出抗诉。</p>\r\n<p>上海市人民检察院的主要抗诉理由是：</p>\r\n<p>（1）魏培明3人在经“踩点”确认被害人夫妇晚间宿于店内后，选择深夜作案，且在被害人停止营业之际闯入行劫，表明主观上具有“入户抢劫”的故意，其抢劫行为的指向应认定为“户”。</p>\r\n<p>（2）被害人拉下卷帘门的行为表明，此时的芳芳商店已从公开的营业场所转为与外界相对隔离的家庭生活场所，且客观上被害人的妻女已经上床并入睡，故魏培明3人所侵犯的场所已完全具有“户”的生活功能和特征。</p>\r\n<p>（3）魏培明3人找借口趁被害人不备而闯入店内，具有非法侵入性，在侵入后，又强行拉下卷帘门，使之与外界隔离的情况下，对被害人使用暴力进行抢劫，而且还进入内侧卧室劫得900余元，其行为不仅侵犯了公民个人的人身安全，而且还危及到公民的家庭财产和安全，其客观行为和实际危害均符合“入户抢劫”的特征。</p>\r\n<p>上海市高级人民法院经审理认为：芳芳商店系被害人公开营业的商店，该店有工商管理机关核发的营业执照，故不应认定其为居民的住宅，而是认定其为营业场所。该店由连成一体的三间店面房组成，内部各房间之间没有明确的隔离，其中两间分别用于放置货架或作为门市，另一间内有一张床和一具液化气灶具，同时也堆放着数袋大米、货架和冰柜，以上情况说明店内的生活区域与营业场所没有明确的分隔，生活功能和营业功能的区分不明显。刑法“入户抢劫”中的“户”，是指公民的私人住宅，即公民以居住、生活为目的，与外界相对隔离的场所。《最高人民法院关于审理抢劫案件具体应用法律若干问题的解释》规定：“户为他人生活的与外界相对隔离的住所，包括封闭的院落、牧民的帐篷、渔民作为家庭生活场所的渔船、为生活租用的房屋等。”根据该解释，作为刑法意义上的“户”，应当是以生活为目的或主要以生活为目的设立的场所，而其他为生产、经营、学习设立的场所，则不宜认定为“户”。芳芳商店是以营业为目的开设的公开营业场所，虽部分区域兼有生活功能，但不具有居民私人住宅相对封闭性的特征。本案事实表明，魏培明3人在实施抢劫时，芳芳商店还在营业之中。魏培明等人是以抢商店的营业款为目的而实施犯罪，犯罪意图和指向明确。被害人的卧室仍然是商店的一部分，与商店的经营区域不处于封闭的状态，故不能以魏培明等人在此亦实施了抢劫就认定构成入户抢劫。</p>\r\n');
INSERT INTO `artical` VALUES ('2', '', '<p>原告：某女。</p><p>被告：某男。</p>', '<p>原告某女因与被告某男发生婚姻和子女抚养纠纷，基层人民法院提起诉讼。</p>', '<p>原告诉称：</p><p>双方婚后感情不合，经常争吵。被告对我及家人从不关心，致使夫妻感情彻底破裂。现请求与被告离婚；孩子归我抚养，被告要负担抚养费用；在各自住处存放的财产归各自所有。</p>', '<p>被告辩称：</p><p>夫妻感情虽已破裂，但是还应以和为好，若原告坚持离婚，我也同意。孩子是原告未经我的同意，接受人工授精所生，与我没有血缘关系。如果孩子由我抚养教育，我可以负担抚养费用；如果由原告抚养，我不负担抚养费用。同意原告对财产的分割意见。</p>', '', '', '<p>受理此案的人民法院经不公开审理查明：原告某女与被告某男于1978年7月结婚，婚后多年不孕，经医院检查，是某男无生育能力。1984年下半年，夫妻二人通过熟人关系到医院为某女实施人工授精手术2次，均未成功。1985年初，二人到医院，又为某女实施人工授精手术3次。不久，某女怀孕，于1986年1月生育一子。之后，夫妻双方常为生活琐事发生争吵，又长期分居，致使感情破裂。</p>', '<p>受理此案的人民法院认为，原告某女与被告某男的夫妻感情确已破裂，经法院调解，双方同意离婚，依照《中华人民共和国婚姻法》第25条的规定，应当准予离婚。婚姻关系存续期间所生一子，是夫妻双方在未办理书面同意手续的情况下，采用人工授精方法所生。实施人工授精时，某男均在现场，并未提出反对或者不同的意见；孩子出生后的10年中，某男一直视同亲生子女养育，即使在夫妻发生矛盾后分居不来往时，某男仍寄去抚养费。</p><p>最高人民法院于1991年7月8日在《关于夫妻关系存续期间以人工授精所生子女的法律地位的复函》中明确指出：“在夫妻关系存续期间，双方一致同意进行人工授精所生子女应视为夫妻双方的婚生子女，父母子女之间权利义务关系适用《婚姻法》的有关规定”。根据婚姻法的立法精神和最高人民法院的复函规定，某女和某男婚姻关系存续期间所生的孩子，应当视为夫妻双方的婚生子女。某男现在否认当初同意某女做人工授精手术，并籍此拒绝负担对孩子的抚养义务，其理由不能成立。</p><p>依照婚姻法第十五条和第二十九条的规定，无论子女随哪一方生活，父母对子女都有抚养教育的义务。根据最高人民法院《关于人民法院审理离婚案件处理子女抚养问题的若干具体意见》第五条关于“父母双方对十周岁以上的未成年子女随父或随母生活发生争执的，应当考虑该子女的意见”的规定，经征求孩子本人的意见，孩子表示愿意随母亲生活，应予同意。依照婚姻法第三十一条的规定，夫妻双方对共同财产的分割协商一致，法院不予干预。据此，该人民法院于1996年7月15日判决：</p>', '<p>一、准予原告某女、被告某男离婚。</p><p>二、孩子由原告某女抚养教育，被告某男自1996年7月份起每月支付孩子的抚养费130元，至其独立生活时止。</p><p>三、财产分割双方无争议。宣判后，某女、某男均未提出上诉。</p>');
INSERT INTO `artical` VALUES ('3', '<p>原告周某系被告何某之女、系被继承人何某某之外孙女，被告何某系被继承人何某某之女。被继承人何某某于1930年2月10日出生，其父母均先于其去世，其妻姬某某于1998年12月30日去世，被继承人何某某未再婚。被继承人何某某与其妻姬某某仅生育一女，即被告何某。被继承人何某某于2000年取得坐落于天津市××房屋所有权，该房屋所有权人为被继承人何某某。被继承人何某某于2008年11月21日亲笔书写遗嘱一份，并在该遗嘱上签名，按捺指印，注明书写日期。</p>', '<p>原告：周某</p>\r\n<p>被告：何某</p>', '<p>原告周某与被告何某遗赠纠纷一案，本院于2017年4月20日立案后，依法适用简易程序，公开开庭进行了审理，原告周某的委托诉讼代理人周某1、被告何某到庭参加诉讼。本案现已审理终结。</p>', '<p>原告周某向本院提出诉讼请求：1、确认何某某2008年11月21日自书遗嘱有效；2、诉讼费由被告承担。事实与理由：原、被告系母女关系，原告系何某某外孙女，何某某于2008年11月21日在自书遗嘱言明其个人财产中的位于天津市××房屋一套由原告继承，但是由于被告一直居住着诉争房屋，使原告无法实现继承权，故原告诉至本院。</p>', '<p>被告何某辩称，认可遗嘱有效。诉讼费同意承担。</p>', null, null, '<p>当事人围绕诉讼请求依法提交了证据，本院组织当事人进行了证据交换和质证。对当事人无异议的证据，本院予以确认并在卷佐证。</p>\r\n<p>根据当事人陈述和经审查确认的证据，本院认定事实如下：原告周某系被告何某之女、系被继承人何某某之外孙女，被告何某系被继承人何某某之女。被继承人何某某于1930年2月10日出生，其父母均先于其去世，其妻姬某某于1998年12月30日去世，被继承人何某某未再婚。被继承人何某某与其妻姬某某仅生育一女，即被告何某。被继承人何某某于2000年取得坐落于天津市××房屋所有权，该房屋所有权人为被继承人何某某。被继承人何某某于2008年11月21日亲笔书写遗嘱一份，并在该遗嘱上签名，按捺指印，注明书写日期。该遗嘱的主要内容为：“我立此遗嘱对我所有财产作如下处理，我自愿将名下天津市××，产权证号：河西字第津××号，面积63.81平方米房屋一套留给外孙女周某。我遗留给周某的财产仅限周某个人所有，作为周某个人财产。”被继承人何某某于2009年4月13日因病去世。故原告向本院提起诉讼。</p>\r\n<p>庭审中，原告周某的委托诉讼代理人周某1述称，原告在知道受遗赠时即表示尊重被继承人何某某的意思，接受该遗嘱。被告何某对此事实亦表示认可。</p>\r\n<p>本院认为，根据法律规定，公民可以立遗嘱将个人财产赠给国家、集体、或者法定继承人以外的人。被继承人何某某所立自书遗嘱，从内容及形式上均符合法律规定中的遗赠要件，且作为受遗赠人的原告周某在知道受遗赠时即作出接受受遗赠的表示，故该自书遗嘱合法、有效，本院予以确认。</p>', '<p>综上所述，依照《中华人民共和国继承法》第二条、第三条、第五条、第十条、第十六条第三款、第十七条第二款、第二十五条第二款规定，判决如下：</p>', '<p>被继承人何某某于2008年11月21日所立自书遗嘱有效。</p>\r\n<p>案件受理费80元，减半收取40元，由被告何某负担。</p>\r\n<p>如不服本判决，可在判决书送达之日起十五日内，向本院递交上诉状，并按对方当事人的人数提供副本，向天津市第二中级人民法院交纳上诉费，上诉于天津市第二中级人民法院（递交上诉状后，应在上诉期内向天津市第二中级人民法院预交上诉费，上诉期限届满后七日内仍未交纳的，视为放弃上诉权）。</p>');

-- ----------------------------
-- Table structure for caseInfo
-- ----------------------------
DROP TABLE IF EXISTS `caseInfo`;
CREATE TABLE `caseInfo` (
  `uid` int(10) NOT NULL AUTO_INCREMENT,
  `sublibraryId` int(11) DEFAULT NULL COMMENT '案子类型（检查2还是裁判1）',
  `keyWord` varchar(11) DEFAULT NULL COMMENT '关键词',
  `articleId` int(11) DEFAULT NULL COMMENT '文章id',
  `procedureId` int(11) DEFAULT NULL COMMENT '审判程序',
  `instrumentTypeId` int(11) DEFAULT NULL COMMENT '文书类型',
  `caseTypeId` int(11) DEFAULT NULL COMMENT '案件类型',
  `courtLevelId` int(11) DEFAULT NULL COMMENT '法院层级',
  `courtName` varchar(20) DEFAULT NULL COMMENT '法院名称',
  `referencedTypeId` int(11) DEFAULT NULL COMMENT '参考类型',
  `caseTitle` varchar(50) DEFAULT NULL COMMENT '案件名称',
  `caseReason` varchar(20) DEFAULT NULL,
  `caseNO` int(11) DEFAULT NULL COMMENT '案号',
  `defendant` varchar(11) DEFAULT NULL COMMENT '被告',
  `plaintiff` varchar(11) DEFAULT NULL COMMENT '原告',
  `judge` varchar(20) DEFAULT NULL COMMENT '审判人员',
  `lawyerFirm` varchar(20) DEFAULT NULL COMMENT '律所',
  `lawyer` varchar(20) DEFAULT NULL COMMENT '律师',
  `judgementDateStart` varchar(50) DEFAULT NULL COMMENT '裁判开始时间',
  `judgementDateEnd` varchar(50) DEFAULT NULL COMMENT '裁判结束时间',
  `lawClause` varchar(200) DEFAULT NULL COMMENT '法律依据',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of caseInfo
-- ----------------------------
INSERT INTO `caseInfo` VALUES ('1', '1', '抢劫', '1', '2', '1', '1', '3', '上海市嘉定区人民法院', '5', '上海市嘉定区人民检察院诉魏培明等人抢劫案', '抢劫', '17', '魏培明，岳向海，岳雷', '上海市嘉定区人民检察院', '李一二', '某某律师事务所', '赵某某', '2012/4/6-2013/3/21', null, '《中华人民共和国刑法》第二百六十三条、第二百六十四条、第二百六十九条、第二十五条、第六十九条，《中华人民共和国刑事诉讼法》第二百一十七条、第二百二十五条第一款第二项');
INSERT INTO `caseInfo` VALUES ('2', '1', '离婚', '2', '1', '1', '2', '4', '长安镇人民法院', '5', '人工授精子女抚养纠纷案', '抚养纠纷', '12', '某男', '某女', '李一二', '某某律师事务所', '王某某', '1522512000', '1522857600', '《中华人民共和国婚姻法》第二十五条，《关于人民法院审理离婚案件处理子女抚养问题的若干具体意见》第五条');
INSERT INTO `caseInfo` VALUES ('4', '1', '遗赠', '3', '1', '1', '2', '4', '天津市河西区人民法院', '5', '周某与何某遗赠纠纷一审民事判决书', '遗赠纠纷', '11', '何某', '周某', ' 张辉', '某某律师事务所', '李某某', '1494172800', '1495641600', '《中华人民共和国继承法》第二条、第三条、第五条、第十条、第十六条第三款、第十七条第二款、第二十五条第二款');

-- ----------------------------
-- Table structure for caseType
-- ----------------------------
DROP TABLE IF EXISTS `caseType`;
CREATE TABLE `caseType` (
  `caseTypeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '案件类型id值',
  `caseTypeName` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '案件类型名称',
  UNIQUE KEY `typeId` (`caseTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='案件类型表';

-- ----------------------------
-- Records of caseType
-- ----------------------------
INSERT INTO `caseType` VALUES ('1', '刑事');
INSERT INTO `caseType` VALUES ('2', '民事');
INSERT INTO `caseType` VALUES ('3', '行政');
INSERT INTO `caseType` VALUES ('4', '赔偿');
INSERT INTO `caseType` VALUES ('5', '执行');

-- ----------------------------
-- Table structure for checkSearchType
-- ----------------------------
DROP TABLE IF EXISTS `checkSearchType`;
CREATE TABLE `checkSearchType` (
  `checkSearchTypeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '检查类型id',
  `checkSearchTypeName` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '检查类型名称',
  PRIMARY KEY (`checkSearchTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of checkSearchType
-- ----------------------------
INSERT INTO `checkSearchType` VALUES ('1', '当事人');
INSERT INTO `checkSearchType` VALUES ('2', '审查经过');
INSERT INTO `checkSearchType` VALUES ('3', '检院查明');
INSERT INTO `checkSearchType` VALUES ('4', '检院认为');
INSERT INTO `checkSearchType` VALUES ('5', '原判结果');
INSERT INTO `checkSearchType` VALUES ('6', '抗诉理由');
INSERT INTO `checkSearchType` VALUES ('7', '检查员');

-- ----------------------------
-- Table structure for collector
-- ----------------------------
DROP TABLE IF EXISTS `collector`;
CREATE TABLE `collector` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `caseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of collector
-- ----------------------------

-- ----------------------------
-- Table structure for courtLevel
-- ----------------------------
DROP TABLE IF EXISTS `courtLevel`;
CREATE TABLE `courtLevel` (
  `courtLevelId` int(11) NOT NULL AUTO_INCREMENT COMMENT '法院层级id值',
  `courtLevelName` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '法院层级',
  UNIQUE KEY `typeId` (`courtLevelId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='法院层级表';

-- ----------------------------
-- Records of courtLevel
-- ----------------------------
INSERT INTO `courtLevel` VALUES ('1', '最高人民法院');
INSERT INTO `courtLevel` VALUES ('2', '高级人民法院');
INSERT INTO `courtLevel` VALUES ('3', '中级人民法院');
INSERT INTO `courtLevel` VALUES ('4', '基层人民法院');

-- ----------------------------
-- Table structure for instrumentType
-- ----------------------------
DROP TABLE IF EXISTS `instrumentType`;
CREATE TABLE `instrumentType` (
  `instrumentTypeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '文书类型id值',
  `instrumentTypeName` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '文书类型名称',
  UNIQUE KEY `typeId` (`instrumentTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='文书类型表';

-- ----------------------------
-- Records of instrumentType
-- ----------------------------
INSERT INTO `instrumentType` VALUES ('1', '判决书');
INSERT INTO `instrumentType` VALUES ('2', '裁定书');
INSERT INTO `instrumentType` VALUES ('3', '凋解书');
INSERT INTO `instrumentType` VALUES ('4', '决定书');
INSERT INTO `instrumentType` VALUES ('5', '通知书');
INSERT INTO `instrumentType` VALUES ('6', '支付令');
INSERT INTO `instrumentType` VALUES ('7', '执行令');
INSERT INTO `instrumentType` VALUES ('8', '批复');
INSERT INTO `instrumentType` VALUES ('9', '答复');
INSERT INTO `instrumentType` VALUES ('10', '函');
INSERT INTO `instrumentType` VALUES ('11', '裁判结果');
INSERT INTO `instrumentType` VALUES ('12', '其他');

-- ----------------------------
-- Table structure for litigantInfo
-- ----------------------------
DROP TABLE IF EXISTS `litigantInfo`;
CREATE TABLE `litigantInfo` (
  `caseInfoId` int(11) DEFAULT NULL,
  `typeId` varchar(20) DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of litigantInfo
-- ----------------------------
INSERT INTO `litigantInfo` VALUES ('1', '1', '一号公诉机关');
INSERT INTO `litigantInfo` VALUES ('1', '2', '李一');
INSERT INTO `litigantInfo` VALUES ('1', '3', '张三');
INSERT INTO `litigantInfo` VALUES ('1', '4', '王小明');
INSERT INTO `litigantInfo` VALUES ('1', '5', '赵四');
INSERT INTO `litigantInfo` VALUES ('1', '6', '王五');
INSERT INTO `litigantInfo` VALUES ('1', '7', '李六');
INSERT INTO `litigantInfo` VALUES ('1', '8', '杜十');
INSERT INTO `litigantInfo` VALUES ('2', '1', '二号公诉机关');
INSERT INTO `litigantInfo` VALUES ('2', '3', '李四');
INSERT INTO `litigantInfo` VALUES ('2', '2', '李一');
INSERT INTO `litigantInfo` VALUES ('2', '4', '赵三');
INSERT INTO `litigantInfo` VALUES ('2', '5', '王一');
INSERT INTO `litigantInfo` VALUES ('2', '6', '陈五');
INSERT INTO `litigantInfo` VALUES ('2', '7', '郑七');
INSERT INTO `litigantInfo` VALUES ('2', '8', '蔡二');

-- ----------------------------
-- Table structure for litigantType
-- ----------------------------
DROP TABLE IF EXISTS `litigantType`;
CREATE TABLE `litigantType` (
  `litigantTypeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '当事人类型id值',
  `litigantTypeName` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '当事人类型名称',
  UNIQUE KEY `typeId` (`litigantTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='当事人类型表';

-- ----------------------------
-- Records of litigantType
-- ----------------------------
INSERT INTO `litigantType` VALUES ('1', '公诉机关');
INSERT INTO `litigantType` VALUES ('2', '原告');
INSERT INTO `litigantType` VALUES ('3', '被告');
INSERT INTO `litigantType` VALUES ('4', '第三人');
INSERT INTO `litigantType` VALUES ('5', '上诉人');
INSERT INTO `litigantType` VALUES ('6', '被上诉人');
INSERT INTO `litigantType` VALUES ('7', '再审申请(申诉)人');
INSERT INTO `litigantType` VALUES ('8', '再审被申请(申诉)人');

-- ----------------------------
-- Table structure for procedure
-- ----------------------------
DROP TABLE IF EXISTS `procedure`;
CREATE TABLE `procedure` (
  `procedureId` int(11) NOT NULL AUTO_INCREMENT COMMENT '审判程序id值',
  `procedureName` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '审判程序名称',
  UNIQUE KEY `typeId` (`procedureId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='审判程序表';

-- ----------------------------
-- Records of procedure
-- ----------------------------
INSERT INTO `procedure` VALUES ('1', '一审');
INSERT INTO `procedure` VALUES ('2', '二审');
INSERT INTO `procedure` VALUES ('3', '再审');
INSERT INTO `procedure` VALUES ('4', '非诉执行审查');
INSERT INTO `procedure` VALUES ('5', '复核');
INSERT INTO `procedure` VALUES ('6', '刑罚变更');
INSERT INTO `procedure` VALUES ('7', '再审审查与审判监督');
INSERT INTO `procedure` VALUES ('8', '其他');

-- ----------------------------
-- Table structure for referencedType
-- ----------------------------
DROP TABLE IF EXISTS `referencedType`;
CREATE TABLE `referencedType` (
  `referencedTypeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '法院层级id值',
  `referencedTypeName` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '法院层级',
  UNIQUE KEY `typeId` (`referencedTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='法院层级表';

-- ----------------------------
-- Records of referencedType
-- ----------------------------
INSERT INTO `referencedType` VALUES ('1', '普通案例');
INSERT INTO `referencedType` VALUES ('2', '最高法院指导案例');
INSERT INTO `referencedType` VALUES ('3', '检察院指导案例');
INSERT INTO `referencedType` VALUES ('4', '公报裁判文书');
INSERT INTO `referencedType` VALUES ('5', '公报案例');

-- ----------------------------
-- Table structure for searchType
-- ----------------------------
DROP TABLE IF EXISTS `searchType`;
CREATE TABLE `searchType` (
  `searchTypeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '裁判类型id值',
  `searchTypeName` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '裁判类型名称',
  PRIMARY KEY (`searchTypeId`),
  UNIQUE KEY `typeId` (`searchTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='查询类型表';

-- ----------------------------
-- Records of searchType
-- ----------------------------
INSERT INTO `searchType` VALUES ('1', '标题');
INSERT INTO `searchType` VALUES ('2', '案号');
INSERT INTO `searchType` VALUES ('3', '当事人');
INSERT INTO `searchType` VALUES ('4', '审理经过');
INSERT INTO `searchType` VALUES ('5', '诉称');
INSERT INTO `searchType` VALUES ('6', '辩称');
INSERT INTO `searchType` VALUES ('7', '本院查明');
INSERT INTO `searchType` VALUES ('8', '本院认为');
INSERT INTO `searchType` VALUES ('9', '裁判结果');
INSERT INTO `searchType` VALUES ('10', '裁判要旨');
INSERT INTO `searchType` VALUES ('11', '法律依据');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(10) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '111', '111');
INSERT INTO `user` VALUES ('2', '123', '698d51a19d8a121ce581499d7b701668');
INSERT INTO `user` VALUES ('3', '22', 'b6d767d2f8ed5d21a44b0e5886680cb9');
INSERT INTO `user` VALUES ('4', '4444', '79b7cdcd14db14e9cb498f1793817d69');
INSERT INTO `user` VALUES ('5', 'dd', '1aabac6d068eef6a7bad3fdf50a05cc8');
INSERT INTO `user` VALUES ('6', 'ww', 'ad57484016654da87125db86f4227ea3');
INSERT INTO `user` VALUES ('7', 'g', 'b2f5ff47436671b6e533d8dc3614845d');
INSERT INTO `user` VALUES ('8', 'h', '2510c39011c5be704182423e3a695e91');
INSERT INTO `user` VALUES ('9', 's', '03c7c0ace395d80182db07ae2c30f034');
