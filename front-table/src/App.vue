<template>
  <div id="app">
    <nav-bar />
    <router-view />
  </div>
</template>

<script>
export default {
  name: "App",
  components: {
    "nav-bar": () => import("@/components/NavBar")
  },
  data() {
    return {
      email: null,
      password: null
    };
  },
  methods: {},
  computed: {
    isLoggedIn: () => this.$store.getters.isLoggedIn,
  },
};
</script>

<style lang="scss">
</style>
