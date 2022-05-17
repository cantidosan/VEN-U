import React, { useEffect, useState } from 'react'
import { Form, Button } from 'react-bootstrap'

export default function UpdateEventInfo(props) {


    const [eventName, setEventName] = useState([])
    const [eventType, setEventType] = useState([])
    const [eventLocation, setEventLocation] = useState([])
    const [eventPrice, setEventPrice] = useState([])
    const [startDate, setStartDate] = useState([])
    const [startTime, setStartTime] = useState([])


    const { event_id } = props;

    const handleSubmit = async (e) => {

        e.preventDefault();

        const res = await fetch(`http://venu.com.local:3001/events/${event_id}`, {

            method: 'PATCH',
            // credentials: 'same-origin',
            credentials: 'include',
            // withCredentials: true,
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'

            },

            body: JSON.stringify({
                "eventName": eventName,
                "eventLocation": eventLocation,
                "eventPrice": eventPrice,
                "StartDate": startDate,
                "StartTime": startTime,
                "eventType": eventType
            }),


        });

    }

    return (

        <div>UpdateEventInfo
            <Form onSubmit={handleSubmit}>
                <Form.Group className="mb-3" controlId="formGroupName">
                    <Form.Label>Event Name</Form.Label>
                    <Form.Control type="name" onChange={
                        e => setEventName(e.target.value)} placeholder="Enter name" />
                </Form.Group>
                <Form.Group className="mb-3" controlId="formGroupPrice">
                    <Form.Label>Event Type</Form.Label>
                    <Form.Control type="Type" onChange={
                        ev => setEventType(ev.target.value)} placeholder="Type" />
                </Form.Group>
                <Form.Group className="mb-3" controlId="formGroupPrice">
                    <Form.Label>Price</Form.Label>
                    <Form.Control type="price" onChange={
                        eve => setEventPrice(eve.target.value)} placeholder="price" />
                </Form.Group>
                <Form.Group className="mb-3" controlId="formGroupDate">
                    <Form.Label>Start Date</Form.Label>
                    <Form.Control type="name" onChange={
                        even => setStartDate(even.target.value)} placeholder="Start Date" />
                </Form.Group>
                <Form.Group className="mb-3" controlId="formGroupDate">
                    <Form.Label>Location</Form.Label>
                    <Form.Control type="name" onChange={
                        events => setEventLocation(events.target.value)} placeholder="location" />
                </Form.Group>
                <Form.Group className="mb-3" controlId="formGroupTime">
                    <Form.Label>Start Time:</Form.Label>
                    <Form.Control type="location" onChange={
                        event => setStartTime(event.target.value)} placeholder="StartTime" />
                </Form.Group>
                <Button type="submit">Submit</Button>

            </Form>
        </div>
    )
}
