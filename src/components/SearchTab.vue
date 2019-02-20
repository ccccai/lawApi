<style>
@import "../assets/css/style.css";
</style>
<template>
	<div class="serch_tab">
		<ul class="search_tab_line">
			<li :class="childActive == 1 ? 'active' : ''">
				<a @click="toEasySearch">
					简单搜索
				</a>
			</li>
			<li :class="childActive == 2 ? 'active' : ''">
				<a @click="toAdvanceSearch">
					高级搜索
				</a>
			</li>
		</ul>
	</div>
</template>
<script>
import Bus from '../assets/js/bus.js'
export default{
	name:"SearchTab",
	props:['parentActive'],
	data(){
		return{
			childActive:"",
		}
	},
	mounted:function(){
		this.childActive = this.parentActive;
	},
	watch:{
		childActive:function(){
			this.$emit('childActive',this.childActive);
		},
        $route(to, from) {  
        	this.childActive = 1;
        }
	},
	methods:{
		toEasySearch(){
			this.childActive = 1;
			Bus.$emit('tabActive',this.childActive);
		},
		toAdvanceSearch(){
			this.childActive = 2;
			Bus.$emit('tabActive',this.childActive);
		}
	}
}
</script>
