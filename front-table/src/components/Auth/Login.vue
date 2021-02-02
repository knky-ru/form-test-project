<template>
  <section class="login">
    <div class="container is-max-desktop">
      <h1 class="title">Войти в систему</h1>
      <div>
        <ValidationObserver v-slot="{ invalid }">
          <ValidationProvider name="Е-мейл" rules="required|email" v-slot="{ invalid, touched, errors }">
            <b-field
              label="Е-мейл"
              :type="{'is-danger': invalid && touched }"
              :message=" (touched) ? errors[0] : ''"
            >
              <b-input
                v-model="email"
                type="email"
                placeholder="me@mail.ru"
              />
            </b-field>
          </ValidationProvider>

          <ValidationProvider name="Пароль" rules="required|min:8" v-slot="{ invalid, touched, errors }">
            <b-field
              label="Пароль"
              :type="{'is-danger': invalid && touched }"
              :message=" (touched) ? errors[0] : ''"
              class="mt-3"
            >
              <b-input
                v-model="password"
                type="password"
                placeholder="********"
                password-reveal
              />
            </b-field>
          </ValidationProvider>

          <div class="buttons mt-5">
            <b-button type="is-primary" expanded @click.prevent="login" :loading="isLoading" :disabled="invalid || isLoading">Войти</b-button>
          </div>
        </ValidationObserver>
      </div>
      <div class="card mt-5">
        <div class="card-content">
          <div class="title">
            Данные доступа
          </div>
          <div class="content">
            <p>Для получения тестового доступа введите: <strong>E-mail</strong>: test@test.ru <strong>Пароль</strong>: Password</p>
            <div>
              <b-button type="is-primary is-light" @click.prevent="fillCredentials">Заполнить поля</b-button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import { mapGetters } from 'vuex';

export default {
  name: "Login",
  data() {
    return {
      email: null,
      password: null
    };
  },
  computed: {
    ...mapGetters({
      authStatus: "user/authStatus"
    }),
    isLoading() {
      return this.authStatus === "LOAD";
    },
  },
  methods: {
    fillCredentials() {
      this.email = "test@test.ru";
      this.password = "Password";
    },
    login() {
      const email = this.email;
      const password = this.password;
      this.$store
        .dispatch("user/login", { email, password })
        .then(() => {
          this.$buefy.toast.open({
            message: 'Вход выполнен успешно!',
            type: 'is-success',
          });
          this.$router.push("/");
        })
        .catch(err => {
          console.log(err);
          this.$buefy.toast.open({
            message: 'Пара логин и пароль не соответствуют!',
            type: 'is-danger',
          });
        });
    }
  },
};
</script>

<style scoped lang="scss">
</style>
