import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import Buefy from "buefy";
import "buefy/dist/buefy.css";
import { library } from "@fortawesome/fontawesome-svg-core";
import { fas } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import Axios from "axios";
import moment from 'moment';
import { ValidationProvider, ValidationObserver } from 'vee-validate';

Vue.config.productionTip = false;

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount("#app");

library.add(fas);
Vue.component("vue-fontawesome", FontAwesomeIcon);

Vue.use(Buefy, {
  defaultIconComponent: "vue-fontawesome",
  defaultIconPack: "fas",
  customIconPacks: {
    fas: {
      sizes: {
        default: "lg",
        "is-small": "1x",
        "is-medium": "2x",
        "is-large": "3x"
      },
      iconPrefix: ""
    }
  }
});

Vue.filter('formatDate', function(value) {
  if (value) {
    return moment(String(value)).format('DD.MM.YYYY')
  }
});

Vue.component('ValidationProvider', ValidationProvider);
Vue.component('ValidationObserver', ValidationObserver);

const token = localStorage.getItem("token");
if (token) Axios.defaults.headers.common["Authorization"] = `Bearer ${token}`;

Axios.interceptors.response.use(function (response) {
  return response;
}, function (error) {
  if (error.response.status === 401) {
    store.dispatch('user/logout', { root: true, })
        .then(() => router.push({ path: "/logout" }))
  }
  return Promise.reject(error);
});

import { extend, localize } from 'vee-validate';
import { required, email, min, min_value, numeric } from 'vee-validate/dist/rules';
import ru from 'vee-validate/dist/locale/ru.json';

extend('required', required);
extend('email', email);
extend('min', min);
extend('min_value', min_value);
extend('numeric', numeric);

localize('ru', ru);
