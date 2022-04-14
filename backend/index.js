const express = require('express');
const app = express()
const router = express.Router();
const port = 3001


app.post('/login', function (req, res, next) {
    console.log('login route hit success')
    res.status(200)
});

module.exports = router;


app.listen(port, () => {

    console.log(`App running on port ${port}.`)

})