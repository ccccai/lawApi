<style>
    @import "../assets/css/style.css";

    .regulations_row .ivu-input-wrapper {
        min-width: 10px !important;
    }

    .selDate .ivu-form-item .ivu-form-item-content {
        width: 100% !important;
    }
</style>
<template>
    <div class="advance_content">
        <Row type="flex" justify="center" class="code-row-bg">
            <Col :sm="18" :xs="22">
            <Form ref="formItem" :model="formItem" inline class="advance_form">

                <Row class="text_search_row" v-for="(item, index) in formItem.textSearch.items" v-if="item.status"
                     :key="'100' + index">
                    <Col :lg="12" :xs="24" style="padding-left:15px">
                    <FormItem label="文本检索" style="width:100%" class="form_select"
                              :prop="'textSearch.items.' + index + '.textType'">
                        <Select v-model="item.textType" clearable>
                            <Option v-for="textTypeItem in textTypeList" :value="textTypeItem.checkSearchTypeId"
                                    :key="textTypeItem.checkSearchTypeId">{{ textTypeItem.checkSearchTypeName }}
                            </Option>
                        </Select>
                    </FormItem>
                    </Col>
                    <Col :lg="12" :xs="24" style="padding-left:15px">
                    <FormItem label="关键词" style="width:100%" class="form_input"
                              :prop="'textSearch.items.' + index + '.textValue'">
                        <Input v-model="item.textValue" placeholder="请输入文本关键词" style="width:100%">
                        <Button v-if="item.index == 1" slot="append" icon="plus-round" @click="textSearchAdd"></Button>
                        <Button v-if="item.index != 1" slot="append" icon="minus-round"
                                @click="textSearchRemove(index)"></Button>
                        </Input>
                    </FormItem>
                    </Col>
                </Row>

                <Row>
                    <Col :lg="12" :xs="24" style="padding-left:15px">
                    <FormItem label="文书类型" style="width:100%" class="form_select" prop="instrumentTypeId">
                        <Select v-model="formItem.instrumentTypeId" clearable>
                            <Option v-for="item in instrumentTypeList" :value="item.instrumentTypeId"
                                    :key="item.instrumentTypeId">{{ item.instrumentTypeName }}
                            </Option>
                        </Select>
                    </FormItem>
                    </Col>
                    <Col :lg="12" :xs="24" style="padding-left:15px">
                    <FormItem label="案由" style="width:100%" class="form_input" prop="caseReason">
                        <Input v-model="formItem.caseReason" placeholder="请输入内容" clearable>
                        </Input>
                    </FormItem>
                    </Col>
                </Row>

                <Row>
                    <Col :lg="12" :xs="24" style="padding-left:15px">
                    <FormItem label="检院层级" style="width:100%" class="form_select" prop="courtLevel">
                        <Select v-model="formItem.courtLevel" clearable>
                            <Option v-for="item in courtLevelList" :value="item.courtLevelId" :key="item.courtLevelId">
                                {{ item.courtLevelName }}
                            </Option>
                        </Select>
                    </FormItem>
                    </Col>
                    <Col :lg="12" :xs="24" style="padding-left:15px">
                    <FormItem label="检院名称" style="width:100%" class="form_input" prop="courtName">
                        <Input v-model="formItem.courtName" placeholder="请输入内容" clearable>
                        </Input>
                    </FormItem>
                    </Col>
                </Row>

                <Row class="regulations_row">
                    <Col :lg="12" :xs="24" style="padding-left:15px">
                    <FormItem label="裁判时间" style="width:100%" class="form_input selDate">
                        <Row>
                            <Col :lg="11" :xs="24">
                            <FormItem prop="judgementDateStart" style="width:100%">
                                <DatePicker type="date" style="width:100%" format="yyyy/MM/dd" placement="bottom-end"
                                            placeholder="选择时间区间" v-model="formItem.judgementDateStart"></DatePicker>
                            </FormItem>
                            </Col>
                            <Col :lg="2" :xs="24" style="text-align:center">
                            <span>至</span>
                            </Col>
                            <Col :lg="11" :xs="24">
                            <FormItem prop="judgementDateEnd" style="width:100%">
                                <DatePicker type="date" style="width:100%;float:right" format="yyyy/MM/dd"
                                            placement="bottom-end" placeholder="选择时间区间"
                                            v-model="formItem.judgementDateEnd"></DatePicker>
                            </FormItem>
                            </Col>
                        </Row>
                    </FormItem>
                    </Col>
                    <Col :lg="12" :xs="24" style="padding-left:15px">
                    <FormItem label="法律依据" style="width:100%" class="form_input" prop="lawClause">
                        <Input v-model="formItem.lawClause" placeholder="请输入内容" clearable>
                        </Input>
                    </FormItem>
                    </Col>
                </Row>

                <Row type="flex" justify="center" class="code-row-bg advance_search_btn" style="margin:40px">
                    <Col :lg="6" :xs="24" style="text-align:center;min-width:230px;margin-right:20px">
                    <FormItem style="width:100%">
                        <Button type="primary" icon="ios-search" size="large" @click='advanceSearch'>搜索</Button>
                        <Button type="ghost" icon="refresh" size="large" style="margin-left:30px"
                                @click="handleReset('formItem')">重置
                        </Button>
                    </FormItem>
                    </Col>
                </Row>
            </Form>
            </Col>
        </Row>
    </div>
</template>
<script>
    export default {
        name: 'AdvanceSearch',
        data() {
            return {
                formItem: {
                    textSearch: {
                        items: [
                            {
                                textType: "",
                                textValue: "",
                                index: 1,
                                status: 1
                            }
                        ]
                    },

                    instrumentTypeId: "",
                    caseReason: "",

                    courtLevel: "",
                    courtName: "",

                    judgementDateStart: "",
                    judgementDateEnd: "",
                    lawClause: ""
                },

                textTypeList: [],
                instrumentTypeList: [],
                caseTypeList: [],
                courtLevelList: [],
                selectflag: false,

                textSearchIndex: 1,
            }
        },
        watch: {},
        mounted: function () {
            this.getTextTypeList();
            this.getInstrumentTypeList();
            this.getCaseTypeList();
            this.getCourtLevelList();
        },
        methods: {
            getTextTypeList(){
                let _this = this;
                this.$axios.get('/api/getData.php?method=get_easySearch_list&flag=2').then(function (res) {
                    // 响应成功回调
                    res.data.list.unshift({checkSearchTypeId: "0", checkSearchTypeName: "全文"});
                    _this.textTypeList = res.data.list;
                }).catch(function (err) {
                    alert(err);
                })
            },
            getInstrumentTypeList(){
                let _this = this;
                this.$axios.get('/api/getData.php?method=get_instrument_list').then(function (res) {
                    // 响应成功回调
                    _this.instrumentTypeList = res.data.list;
                }).catch(function (err) {
                    alert(err);
                })
            },
            getCaseTypeList(){
                let _this = this;
                this.$axios.get('/api/getData.php?method=get_case_list').then(function (res) {
                    // 响应成功回调
                    _this.caseTypeList = res.data.list;
                }).catch(function (err) {
                    alert(err);
                })
            },
            getCourtLevelList(){
                let _this = this;
                this.$axios.get('/api/getData.php?method=get_courtLevel').then(function (res) {
                    // 响应成功回调
                    _this.courtLevelList = res.data.list;
                }).catch(function (err) {
                    alert(err);
                })
            },
            handleReset(name){
                // this.judgementDate = "";
                this.$refs[name].resetFields();
            },
            advanceSearch(){
                let dateStart = this.formItem.judgementDateStart;
                let dateEnd = this.formItem.judgementDateEnd;
                this.formItem.judgementDateStart = Date.parse(dateStart) / 1000;
                this.formItem.judgementDateEnd = Date.parse(dateEnd) / 1000;
            },
            textSearchAdd(){
                this.textSearchIndex++;
                this.formItem.textSearch.items.push({
                    textType: "",
                    textValue: "",
                    index: this.textSearchIndex,
                    status: 1
                });
            },
            textSearchRemove(i){
                // console.log(this.textSearch.items[i]);
                this.formItem.textSearch.items[i].status = 0;
            }
        }
    }
</script>
