<template>
    <div class="columns">
        <div class="column is-2">
            <ValidationProvider name="Тип" :rules="'required|min_value:1'" v-slot="{ }">
                <b-select v-model="selectedType" placeholder="Способ связи" @input="onChange">
                    <option
                        v-if="selectedType === 0"
                        :value="0"
                    >
                        - Укажите -
                    </option>
                    <option
                        v-for="(type, index) in types"
                        :value="type.id"
                        :key="`${index}${type.name}${type.id}`"
                    >
                        {{ type.name }}
                    </option>
                </b-select>
            </ValidationProvider>
        </div>
        <div class="column is-8">
            <ValidationProvider :name="contact.type.name" :rules="contact.type.validator ? contact.type.validator : ''" v-slot="{ invalid, touched, errors }">
                <b-field
                    :type="{'is-danger': invalid && touched }"
                    :message=" (touched) ? errors[0] : ''"
                >
                    <b-input
                        ref="input"
                        v-model="contact.value"
                        :type="contact.type.type"
                        :disabled="contact.type.id === 0"
                        @input="onChange"
                    />
                </b-field>
            </ValidationProvider>
        </div>
        <div class="column is-2 is-flex is-justify-content-center">
            <b-button v-if="!isLast" :disabled="loading" @click.prevent="onAddClick" class="mr-1">+</b-button>
            <b-button :disabled="loading" @click.prevent="onRemoveClick" :class="{ 'ml-1': !isLast }">-</b-button>
        </div>
    </div>
</template>

<script>
    export default {
        name: "ContactsRow",
        props: {
            contact: {
                type: Object,
                required: true,
            },
            types: {
                type: Array,
                required: true,
            },
            isLast: {
                type: Boolean,
                default: () => false,
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
        computed: {
            selectedType: {
                get() {
                    return this.contact.type.id;
                },
                set(val) {
                    if (val > 0) {
                        this.contact.type = this.types.filter(t => t.id === val)[0];
                        this.$refs.input.focus();
                    }
                }
            },
        },
        methods: {
            onChange() {
                this.$emit('onChange');
            },
            onAddClick() {
                this.$emit('onAdd', this.contact);
            },
            onRemoveClick() {
                this.$emit('onRemove', this.contact);
            },
            // onTypeChange() {
            //     this.contact.type = this.types.filter(t => t.id === this.contact.type.id)[0];
            //     console.log(this.contact.type);
            //     this.$refs.input.focus();
            // },
        },
    };
</script>

<style scoped lang="scss">
</style>
