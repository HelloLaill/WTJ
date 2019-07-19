import Vue from 'vue'
import Vuex from 'vuex'
import * as getters from './getters'
import * as mutations from './mutations'
import * as actions from './action'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    currentUser:null,
    isLogin:false,
    token:"",
  },
  getters,
  mutations,
  actions
})
