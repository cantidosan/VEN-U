import camelCase from 'lodash/camelCase';

import mapKeysDeep from './map-keys-deep';


/**
 *  Util function to easily and deeply camelize the keys of an
 *  object/array. This is especially helpful when transforming a
 *  response from an api from snake_case to camelCase.
 *
 *  @param {(object|array)} data          The structure to camelize.
 *  @param {function}       [validatorFn] A custom validator function. Return a truthy
 *                                        value when camelization is desired. Signature
 *                                        is `(val, key)`.
 *
 *  @returns {(object|array)} The camelized structure. Its type should
 *                            match what was passed in initially.
 */
export default function camelizeKeysDeep(data, validatorFn = () => true) {
    return mapKeysDeep(data, (val, key) => (validatorFn(val, key) ? camelCase(key) : key));
}