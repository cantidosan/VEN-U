export default function setHeaders(overrides = {}) {

    const sessionId = window.localStorage.getItem('sessionId')

    return {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        // 'Access-Control-Allow-Origin': '*',
        'x-access-token': sessionId, // however you get it..
        ...overrides
    };
}
