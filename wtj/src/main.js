import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './vuex/store'
import axios from "./axios"
import Vuex from "vuex"
Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
