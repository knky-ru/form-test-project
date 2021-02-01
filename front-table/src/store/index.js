import Vue from "vue";
import Vuex from "vuex";

import user from './modules/user';
import order from './modules/order';

Vue.use(Vuex);

// const API_URL = process.env.VUE_APP_BASEURL;

export default new Vuex.Store({
  state: {
    // token: localStorage.getItem('token'),
    // user: null,
    // status: null,
  },

  mutations: {
    // authLoading(state){
    //   state.status = "LOAD";
    // },
    // authSuccess(state, token, user){
    //   state.status = "OK";
    //   state.token = token;
    //   state.user = user;
    // },
    // authError(state){
    //   state.status = "ERR";
    // },
    // authLogout(state){
    //   state.status = null;
    //   state.token = null;
    // },
  },

  actions: {
    // login({commit}, user){
    //
    //   const url = `${API_URL}/login`;
    //   const payload = {
    //     ...user,
    //   };
    //
    //   return new Promise((resolve, reject) => {
    //     commit('authLoading');
    //     axios.post(url, payload).then(response => {
    //       const token = response.data.token;
    //       const user = response.data.user;
    //       localStorage.setItem('token', token);
    //       axios.defaults.headers.common['Authorization'] = token;
    //       commit('authSuccess', token, user);
    //       resolve(response);
    //     }).catch(error => {
    //       commit('authError');
    //       localStorage.removeItem('token');
    //       reject(error);
    //     });
    //   });
    //
    // },
    // logout({commit}){
    //   return new Promise((resolve) => {
    //     commit('authLogout');
    //     localStorage.removeItem('token');
    //     delete axios.defaults.headers.common['Authorization'];
    //     resolve();
    //   })
    // },
  },

  getters : {
    // isLoggedIn: state => !!state.token,
    // authStatus: state => state.status,
  },

  modules: {
    user,
    order,
  },
});
