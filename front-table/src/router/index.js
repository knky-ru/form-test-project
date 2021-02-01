import Vue from "vue";
import VueRouter from "vue-router";
import store from "../store";
import Home from "../views/Home.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home
  },
  {
    path: "/guard",
    name: "Guard",
    component: () => import("../components/Auth/Guard.vue"),
    props: true,
  },
  {
    path: "/about",
    name: "About",
    component: () => import("../views/About.vue"),
    meta: {
      authorizedOnly: false
    }
  },
  {
    path: "/table",
    name: "Table",
    component: () => import("../components/Table/TableMain.vue"),
    meta: {
      authorizedOnly: true
    }
  },
  {
    path: "/contacts",
    name: "Contacts",
    component: () => import("../components/Contacts/ContactsMain.vue"),
    meta: {
      authorizedOnly: true
    }
  },
  {
    path: "/login",
    name: "Login",
    component: () => import("../components/Auth/Login.vue")
  }
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes
});

router.beforeEach((to, from, next) => {
  if (to.matched.some(route => route.meta.authorizedOnly)) {
    if (store.getters["user/isLoggedIn"]) {
      next();
      return;
    }
    next('/guard');
  } else {
    next();
  }
});

export default router;
