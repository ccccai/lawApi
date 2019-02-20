<style>
@import "../assets/css/style.css";

</style>
<template>
  <div>
    <div class="catalog">
      <Collapse>
          <Panel>
              <icon name="catalog1" scale="2.8"></icon>
              <div class="project_list" slot="content">
                <ul class="nav">
                  <li>
                    <a href="#dangshi">
                      <Icon type="arrow-right-b"></Icon>
                      当事人
                    </a>
                  </li>

                  <li>
                    <a href="#shenli">
                      <Icon type="arrow-right-b"></Icon>
                      审理经过
                    </a>
                  </li>

                  <li>
                    <a href="#yuangao">
                      <Icon type="arrow-right-b"></Icon>
                      原告诉称
                    </a>
                  </li>

                  <li>
                    <a href="#beigao">
                      <Icon type="arrow-right-b"></Icon>
                      被告辩称
                    </a>
                  </li>

                  <li>
                    <a href="#chaming">
                      <Icon type="arrow-right-b"></Icon>
                      本院查明
                    </a>
                  </li>

                  <li>
                    <a href="#renwei">
                      <Icon type="arrow-right-b"></Icon>
                      本院认为
                    </a>
                  </li>

                  <li>
                    <a href="#jieguo">
                      <Icon type="arrow-right-b"></Icon>
                      裁判结果
                    </a>
                  </li>
                </ul>
              </div>
          </Panel>
      </Collapse>
    </div>
    <Row>
      <Col :md="24" :xs="24">
        <div class="item_header">
          <h3 class="item_case_title" v-text="list.caseTitle"></h3>
          <p class="item_header_tab">
            <span v-text="list.keyWord"></span>
            <span @click="addToCollect(list.aid)">
              <a>
                <icon name="star2" scale="1.6"></icon>
                收藏
              </a>
            </span>
          </p>
        </div>
      </Col>
    </Row>
    <Row type="flex" justify="center" class="code-row-bg">
      <Col :md="7" :xs="24" style="padding:20px">
        <Row>
          <Col :md="24" :xs="24">
            <div class="item_body">
              <div class="body_top">
                <div class="caption">
                  <Icon size="18" type="android-list"></Icon>
                  <span>基本信息</span>
                </div>
              </div>
              <div class="body_bottom">
                <dl>
                  <dt>案件类型：</dt>
                  <dd v-text="list.caseTypeName"></dd>
                </dl>
                <dl>
                  <dt>审理程序：</dt>
                  <dd v-text="list.procedureName"></dd>
                </dl>
                <dl>
                  <dt>上 诉 人：</dt>
                  <dd v-text="list.plaintiff"></dd>
                </dl>
                <dl>
                  <dt>被上诉人：</dt>
                  <dd v-text="list.defendant"></dd>
                </dl>
                <dl>
                  <dt>文书性质：</dt>
                  <dd v-text="list.instrumentTypeName"></dd>
                </dl>
                <dl>
                  <dt>审理法院：</dt>
                  <dd v-text="list.courtName"></dd>
                </dl>
                <dl>
                  <dt>案　　号：</dt>
                  <dd v-text="list.caseNO"></dd>
                </dl>
              </div>
            </div>
          </Col>
          <Col :md="24" :xs="24">
            <div class="item_body">
              <div class="body_top">
                <div class="caption">
                  <Icon size="18" type="android-done-all"></Icon>
                  <span>裁判要旨</span>
                </div>
              </div>
              <div class="body_bottom" v-html="list.judicialGist">
              </div>
            </div>
          </Col>
          <Col :md="24" :xs="24">
            <div class="item_body">
              <div class="body_top">
                <div class="caption">
                  <Icon size="18" type="information-circled"></Icon>
                  <span>法条法规</span>
                </div>
              </div>
              <div class="body_bottom">
                <template v-for="item in lawClauseList">
                  <div class="law" v-text="item"></div>
                </template>
              </div>
            </div>
          </Col>
        </Row>
      </Col>
      <Col :md="15" :xs="24" style="padding:20px">
        <div class="item_body">
          <div class="body_top">
            <div class="caption">
              <Icon size="18" type="ios-bookmarks"></Icon>
              <span>文书正文</span>
            </div>
          </div>
          <div class="body_bottom">
            <div id="dangshi" class="project">
              <h4>
                <Icon type="arrow-right-b"></Icon>
                当事人
              </h4>
            </div>
            <div class="paragraph" v-html="list.litigant">
            </div>

            <div id="shenli" class="project">
              <h4>
                <Icon type="arrow-right-b"></Icon>
                审理经过
              </h4>
            </div>
            <div class="paragraph" v-html="list.hearing">
            </div>

            <div id="yuangao" class="project">
              <h4>
                <Icon type="arrow-right-b"></Icon>
                原告诉称
              </h4>
            </div>
            <div class="paragraph" v-html="list.firstInstancePlaintiffAllegation">
            </div>

            <div id="beigao" class="project">
              <h4>
                <Icon type="arrow-right-b"></Icon>
                被告辩称
              </h4>
            </div>
            <div class="paragraph" v-html="list.firstInstanceDefendantArgued">
            </div>

            <div id="chaming" class="project">
              <h4>
                <Icon type="arrow-right-b"></Icon>
                本院查明
              </h4>
            </div>

            <div class="paragraph" v-html="list.thisCourtDiscover">
            </div>
            <div id="renwei" class="project">
              <h4>
                <Icon type="arrow-right-b"></Icon>
                本院认为
              </h4>
            </div>

            <div class="paragraph" v-html="list.thisCourtBelieve">
            </div>
            <div id="jieguo" class="project">
              <h4>
                <Icon type="arrow-right-b"></Icon>
                裁判结果
              </h4>
            </div>

            <div class="paragraph" v-html="list.judicialResult">
            </div>
          </div>
        </div>
      </Col>
    </Row>
  </div>
</template>
<script>
  import Bus from '../assets/js/bus.js'
  export default{
    data(){
      return{
        list:[],
        lawClauseList:[]
      }
    },
    beforeMount:function(){
      this.getParams();
    },
    mounted:function(){
      this.getData(this.articalId);
    },
    methods: {
      //获取路由带过来的参数
      getParams(){
      // 取到路由带过来的参数
        let routerParams = this.$route.query.aid;
        // 将数据放在当前组件的数据内
        console.log(routerParams);
        if(routerParams){
            this.articalId = routerParams;
        }else{
            return false;
        }
      },
      getData(aid){
        this.$Spin.show();
        var _this = this;
        this.$axios.get('/api/getArtical.php?method=get_artical&aid='+aid).then(function(res){
            // 响应成功回调
            console.log(res.data);
            if(res.data.state){
              _this.list = res.data.list;
              _this.lawClauseList = res.data.list.lawClause.split("，");
            }else{
              _this.$Notice.error({
                title: 'Error',
                desc: "数据返回错误！",
                duration: 5,
              });
            }
            _this.$Spin.hide();
        }).catch(function(err){
          _this.$Spin.hide();
          _this.$Notice.error({
              title: 'Error',
              desc: err,
              duration: 3,
          });
        })
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
