import axios from "axios";
const API_URL = process.env.VUE_APP_BASEURL;

export default {
    loadOrders({commit}, { page = null, count = null }){

        const url = `${API_URL}/orders`;
        const payload = {};
        payload.params = {};
        if (page) {
            payload.params["page[number]"] = page;
        }
        if (count) {
            payload.params["page[size]"] = count;
        }

        return new Promise((resolve, reject) => {
            commit('fetchLoading');
            axios.get(url, payload).then(response => {
                const orders = response.data.data;
                const paginator = {
                    current_page: response.data.current_page,
                    last_page: response.data.last_page,
                    per_page: response.data.per_page,
                    total: response.data.total,
                };
                commit('fetchSuccess', { orders, paginator });
                resolve(response);
            }).catch(error => {
                commit('fetchError');
                reject(error);
            });
        });

    },
    updateOrder({commit}, order){
        const url = `${API_URL}/orders/${order.id}`;
        const payload = {
            name: order.name,
            status: order.status,
        };

        return new Promise((resolve, reject) => {
            commit('fetchLoading');
            axios.patch(url, payload).then(response => {
                commit('updateSuccess');
                resolve(response);
            }).catch(error => {
                commit('fetchError');
                reject(error);
            });
        });

    },
    updateOrders({commit}, orders){
        const url = `${API_URL}/orders`;
        const payload = {
            orders,
        };

        return new Promise((resolve, reject) => {
            commit('fetchLoading');
            axios.put(url, payload).then(response => {
                commit('updateSuccess');
                resolve(response);
            }).catch(error => {
                commit('fetchError');
                reject(error);
            });
        });

    },
}
