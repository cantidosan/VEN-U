import React from 'react'
import { Card, CardGroup } from 'react-bootstrap'
import { useNavigate } from "react-router-dom";




export default function EventGalleryImage(props) {

    ///  THIS WILL ACCEPT OBJECT DATA SUCH AS EVENTS OR VENUES AND DISPLAY IT
    ///   IN A PREDETERMINED PATTERN.

    let navigate = useNavigate();

    const { imgSrc,
        location,
        price,
        name,
        eventId,
        event_type,
    } = props;

    const handleClick = () => {


        navigate(`/events/${eventId}`)

    }



    return (

        <CardGroup className='m-2 '>
            <Card className='flex ' onClick={handleClick} >
                <Card.Img variant="top" src={imgSrc} />
                <Card.Body className='text-wrap' >
                    <Card.Title>{name}</Card.Title>
                    <Card.Text className='text-wrap'>
                        {price}
                    </Card.Text>
                </Card.Body>
                <Card.Footer>
                    <small className="text-muted">{event_type}</small>
                </Card.Footer>
            </Card>

        </CardGroup>



    )
}
