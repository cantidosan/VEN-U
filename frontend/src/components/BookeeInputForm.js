import React, { useState, useEffect } from 'react'
import { Form } from 'react-bootstrap'
import SubmitButton from './Buttons/SubmitButton'
import { useStateValue } from '../state';

export default function BookeeInputForm(props) {

    const [eventName, setEventName] = useState([])
    const [eventType, setEventType] = useState([])
    const [eventPrice, setEventPrice] = useState([])
    const [startDate, setStartDate] = useState([])
    const [startTime, setStartTime] = useState([])
    const [duration, setDuration] = useState([])
    const [promotionalDetails, setPromotionalDetails] = useState([])
    const [imageSelected, setImageSelected] = useState([])
    const [{ userRole, userId, username }, dispatch] = useStateValue();

    const { venue_id } = props




    return (
        <div>BookeeInputForm
            <Form>
                <Form.Group className="mb-3" controlId="formGroupName">
                    <Form.Label>Event Name</Form.Label>
                    <Form.Control type="name" onChange={(event) => setEventName(event.target.value)} placeholder="Enter name" />
                </Form.Group>
                <Form.Group className="mb-3" controlId="formGroupPrice">
                    <Form.Label>Event Type</Form.Label>
                    <Form.Control type="Type" onChange={(even) => setEventType(even.target.value)} placeholder="Type" />
                </Form.Group>
                <Form.Group className="mb-3" controlId="formGroupPrice">
                    <Form.Label>Price</Form.Label>
                    <Form.Control type="price" onChange={(eve) => setEventPrice(eve.target.value)} placeholder="price" />
                </Form.Group>
                <Form.Group className="mb-3" controlId="formGroupDate">
                    <Form.Label>Start Date</Form.Label>
                    <Form.Control type="name" onChange={(ev) => setStartDate(ev.target.value)} placeholder="Start Date" />
                </Form.Group>
                <Form.Group className="mb-3" controlId="formGroupTime">
                    <Form.Label>Start Time:</Form.Label>
                    <Form.Control type="Start Time" onChange={(e) => setStartTime(e.target.value)} placeholder="StartTime" />
                </Form.Group>
                <Form.Group className="mb-3" controlId="formGroupTime">
                    <Form.Label>Duration:</Form.Label>
                    <Form.Control type="Duration" onChange={(eb) => setDuration(eb.target.value)} placeholder="Duration" />
                </Form.Group>
                <Form.Group className="mb-3" controlId="formGroupTime">
                    <Form.Label>Promo Details:</Form.Label>
                    <Form.Control type="Promo Details" onChange={(eb) => setPromotionalDetails(eb.target.value)} placeholder="Duration" />
                </Form.Group>


            </Form>
            <input
                type="file"
                onChange={(e) => {
                    setImageSelected(e.target.files[0]);
                }}
            />
            {
                imageSelected.length !== 0 ? <SubmitButton imageSelected={imageSelected}
                    eventName={eventName}
                    eventType={eventType}
                    eventPrice={eventPrice}
                    startDate={startDate}
                    startTime={startTime}
                    duration={duration}
                    promotionalDetails={promotionalDetails}
                    venue_id={venue_id}
                    isActive={'true'}
                    userId={userId} />
                    :
                    ''
            }

        </div>
    )
}
