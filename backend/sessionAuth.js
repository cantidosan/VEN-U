const { pool } = require("./db-pool");


function sessionAuthenticate(req, res, next) {


    const { sessionid } = req.sessionID
    console.log('sessid', req.sessionID)

    const getSessionQuery = `SELECT * FROM sessions
                                WHERE sessions.sid = $1
                            ;
                            `

    pool.query(
        getSessionQuery,
        [sessionid],
        (err, results) => {
            if (err) {
                throw err;
            }
            // console.log('results rows', results.rows.length)
            if (results.rows.length > 0) {
                // const session = results.rows[0];
                // console.log('session object from db', session)
                // res.status(200).json(session)
                // req.role = session.role
                // console.log('reqrol', req.role)
                next();

            } else {
                // // No user
                res.status(500).send({
                    message: "Unavailable Session!"
                });
                console.log('USER NEEDS TO LOGIN')
            }
        }
    );

}

module.exports = sessionAuthenticate;