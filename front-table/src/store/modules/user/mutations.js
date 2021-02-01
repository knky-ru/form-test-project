export default {
    authLoading(state){
        state.status = "LOAD";
    },
    authSuccess(state, token, user){
        state.status = "OK";
        state.token = token;
        state.user = user;
    },
    authError(state){
        state.status = "ERR";
    },
    authLogout(state){
        state.status = null;
        state.token = null;
    },
}
