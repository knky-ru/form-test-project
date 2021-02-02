<template>
    <section>
        <contacts-row
            v-for="(contact, index) in contacts"
            :contact="contact"
            :types="types"
            :isLast="isLast(index)"
            :key="contact.id"
            @onRemove="onRemove"
            @onChange="onChange"
            @onAdd="onAdd"
        />
    </section>
</template>

<script>
    import ContactsRow from "@/components/Contacts/ContactsRow.vue";

    export default {
        name: "ContactsForm",
        components: {
            "contacts-row": ContactsRow
        },
        props: {
            contacts: {
                type: Array,
                required: true,
            },
            types: {
                type: Array,
                required: true,
            },
            loading: {
                type: Boolean,
                default: () => false,
            },
        },
        data() {
            return {
            }
        },
        methods: {
            isLast(index) {
                return index === (this.contacts.length - 1);
            },
            onRemove(contact) {
                this.$emit('onRemove', contact);
            },
            onChange() {
                this.$emit('onChange');
            },
            onAdd(contact) {
                const index = this.contacts.indexOf(contact);
                this.$emit('onAddAfter', index);
            },
        },
    };
</script>

<style scoped lang="scss">
</style>
