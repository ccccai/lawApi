<style>
@import "../assets/css/style.css";

</style>
<template>
  <div>
    <Row type="flex" justify="space-around" class="code-row-bg foot_content">
      <Col :sm="6" :xs="0"></Col>
      <Col :sm="4" :xs="8">
        <dl>
          <dt>关于我们</dt>
          <dd><a target="_blank" href="">了解我们</a></dd>
          <dd><a target="_blank" href="">媒体报道</a></dd>
          <dd><a target="_blank" href="">合作伙伴</a></dd>
          <dd><a target="_blank" href="">使用指南</a></dd>
        </dl>
      </Col>
      <Col :sm="4" :xs="8">
        <dl>
          <dt>友情链接</dt>
          <dd><a target="_blank" href="http://www.court.gov.cn/">最高人民法院</a></dd>
          <dd><a target="_blank" href="http://wenshu.court.gov.cn/">中国裁判文书网</a></dd>
          <dd><a target="_blank" href="https://anli.court.gov.cn/static/web/index.html">中国司法案例网</a></dd>
          <dd><a target="_blank" href="http://law.jlu.edu.cn//">吉林大学法学院</a></dd>
        </dl>
      </Col>
      <Col :sm="4" :xs="8">
        <dl>
          <dt>联系我们</dt>
          <dd><a target="_blank" href="">商务合作</a></dd>
          <dd><a target="_blank" href="">招聘英才</a></dd>
          <dd><a target="_blank" href="">联系方式</a></dd>
          <dd><a target="_blank" href="">意见反馈</a></dd>
        </dl>
      </Col>
      <Col :sm="6" :xs="0"></Col>
    </Row>
    <Row>
      <Col :sm="24" :xs="24" style="border-top:1px solid darkgray">
        <div style="padding-top:20px">
          2017-2018 &copy; GreenyCai
        </div>
      </Col>
    </Row>
  </div>
</template>
<script>
  export default{
    name:'MyFooter'
  }
</script>
