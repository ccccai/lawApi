<style>
@import "../assets/css/style.css";

</style>
<template>
	<div>
		<EasySearch v-if="tabActive == 1"></EasySearch>
		<AdvanceSearch v-if="tabActive == 2"></AdvanceSearch>
		<div>
        <router-view></router-view>
    </div>
	</div>
</template>
<script>
import EasySearch from "../components/EasySearch.vue"
import AdvanceSearch from "../components/AdvanceSearch.vue"
import Bus from '../assets/js/bus.js'
export default {
	data() {
		return {
			tabActive:1,
		}
	},
	components: {
		EasySearch,AdvanceSearch
	},
	created:function(){
	    //接受兄弟组件传过来的值
	    Bus.$on('tabActive',(data) => {
	      // console.log(data);
	      this.tabActive = data;
	    });
			Bus.$emit('broShowTab',true);
  	},
}
</script>
