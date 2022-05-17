import React from 'react'
import { Card, CardGroup } from 'react-bootstrap'
import { useNavigate } from "react-router-dom";




export default function VenueGalleryImage(props) {

    ///  THIS WILL ACCEPT OBJECT DATA SUCH AS EVENTS OR VENUES AND DISPLAY IT
    ///   IN A PREDETERMINED PATTERN.

    let navigate = useNavigate();

    const { imgSrc, location, price, name, venue_id, id } = props;

    const handleClick = () => {

        console.log('props', props)
        navigate(`/venues/${venue_id}`)

    }

    console.log('Image Sources:', imgSrc)

    return (

        <CardGroup className='m-2 '>
            <Card className='flex ' onClick={handleClick} >
                <Card.Img variant="top" src={imgSrc} />
                <Card.Body className='text-wrap' >
                    <Card.Title>{name}</Card.Title>
                    <Card.Text className='text-wrap'>
                        This is a wider card with supporting
                    </Card.Text>
                </Card.Body>
                <Card.Footer>
                    <small className="text-muted">Last updated 3 mins ago</small>
                </Card.Footer>
            </Card>

        </CardGroup>



    )
}
