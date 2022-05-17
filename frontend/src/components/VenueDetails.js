import React from 'react'
import DisplayMap from './DisplayMap'
import MakeBidButton from './Buttons/MakeBidButton';
import EditButton from './Buttons/EditButton';
import AcceptEventButton from './Buttons/AcceptEventButton';
import RejectEventButton from './Buttons/RejectEventButton';
import { Container, Col, Row } from 'react-bootstrap';
import PurchaseButton from './Buttons/PurchaseButton';
import { useStateValue } from '../state';

// COMPONENT SHOULD ONLY ACCEPT ONE VENUE OBJECT MAX AS A PROP

export default function VenueDetails(props) {

    const { venue } = props;
    const { name, id, price, location } = venue[0];
    const [{ userRole, username }, dispatch] = useStateValue();

    console.log('venue prop', venue)

    return (

        <div className='d-flex justify-content-around'>

            <Container className=' d-flex  justify-content-evenly'>

                <Col className=' d-flex flex-column justify-content-evenly'>

                    <Row>
                        {name}
                    </Row>

                    <Row className="justify-content-center">

                        {price}

                    </Row>

                    <Row className="justify-content-center">

                        {location}
                    </Row>

                    <Row className="justify-space-between">

                        {userRole === 'BOOKEE' ? <MakeBidButton id={id} /> : ''}

                        {userRole === 'HOST' ? <EditButton /> : ''}



                    </Row>

                </Col>

            </Container >

            <Container>

                <DisplayMap location={location} />

            </Container>

        </div >
    )
}
