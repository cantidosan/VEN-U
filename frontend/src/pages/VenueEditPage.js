import React, { useEffect, useState } from 'react'
import DisplayVenueImage from '../components/DisplayVenueImage'
import VenueDetails from '../components/VenueDetails'
import VenueIssuesList from '../components/VenueIssuesList'
import Amenities from '../components/Amenities'
import UpdateVenueInfo from '../components/UpdateVenueInfo'
import PageLayout from '../components/layout/PageLayout'
import { Container } from 'react-bootstrap'
import setHeaders from '../setHeaders'
import { useParams } from 'react-router-dom'
import { useStateValue } from '../state';

export default function VenueEditPage() {

    // const {  } = props;
    // FETCHES VENUE DATA THEN SAVES IT LOCALLY TO BE OVERWRITTEN
    // BY CERTAIN USER INPUT
    const params = useParams();
    const { venue_id } = params;

    const [venue, setVenues] = useState([])

    const [{ userRole, username }, dispatch] = useStateValue();


    useEffect(() => {


        fetch(`http://venu.com.local:3001/venues/${venue_id}`, {
            headers: setHeaders(),
        })

            .then(response => response.json())

            .then(response => setVenues(response))
        //  THE RESPONSE VARIABLE SHOULD HAVE VENUEID AS AS OBJECT ATRIBUTE
    }, [])



    return (

        <PageLayout>

            <h2>VenueEditPage</h2>

            <Container className='d-flex' >

                <Container>

                    <DisplayVenueImage />

                </Container>

                <Container className='d-flex flex-column'>
                    <Container className='d-flex align-items-start'>

                        <VenueDetails venue={venue} />
                        <UpdateVenueInfo venue_id={venue_id} />

                    </Container>
                    <Container className='d-flex'>


                        <Amenities venue_id={venue_id} />
                        <VenueIssuesList />


                    </Container>

                </Container>

            </Container>
        </PageLayout>

    )
}
