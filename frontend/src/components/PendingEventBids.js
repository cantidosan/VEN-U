import React, { useState, useEffect } from 'react'
import { ListGroup } from 'react-bootstrap';
import UpcomingEventsDetail from './UpcomingEventsDetail'
import events_mock_data from '../../src/mock_data_jsons/events_mock_data.json'
import setHeaders from '../setHeaders';

// THIS component will only take the venue_id as a prop
// and perform its own fetch.
//
//

export default function PendingEventBids(props) {

    const { venue_id } = props;
    const [eventBids, setEventBids] = useState([])


    useEffect(() => {

        fetch(`http://venu.com.local:3001/events/pending/${venue_id}`, {

            headers: setHeaders(),
        })

            .then(response => response.json())

            .then(response => setEventBids(response))
    }, [])

    //TO DO: THE BELOW FUNCTION WILL BE CHANGED TO A HELPER 
    //TO DO:  THAT REDIRECTS ONCLICK TO THE VENUE DETAILS PAGE
    //
    //

    function alertClicked() {

        alert('You clicked the third ListGroupItem');
    }
    // THIS FUNCTION IS TO BE CONDITIONALLY RENDERED BASED
    // ON THE USERS ROLE. I.E Hosts Only
    //
    //

    return (
        <ListGroup defaultActiveKey="#link1">
            {/* WE"LL NEED TO IMPOSE A FILTER TO ONLY ALLOW EVENTS WITH THE isActive  === false */}
            {eventBids.map((event, key) =>

                // <ListGroup.Item action href="#link1">
                //     {event.name}
                //     {event.type}
                // </ListGroup.Item>

                key < 4 && <UpcomingEventsDetail
                    key={key}
                    event={event} />
            )}
        </ListGroup>
    )
}
