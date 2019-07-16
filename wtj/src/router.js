import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home.vue'
import Cart from "./views/Cart.vue"
import test from "./views/test.vue"
import ProductList from "./views/ProductList.vue"
import Tz from "./views/taozhuan.vue"
Vue.use(Router)

export default new Router({
  routes: [
    {path:"/ProductList",name:"productlist",component:ProductList},
    {path:"/tz/:id",name:"tz",component:Tz},
    {path:"/Cart",component:Cart},
    {path:"/test",component:test},
    {path: '/',component: Home}
  ]
})
