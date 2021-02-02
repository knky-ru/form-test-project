<template>
    <div class="container is-max-desktop">
        <h1 class="title">
            Контакты пользователя
        </h1>
        <ValidationObserver v-slot="{ invalid }">
            <contacts-form
                :contacts="contacts || []"
                :types="types || []"
                @onChange="changeTouch"
                @onRemove="removeContact"
                @onAddAfter="addContact"
            />
            <div class="mt-5">
                <b-button :disabled="isLoading" :loading="!isChanged && isLoading" @click.prevent="addContact(null)">+</b-button>
            </div>
            <div class="mt-5">
                <b-button :disabled="isLoading || !isChanged || invalid" :loading="isChanged && isLoading" type="is-success" @click.prevent="updateContacts">Сохранить</b-button>
                <b-button :disabled="isLoading" v-show="isChanged" type="is-danger is-light" @click.prevent="cancel" class="ml-5">Отменить</b-button>
            </div>
        </ValidationObserver>
    </div>
</template>

<script>
    import ContactsForm from "@/components/Contacts/ContactsForm.vue";
    import { mapGetters } from 'vuex';

    export default {
        name: "ContactsMain",
        components: {
            "contacts-form": ContactsForm
        },
        props: {
        },
        data() {
            return {
            };
        },
        computed: {
            ...mapGetters({
                contacts: "contact/contactsList",
                types: "contact/typesList",
                connections: "contact/connections",
                isChanged: "contact/isChanged",
            }),
            isLoading() {
                return (this.connections > 0);
            },
        },
        mounted(){
            if (this.contacts === null)
                this.fetchContacts();
            if (this.types === null)
                this.fetchTypes();
        },
        methods: {
            changeTouch() {
                this.$store.dispatch("contact/setChanged");
            },
            cancel() {
                this.fetchContacts();
                this.$store.dispatch("contact/resetChanged");
            },
            removeContact(contact) {
                this.$store.dispatch("contact/removeContact", { contact });
                if (!('new' in contact.type))
                    this.$store.dispatch("contact/setChanged");
            },
            fetchContacts() {
                this.$store
                    .dispatch("contact/loadContacts")
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
            fetchTypes() {
                this.$store
                    .dispatch("contact/loadTypes")
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
            addContact(onIndex = null) {
                const contact = {
                    "order": -1,
                    "value": "",
                    "type": {
                        "new": true,
                        "id": 0,
                        "name": "Выбрать",
                        "type": "text",
                        "validator": null
                    },
                };
                this.$store
                    .dispatch("contact/addContact", { contact, onIndex });
            },
            updateContacts() {
                this.$store
                    .dispatch("contact/updateContacts", this.contacts)
                    .then(() => {
                        this.$buefy.toast.open({
                            message: 'Сохранено!',
                            type: 'is-success',
                        });

                        this.$store.dispatch("contact/resetChanged");
                    })
                    .catch(err => {
                        console.log(err);
                        this.$buefy.toast.open({
                            message: 'Ошибка сохранения даных!',
                            type: 'is-danger',
                        });
                    });
            },
        }
    }
</script>
