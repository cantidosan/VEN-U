import camelizeKeysDeep from '../camelize-keys-deep';

export default {
    get(url, opts) {
        const getOpts = { ...opts, method: 'GET' };

        return fetch(url, getOpts)
            .then((res) => camelizeKeysDeep(res.json()));
    },

    post(url, opts) {
        const postOpts = { ...opts, method: 'POST' };

        return fetch(url, postOpts)
            .then((res) => camelizeKeysDeep(res.json()));
    },

    // delete() {},
    // patch() {},
    // etc
};