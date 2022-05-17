import React from 'react'
import { Form } from 'react-bootstrap'
import HostInputForm from '../components/HostInputForm'
import BookeeInputForm from '../components/BookeeInputForm'
import PageLayout from '../components/layout/PageLayout'
import { Container } from 'react-bootstrap'
import UploadImages from '../components/UploadImages'
import Amenities from '../components/Amenities'
import { useStateValue } from '../state';
import { useParams } from 'react-router-dom'

// Through conditional rendering we'll only reveal on of two inputs below to the user.
// 
// 
export default function EventCreatePage() {

    const [{ userRole, username }, dispatch] = useStateValue();

    let params = useParams();
    console.log('params', params)
    return (
        <PageLayout>

            <Container className='d-flex  p-5'>

                <Container className='d-flex flex-column'>

                    <UploadImages />
                    {/* TODO AMENITIES IN EVENT CREATE PAGE NEEDS ATTENTION TO WORK */}
                    <Amenities venue_id={params.venue_id} />


                </Container>
                <Container className='justify-content-center'>


                    <BookeeInputForm venue_id={params.venue_id} />

                </Container>

            </Container>

        </PageLayout>
    )
}
