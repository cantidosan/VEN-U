import React, { useEffect, useState } from 'react'
import { ListGroup } from 'react-bootstrap';
import events_mock_data from '../../src/mock_data_jsons/events_mock_data.json'
import UpcomingEventsDetail from './UpcomingEventsDetail';
import setHeaders from '../setHeaders';

// THIS component will only take the venue_id as a prop
// and perform its own fetch.
//
//

export default function UpcomingEventsList(props) {

    const { venue_id } = props;

    const [eventInfo, setEventInfo] = useState([])

    useEffect(() => {

        fetch(`http://venu.com.local:3001/events/related/${venue_id}`, {

            headers: setHeaders(),
        })

            .then(response => response.json())

            .then(response => setEventInfo(response))

    }, [])

    function alertClicked() {

        alert('You clicked the third ListGroupItem');
    }
    {/*
        AFTER WE PERFORM THE FETCH WE RENDER SET THE OBJECT LOCALLY
        THEN WE RENDER  THE PAYLOAD THROUGH A SIMPLE MAPPING

    */}

    // THIS ENTIRE RENDER BELOW IS A FLEX ITEM
    return (

        <ListGroup defaultActiveKey="#link1" className="d-flex " >

            {eventInfo.map((event, key) =>

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
