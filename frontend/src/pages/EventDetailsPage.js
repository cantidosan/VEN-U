import React, { useState, useEffect } from 'react'
import eventsListMockData from '../../src/eventsListMockData'
import Amenities from '../components/Amenities'
import VenueDetails from '../components/VenueDetails'
import DisplayEventImage from '../components/DisplayEventImage'
import PastEventReviews from '../components/PastEventReviewsList'
import PageLayout from '../components/layout/PageLayout'
import { Container } from 'react-bootstrap'
import AcceptEventButton from '../components/Buttons/AcceptEventButton'
import RejectEventButton from '../components/Buttons/RejectEventButton'
import EditButton from '../components/Buttons/EditButton'
import PurchaseButton from '../components/Buttons/PurchaseButton'
import EventDetails from '../components/EventDetails'
import { useParams } from 'react-router-dom';
import setHeaders from '../setHeaders'
import MakeBidButton from '../components/Buttons/MakeBidButton'
import Calendar from '../components/Calendar'
import 'react-calendar/dist/Calendar.css';
import { useStateValue } from '../state';

export default function EventDetailsPage() {

    const params = useParams();
    const [event, setEvent] = useState([])
    const [{ userRole, username }, dispatch] = useStateValue();

    //const [venue, setVenue] = useState([])
    useEffect(() => {

        // setVenues(venuesMockData)

        fetch(`http://venu.com.local:3001/events/${params.event_id}`, {
            headers: setHeaders(),

        })

            .then(response => response.json())

            .then(response => setEvent(response))

        //  THE RESPONSE VARIABLE SHOULD HAVE VENUEID AS AS OBJECT ATRIBUTE
    }, [])

    console.log('pre event', event)
    const { venue_id } = event



    return (
        <PageLayout>

            EventDetailsPage
            <Container className='d-flex'>
                <Container>

                    <DisplayEventImage />

                </Container>

                <Container className='d-flex flex-column'>
                    <Container className='d-flex'>

                        <EventDetails event={event} />



                    </Container>
                    <Container className='d-flex'>
                        {/*  THE CALENDAR COMPONENT SHOULD BE POPULATED WITH UPCOMING
                        APPROVED EVENTS TO PROVIDE AT A GLANCE INFORMATION*/}
                        {
                            (!venue_id) ? '' : <Calendar venue_id={venue_id} />

                        }
                        {
                            (!venue_id) ? '' : <Amenities venue_id={venue_id} />
                        }

                        {/* <PastEventReviews /> */}

                    </Container>
                </Container>


            </Container>


        </PageLayout>
    )
}
