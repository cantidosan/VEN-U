import React, { useState } from 'react'
import { Button, ButtonGroup } from 'react-bootstrap'
import { useNavigate, useParams, useLocation } from 'react-router-dom'
import { useStateValue } from '../../state';


// TODO ADD functionality to the +Add button first then the others
export default function ImageListSortButtons() {

    let navigate = useNavigate();
    let params = useParams();
    let location = useLocation();

    const [{ userRole, username }, dispatch] = useStateValue();

    //TODO IMPLEMENT IMAGE LIST BUTTON FUNCTIONALITIES

    const venuePageBool = location.pathname.match("venues")

    const combinedUrl = `${location.pathname}/create`;

    return (
        <ButtonGroup aria-label="Basic example" className=" d-flex justify-content-center" >
            <Button variant="secondary">Sort by </Button>
            <Button variant="secondary">Availability</Button>
            <Button variant="secondary">Price</Button>
            <Button variant="secondary">Rating</Button>
            <Button variant="secondary">A-Z</Button>
            {venuePageBool && userRole === 'HOST' ? <Button onClick={() => { navigate(combinedUrl) }} variant="secondary">+Add</Button> : ''}
        </ButtonGroup>

    )
}
