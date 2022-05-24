import React, { useState, useEffect } from 'react'
import { Form } from 'react-bootstrap'
import HostInputForm from '../components/HostInputForm'
import BookeeInputForm from '../components/BookeeInputForm'
import PageLayout from '../components/layout/PageLayout'
import { Container } from 'react-bootstrap'
import UploadImages from '../components/UploadImages'
import AmenityOptionsList from '../components/AmenityOptionsLIst/AmenityOptionsList'
import { useStateValue } from '../state';
import setHeaders from '../setHeaders'
import AmenitiesSetup from '../components/AmenitiesSetup'

// Through conditional rendering we'll only reveal on of two inputs below to the user.
// 
// 
export default function VenueCreatePage() {


    const [{ userRole, username }, dispatch] = useStateValue();





    return (
        <PageLayout>

            <Container className='d-flex  p-5'>

                <Container className='d-flex flex-column'>

                    <UploadImages />



                </Container>
                <Container className='justify-content-center'>

                    <HostInputForm />


                </Container>

            </Container>

        </PageLayout>
    )
}
