<style>
@import "../assets/css/style.css";

</style>
<template>
    <div>
        <Row type="flex" justify="center" class="code-row-bg">
            <Col :md="22" :xs="24">
            <Row type="flex" justify="center" class="code-row-bg">
                <!-- <Col :xs="23" :sm="6" style="padding-left:15px;padding-top:20px">
                <Collapse v-model="value1">
                    <Panel name="1">
                        参考类型
                        <div slot="content" class="list_group">
                            <a class="list_group_item">
									<span class="item_title">
										普通案例
									</span>
                                <span class="badge">
										8888
									</span>
                            </a>
                            <a class="list_group_item">
									<span class="item_title">
										公报案例
									</span>
                                <span class="badge">
										1
									</span>
                            </a>
                        </div>
                    </Panel>
                    <Panel name="2">
                        案由
                        <div slot="content" class="list_group">
                            <a class="list_group_item">
									<span class="item_title">
										普通案例
									</span>
                                <span class="badge">
										8888
									</span>
                            </a>
                            <a class="list_group_item">
									<span class="item_title">
										公报案例
									</span>
                                <span class="badge">
										1
									</span>
                            </a>
                        </div>
                    </Panel>
                    <Panel name="3">
                        法院层级
                        <div slot="content" class="list_group">
                            <a class="list_group_item">
									<span class="item_title">
										普通案例
									</span>
                                <span class="badge">
										8888
									</span>
                            </a>
                            <a class="list_group_item">
									<span class="item_title">
										公报案例
									</span>
                                <span class="badge">
										1
									</span>
                            </a>
                        </div>
                    </Panel>
                    <Panel name="4">
                        地域及法院
                        <div slot="content" class="list_group">
                            <a class="list_group_item">
									<span class="item_title">
										普通案例
									</span>
                                <span class="badge">
										8888
									</span>
                            </a>
                            <a class="list_group_item">
									<span class="item_title">
										公报案例
									</span>
                                <span class="badge">
										1
									</span>
                            </a>
                        </div>
                    </Panel>
                    <Panel name="5">
                        裁判年份
                        <div slot="content" class="list_group">
                            <a class="list_group_item">
									<span class="item_title">
										普通案例
									</span>
                                <span class="badge">
										8888
									</span>
                            </a>
                            <a class="list_group_item">
									<span class="item_title">
										公报案例
									</span>
                                <span class="badge">
										1
									</span>
                            </a>
                        </div>
                    </Panel>
                    <Panel name="6">
                        审理程序
                        <div slot="content" class="list_group">
                            <a class="list_group_item">
									<span class="item_title">
										普通案例
									</span>
                                <span class="badge">
										8888
									</span>
                            </a>
                            <a class="list_group_item">
									<span class="item_title">
										公报案例
									</span>
                                <span class="badge">
										1
									</span>
                            </a>
                        </div>
                    </Panel>
                    <Panel name="7">
                        文书类型
                        <div slot="content" class="list_group">
                            <a class="list_group_item">
									<span class="item_title">
										普通案例
									</span>
                                <span class="badge">
										8888
									</span>
                            </a>
                            <a class="list_group_item">
									<span class="item_title">
										公报案例
									</span>
                                <span class="badge">
										1
									</span>
                            </a>
                        </div>
                    </Panel>
                </Collapse>
                </Col> -->
                <Col :xs="23" :sm="20" style="padding-top:20px">
                <template v-for="item in resultList">
                    <Card class="case_card" style="margin-bottom:20px">
                        <div>
                            <div class="card_title">
                                <Row>
                                    <Col :md="22" class="case_title">
                                    <router-link tag="a" target="_blank" :to="{name:'ResultItem',query: { aid: item.aid }}">
                                        <icon name="case" scale="2.5" style=""></icon>
                                        <span v-text="item.caseTitle"></span>
                                    </router-link>
                                    </Col>
                                </Row>
                            </div>
                            <div class="card_body">
                                <Tabs value="name1">
                                    <TabPane label="审理经过" name="name1" v-html="item.hearing"></TabPane>
                                    <TabPane label="当事人" name="name2" v-html="item.litigant"></TabPane>
                                    <TabPane label="裁判要旨" name="name3" v-html="item.judicialGist"></TabPane>
                                </Tabs>
                                <Row>
                                    <Col :md="24" class="case_footer">
                                    <span class="font_grey" v-text="item.caseTypeName"></span>
                                    <span class="font_grey" v-text="item.procedureName"></span>
                                    <span class="font_grey" v-text="item.instrumentTypeName"></span>
                                    </Col>
                                </Row>
                            </div>
                            <div class="card_footer">
                                <Row type="flex" justify="start" class="code-row-bg">
                                    <Col :md="24" class="">
                                    <span class="font_grey" v-text="item.courtName"></span>
                                    <span class="font_grey" v-text="item.keyWord"></span>
                                    </Col>
                                </Row>
                                <Row type="flex" justify="end" class="code-row-bg">
                                    <Col :md="8" class="action_bar">
                                    <a class="collect" @click="addToCollect(item.aid)">
                                        <icon name="star2" scale="1.6" style=""></icon>
                                        <span>收藏</span>
                                    </a>
                                    <!--<a class="download">-->
                                        <!--<icon name="download" scale="1.6" style=""></icon>-->
                                        <!--<span>下载</span>-->
                                    <!--</a>-->
                                    </Col>
                                </Row>
                            </div>
                        </div>
                    </Card>
                </template>
                </Col>
            </Row>
            <Row type="flex" justify="end" class="code-row-bg">
                <Col :xs="23" :sm="18">
                    <div style="float: right;margin-bottom: 15px">
                        <Page :page-size="2" :total="dataCount" @on-change="getPage" show-total></Page>
                    </div>
                </Col>
            </Row>
            </Col>
        </Row>
    </div>
</template>
<script>
    import Bus from '../assets/js/bus.js'
    export default {
        data () {
            return {
                value1: '1',
                resultList: [],
                dataCount:0,
                formItem: {},
                pageBegin:0
            }
        },
        watch: {
            $route(to, from) {
                this.getParams();
            }
        },
        mounted: function () {
            this.getParams();
        },
        methods: {
            //分页获取数据
            getPage(page){
                if(page == 1){
                    this.pageBegin = 0;
                }else{
                    this.pageBegin = (page-1) * 2;
                }
                this.getData();
            },
            //获取路由带过来的参数
            getParams(){
                // 将数据放在当前组件的数据内
                if (this.$route.params) {
                    let formItem = this.$route.params.formItem;
                    if (!formItem) formItem = "";
                    this.formItem = formItem;
                    console.log(this.formItem);
                    this.getData();
                } else {
                    return false;
                }
            },
            getData(){
                this.$Spin.show();
                let _this = this;
//                console.log(this.formItem.flag);
                if (this.formItem.flag) {
                    if (this.formItem.flag == 1) {
                        let searchInput = this.formItem.easySearchInput;
                        let searchTypeId = this.formItem.selSimpleItem;
                        // let pageBegin= this.pageBegin;
                        this.formItem.pageBegin = this.pageBegin;
                        this.$axios({
                          url:'/api/easySearch.php',
                          method: 'post',
                          data: {
                            method:"get_case_list",
                            formItem:_this.formItem
                          },
                          transformRequest: [function (data) {
                              let ret = ''
                              for (let it in data) {
                                if (it == 'formItem') {
                                    ret += encodeURIComponent(it) + '=' + encodeURIComponent(JSON.stringify(data[it])) + '&';
                                } else {
                                    ret += encodeURIComponent(it) + '=' + encodeURIComponent(data[it]) + '&';
                                }
                              }
                              return ret
                          }],
                          headers: {
                              'Content-Type': 'application/x-www-form-urlencoded'
                          }
                        }
                        // '/api/easySearch.php?method=get_case_list&searchInput=' + searchInput + '&searchTypeId=' + searchTypeId + '&pageBegin=' + pageBegin
                      ).then(function (res) {
                            // 响应成功回调
                            console.log(res.data);
                            if (res.data.state) {
                                _this.resultList = res.data.list;
                                _this.dataCount = parseInt(res.data.count);
                            } else {
                                _this.$router.push({name: 'NoResult'});
                            };
                            _this.$Spin.hide();
                        }).catch(function (err) {
                            _this.$Notice.error({
                                title: 'Error',
                                desc: err,
                                duration: 3,
                            });
                        })
                    }
                    if (this.formItem.flag == 2) {
                        this.formItem.pageBegin = this.pageBegin;
                        this.$axios({
                            url: '/api/advanceSearch.php',
                            method: 'post',
                            data: _this.formItem,
                            transformRequest: [function (data) {
                                // Do whatever you want to transform the data
                                let ret = ''
                                for (let it in data) {
                                    if (it == 'textSearch' || it == 'litigantSearch') {
                                        ret += encodeURIComponent(it) + '=' + encodeURIComponent(JSON.stringify(data[it])) + '&';
                                    } else {
                                        ret += encodeURIComponent(it) + '=' + encodeURIComponent(data[it]) + '&';
                                    }
                                }
                                // console.log(ret);
                                return ret
                            }],
                            headers: {
                                'Content-Type': 'application/x-www-form-urlencoded'
                            }
                        }).then(function (res) {
                            // 响应成功回调
                            console.log(res.data);
                            if (res.data.state) {
                                _this.resultList = res.data.list;
                                _this.dataCount = parseInt(res.data.count);
                            } else {
                                _this.$router.push({name: 'NoResult'});
                            };
                            _this.$Spin.hide();
                        }).catch(function (err) {
                            _this.$Spin.hide();
                            _this.$Notice.error({
                                title: 'Error',
                                desc: err,
                                duration: 3,
                            });
                        })
                    }
                } else {
                    _this.$Spin.hide();
                    this.$Message.error({
                        content: '数据返回错误！',
                        closable: true,
                        duration: 1,
                        onClose: function () {
                            _this.$router.go(-1)
                        }
                    });
                }
            },
            addToCollect(aid){
                let username = this.$getCookie("username");
                if(username){
                    let _this = this;
                    this.$axios.get("/api/collector.php?method=insert_collector&aid=" + aid + "&username=" + username).then(function(res){
                        console.log(res.data);
                        if(res.data.state == 1){
                            _this.$Notice.success({
                             desc: res.data.msg,
                             duration: 3,
                             title: 'Success'
                           });
                        }
                        else if(res.data.state == -1){
                          _this.$Notice.warning ({
                           desc: res.data.msg,
                           duration: 3,
                           title: 'Warning'
                         });
                        }
                        else{
                            _this.$Notice.error({
                             desc: res.data.msg,
                             duration: 3,
                             title: 'Error'
                           });
                        }
                    }).catch(function (err) {
                        _this.$Notice.error({
                            title: 'Error',
                            desc: err,
                            duration: 3,
                        });
                    })
                }else{
                  this.$Notice.warning ({
                   desc: "请先登录！",
                   duration: 1,
                   title: 'Warning',
                   onClose: function () {
                       Bus.$emit('broLoginModal',true);
                   }
                 });
                }
            }
        }
    }
</script>
