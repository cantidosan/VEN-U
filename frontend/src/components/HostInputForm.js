import React, { useState, useEffect } from 'react'
import UploadButton from './Buttons/UploadButton'
import AmenitiesSetup from './AmenitiesSetup'
import { Form } from 'react-bootstrap'
import SubmitButton from '../components/Buttons/SubmitButton'
import setHeaders from '../setHeaders'
import { useStateValue } from '../state';


export default function HostInputForm() {

    const [venueName, setVenueName] = useState([])
    const [venueLocation, setVenueLocation] = useState([])
    const [venuePrice, setVenuePrice] = useState([])
    const [user_id, setUserId] = useState([]);
    const [{ userRole, username }, dispatch] = useStateValue();

    console.log('', user_id)

    // console.log('user_id', user_id)

    // const handleSubmit = async (e) => {

    //     e.preventDefault();

    // const res = await fetch(`http://venu.com.local:3001/venues`, {

    //     method: 'PUT',
    //     // credentials: 'same-origin',
    //     credentials: 'include',
    //     // withCredentials: true,
    //     header: setHeaders(),

    //     body: JSON.stringify({
    //         "venueName": venueName,
    //         "venueLocation": venueLocation,
    //         "venuePrice": venuePrice,
    //         "host_id": user_id,
    //         "created_at": new Date(),
    //         "updated_at": null,
    //         "is_active": true
    //     }),


    // });

    // console.log('response obj', res)
    //TODO ON CONDITION OF THE RESPONSE OBJECT WE"LL NAVIGATE TO THE VENUE DETAILS PAGE .

    useEffect(() => {

        const getUserInfo = async () => {

            const userInfoResponse = await fetch(`http://venu.com.local:3001/users/${username}`, {
                header: setHeaders(),

            })
            const userInfoObject = await userInfoResponse.json();
            console.log('userInfoObject', userInfoObject)
            setUserId(userInfoObject)
        }
        getUserInfo();


    }, [])

    // console.log("userId host input form", userID)
    // BASED ON THE RES OBJECT WE"LL REDIRECT TO THE DETAILSP PAGE
    return (

        <div> HostInputForm

            <Form>
                <Form.Group className="mb-3" controlId="formGroupName">
                    <Form.Label>Venue Name</Form.Label>
                    <Form.Control type="name" onChange={(event) => setVenueName(event.target.value)} placeholder="Enter name" />
                </Form.Group>
                <Form.Group className="mb-3" controlId="formGroupLocation">
                    <Form.Label>Location</Form.Label>
                    <Form.Control type="location" onChange={(eve) => setVenueLocation(eve.target.value)} placeholder="Location" />
                </Form.Group>
                <Form.Group className="mb-3" controlId="formGroupPrice">
                    <Form.Label>Price</Form.Label>
                    <Form.Control type="price" onChange={(e) => setVenuePrice(e.target.value)} placeholder="price" />
                </Form.Group>
                {/* <AmenitiesSetup /> */}
                <UploadButton venueName={venueName} venuePrice={venuePrice} venueLocation={venueLocation} userId={user_id} />
                {/* <DeleteImageButton /> */}
                {/* <SubmitButton /> */}
            </Form>

        </div>
    )

}