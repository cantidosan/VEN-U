const express = require("express");
const bcrypt = require("bcrypt");
const passport = require("passport");
const flash = require("express-flash");
const session = require("express-session");
const initializePassport = require("./auth");
const cors = require('cors')


initializePassport(passport);



const app = express();
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

app.use(
    session({
        // Key we want to keep secret which will encrypt all of our information
        secret: 'secret',
        // Should we resave our session variables if nothing has changes which we dont
        resave: false,
        // Save empty value if there is no vaue which we do not want to do
        saveUninitialized: false
    })
);

app.use(passport.initialize());
app.use(passport.session());
app.use(flash());
app.use(cors())

// app.options('*', cors())

// router.use(cors())


// app.post('/login', (req, res) => {

//     console.log('should be res 200', req.body)

//     res.status(200).send({ user: 'tobi' })
// });


//
//
// WE HAD TO PROVIDE THE FORM DATA AS AN OBJECT { "username":usernamevar , "password":passwordvar}
//

// THIS SHOULD SERVE AS THE TEMPLATE TI ACCESS THE DONE FUNCTION ON MONDAY
app.post('/login', function (req, res, next) {
    passport.authenticate('local', function (err, user, info) {
        if (err) { return next(err) }
        if (!user) { return res.json({ message: info.message }) }
        res.json(user);
    })(req, res, next);
});
// app.post(
//     "/login"
//     ,
//     passport.authenticate("local", (err, user, info) => {
//         if (user) {

//             console.log('err', err)
//             console.log('user', user)
//             console.log('info', info)
//         }




//     },
//         // {
//         //     successRedirect: "/",
//         //     failureRedirect: "/login",
//         //     failureFlash: true
//         // }
//     )
// );





app.listen(3001, () => {

    console.log(`App running on port ${3001}.`)

})

module.exports = app;
