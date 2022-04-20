const express = require("express");
const bcrypt = require("bcrypt");
const passport = require("passport");
const flash = require("express-flash");

const cookieParser = require('cookie-parser');
const initializePassport = require("./auth");
const cors = require('cors');
const { pool } = require("./db-pool");

const session = require("express-session");
const pgSession = require('connect-pg-simple')(session)




initializePassport(passport);



const app = express();
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

app.use(
    session({
        store: new pgSession({
            pool: pool,
            tableName: 'sessions',
            createTableIfMissing: true,
        }),
        // Key we want to keep secret which will encrypt all of our information
        secret: 'secret',
        // Should we resave our session variables if nothing has changes which we dont
        resave: false,
        // Save empty value if there is no vaue which we do not want to do
        saveUninitialized: false,

        cookie: {
            maxAge: 360000,
            secure: false,
            domain: 'venu.com.local:3000',
            httpOnly: false
        }

    })
);
app.use(passport.authenticate('session'));
app.use(passport.initialize());
app.use(passport.session());

app.use(cookieParser("secret"));
app.use(flash());

const corsOptions = {
    origin: 'http://venu.com.local:3000',
    credentials: true
}

app.use(cors(corsOptions))

app.options('*', cors())


checkAuthenticated = (req, res, next) => {

    // console.log('req.session', req.session)

    console.log('req.sess.pass.user', req.cookies)
    // This checks if req.sessions.passport.user exists

    // if (req.isAuthenticated()) {

    //     console.log('proper authed')

    //     return next()


    // }
    // else {

    //     console.log('checkAuth else block')

    // }
    // res.status(500).send(({
    //     message: "Unauthenticated BUB!"
    // }))
    next();
}




// WE HAD TO PROVIDE THE FORM DATA AS AN OBJECT { "username":usernamevar , "password":passwordvar}
//

app.post('/login', function (req, res, next) {
    passport.authenticate('local', function (err, user, info) {
        if (err) { return next(err) }
        if (!user) { return res.json({ message: info.message }) }
        req.login(user, function (err) {

            if (err) {
                res.status(500).send(({
                    message: "Unauthorized Credentials!"
                }))
            }
        })
        console.log('sess', req.cookie)

        res.json(req.session);


    })(req, res, next);


});

app.get('/venues', checkAuthenticated, (req, res) => {

    /* pool method makes request for venue information */


    pool.query('SELECT * FROM venues', (error, results) => {
        if (error) {

            res.status(500)
            throw error
        }
        else {
            res.status(200).json(results.rows)
        }
    })

})

app.get('/venues/:venue_id', checkAuthenticated, (req, res) => {

    /* pool method makes request for venue information */


    pool.query('SELECT * FROM venues ', (error, results) => {
        if (error) {

            res.status(500)
            throw error
        }
        else {
            res.status(200).json(results.rows)
        }
    })

})



























app.listen(3001, () => {

    console.log(`App running on port ${3001}.`)

})

module.exports = app;
