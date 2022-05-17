import React, { useEffect, useState } from 'react'
import { ListGroup } from 'react-bootstrap';
import setHeaders from '../setHeaders';
//
//  REQUIRES A VENUE OBJECT
//
//

export default function VenueIssuesList() {

    const [venueIssues, setVenueIssues] = useState(['pretty old', 'not soo bad', 'ive seen worse'])

    //  THIS RENDER IS CONDITIONAL ON BEING LOGGED IN AS HOST
    //
    //
    useEffect(() => {

        fetch(`http://venu.com.local:3001/venueIssues/{venue_id}`, {

            headers: setHeaders(),
        })

            .then(response => response.json())

            .then(response => setVenueIssues(response))
    }, [])

    function alertClicked() {

        alert('You clicked the third ListGroupItem');
    }

    /// LIST GROUP NEEDS TO BE REWORKED





    return (




        <ListGroup defaultActiveKey="#link1">

            {venueIssues.map((issue, key) =>

                <ListGroup.Item action href="#link1" onClick={alertClicked}>
                    {issue}
                </ListGroup.Item>
            )}

        </ListGroup>

    )
}

