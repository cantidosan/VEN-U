import React from 'react'
import { Button } from 'react-bootstrap'
import { useNavigate } from 'react-router-dom'
import { useLocation } from 'react-router-dom';
import { useStateValue } from '../../state';

export default function EditButton() {


    let navigate = useNavigate();
    let location = useLocation();
    let newUrl = `${location.pathname}`
    // console.log('location', location.pathname)


    const [{ userRole }, dispatch] = useStateValue();
    //TODO ENSURE THAT WE CHECK IF WE"RE ALREADY ON THE /edit page
    // BEFORE RENDERING BUTTON
    if (location.pathname.match("edit")) {
        return ''
    }
    return (

        <Button onClick={() => navigate(`${newUrl}/edit`)} >Edit</Button>
    )

}
