<style>
@import "../assets/css/style.css";

.ivu-notice{
  top:80px !important;
}
</style>
<template>
<Modal v-model="childLoginModal" width="448" class-name="vertical-center-modal" :mask-closable="false">
  <div slot="header" class="modal_header">
    <span>登&nbsp;&nbsp;&nbsp;&nbsp;录</span>
  </div>
  <div class="modal_form">
    <Row type="flex" justify="center" class="code-row-bg modal_form_row">
      <Col :md="24" :xs="24">
      <div class="input_icon">
        <icon class="icon" name="user" scale="2.5" style="width:12%"></icon>
        <Input type="text" class="" style="width:87%" placeholder="请输入用户名" v-model="username"></Input>
      </div>
      </Col>
    </Row>

    <Row type="flex" justify="center" class="code-row-bg modal_form_row">
      <Col :md="24" :xs="24">
      <div class="input_icon">
        <icon class="icon" name="password" scale="2.5" style="width:12%"></icon>
        <Input type="password" class="" style="width:87%" placeholder="请输入密码" v-model="password"></Input>
      </div>
      </Col>
    </Row>

    <Row type="flex" justify="center" class="code-row-bg modal_form_row">
      <Col :md="12"  :xs="12">
      <Checkbox size="large" class="remember_me" v-model="rememberMe">记住我</Checkbox>
      </Col>

      <Col :md="12"  :xs="12">
      <div class="forgetPasswordBtn"><span>忘记密码？</span></div>
      </Col>
    </Row>

    <Row type="flex" justify="center" class="code-row-bg modal_form_row" style="margin-top: 25px">
      <Col :md="24"  :xs="24">
      <!-- <Button type="success" style="height: 48px;font-size: 17px" @click="cancel" long>取&nbsp;&nbsp;&nbsp;消</Button> -->
      <Button type="success" style="height: 48px;font-size: 17px" @click="login" long>登&nbsp;&nbsp;&nbsp;录</Button>
      </Col>
    </Row>
  </div>
  <div slot="footer" style="">
    <span style="cursor: pointer" @click="toRegister">暂无账号？马上去注册</span>
  </div>
</Modal>
</template>
<script>
// import {
//   setCookie,
//   getCookie
// } from '../assets/js/cookie.js';

import Bus from '../assets/js/bus.js';
export default {
  name: 'Login',
  props: ['parentLoginModal'],
  data() {
    return {
      childLoginModal: false,
      modal_loading: false,
      rememberMe: false,
      username: '',
      password: '',
      msg: '',
    }
  },
  created:function(){
    //接受兄弟组件传过来的值
    Bus.$on('broLoginModal',(data) => {
      console.log(data);
      this.childLoginModal = data;
    });
  },
  mounted: function() {
    this.childLoginModal = this.parentLoginModal;
    // if (this.$getCookie("username")) {
    //   this.$router.push('/')
    // }
  },
  watch: {
    //接受父组件传过来的值
    parentLoginModal: function() {
      this.childLoginModal = this.parentLoginModal;
    },
    childLoginModal: function() {
      this.$emit('childLoginModal', this.childLoginModal);
    }
  },
  methods: {
    cancel() {
      // console.log("parentLoginModal:" + this.childLoginModal);
      // console.log("childLoginModal:" + this.childLoginModal);
      this.childLoginModal = false;
      // this.$emit('childLoginModal',this.childLoginModal);
    },
    login() {
      let _this = this;
      if (this.username == "" || this.password == "") {
          this.$Notice.error({
              title: 'Error',
              desc: "请输入用户名或者密码",
              duration: 5,
          });
      } else {
        // URLSearchParams对象是为了让参数以form data形式
        let params = new URLSearchParams();
        params.append('username', this.username);
        params.append('password', this.password);
        this.$axios.post("/api/login.php", params).then((res) => {
          console.log(res.data);
          if (res.data.state == 0) {
            _this.$Notice.error({
              title: 'Error',
              desc: res.data.msg,
              duration: 5,
            });
          } else if (res.data.state == -1) {
            _this.$Notice.warning({
              title: 'Warning',
              desc: res.data.msg,
              duration: 5
            });
          } else if(res.data.state == 1) {
            _this.childLoginModal = false;
            _this.$setCookie("username", this.username);
            Bus.$emit('broLoginFlag',true);
//            console.log(this.username);
          }
        })
      }
    },
    toRegister(){
      Bus.$emit('broRegisterModal',true);
      this.childLoginModal = false;
    }
  }
}
</script>
