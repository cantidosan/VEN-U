import isPlainObject from 'lodash/isPlainObject';
import mapKeys from 'lodash/mapKeys';
import mapValues from 'lodash/mapValues';


/**
 *  When working with json apis, the response data often comes back as
 *  snake_cased, especially when working with rails apis. Working in
 *  snake_case is not standard in javascript, so a transformer is needed
 *  to format the data so that the keys on objects are entirely camelCased.
 *  Instead of writing a function that is explicitly for camelCasing, this
 *  method will allow any arbitrary transformation on keys (which could be
 *  useful for, say, working with camelCased objects before an api call and
 *  transforming to snake_case just before making the call).
 *
 *  @param   {*}        ref The reference for which keys will be transformed.
 *  @param   {function} cb  The iteratee invoked for each key. Because lodash methods are used
 *                          under the hood, the signature for this function should be:
 *                          `(value, key)`.
 *
 *  @returns {*} The return type should match the type of the passed-in `ref`.
 */
export default function mapKeysDeep(ref, cb) {
    let mappedKeysRef;
    let mappedRef = ref;

    if (Array.isArray(ref)) {
        mappedRef = ref.map((innerObj) => mapKeysDeep(innerObj, cb));
    } else if (isPlainObject(ref)) {
        mappedKeysRef = mapKeys(ref, cb);
        mappedRef = mapValues(mappedKeysRef, (val) => mapKeysDeep(val, cb));
    }

    return mappedRef;
}