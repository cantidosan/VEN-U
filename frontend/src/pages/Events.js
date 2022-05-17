import React from 'react'
import PageLayout from '../components/layout/PageLayout'
import EventsList from '../components/EventsList'
import { useStateValue } from '../state';

export default function Events() {
    const [{ userRole, username }, dispatch] = useStateValue();

    return (

        <PageLayout>

            <EventsList />

        </PageLayout>

    )
}
