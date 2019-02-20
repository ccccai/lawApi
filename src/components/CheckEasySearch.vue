<style>
@import "../assets/css/style.css";

</style>
<template>
  <div class=" easy_content">
    <Row type="flex" justify="center" class="code-row-bg">
      <Col :md="showNews ? 18 : 22" :xs="24">
          <Row>
            <Form inline class="easy_form">
              <Col :xs="23" :sm="6" style="padding-left:15px">
                <FormItem style="width:100%" class="form_select">
                  <Select v-model="selSimpleItem" clearable style="width:100%" size="large" >
                    <Option v-for="item in simpleList" :value="item.checkSearchTypeId" :key="item.checkSearchTypeId">{{ item.checkSearchTypeName }}</Option>
                  </Select>
                </FormItem>
              </Col>
              <Col :xs="23" :sm="18" style="padding-left:15px">
                <FormItem  style="width:100%" class="form_input">
                  <Input v-model="checkEasySearchInput"  size="large" placeholder="请输入内容"  style="width:100%">
                    <Button slot="append" icon="ios-search" @click="checkEasySearch">搜索</Button>
                  </Input>
                </FormItem>
              </Col>
            </Form>
          </Row>
          <Row v-show="showNews">
            <Col :xs="24">
              <p class="easy_total">
                本数据库已收录<span class="sublibrary_txt">检查文书</span><span class="text_total">{{ textTotal }}</span>篇
              </p>
            </Col>
          </Row>
          <Row  v-show="showNews" type="flex" justify="start" class="code-row-bg easy_news">
            <Col :sm="18" :xs="23">
              <News></News>
            </Col>
          </Row>
      </Col>
    </Row>
  </div>
</template>
<script>
import News from "../components/News.vue"
import Bus from '../assets/js/bus.js'

export default {
  data() {
    return {
      checkEasySearchInput:"",
      simpleList: [],
      selSimpleItem: 0,
      textTotal:"",
      showNews:true,
    }
  },
  components: {
    News,
  },
  watch:{
    selSimpleItem:function(){
      if(this.selSimpleItem == "" || this.selSimpleItem == null){
        this.selSimpleItem = 0;
      }
    }
  },
  mounted:function(){
    if(this.$route.name == "CheckResultList" || this.$route.name == "CheckNoResult"){
      this.showNews = false;
    };
    this.getEasySearchList();
    this.getSublibraryNum();
    },
    methods:{
      checkEasySearch(){
        if(this.checkEasySearchInput != ""){
          this.showNews = false;
          this.$router.push({name:'CheckResultList', query: { searchTypeId: this.selSimpleItem,searchInput:this.easySearchInput }});
        }
      },

      getEasySearchList(){
        var _this = this;
        this.$axios.get('/api/getData.php?method=get_easySearch_list&flag=2').then(function(res){
          // 响应成功回调
            // console.log(res.data);
            res.data.list.unshift({checkSearchTypeId:"0",checkSearchTypeName:"全文",total:"1111111"});
            _this.simpleList = res.data.list;
        }).catch(function(err){
          alert(err);
        })
      },

      getSublibraryNum(){
        this.$Spin.show();
        var _this = this;
        this.$axios.get('/api/getData.php?method=get_sublibrary_num&sublibrary=' + "2").then(function(res){
            // 响应成功回调
            // console.log(res.data);
            if(res.data.status){
              _this.textTotal = res.data.count;
            }else{
              _this.$Notice.error({
                title: 'Error',
                desc: "数据返回错误！",
                duration: 5,
              });
            };
            _this.$Spin.hide();
        }).catch(function(err){
            alert(err);
        })
      }
    }
}
</script>
