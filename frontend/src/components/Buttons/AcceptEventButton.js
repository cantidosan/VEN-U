import React from 'react'
import { Button } from 'react-bootstrap'
import { useNavigate } from 'react-router-dom'
import { useLocation } from 'react-router-dom';
import { useStateValue } from '../../state';


export default function AcceptEventButton() {

    let navigate = useNavigate();
    let location = useLocation();
    let newUrl = `${location.pathname}`



    return (

        <Button onClick={() => { navigate(`${newUrl}`) }}>Accept</Button>
    )
}



