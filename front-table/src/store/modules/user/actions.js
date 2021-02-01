import axios from "axios";
const API_URL = process.env.VUE_APP_BASEURL;

export default {
    login({commit}, user){

        const url = `${API_URL}/login`;
        const payload = {
            ...user,
        };

        return new Promise((resolve, reject) => {
            commit('authLoading');
            axios.post(url, payload).then(response => {
                const token = response.data.token;
                const user = response.data.user;
                localStorage.setItem('token', token);
                axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;
                commit('authSuccess', token, user);
                resolve(response);
            }).catch(error => {
                commit('authError');
                localStorage.removeItem('token');
                reject(error);
            });
        });

    },
    logout({commit}){
        return new Promise((resolve) => {
            commit('authLogout');
            localStorage.removeItem('token');
            delete axios.defaults.headers.common['Authorization'];
            resolve();
        })
    },
}
