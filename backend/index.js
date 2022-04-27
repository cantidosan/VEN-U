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

    getVenuesQuery = `SELECT
                        v.id, 
                        v.name, 
                        v.location, 
                        v.price, 
                        v.host_id, 
                        p.pic_url
                    FROM
                        venues AS v JOIN venues_pictures AS p 
                    ON
                        v.id = p.venue_id

                    ;`

    pool.query(getVenuesQuery, (error, results) => {
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
    console.log('venueId', venue_id)

    getVenueQuery = `SELECT 
                        v.id,
                        v.name,
                        v.location,
                        v.price,
                        v.host_id,
                        p.pic_url
                    FROM 
                        venues AS v JOIN venues_pictures AS p
                    ON
                        v.id = p.venue_id

                        WHERE v.id = $1;`


    pool.query(getVenueQuery, [venue_id], (error, results) => {
        if (error) {

            res.status(500)
            throw error
        }
        else {
            // console.log('venue query venueid results rows', results.rows[0])
            res.status(200).json(results.rows[0])
        }
    })

})
app.patch('/venues/:venue_id', (req, res) => {

    /* pool method makes request for venue information */
    const { venue_id } = req.params
    const { venueName, venueLocation, venuePrice } = req.body;
    updateVenueQuery = 'UPDATE venues SET name = $1,location= $2, price = $3 WHERE id = $4 ;'

    pool.query(updateVenueQuery, [venueName, venueLocation, venuePrice, venue_id], (error, results) => {
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

app.get('/venues/:venue_id/eventDates', (req, res) => {

    /* pool method makes request for venue information */
    const { venue_id } = req.params
    console.log('venueId date call', venue_id)
    getVenuesDatesQuery = `SELECT start_date 
                            FROM events  
                            WHERE venue_id = $1
                            `

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




app.get('/amenities/:venue_id', (req, res) => {

    const { venue_id } = req.params

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

app.get('/pictures/events/:event_id', (req, res) => {

    const { event_id } = req.params
    console.log('req params', req.params)
    getEventPictureQuery = `SELECT pic_url FROM events_pictures WHERE event_id = $1 ;`

    pool.query(getEventPictureQuery, [event_id], (error, results) => {
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

    getVenuePictureQuery = `SELECT * FROM pictures_venues WHERE venue_id = $1 ;`

    pool.query(getVenuePictureQuery, [venue_id], (error, results) => {
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



    getEventsQuery = `SELECT
                            e.id, 
                            e.name, 
                            e.location, 
                            e.bookee_id,
                            e.type,
                            e.start_date,
                            e.duration,
                            e.start_time,
                            e.venue_id,
                            e.is_active,
                            e.entry_price,  
                            p.pic_url
                        FROM
                            events AS e JOIN events_pictures AS p 
                        ON
                            e.id = p.event_id

                        ;`

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

    const { event_id } = req.params;

    getEventQuery = `SELECT 
                            e.id, 
                            e.name, 
                            e.location, 
                            e.bookee_id,
                            e.type,
                            e.start_date,
                            e.duration,
                            e.start_time,
                            e.venue_id,
                            e.is_active,
                            e.entry_price,  
                            p.pic_url

                        FROM
                        events AS e JOIN events_pictures AS p 
                    ON
                        e.id = p.event_id
    
    
                        WHERE e.id = $1 
                        ;`

    pool.query(getEventQuery, [event_id], (error, results) => {
        if (error) {

            res.status(500)
            throw error
        }
        else {
            console.log('success event db sql query')
            res.status(200).json(results.rows[0])
        }
    })

})
app.patch('/events/:event_id', (req, res) => {

    const {
        eventName,
        eventLocation,
        eventPrice,
        startDate,
        startTime,
        eventType
    } = req.body;

    const { event_id } = req.params;
    console.log(' to be patched eventid', event_id)

    updateEventQuery = `UPDATE events 
                        SET  name = $1,
                        location = $2,
                        entry_price = $3,
                        start_date = $4,
                        start_time = $5,
                        type = $6
                        WHERE id = $7;`

    pool.query(updateEventQuery,
        [
            eventName,
            eventLocation,
            eventPrice,
            startDate,
            startTime,
            eventType,
            event_id
        ], (error, results) => {
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
