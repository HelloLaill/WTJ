import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home.vue'
import Cart from "./views/Cart.vue"
import test from "./views/test.vue"
import user from "./views/user.vue"
import product from "./views/product.vue"
import login from "./views/login.vue"
import register from "./views/register.vue"
Vue.use(Router)

export default new Router({
  routes: [
    {path:"/Cart",component:Cart},
    {path:"/test",component:test},
    {path:"/user",component:user},
    {path:"/product",component:product},
    {path:"/login",component:login},
    {path:"/register",component:register},
    {path: '/',component: Home}
  ]
})
