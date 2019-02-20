<style>
@import "../assets/css/style.css";

</style>
<template>
<div>
  <Row type="flex" justify="center" class="code-row-bg">
    <Col :md="22" :xs="22" style="text-align:center;padding:20px;border-bottom:1px dashed #A9A9A9">
        <Avatar size="large">{{userName}}</Avatar>
        <span class="center_title" style="font-weight:700">の个人中心
        </span>
    </Col>
  </Row>
  <Row type="flex" justify="center" class="code-row-bg">
    <Col :md="7" :xs="22" style="padding:20px 10px;">
    <Card class="user_info">
      <Row>
        <Col :md="24" class="card_title" style="padding:0 10px 10px;border-bottom:1px dashed #A9A9A9">
        <p class="center_title">
          <Icon type="person"></Icon>
          个人信息
        </p>
        </Col>
        <Col :md="24" class="card_body">
          <Row style="margin:20px 10px 10px">
            <Col :md="8" :sm="4" :xs="8" style="padding:5px 10px 5px 0;text-align:center">
              <label >ID:</label>
            </Col>
            <Col :md="16" :sm="18" :xs="16" style="padding:5px 10px 5px 0">
              <span>{{uid}}</span>
            </Col>
          </Row>
          <Row style="margin:10px">
            <Col :md="8" :sm="4" :xs="8" style="padding:5px 10px 5px 0;text-align:center">
              <label>用户名:</label>
            </Col>
            <Col :md="16" :sm="18" :xs="16" style="padding:5px 10px 5px 0">
              <span>{{userName}}</span>
            </Col>
          </Row>

          <template v-if="flag">
            <Row style="margin:10px">
              <Col :md="8" :sm="4" :xs="8" style="padding:5px 10px 5px 0;text-align:center">
                <label>密码:</label>
              </Col>
              <Col :md="16" :sm="18" :xs="16">
                <Input v-model="newPsw" type="password" placeholder="输入新密码" clearable></Input>
              </Col>
            </Row>
            <Row style="margin:10px">
              <Col :md="8" :sm="4" :xs="8" style="padding:5px 10px 5px 0;text-align:center">
                <label>确认:</label>
              </Col>
              <Col :md="16" :sm="18" :xs="16">
                <Input v-model="reWritePsw" type="password" placeholder="再次输入新密码" clearable></Input>
              </Col>
            </Row>
          </template>

          <template v-else>
            <Row style="margin:10px">
              <Col :md="8" :sm="4" :xs="8" style="padding:5px 10px 5px 0;text-align:center">
                <label>密码:</label>
              </Col>
              <Col :md="16" :sm="18" :xs="16" style="padding:5px 10px 5px 0">
                <span>********</span>
              </Col>
            </Row>
          </template>
          <Row type="flex" justify="center" class="code-row-bg" style="margin:20px">
            <Col :md="8" :xs="8" style="text-align:center">
              <Button type="ghost" @click="updatePsw">{{ flag ? '保 存':'点击修改' }}</Button>
            </Col>
          </Row>
        </Col>
      </Row>
    </Card>
    </Col>

    <Col :md="15" :xs="22" style="padding:20px 10px;">
    <Card class="collect_list">
      <Row>
        <Col :md="24" class="card_title" style="padding:0 10px 10px;margin-bottom:10px;border-bottom:1px dashed #A9A9A9">
        <p class="center_title">
          <Icon type="folder"></Icon>
          收藏夹
        </p>
        </Col>
        <Col :md="24" class="card_body">
          <template v-if="noList">
            <Row type="flex" style="min-height:239px" justify="center" align="middle" class="code-row-bg">
              <h2>
                啊哦，空空如也~
              </h2>
            </Row>
          </template>
          <template v-else v-for="item in collectList">
            <Row style="margin:10px;font-size:17px" class="case_title">
              <Col :md="20" :xs="20" style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap">
                <router-link tag="a" :title="item.caseTitle" target="_blank" :to="{name:'ResultItem',query: { aid: item.aid }}">
                  <icon name="case" scale="2.3" style=""></icon>
                  <span>{{item.caseTitle}}</span>
                </router-link>
              </Col>
              <Col :md="4" :xs="4" style="text-align:right">
                <Button type="ghost" shape="circle" icon="close-round" @click="delCollect(item.aid)"></Button>
              </Col>
            </Row>
          </template>
        </Col>
      </Row>
    </Card>
    </Col>
  </Row>
  <Row type="flex" justify="center" class="code-row-bg" style="margin:20px">
    <Col :md="6" :xs="6" style="text-align:center">
      <Button type="primary" size="large" @click='exit'>退出登录</Button>
    </Col>
  </Row>
</div>
</template>
<script>
import Bus from '../assets/js/bus.js'
export default {
  data() {
    return {
      userName: "",
      uid:"",
      newPsw:"",
      reWritePsw:"",
      flag:false,
      noList:false,
      collectList:[]
    }
  },
	created:function(){
		Bus.$emit('broShowTab',false);
  },
  mounted: function() {
    let userName = this.$getCookie("username");
    if (userName) {
      this.userName = userName;
      this.getUserInfo();
      this.getCollector();
    } else {
      let _this = this;
      this.$Message.error({
        content: '身份验证过期。请重新登录！',
        closable: true,
        duration: 1,
        onClose: function() {
          _this.$router.push({
            name: 'Error'
          });
          Bus.$emit('broLoginModal', true);
        }
      });
    }
  },
  methods:{
    delCollect(aid){
      let _this = this;
      this.$axios.get("/api/collector.php?method=delete_collector&aid=" + aid + "&username=" + _this.userName).then(function(res){
          // console.log(res.data);
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
          _this.getCollector();
      }).catch(function (err) {
          _this.$Notice.error({
              title: 'Error',
              desc: err,
              duration: 3,
          });
      })
    },
    exit(){
      this.$delCookie("username");
      Bus.$emit('broLoginFlag',false);
      this.$router.push({
        name: 'Homepage'
      });
    },
    updatePsw(){
      this.flag = !this.flag;
      if(!this.flag){
        let newPsw = this.newPsw;
        let rePsw = this.reWritePsw;
        let _this = this;
        if(newPsw == "" || rePsw == ""){
          this.$Notice.warning({
            title: 'Warning',
            desc: '不能为空！',
            duration: 1
          });
          _this.newPsw = _this.reWritePsw = "";
          return false;
        }
        if(newPsw != rePsw){
          this.$Notice.error({
            title: 'Error',
            desc:'两次密码输入不一致！',
            duration: 1
          });
          _this.newPsw = _this.reWritePsw = "";
          return false;
        }
        this.$axios({
          url:'/api/updatePassword.php',
          method: 'post',
          data: {
            method:"update_password",
            userName:_this.userName,
            newPsw:_this.newPsw
          },
          transformRequest: [function (data) {
              let ret = ''
              for (let it in data) {
                ret += encodeURIComponent(it) + '=' + encodeURIComponent(data[it]) + '&';
              }
              return ret
          }],
          headers: {
              'Content-Type': 'application/x-www-form-urlencoded'
          }
        }).then(function (res) {
            // 响应成功回调
            // console.log(res);
            if(res.data.status == 1){
              _this.$Notice.success({
                  title: 'Success',
                  desc: res.data.msg,
                  duration: 2,
              });
            }else{
              _this.$Notice.error({
                  title: 'Error',
                  desc: res.data.msg,
                  duration: 2,
              });
            }
            _this.newPsw = _this.reWritePsw = "";
        }).catch(function (err) {
          _this.$Notice.error({
              title: 'Error',
              desc: err,
              duration: 3,
          });
          _this.newPsw = _this.reWritePsw = "";
        })
      }
    },
    getUserInfo(){
      let _this = this;
      this.$axios.get('/api/collector.php?method=get_user_info&userName=' + _this.userName).then(function (res) {
          // 响应成功回调
          // console.log(res);
          _this.uid = res.data.list.uid;
      }).catch(function (err) {
        _this.flag = false;
        _this.$Notice.error({
            title: 'Error',
            desc: err,
            duration: 3,
        });
      })
    },
    getCollector(){
      this.$Spin.show();
      let _this = this;
      this.$axios.get('/api/collector.php?method=get_collect_list&userName=' + _this.userName).then(function (res) {
          // 响应成功回调
          // console.log(res);
          if(res.data.state){
            _this.collectList = res.data.list;
            if(res.data.list.length == 0){
              _this.noList = true;
            }
            console.log(_this.noList);
          }
          _this.$Spin.hide();
      }).catch(function (err) {
        _this.$Spin.hide();
        _this.flag = false;
        _this.$Notice.error({
            title: 'Error',
            desc: err,
            duration: 3,
        });
      })
    }
  }
}
</script>
