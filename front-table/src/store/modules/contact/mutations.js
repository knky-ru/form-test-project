export default {
    setChanged(state){
        state.isChanged = true;
    },
    resetChanged(state){
        state.isChanged = false;
    },
    fetchLoading(state){
        state.connections++;
    },
    addContact(state, { contact, onIndex }){
        if (onIndex !== null)
            state.contacts.splice(onIndex + 1, 0, contact);
        else
            state.contacts.push(contact);

        state.contacts.forEach( (c, index) => {
            c.order = index + 1;
        });
    },
    removeContact(state, { contact }){
        const index = state.contacts.indexOf(contact);
        state.contacts.splice(index, 1);
    },
    fetchContactsSuccess(state, { contacts }){
        state.contacts = contacts;
        state.connections--;
    },
    fetchTypesSuccess(state, { types }){
        state.types = types;
        state.connections--;
    },
    fetchError(state){
        state.connections--;
    },
    sortContacts(state){
        state.contacts.sort((a, b)=> (a.order > b.order ? 1 : -1));
    },
}
