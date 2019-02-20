<style>
@import "../assets/css/style.css";
</style>
<template>
<Modal v-model="childRegisterModal" width="448" class-name="vertical-center-modal" :mask-closable="false">
  <div slot="header" class="modal_header">
    <span>注&nbsp;&nbsp;&nbsp;&nbsp;册</span>
  </div>
  <div class="modal_form">
    <Row type="flex" justify="center" class="code-row-bg modal_form_row">
      <Col :md="24" :xs="24">
      <div class="input_icon">
        <icon class="icon" name="register-phone" scale="2.5" style="width:12%"></icon>
        <Input type="text" class="" style="width:87%" placeholder="用户名" v-model="userName"></Input>
      </div>
      </Col>
    </Row>

    <Row type="flex" justify="center" class="code-row-bg modal_form_row">
      <Col :md="24" :xs="24">
      <div class="input_icon">
        <icon class="icon" name="register-psw" scale="2.5" style="width:12%"></icon>
        <Input type="password" class="" style="width:87%" placeholder="密码,6-16位数字,字母或特殊字符" v-model="password"></Input>
      </div>
      </Col>
    </Row>

    <Row type="flex" justify="center" class="code-row-bg modal_form_row">
      <Col :md="24" :xs="24">
      <div class="input_icon">
        <icon class="icon" name="register-confirm-psw" scale="2.5" style="width:12%"></icon>
        <Input type="password" class="" style="width:87%" placeholder="确认密码" v-model="confirmPassword"></Input>
      </div>
      </Col>
    </Row>

    <Row type="flex" justify="center" class="code-row-bg modal_form_row">
      <Col :md="16" :xs="14">
      <!-- <Col :md="16"> -->
      <div class="input_icon">
        <icon class="icon" name="register-msg" scale="2.5" style="width:19.6%"></icon>
        <Input type="text" class="" style="width:79%" placeholder="短信验证码"></Input>
      </div>
      </Col>
      <Col :md="8" :xs="10" style="padding-left: 10px">
      <!-- <Col :md="8" style="padding-left: 10px"> -->
      <Button type="ghost" size="large" style="height:100%;width:100%">获取验证码</Button>
      </Col>
    </Row>

    <Row type="flex" justify="center" class="code-row-bg modal_form_row" style="margin-top: 30px">
      <Col :md="24" :xs="24">
      <Button type="success" style="height: 48px;font-size: 17px" @click="register" long>注&nbsp;&nbsp;&nbsp;册</Button>
      </Col>
    </Row>
  </div>
  <div slot="footer" style="">
    <span style="cursor: pointer" @click="toLogin">已有帐号？</span>
  </div>
</Modal>
</template>
<script>
import Bus from '../assets/js/bus.js'
export default {
  name: 'Register',
  props: ['parentRegisterModal'],
  data() {
    return {
      childRegisterModal: false,
      modal_loading: false,
      userName: '',
      password: '',
      confirmPassword:'',
      msg: '',
    }
  },
  created:function(){
    Bus.$on('broRegisterModal',(data) => {
      console.log(data);
      this.childRegisterModal = data;
    })
  },
  mounted: function() {
    this.childRegisterModal = this.parentRegisterModal;
  },
  watch: {
    parentRegisterModal: function() {
      this.childRegisterModal = this.parentRegisterModal;
    },
    childRegisterModal: function() {
      this.$emit('childRegisterModal', this.childRegisterModal);
    }
  },
  methods: {
    cancel() {
      // console.log("parentRegisterModal:" + this.childRegisterModal);
      // console.log("childRegisterModal:" + this.childRegisterModal);
      this.childRegisterModal = false;
      // this.$emit('childRegisterModal',this.childRegisterModal);
    },
    register() {
      let _this = this;
      if (this.userName == "" || this.password == "" || this.confirmPassword == "") {
        _this.$Message.warning({
          content: "请将信息填写完整！",
          duration: 3,
          closable: true
        });
        // alert("请将信息填写完整！");
      } else if(this.password != this.confirmPassword){
        _this.$Message.warning({
          content: "两次密码不一致！",
          duration: 3,
          closable: true
        });
        // alert("两次密码不一致！");
      }else {
        let params = new URLSearchParams();
        params.append('userName', this.userName);
        params.append('password', this.password);
        this.axios.post("/api/register.php", params).then((res) => {
          console.log(res)
          console.log(res.data)
          if (res.data.state > 0) {
            _this.userName = ""
            _this.password = ""
            _this.confirmPassword = ""
            _this.childRegisterModal = false
            setTimeout(function() {
              _this.$Message.success({
                content: res.data.msg,
                duration: 2,
                closable: true
              });
            }.bind(_this), 500);
            setTimeout(function() {
              _this.$Message.info({
                content: '请登录',
                duration: 3,
                closable: true
              });
              _this.toLogin();
            }.bind(_this), 1000)
          }else{
            _this.$Message.error({
              closable: true,
              content: res.data.msg,
              duration: 5,
            });
          }
        })
      }
    },
    toLogin(){
      Bus.$emit('broLoginModal',true);
      this.childRegisterModal = false;
    }
  }
}
</script>
