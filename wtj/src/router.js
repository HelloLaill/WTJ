import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home.vue'
import Cart from "./views/Cart.vue"
import test from "./views/test.vue"
import ProductList from "./views/ProductList.vue"
import Tz from "./views/taozhuan.vue"
import Product from "./views/Product.vue"
import cro from "./components/Carousel.vue"
import Carousel1 from "./components/Carousel1.vue"
import login from "./views/login.vue"
import register from "./views/register.vue"
Vue.use(Router)

export default new Router({
  routes: [
    {path:"/cro",name:"cro",component:cro},
    {path:"/Product/:id",name:"Product",component:Product},
    {path:"/ProductList",name:"productlist",component:ProductList},
    {path:"/tz/:id",name:"tz",component:Tz},
    {path:"/Cart",component:Cart},
    {path:"/test",component:test},
    {path:"/Carousel1",component:Carousel1},
    {path:"/login",component:login},
    {path:"/register",component:register},
    {path: '/',component: Home}
  ]
})
