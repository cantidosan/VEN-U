import axios from 'axios';


const sessionId = window.localStorage.getItem('sessionId')

export default axios.create({

    baseURL: 'http://venu.com.local:3001',
    timeout: 1000,
    headers: {
        'x-access-token': sessionId,
        'Accept': 'application/json',
        'Content-Type': 'application/json',
    }
})

