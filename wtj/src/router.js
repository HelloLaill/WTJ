import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home.vue'
import Cart from "./views/Cart.vue"
import ProductList from "./views/ProductList.vue"
import Carousel1 from "./components/Carousel1.vue"
import login from "./views/login.vue"
import register from "./views/register.vue"
Vue.use(Router)

export default new Router({
  routes: [
    
    {path:"/ProductList",name:"productlist",component:ProductList},
    {path:"/Cart",component:Cart},
    {path:"/Carousel1",component:Carousel1},
    {path:"/login",component:login},
    {path:"/register",component:register},
    {path: '/',component: Home}
  ]
})
