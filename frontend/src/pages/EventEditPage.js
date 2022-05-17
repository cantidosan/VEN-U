import React, { useState, useEffect } from 'react'
import DisplayEventImage from '../components/DisplayEventImage'
import Amenities from '../components/Amenities'
import UpdateEventInfo from '../components/UpdateEventInfo'
import PageLayout from '../components/layout/PageLayout'
import { Container } from 'react-bootstrap'
import setHeaders from '../setHeaders'

import { useParams } from 'react-router-dom'
import EventDetails from '../components/EventDetails'
import { useStateValue } from '../state';



export default function EventEditPage() {

    const [event, setEvent] = useState([])
    const params = useParams();
    const [{ userRole, username }, dispatch] = useStateValue();

    useEffect(() => {


        fetch(`http://venu.com.local:3001/events/${params.event_id}`, {
            headers: setHeaders(),

        })
            .then(response => response.json())
            .then(response => setEvent(response))
        //  THE RESPONSE VARIABLE SHOULD HAVE VENUEID AS AS OBJECT ATRIBUTE
        //  obj.venue_id for ref
    }, [params.event_id])


    console.log('event ', event)
    // const { venue_id } = event[0].venue_id
    // console.log('event ', venue_id)
    const { venue_id } = event;
    console.log('id', venue_id)

    if (!venue_id) {
        return <div />
    }

    return (

        <PageLayout>
            EventEditPage
            <Container className='d-flex'>
                <Container>

                    <DisplayEventImage />

                </Container>
                <Container className='d-flex flex-column'>
                    <Container className='d-flex'>


                        <EventDetails event={event} />
                        <UpdateEventInfo event_id={event.id} />

                    </Container>
                    <Container className='d-flex'>

                        <Amenities venue_id={venue_id} />

                    </Container>
                </Container>


            </Container>
        </PageLayout>
    )
}
