<template>
  <div class="container is-max-desktop">
    <b-navbar>
      <template #brand>
        <b-navbar-item tag="router-link" :to="{ path: '/' }">
          <b-icon
            pack="fas"
            icon="tachometer-alt"
            size="is-large"
            type="is-primary"
          >
          </b-icon>
          <span class="title ml-3">
            TestApp
          </span>
        </b-navbar-item>
      </template>
      <template #start>
        <b-navbar-item tag="router-link" :to="{ path: '/table' }">
            Таблица заказов
        </b-navbar-item>
        <b-navbar-item tag="router-link" :to="{ path: '/contacts' }">
          Контакты
        </b-navbar-item>
        <b-navbar-item tag="router-link" :to="{ path: '/about' }">
          О программе
        </b-navbar-item>
      </template>
      <template #end>
        <b-navbar-item tag="div">
          <div class="buttons">
            <router-link v-if="!isLoggedIn" class="button is-primary" :to="{ path: '/login' }">
              <strong>Войти</strong>
            </router-link>
            <a v-if="isLoggedIn" class="button is-light" @click.prevent="logout">
              <strong>Выйти</strong>
            </a>
          </div>
        </b-navbar-item>
      </template>
    </b-navbar>
  </div>
</template>

<script>
import { mapGetters } from 'vuex';

export default {
  name: "NavBar",
  computed: {
    ...mapGetters({
      isLoggedIn: "user/isLoggedIn"
    }),
  },
  methods: {
    logout() {
      this.$store
        .dispatch("user/logout")
        .then(() => this.$router.push({ path: "/logout" }))
        .catch(err => console.log(err));
    },
  }
};
</script>

<style scoped lang="scss">
.navbar {
  margin-bottom: 50px;
}
</style>
