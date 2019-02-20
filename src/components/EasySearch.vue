<style>
    @import "../assets/css/style.css";

</style>
<template>
    <div class=" easy_content">
        <Row type="flex" justify="center" class="code-row-bg">
            <Col :md="showNews ? 18 : 20" :xs="22">
            <Row>
                <Form inline class="easy_form">
                    <Col :xs="23" :sm="6" style="padding-left:15px">
                    <FormItem style="width:100%" class="form_select">
                        <Select v-model="formItem.selSimpleItem" clearable style="width:100%" size="large">
                            <Option v-for="item in simpleList" :value="item.searchTypeId" :key="item.searchTypeId">
                                {{ item.searchTypeName }}
                            </Option>
                        </Select>
                    </FormItem>
                    </Col>
                    <Col :xs="23" :sm="18" style="padding:0 15px">
                    <FormItem style="width:100%" class="form_input">
                        <Input v-model="formItem.easySearchInput" size="large" placeholder="请输入内容" style="width:100%">
                        <Button slot="append" icon="ios-search" @click="easySearch">搜索</Button>
                        </Input>
                    </FormItem>
                    </Col>
                </Form>
            </Row>
            <Row v-show="showNews">
                <Col :xs="24">
                <p class="easy_total">
                    本数据库已收录<span class="sublibrary_txt">裁判文书</span><span class="text_total">{{ textTotal }}</span>篇
                </p>
                </Col>
            </Row>
            <Row v-show="showNews" type="flex" justify="start" class="code-row-bg easy_news">
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
        // props: ['parentShowNews'],
        data() {
            return {
                formItem:{
                    flag:1,
                    easySearchInput: "",
                    selSimpleItem: 0,
                },
                simpleList: [],
                textTotal: "",
                showNews: true,
            }
        },
        components: {
            News,
        },
        watch: {
            selSimpleItem: function () {
                if (this.selSimpleItem == "" || this.selSimpleItem == null) {
                    this.selSimpleItem = 0;
                }
            },
        },
        mounted: function () {
            if (this.$route.name == "ResultList" || this.$route.name == "NoResult") {
                this.showNews = false;
            }
            ;
            this.getEasySearchList();
            this.getSublibraryNum();
        },
        methods: {
            easySearch(){
                console.log(this.formItem.easySearchInput);
                if (this.formItem.easySearchInput) {
                    this.showNews = false;
                    this.$router.push({
                        name: 'ResultList',
                        params: {formItem: this.formItem}
                    });
                }else{
                    this.$Notice.warning({
                        title: 'Warning',
                        desc: "请输入内容！",
                        duration: 3,
                    });
                    return false;
                }
            },

            getEasySearchList(){
                var _this = this;
                this.$axios.get('/api/getData.php?method=get_easySearch_list&flag=1').then(function (res) {
                    // 响应成功回调
                    // console.log(res.data);
                    res.data.list.unshift({searchTypeId: "0", searchTypeName: "全文", total: "1111111"});
                    _this.simpleList = res.data.list;
                }).catch(function (err) {
                    alert(err);
                })
            },

            getSublibraryNum(){
                this.$Spin.show();
                var _this = this;
                this.$axios.get('/api/getData.php?method=get_sublibrary_num&sublibrary=' + "1").then(function (res) {
                    // 响应成功回调
                    // console.log(res.data);
                    if (res.data.status) {
                        _this.textTotal = res.data.count;
                    } else {
                        _this.$Notice.error({
                            title: 'Error',
                            desc: "数据返回错误！",
                            duration: 5,
                        });
                    }
                    ;
                    _this.$Spin.hide();
                }).catch(function (err) {
                    alert(err);
                })
            }
        }
    }
</script>
