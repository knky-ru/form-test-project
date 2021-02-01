<template>
    <div class="container is-max-desktop">
        <h1 class="title">
            Таблица заказов
        </h1>
        <div class="status__container" v-show="ordersSelected.length > 0">
            <span class="mr-3">
                Сменить статус у выбранных элементов на:
            </span>
            <b-select v-model="updateStatus" placeholder="Выбрать статус">
                <option
                        v-for="(status, key) in statuses"
                        :value="key"
                        :key="key">
                    {{ status }}
                </option>
            </b-select>
            <b-button class="ml-3" type="is-success" :loading="isLoading" :disabled="isLoading || !updateStatus" @click.prevent="updateStatuses">
                Сохранить
            </b-button>
        </div>
        <table-draw :resetCheckedRows="ordersSelectedReset" :loading="isLoading" :items="orders" @onRowChange="updateRaw" @onRawSelected="onRowsSelected" />
        <hr>
        <div class="buttons mb-5">
            <span class="mr-5 mb-2">
                Страницы:
            </span>
            <b-button outlined type="is-info" v-show="prevPage > 0" @click.prevent="changePage(prevPage)">
                {{ prevPage }}
            </b-button>
            <b-button disabled>
                {{ currentPage }}
            </b-button>
            <b-button outlined type="is-info" v-show="nextPage <= lastPage" @click.prevent="changePage(nextPage)">
                {{ nextPage }}
            </b-button>
        </div>
    </div>
</template>

<script>
import enums from '@/enums';
import { mapGetters } from 'vuex';
import TableDraw from "@/components/Table/TableDraw.vue";

export default {
    name: "TableMain",
    components: {
        "table-draw": TableDraw
    },
    data() {
        return {
            updateStatus: null,
            ordersSelected: [],
            ordersSelectedReset: false,
        };
    },
    computed: {
        ...mapGetters({
            orders: "order/ordersList",
            fetchStatus: "order/fetchStatus",
            paginationData: "order/paginationData",
        }),
        isLoading() {
            return this.fetchStatus === "LOAD";
        },
        total() {
            return this.orders.length;
        },
        prevPage() {
            return this.paginationData?.current_page - 1;
        },
        nextPage() {
            return this.paginationData?.current_page + 1;
        },
        currentPage() {
            return this.paginationData?.current_page;
        },
        perPage() {
            return this.paginationData?.per_page;
        },
        lastPage() {
            return this.paginationData?.last_page;
        },
        statuses() {
            return enums.orderStatus;
        },
    },
    mounted() {
        this.fetch();
    },
    methods: {
        onRowsSelected(selectedRaws) {
            if (selectedRaws.length === 0)
                this.updateStatus = null;
            this.ordersSelected = selectedRaws;
        },
        changePage(page) {
            this.fetch(page, this.perPage);
        },
        fetch(page = 1, count = 30) {
            this.$store
                .dispatch("order/loadOrders", { page, count })
                .then(() => {
                })
                .catch(err => {
                    console.log(err);
                    this.$buefy.toast.open({
                        message: 'Ошибка загрузки даных!',
                        type: 'is-danger',
                    });
                });
        },
        updateRaw(updatedRow) {
            const updatedOrder = { ...updatedRow.item };
            updatedOrder[updatedRow.columnName] = updatedRow.newValue;

            this.$store
                .dispatch("order/updateOrder", updatedOrder)
                .then((data) => {
                    this.$buefy.toast.open({
                        message: 'Сохранено!',
                        type: 'is-success',
                    });

                    const index = this.orders.findIndex(o => o.id === updatedOrder.id);
                    this.orders[index][updatedRow.columnName] = data.data.order[updatedRow.columnName];
                })
                .catch(err => {
                    console.log(err);
                    this.$buefy.toast.open({
                        message: 'Ошибка сохранения даных!',
                        type: 'is-danger',
                    });
                    updatedRow.item[updatedRow.columnName] = updatedRow.initialValue;
                });
        },
        updateStatuses() {

            // const orders = [];
            // this.ordersSelected.forEach((order) => {
            //     const updatedOrder = { ...order };
            //     updatedOrder.status = this.updateStatus;
            //     orders.push(updatedOrder);
            // });

            this.ordersSelected.forEach((order) => {
                order.status = this.updateStatus;
            });

            this.$store
                .dispatch("order/updateOrders", this.ordersSelected)
                .then(() => {
                    this.$buefy.toast.open({
                        message: 'Сохранено!',
                        type: 'is-success',
                    });

                    this.ordersSelected = [];
                    this.ordersSelectedReset = true;
                    setTimeout(() => {
                        this.ordersSelectedReset = false;
                    }, 0);
                    // this.fetch(this.currentPage, this.perPage);
                })
                .catch(err => {
                    console.log(err);
                    this.$buefy.toast.open({
                        message: 'Ошибка сохранения даных!',
                        type: 'is-danger',
                    });
                });
        },
    },
}
</script>

<style scoped lang="scss">
.status {
    &__container {
        display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: center;
    }
}
</style>
