import React from 'react'
import Header from '../components/layout/Header'
import Footer from '../components/layout/Footer'
import VenuesList from '../components/VenuesList'
import PageLayout from '../components/layout/PageLayout'
import { useStateValue } from '../state';


export default function Venues() {

    const [{ userRole, username }, dispatch] = useStateValue();

    return (

        <PageLayout>

            <VenuesList />

        </PageLayout>



    )
}
