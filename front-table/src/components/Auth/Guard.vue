<template>
    <div class="container is-max-desktop">
        <div v-if="isForbidden">
            <h1 class="title">
                Требуется авторизация
            </h1>
            <p>
                Страница предназначена только пользователям. <router-link :to="{ path: '/login' }">Войдите</router-link>, чтобы открыть доступ.
            </p>
        </div>
        <div v-if="isLogout">
            <h1 class="title">
                Завершение сеанса
            </h1>
            <p>
                Сеанс завершён. <router-link :to="{ path: '/' }">Вернуться</router-link> на главную.
            </p>
        </div>
    </div>
</template>

<script>
export default {
    name: "Guard",
    props: {
        mode: {
            type: String,
            default: "FORBIDDEN"
        },
    },
    computed: {
        isForbidden() {
            return this.mode.toUpperCase() === 'FORBIDDEN';
        },
        isLogout() {
            return this.mode.toUpperCase() === 'LOGOUT';
        },
    }
}
</script>
