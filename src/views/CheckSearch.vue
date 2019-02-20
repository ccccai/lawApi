<style>
@import "../assets/css/style.css";

</style>
<template>
	<div>
		<CheckEasySearch v-if="tabActive == 1"></CheckEasySearch>
		<CheckAdvanceSearch v-if="tabActive == 2"></CheckAdvanceSearch>
		<div>
        <router-view></router-view>
    </div>
	</div>
</template>
<script>
import CheckEasySearch from "../components/CheckEasySearch.vue"
import CheckAdvanceSearch from "../components/CheckAdvanceSearch.vue"
import Bus from '../assets/js/bus.js'
export default {
	data() {
		return {
			tabActive:1,
		}
	},
	components: {
		CheckEasySearch,CheckAdvanceSearch
	},
	created:function(){
	    //接受兄弟组件传过来的值
	    Bus.$on('tabActive',(data) => {
	      this.tabActive = data;
	    });
			Bus.$emit('broShowTab',true);
  	},
}
</script>
