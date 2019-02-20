<style>
@import "../assets/css/style.css";

</style>
<template>
    <div class="advance_content">
        <Row type="flex" justify="center" class="code-row-bg">
            <Col :sm="18" :xs="22">
            <Form ref="formItem" :model="formItem" inline class="advance_form">

                <Row class="text_search_row" v-for="(item, index) in formItem.textSearch" v-if="item.status"
                     :key="'100' + index">
                    <Col :lg="12" :xs="24" style="padding-left:15px">
                    <FormItem label="文本检索" style="width:100%" class="form_select"
                              :prop="'textSearch.' + index + '.textType'">
                        <Select v-model="item.textType" clearable>
                            <Option v-for="textTypeItem in textTypeList" :value="textTypeItem.searchTypeId"
                                    :key="textTypeItem.searchTypeId">{{ textTypeItem.searchTypeName }}
                            </Option>
                        </Select>
                    </FormItem>
                    </Col>
                    <Col :lg="12" :xs="24" style="padding-left:15px">
                    <FormItem label="关键词" style="width:100%" class="form_input"
                              :prop="'textSearch.' + index + '.textValue'">
                        <Input v-model="item.textValue" placeholder="请输入文本关键词" style="width:100%">
                        <Button v-if="item.index == 1" slot="append" icon="plus-round" @click="textSearchAdd"></Button>
                        <Button v-if="item.index != 1" slot="append" icon="minus-round"
                                @click="textSearchRemove(index)"></Button>
                        </Input>
                    </FormItem>
                    </Col>
                </Row>

                <Row class="litigant_search_row">
                    <Col :lg="12" :xs="24" style="padding-left:15px">
                    <FormItem label="当事人" style="width:100%" class="form_select" prop="litigantType">
                        <Select v-model="formItem.litigantType" clearable>
                            <Option v-for="litigantTypeItem in litigantTypeList"
                                    :value="litigantTypeItem.litigantTypeId" :key="litigantTypeItem.litigantTypeId">
                                {{ litigantTypeItem.litigantTypeName }}
                            </Option>
                        </Select>
                    </FormItem>
                    </Col>
                    <Col :lg="12" :xs="24" style="padding-left:15px">
                    <FormItem label="关键词" style="width:100%" class="form_input" prop="litigantValue">
                        <Input v-model="formItem.litigantValue" placeholder="请输入当事人名称" style="width:100%">
                        </Input>
                    </FormItem>
                    </Col>
                </Row>

                <Row>
                    <Col :lg="12" :xs="24" style="padding-left:15px">
                    <FormItem label="案件名称" style="width:100%" class="form_input" prop="caseTitle">
                        <Input v-model="formItem.caseTitle" placeholder="请输入内容" clearable>
                        </Input>
                    </FormItem>
                    </Col>
                    <Col :lg="12" :xs="24" style="padding-left:15px">
                    <FormItem label="案号" style="width:100%" class="form_input" prop="caseNo">
                        <Input v-model="formItem.caseNo" placeholder="请输入内容" clearable>
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
                    <FormItem label="案件类型" style="width:100%" class="form_select" prop="caseType">
                        <Select v-model="formItem.caseType" clearable>
                            <Option v-for="item in caseTypeList" :value="item.caseTypeId" :key="item.caseTypeId">
                                {{ item.caseTypeName }}
                            </Option>
                        </Select>
                    </FormItem>
                    </Col>
                </Row>

                <Row>
                    <Col :lg="12" :xs="24" style="padding-left:15px">
                    <FormItem label="审判程序" style="width:100%" class="form_select" prop="procedureId">
                        <Select v-model="formItem.procedureId" clearable>
                            <Option v-for="item in procedureList" :value="item.procedureId" :key="item.procedureId">
                                {{ item.procedureName }}
                            </Option>
                        </Select>
                    </FormItem>
                    </Col>
                    <Col :lg="12" :xs="24" style="padding-left:15px">
                    <FormItem label="案由" style="width:100%" class="form_input" prop="caseReason">
                        <Input v-model="formItem.caseReason" placeholder="请输入内容" clearable>
                        </Input>
                        <!-- <Select v-model="formItem.caseReason" clearable>
                          <Option v-for="item in caseTypeList" :value="item.typeId" :key="item.typeId">{{ item.typeName }}</Option>
                        </Select> -->
                    </FormItem>
                    </Col>
                </Row>

                <Row>
                    <Col :lg="12" :xs="24" style="padding-left:15px">
                    <FormItem label="法院层级" style="width:100%" class="form_select" prop="courtLevel">
                        <Select v-model="formItem.courtLevel" clearable>
                            <Option v-for="item in courtLevelList" :value="item.courtLevelId" :key="item.courtLevelId">
                                {{ item.courtLevelName }}
                            </Option>
                        </Select>
                    </FormItem>
                    </Col>
                    <Col :lg="12" :xs="24" style="padding-left:15px">
                    <FormItem label="法院名称" style="width:100%" class="form_input" prop="courtName">
                        <Input v-model="formItem.courtName" placeholder="请输入内容" clearable>
                        </Input>
                        <!-- <Select v-model="formItem.courtName" clearable>
                          <Option v-for="item in courtLevelList" :value="item.typeId" :key="item.typeId">{{ item.typeName }}</Option>
                        </Select> -->
                    </FormItem>
                    </Col>
                </Row>

                <Row>
                    <Col :lg="12" :xs="24" style="padding-left:15px">
                    <FormItem label="参考类型" style="width:100%" class="form_select" prop="referencedType">
                        <Select v-model="formItem.referencedType" clearable>
                            <Option v-for="item in referencedTypeList" :value="item.referencedTypeId"
                                    :key="item.referencedTypeId">{{ item.referencedTypeName }}
                            </Option>
                        </Select>
                    </FormItem>
                    </Col>
                    <Col :lg="12" :xs="24" style="padding-left:15px">
                    <FormItem label="审判人员" style="width:100%" class="form_input" prop="judge">
                        <Input v-model="formItem.judge" placeholder="请输入内容" clearable>
                        </Input>
                    </FormItem>
                    </Col>
                </Row>

                <Row>
                    <Col :lg="12" :xs="24" style="padding-left:15px">
                    <FormItem label="律所" style="width:100%" class="form_input" prop="lawyerFirm">
                        <Input v-model="formItem.lawyerFirm" placeholder="请输入内容" clearable>
                        </Input>
                    </FormItem>
                    </Col>
                    <Col :lg="12" :xs="24" style="padding-left:15px">
                    <FormItem label="律师" style="width:100%" class="form_input" prop="lawyer">
                        <Input v-model="formItem.lawyer" placeholder="请输入内容" clearable>
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
                    flag:2,
                    textSearch: [
                        {
                            textType: "",
                            textValue: "",
                            index: 1,
                            status: 1
                        }
                    ],
                    litigantType: '',
                    litigantValue: '',

                    caseTitle: "",
                    caseNo: "",

                    instrumentTypeId: "",
                    caseType: "",

                    procedureId: "",
                    caseReason: "",

                    courtLevel: "",
                    courtName: "",

                    referencedType: "",
                    judge: "",

                    lawyerFirm: "",
                    lawyer: "",

                    judgementDateStart: "",
                    judgementDateEnd: "",
                    lawClause: ""
                },

                textTypeList: [
                    {searchTypeId: "1", searchTypeName: "裁判要旨"},
                    {searchTypeId: "2", searchTypeName: "审理经过"},
                    {searchTypeId: "3", searchTypeName: "原告诉称"},
                    {searchTypeId: "4", searchTypeName: "被告辩称"},
                    {searchTypeId: "5", searchTypeName: "法院查明"},
                    {searchTypeId: "6", searchTypeName: "法院认为"},
                    {searchTypeId: "7", searchTypeName: "本院查明"},
                    {searchTypeId: "8", searchTypeName: "本院认为"},
                    {searchTypeId: "9", searchTypeName: "裁判结果"},
                ],
                instrumentTypeList: [],
                litigantTypeList: [],
                caseTypeList: [],
                procedureList: [],
                courtLevelList: [],
                referencedTypeList: [],
                selectflag: false,

                textSearchIndex: 1
            }
        },
        watch: {},
        mounted: function () {
            // this.getTextTypeList();
            this.getLitigantTypeList();
            this.getCaseTypeList();
            this.getInstrumentTypeList();
            this.getProcedureList();
            this.getCourtLevelList();
            this.getReferencedTypeList();
        },
        methods: {
            advanceSearch(){
                // console.log(this.formItem);
                let dateStart = this.formItem.judgementDateStart;
                let dateEnd = this.formItem.judgementDateEnd;
                if (dateStart == true || dateEnd == true) {
                    this.formItem.judgementDateStart = Date.parse(dateStart) / 1000;
                    this.formItem.judgementDateEnd = Date.parse(dateEnd) / 1000;
                }
                this.$router.push({
                    name: 'ResultList',
                    params: {formItem: this.formItem}
                });
            },
            getLitigantTypeList(){
                let _this = this;
                this.$axios.get('/api/getData.php?method=get_litigant_list').then(function (res) {
                    // 响应成功回调
                    _this.litigantTypeList = res.data.list;
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
            getInstrumentTypeList(){
                let _this = this;
                this.$axios.get('/api/getData.php?method=get_instrument_list').then(function (res) {
                    // 响应成功回调
                    _this.instrumentTypeList = res.data.list;
                }).catch(function (err) {
                    alert(err);
                })
            },
            getProcedureList(){
                let _this = this;
                this.$axios.get('/api/getData.php?method=get_procedure').then(function (res) {
                    // 响应成功回调
                    _this.procedureList = res.data.list;
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
            getReferencedTypeList(){
                let _this = this;
                this.$axios.get('/api/getData.php?method=get_referenced_list').then(function (res) {
                    // 响应成功回调
                    _this.referencedTypeList = res.data.list;
                }).catch(function (err) {
                    alert(err);
                })
            },
            handleReset(name){
                this.$refs[name].resetFields();
            },
            textSearchAdd(){
                this.textSearchIndex++;
                this.formItem.textSearch.push({
                    textType: "",
                    textValue: "",
                    index: this.textSearchIndex,
                    status: 1
                });
            },
            textSearchRemove(i){
                this.formItem.textSearch[i].status = 0;
            }
        }
    }
</script>
