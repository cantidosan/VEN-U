import React, { useState, useEffect } from 'react'
import { DropdownButton, ButtonGroup, Dropdown } from 'react-bootstrap'
import { useStateValue } from '../state';
import AmenityOptionsList from './AmenityOptionsList'
import DisplayAmenityOptions from './DisplayAmenityOptions/DisplayAmenityOptions'
import { useLocation } from 'react-router-dom'

// TODO CONNECT TO USER ROLE

export default function Amenities(props) {

    const { venue_id } = props;
    const location = useLocation();
    const [amenities, setAmenities] = useState([])

    const [{ userRole, username }, dispatch] = useStateValue();

    console.log('amenities', amenities)
    // const [isAmenityAvailable, setIsAmenityAvailable] = useState(false);

    // const [amenityAvailability, setAmenityAvailability] = useState([]);




    useEffect(() => {

        fetch(`http://venu.com.local:3001/amenities/${venue_id}`)

            .then(response => response.json())

            .then(response => setAmenities(response))


    }, [venue_id])

    const onAmenityChange = (newAmenity) => {

        setAmenities(newAmenity)
    }



    if (location.pathname.match("edit") || (location.pathname.match("create") && userRole === 'HOST')) {

        return (
            <AmenityOptionsList amenities={amenities} onAmenityChange={onAmenityChange} />
        )
    }
    return (

        <DisplayAmenityOptions amenities={amenities} />

    )
}
