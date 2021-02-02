import axios from "axios";
const API_URL = process.env.VUE_APP_BASEURL;

export default {
    setChanged({commit}){
        commit('setChanged');
    },
    resetChanged({commit}){
        commit('resetChanged');
    },
    removeContact({commit}, { contact }){
        commit('removeContact', { contact });
    },
    addContact({commit}, { contact, onIndex = null }){
        commit('addContact', { contact, onIndex });
    },
    loadContacts({commit}){

        const url = `${API_URL}/contacts`;
        const payload = {};

        return new Promise((resolve, reject) => {
            commit('fetchLoading');
            axios.get(url, payload).then(response => {
                const contacts = response.data.contacts;
                commit('fetchContactsSuccess', { contacts });
                commit('sortContacts');
                resolve(response);
            }).catch(error => {
                commit('fetchError');
                reject(error);
            });
        });

    },
    loadTypes({commit}){

        const url = `${API_URL}/communications`;
        const payload = {};

        return new Promise((resolve, reject) => {
            commit('fetchLoading');
            axios.get(url, payload).then(response => {
                const types = response.data.types;
                commit('fetchTypesSuccess', { types });
                resolve(response);
            }).catch(error => {
                commit('fetchError');
                reject(error);
            });
        });

    },
    updateContacts({commit}, contacts){
        const url = `${API_URL}/contacts`;
        const payload = {
            contacts,
        };

        return new Promise((resolve, reject) => {
            commit('fetchLoading');
            axios.put(url, payload).then(response => {
                const contacts = response.data.contacts;
                commit('fetchContactsSuccess', { contacts });
                commit('sortContacts');
                resolve(response);
            }).catch(error => {
                commit('fetchError');
                reject(error);
            });
        });

    },

}
