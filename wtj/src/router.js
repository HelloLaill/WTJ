import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home.vue'
import Cart from "./views/Cart.vue"
import ProductList from "./views/ProductList.vue"
import Product from "./views/Product.vue"
import login from "./views/login.vue"
import register from "./views/register.vue"
Vue.use(Router)

export default new Router({
  routes: [
    {path:"/Product/:id",name:"Product",component:Product},
    {path:"/ProductList/:id",name:"productlist",component:ProductList},
    {path:"/Cart",name:"Cart",component:Cart},
    {path:"/login",component:login},
    {path:"/register",component:register},
    {path: '/',name:"/",component: Home}
  ]
})
