// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'

//vue的router插件
import Router from 'vue-router'
//加载插件
Vue.use(Router)

import svgIcon from 'vue-svg-icon/Icon.vue';
Vue.component('icon', svgIcon);

//引入axios
import axios from 'axios'
import VueAxios from 'vue-axios'
Vue.use(VueAxios,axios)
Vue.prototype.$axios = axios

import {
    delCookie,
    getCookie,
    setCookie
} from './assets/js/cookie.js';

Vue.prototype.$setCookie = setCookie;
Vue.prototype.$getCookie = getCookie;
Vue.prototype.$delCookie = delCookie;


//按需引用iview组件
import 'iview/dist/styles/iview.css';
import {
  Row, Col,
  Button,Message,
  Header,Layout,
  Menu,MenuItem,
  Submenu,MenuGroup,
  Content,Breadcrumb,
  BreadcrumbItem,Card,
  Footer,Tooltip,
  Select,Option,
  Form,FormItem,
  Input,Icon,
  Modal,Checkbox,
  DatePicker,Alert,
  Notice,BackTop,
  Dropdown,DropdownItem,
  DropdownMenu,Collapse,
  Panel,Tabs,
  TabPane,Affix,
  Spin,Page,
  Avatar,
  } from 'iview';

Vue.component('Row', Row);
Vue.component('Col', Col);
Vue.component('Button', Button);
Vue.component('Header',Header);
Vue.component('Layout',Layout);
Vue.component('Menu',Menu);
Vue.component('MenuItem',MenuItem);
Vue.component('Submenu',Submenu);
Vue.component('MenuGroup',MenuGroup);
Vue.component('Content',Content);
Vue.component('Breadcrumb',Breadcrumb);
Vue.component('BreadcrumbItem',BreadcrumbItem);
Vue.component('Card',Card);
Vue.component('Footer',Footer);
Vue.component('Tooltip',Tooltip);
Vue.component('Select',Select);
Vue.component('Option',Option);
Vue.component('Input',Input);
Vue.component('Form',Form);
Vue.component('FormItem',FormItem);
Vue.component('Icon',Icon);
Vue.component('Modal',Modal);
Vue.component('Checkbox',Checkbox);
Vue.component('DatePicker',DatePicker);
Vue.component('Alert',Alert);
Vue.component('Notice',Notice);
Vue.component('BackTop',BackTop);
Vue.component('Dropdown',Dropdown);
Vue.component('DropdownItem',DropdownItem);
Vue.component('DropdownMenu',DropdownMenu);
Vue.component('Collapse',Collapse);
Vue.component('Panel',Panel);
Vue.component('Tabs',Tabs);
Vue.component('TabPane',TabPane);
Vue.component('Affix',Affix);
Vue.component('Spin',Spin);
Vue.component('Page',Page);
Vue.component('Avatar',Avatar);
Vue.prototype.$Notice = Notice;
Vue.prototype.$Message = Message;
Vue.prototype.$Spin = Spin;

Vue.config.productionTip = false;

Vue.prototype.$Message.config({
    top:200
});
// const RouterConfig = {
//   mode:'history',
//   routes:router
// };
//
// const routers = new VueRouter(RouterConfig);
/* eslint-disable no-new */
router.beforeEach((to,from,next) => {
  // console.log(to.meta.title);
  window.document.title = to.meta.title;
  next();
});
new Vue({
  el: '#app',
  router: router,
  components: { App },
  template: '<App/>'
})
