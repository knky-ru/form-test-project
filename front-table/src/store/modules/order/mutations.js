export default {
    fetchLoading(state){
        state.status = "LOAD";
    },
    fetchSuccess(state, { orders, paginator }){
        state.status = "OK";
        state.orders = orders;
        state.paginator = paginator;
    },
    updateSuccess(state){
        state.status = "OK";
    },
    fetchError(state){
        state.status = "ERR";
    },
}
