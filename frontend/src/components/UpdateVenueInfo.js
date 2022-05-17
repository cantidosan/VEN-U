import React, { useState, useEffect } from 'react'
import { Form, Button } from 'react-bootstrap'

//// WHERE WE HANDLE USER INPUT TO MODIFY CURRENT VENUE INFORMATION
export default function UpdateVenueInfo(props) {

    const [venueName, setVenueName] = useState([])
    const [venueLocation, setVenueLocation] = useState([])
    const [venuePrice, setVenuePrice] = useState([])
    const { venue_id } = props;

    const handleSubmit = async (e) => {

        e.preventDefault();

        const res = await fetch(`http://venu.com.local:3001/venues/${venue_id}`, {

            method: 'PATCH',
            // credentials: 'same-origin',
            credentials: 'include',
            // withCredentials: true,
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'

            },

            body: JSON.stringify({
                "venueName": venueName,
                "venueLocation": venueLocation,
                "venuePrice": venuePrice

            }),


        });
        console.log('response object', res)
    }
    return (
        <div>UpdateVenueInfo
            <Form onSubmit={handleSubmit}>
                <Form.Group className="mb-3" controlId="formGroupName">
                    <Form.Label>Venue Name</Form.Label>
                    <Form.Control type="name" onChange={
                        e => setVenueName(e.target.value)} placeholder="Enter name" />
                </Form.Group>
                <Form.Group className="mb-3" controlId="formGroupLocation">
                    <Form.Label>Location</Form.Label>
                    <Form.Control type="location" onChange={
                        ev => setVenueLocation(ev.target.value)} placeholder="Location" />
                </Form.Group>
                <Form.Group className="mb-3" controlId="formGroupPrice">
                    <Form.Label>Price</Form.Label>
                    <Form.Control type="price" onChange={
                        eve => setVenuePrice(eve.target.value)} placeholder="price" />
                </Form.Group>
                <Button type="submit">Submit</Button>
            </Form>
        </div>
    )
}
