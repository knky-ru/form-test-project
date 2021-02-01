<template>
    <div>
        <div v-show="isEditMode">
            <b-field>
                <b-input :ref="'input'" v-model="editValue" @blur="save" />
            </b-field>
        </div>
        <div v-show="!isEditMode">
            <span class="editable" @click.prevent="edit">
                {{ value }}
            </span>
        </div>
    </div>
</template>

<script>
    export default {
        name: "TableEditableCell",
        props: {
            value: {
                type: String,
                required: true,
            },
        },
        data() {
            return {
                isEditMode: false,
                editValue: null,
            };
        },
        mounted() {
            this.editValue = this.value;
        },
        methods: {
            edit() {
                this.isEditMode = true;
                if (this.editValue !== this.value)
                    this.editValue = this.value;
                this.$refs.input.focus();
            },
            save() {
                this.isEditMode = false;
                if (this.editValue !== this.value)
                    this.$emit('onChange', { newValue: this.editValue, initialValue: this.value } );
            },
        },
    }
</script>

<style scoped lang="scss">
.editable {
    border-bottom: none;

    &:hover {
        border-bottom: 1px dashed;
        cursor: pointer;
    }
}
</style>
