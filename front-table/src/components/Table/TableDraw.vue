<template>
    <section>
        <b-table
            :data="items"
            :loading="loading"
            :default-sort="'id'"
            :default-sort-direction="defaultSortDirection"
            :checked-rows.sync="checkedRows"
            checkable
            :checkbox-position="checkboxPosition">

            <b-table-column field="id" label="Номер" width="40" numeric sortable v-slot="props">
                {{ props.row.id }}
            </b-table-column>

            <b-table-column field="name" label="Название" sortable v-slot="props">
                <table-editable-cell :value="props.row.name" @onChange="editRow(props.row, 'name', $event)" />
            </b-table-column>

            <b-table-column field="status" label="Статус" sortable v-slot="props">
                {{ status(props.row.status) }}
            </b-table-column>

            <b-table-column field="created_at" label="Дата" sortable v-slot="props">
                {{ props.row.created_at | formatDate }}
            </b-table-column>

            <template #bottom-left>
                <b>Total checked</b>: {{ checkedRows.length }}
            </template>
        </b-table>
    </section>
</template>

<script>
    import enums from '@/enums';
    import TableEditableCell from "@/components/Table/TableEditableCell.vue";

    export default {
        name: "TableDraw",
        components: {
            "table-editable-cell": TableEditableCell
        },
        props: {
            items: {
                type: Array,
                required: true,
            },
            loading: {
                type: Boolean,
                default: () => false,
            },
            resetCheckedRows: {
                type: Boolean,
                default: () => false,
            },
        },
        data() {
            return {
                defaultSortDirection: 'asc',
                checkboxPosition: 'left',
                checkedRows: [],
            }
        },
        watch: {
            checkedRows: function(val) {
                this.$emit('onRawSelected', val);
            },
            resetCheckedRows: function() {
                this.checkedRows = [];
            },
        },
        methods: {
            status(key) {
                return enums.orderStatus[key];
            },
            editRow(item, columnName, values) {
                const updatedRow = {
                    item,
                    columnName,
                    newValue: values.newValue,
                    initialValue: values.initialValue,
                };
                this.$emit('onRowChange', updatedRow)
            },
        },
    };
</script>

<style scoped lang="scss">
</style>
