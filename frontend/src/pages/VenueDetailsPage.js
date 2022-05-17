import React, { useState, useEffect } from 'react'
import DisplayVenueImage from '../components/DisplayVenueImage'
import VenueDetails from '../components/VenueDetails'
import Calendar from '../components/Calendar'
import UpcomingEventsList from '../components/UpcomingEventsList'
import PendingEventBids from '../components/PendingEventBids'
import VenueIssuesList from '../components/VenueIssuesList'
import venuesMockData from '../../src/venuesMockData.json'
import eventsListMockData from '../../src/eventsListMockData.json'
import Amenities from '../components/Amenities'
import PageLayout from '../components/layout/PageLayout'
import { Container } from 'react-bootstrap'
import EditButton from '../components/Buttons/EditButton'
import MakeBidButton from '../components/Buttons/MakeBidButton'
import setHeaders from '../setHeaders'
import { useStateValue } from '../state';


import 'react-calendar/dist/Calendar.css';
import { useParams } from 'react-router-dom';


//
// THIS COMPONENT TAKES THE VENUEID FROM THE URL VIA USE PARAMS
//
//
//
//

export default function VenueDetailsPage() {

    const params = useParams();

    const { venue_id } = params;


    const sessionId = window.localStorage.getItem('sessionId');

    const [events, setEvents] = useState([])

    const [venue, setVenue] = useState([])

    const [{ userRole, username }, dispatch] = useStateValue();

    console.log('venue Id on details page', venue)


    useEffect(() => {


        fetch(`http://venu.com.local:3001/venues/${venue_id}`, {
            headers: setHeaders(),
        })

            .then(response => response.json())

            .then(response => setVenue(response))
    }, [])

    console.log('venue object', venue)
    console.log(!venue.length)
    if (!venue.length) {

        return <div />

    }
    return (

        <PageLayout>

            <Container className='d-flex'>
                <Container>
                    <DisplayVenueImage />
                </Container>

                <Container className='d-flex flex-column'>
                    <Container className='d-flex justify-content-evenly'>
                        <VenueDetails venue={venue} />
                        <VenueIssuesList role={userRole} />

                        {/* <MakeBidButton role={userRole} />
                        <EditButton role={userRole} /> */}
                    </Container>

                    <Container className='d-flex justify-content-evenly m-2 p-3'>

                        <Calendar venue_id={venue_id} />
                        <UpcomingEventsList venue_id={venue_id} />
                        <PendingEventBids venue_id={venue_id} />
                        <Amenities venue_id={venue_id} />
                    </Container>

                </Container>

            </Container>

        </PageLayout>
    )
}
