import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home.vue'
import Cart from "./views/Cart.vue"
import test from "./views/test.vue"
import ProductList from "./views/ProductList.vue"
import Product from "./views/Product.vue"
Vue.use(Router)

export default new Router({
  routes: [
    {path:"/Product/:id",name:"Product",component:Product},
    {path:"/ProductList",name:"productlist",component:ProductList},
    {path:"/Cart",name:"Cart",component:Cart},
    {path:"/test",component:test},
    {path: '/',component: Home}
  ]
})
