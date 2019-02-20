<style>
@import "../assets/css/style.css";

</style>
<template>
  <div>
    <Row>
      <Form inline class="easy_form">
        <Col :xs="23" :sm="6" style="padding-left:15px">
        <FormItem style="width:100%" class="form_select">
          <Select v-model="selSimpleItem" clearable style="width:100%" size="large" >
            <Option v-for="item in simpleList" :value="item.typeId" :key="item.typeId">{{ item.typeName }}</Option>
          </Select>
        </FormItem>
      </Col>
      <Col :xs="23" :sm="18" style="padding-left:15px">
      <FormItem  style="width:100%" class="form_input">
        <Input v-model="easySearchInput"  size="large" placeholder="请输入内容"  style="width:100%">
        <Button slot="append" icon="ios-search">搜索</Button>
      </Input>
    </FormItem>
  </Col>
</Form>
</Row>
</div>
</template>
<script>
export default {
  data() {
    return {
      easySearchInput:"",
      simpleList: [],
      selSimpleItem: 0,
    }
  },
  watch:{
    selSimpleItem:function(){
      if(this.selSimpleItem == "" || this.selSimpleItem == null){
        this.selSimpleItem = 0;
      }
    }
  },
  computed:{
    textTotal:function(){
      if(this.simpleList[this.selSimpleItem]){
        return this.simpleList[this.selSimpleItem].total;
      }else{
        return 0;
      }
    }
  },
  created:function(){
  },
  mounted:function(){
    this.getEasySearchList();
    },
    methods:{
      getEasySearchList(){
        var _this = this;
        this.$axios.get('/api/getData.php?method=get_easySearch_list').then(function(res){
          // 响应成功回调
          // console.log(res.data);
          res.data.list.unshift({typeId:"0",typeName:"全文",total:"1111111"});
          _this.simpleList = res.data.list;
        }).catch(function(err){
          alert(err);
        })
      }
    }
  }
  </script>
