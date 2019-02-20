import Vue from 'vue'
import Router from 'vue-router'
import JudgmentSearch from '@/views/JudgmentSearch'
import CheckSearch from '@/views/CheckSearch'
import Homepage from '@/views/Homepage'
import ResultList from '@/views/ResultList'
import ResultItem from '@/views/ResultItem'
import NoResult from '@/views/NoResult'
import Error from '@/views/404'
import MyCenter from '@/views/MyCenter'

Vue.use(Router)

export default new Router({
  routes: [
  {
    path: '/',
    redirect: { name:"JudgmentSearch"}
  },
  {
    path: '*',
    redirect: { name:"JudgmentSearch"}
  },
  {
    path:'/homepage',
    name:"Homepage",
    component:Homepage,
    redirect: { name:"JudgmentSearch"},
    meta:{
      title:"Lawvue"
    },
    children:[
    {
      path: '/homepage/error',
      name: 'Error',
      component: Error,
      meta:{
        title:"404 NO FOUND"
      }
    },
    {
      path: '/homepage/myCenter',
      name: 'MyCenter',
      component: MyCenter,
      meta:{
        title:"个人中心"
      }
    },
    {
      path: '/homepage/resultItem',
      name: 'ResultItem',
      component: ResultItem,
      meta:{
        title:"案件详情"
      }
    },
    {
      path: '/homepage/checkSearch',
      name: 'CheckSearch',
      component: CheckSearch,
      meta:{
        title:"检查文书"
      },
      children:[
        {
          path: '/homepage/checkSearch/resultList',
          name: 'CheckResultList',
          component: ResultList,
          meta:{
            title:"搜索详情"
          }
        },
        {
          path: '/homepage/checkSearch/noResult',
          name: 'CheckNoResult',
          component: NoResult,
          meta:{
            title:"无结果"
          }
        }
      ]
    },
    {
      path: '/homepage/judgmentSearch',
      name: 'JudgmentSearch',
      component: JudgmentSearch,
      meta:{
        title:"裁判文书"
      },
      children:[
        {
          path: '/homepage/judgmentSearch/resultList',
          name: 'ResultList',
          component: ResultList,
          meta:{
            title:"搜索详情"
          }
        },
        {
          path: '/homepage/judgmentSearch/noResult',
          name: 'NoResult',
          component: NoResult,
          meta:{
            title:"无结果"
          }
        }
      ]
    }]
  }
  ],
  mode:'history'
})
