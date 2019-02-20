<style>
@import "../assets/css/style.css";

</style>
<template>
<div class="layout home_layout">
  <Layout>
    <Header :style="{position: 'fixed', width: '100%',zIndex:'999'}">
      <Menu mode="horizontal" theme="dark" active-name="1">
        <div class="layout-logo"></div>
          <div class="pageheader_dropdown" style="display:none">
            <Dropdown trigger="click" style="margin-left: 20px">
              <Button type="primary" size="small">
                  <Icon type="arrow-down-b"></Icon>
              </Button>
              <DropdownMenu slot="list">
                  <DropdownItem :class="activeSublibrary == 2 ? '':'drop_active'" @click.native="judgmentDocument" style="font-size:14px!important">裁判文书</DropdownItem>
                  <DropdownItem :class="activeSublibrary == 2 ? 'drop_active':''"@click.native="checkDocument" style="font-size:14px!important">检查文书</DropdownItem>
              </DropdownMenu>
          </Dropdown>
        </div>
        <div class="pageheader_btn">
          <a :class="activeSublibrary == 2 ? 'sublibrary_btn':'sublibrary_btn active'" @click="judgmentDocument">裁判文书</a>
          <a :class="activeSublibrary == 2 ? 'sublibrary_btn active':'sublibrary_btn'" @click="checkDocument">检查文书</a>
        </div>
        <div class="layout-nav">
          <!--<Tooltip content="微信登录" placement="bottom" class="weChat tips">-->
            <!--<MenuItem name="1">-->
            <!--<icon name="weChat" scale="4.8" style="padding-top:12px;"></icon>-->
            <!--</MenuItem>-->
          <!--</Tooltip>-->

          <!--<Tooltip content="QQ登录" placement="bottom" class="qq tips">-->
            <!--<MenuItem name="2">-->
            <!--<icon name="qq" scale="4.8" style="padding-top:12px;"></icon>-->
            <!--</MenuItem>-->
          <!--</Tooltip>-->
          <template v-if="loginFlag">
            <Tooltip content="个人中心" placement="bottom" class="tips">
              <MenuItem name="2" @click.native='showMyCenter'>
                <icon name="avatar" scale="4.8" style="padding-top:12px;"></icon>
              </MenuItem>
            </Tooltip>
          </template>
          <template v-else>
            <Tooltip content="会员登录" placement="bottom"  class="tips">
              <MenuItem name="3" @click.native='showLogin'>
                <icon name="login" scale="4.8" style="padding-top:12px;"></icon>
              </MenuItem>
            </Tooltip>

            <Tooltip content="注册会员" placement="bottom"  class="tips">
              <MenuItem name="4" @click.native='showRegister'>
                <icon name="register" scale="4.8" style="padding-top:12px;"></icon>
              </MenuItem>
            </Tooltip>
          </template>
        </div>
      </Menu>
    </Header>
    <Content :style="{margin: '88px 20px 20px 20px', background: '#fff'}">
      <Login :parentLoginModal="loginModal" @childLoginModal='isLoginModal'></Login>
      <Register :parentRegisterModal="registerModal" @childRegisterModal='isRegisterModal'></Register>
      <div class="content">
        <Row v-if="showTab" type="flex" justify="center" class="code-row-bg search_tab"  :style="tabActive == 1 ? {paddingTop:'90px'} : {paddingTop:'40px'}">
          <Col :lg='22' :xs="22" style="border-bottom:1px solid #ddd">
          <SearchTab :parentActive='tabActive' @childActive='isActive'></SearchTab>
          </Col>
        </Row>
        <Row>
          <router-view></router-view>
        </Row>
        <BackTop></BackTop>
      </div>
    </Content>
    <Footer class="layout-footer-center" style="background:#80848f">
      <MyFooter></MyFooter>
    </Footer>
  </Layout>
</div>
</template>
<script>
import SearchTab from "../components/SearchTab.vue"
import MyFooter from "../components/MyFooter.vue"
import Login from "../components/Login.vue"
import Register from "../components/Register.vue"
import Bus from '../assets/js/bus.js'

export default {
  name: "HomePage",
  data() {
    return {
      tabActive: 1,
      loginModal: false,
      registerModal: false,
      activeSublibrary:1,
      showTab:true,
      loginFlag:false,
    }
  },
  components: {
    SearchTab,
    MyFooter,
    Login,
    Register
  },
  created:function(){
    //接受兄弟组件传过来的值
    Bus.$on('broLoginFlag',(data) => {
      this.loginFlag = data;
    });
    Bus.$on('broShowTab',(data) => {
      this.showTab = data;
    });
  },
  mounted:function(){
    if(this.$route.name == "CheckSearch"){
      this.activeSublibrary = 2;
    };
    if(this.$route.name == "ResultItem" || this.$route.name == "Error"){
      this.showTab = false;
    };
    let username = this.$getCookie("username");
    if(username){
        this.loginFlag = true;
    }
  },
  methods: {
    showMyCenter(){
      this.showTab = false;
      this.$router.push({name:'MyCenter'})
    },
    isActive: function(val) {
      this.tabActive = val;
      // console.log(this.tabActive);
    },
    isLoginModal: function(val) {
      this.loginModal = val;
      // console.log(this.loginModal);
    },
    showLogin() {
      this.loginModal = true;
      // console.log("loginModal:" + this.loginModal);
    },
    isRegisterModal: function(val) {
      this.registerModal = val;
      // console.log(this.registerModal);
    },
    showRegister() {
      this.registerModal = true;
      // console.log("registerModal:" + this.registerModal);
    },
    judgmentDocument() {
      this.activeSublibrary = 1;
      Bus.$emit('broSublibrary',this.activeSublibrary);
      this.$router.push({name:'JudgmentSearch'})},
    checkDocument() {
      this.activeSublibrary = 2;
      Bus.$emit('broSublibrary',this.activeSublibrary);
      this.$router.push({name:'CheckSearch'});
    }
  }
}
</script>
