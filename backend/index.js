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
const sessionAuth = require('./sessionAuth');



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

    console.log('header details', req.headers.sessionid)







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
        console.log('user object details', user)
        req.login(user, function (err) {

            if (err) {
                res.status(500).send(({
                    message: "Unauthorized Credentials!"
                }))
            }
        })
        // console.log('sess', req.cookie)

        res.json(req.sessionID);
        // res.json(req.user);


    })(req, res, next);


});

app.get('/venues', (req, res) => {

    /* pool method makes request for venue information */


    pool.query('SELECT * FROM venues', (error, results) => {
        if (error) {

            res.status(500)
            throw error
        }
        else {
            console.log('success qry res')
            res.status(200).json(results.rows)
            // res.status(200).json(results.rows)
        }
    })

})

app.get('/venues/:venue_id', (req, res) => {

    /* pool method makes request for venue information */
    const { venue_id } = req.params

    getVenueQuery = 'SELECT * FROM venues  $1'

    pool.query(getVenueQuery, [venue_id], (error, results) => {
        if (error) {

            res.status(500)
            throw error
        }
        else {
            console.log('pool query')
            res.status(200).json(results.rows)
        }
    })

})
app.patch('/venues/:venue_id', (req, res) => {

    /* pool method makes request for venue information */
    const { venue_id } = req.params

    updateVenueQuery = 'UPDATE * FROM venues ;'

    pool.query(updateVenueQuery, [venue_id], (error, results) => {
        if (error) {

            res.status(500)
            throw error
        }
        else {
            console.log('pool query')
            res.status(200).json(results.rows)
        }
    })

})

app.get('/venues/:venue_id/dates', (req, res) => {

    /* pool method makes request for venue information */
    const { venue_id } = req.params

    getVenuesDatesQuery = 'SELECT * FROM venues WHERE '

    pool.query(getVenuesDatesQuery, [venue_id], (error, results) => {
        if (error) {

            res.status(500)
            throw error
        }
        else {
            console.log('pool query')
            res.status(200).json(results.rows)
        }
    })

})




app.get('/amenities/:venueId', (req, res) => {

    const { venueId } = req.params

    getVenueAmenitiesQuery = `SELECT * FROM amenities ;`

    pool.query(getVenueAmenitiesQuery, [venueId], (error, results) => {
        if (error) {

            res.status(500)
            throw error
        }
        else {

            res.status(200).json(results.rows)
        }
    })

})

app.get('/pictures/events/:eventId', (req, res) => {

    const { eventId } = req.params

    getEventPictureQuery = `SELECT * FROM pictures ;`

    pool.query(getEventPictureQuery, (error, results) => {
        if (error) {

            res.status(500)
            throw error
        }
        else {

            res.status(200).json(results.rows)
        }
    })

})
app.get('/pictures/venues/:venue_id', (req, res) => {

    const { venue_id } = req.params

    getVenuePictureQuery = `SELECT * FROM pictures ;`

    pool.query(getVenuePictureQuery, [venueId], (error, results) => {
        if (error) {

            res.status(500)
            throw error
        }
        else {

            res.status(200).json(results.rows)
        }
    })

})


app.get('/events', (req, res) => {



    getEventsQuery = `SELECT * FROM events ;`

    pool.query(getEventsQuery, (error, results) => {
        if (error) {

            res.status(500)
            throw error
        }
        else {

            res.status(200).json(results.rows)
        }
    })

})
app.get('/events/:event_id', (req, res) => {



    getEventQuery = `SELECT * FROM events ;`

    pool.query(getEventQuery, (error, results) => {
        if (error) {

            res.status(500)
            throw error
        }
        else {

            res.status(200).json(results.rows)
        }
    })

})
app.patch('/events/:event_id', (req, res) => {



    updateEventQuery = `UPDATE * FROM events ;`

    pool.query(getEventQuery, (error, results) => {
        if (error) {

            res.status(500)
            throw error
        }
        else {

            res.status(200).json(results.rows)
        }
    })

})

app.get('/events/related/:venue_id', (req, res) => {



    getEventsQuery = `SELECT * FROM events ;`

    pool.query(getEventsQuery, (error, results) => {
        if (error) {

            res.status(500)
            throw error
        }
        else {

            res.status(200).json(results.rows)
        }
    })

})

app.get('/events/pending/:venue_id', (req, res) => {

    const { venue_id } = req.params

    unapprovedEventQuery = `SELECT * FROM events ;`

    pool.query(unapprovedEventQuery, (error, results) => {
        if (error) {

            res.status(500)
            throw error
        }
        else {

            res.status(200).json(results.rows)
        }
    })

})

app.get('/venueIssues/:venue_id', (req, res) => {

    const { venue_id } = req.params

    venueIssuesQuery = `SELECT * FROM venueIssues ;`

    pool.query(venueIssuesQuery, (error, results) => {
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
