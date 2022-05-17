import React from 'react'
import DisplayMap from './DisplayMap'
import MakeBidButton from './Buttons/MakeBidButton';
import EditButton from './Buttons/EditButton';
import AcceptEventButton from './Buttons/AcceptEventButton';
import RejectEventButton from './Buttons/RejectEventButton';
import { Container, Col, Row } from 'react-bootstrap';
import PurchaseButton from './Buttons/PurchaseButton';
import { useStateValue } from '../state';

export default function EventDetails(props) {

    const [{ userRole, username }, dispatch] = useStateValue();
    const { event } = props;
    // console.log('event ', typeof (event))

    const {

        id,
        name,
        location,
        entry_price,
        type,
        venue_id,
        bookee_id,


    } = event;







    // const { name, location, id, date, imgSrc, entry_price } = event;


    return (
        <div className='d-flex justify-content-around'>
            <Container className=' d-flex  justify-content-evenly'>
                <Col className=' d-flex flex-column justify-content-evenly'>
                    <Row className="justify-content-center">
                        {name}
                    </Row>
                    <Row className="justify-content-center">

                        {entry_price}

                    </Row>
                    <Row className="justify-content-center">

                        {location}
                    </Row>
                    <Row>
                        {/* THE BUTTONS BELOW ARE RENDERED CONDITIONALLY */}

                        {userRole === 'HOST' ? <AcceptEventButton role={userRole} /> : ''}
                        {userRole === 'HOST' ? <RejectEventButton role={userRole} /> : ''}

                        {/*userRole === 'BOOKEE' ? <MakeBidButton role={userRole} /> : '' */}
                        {userRole === 'BOOKEE' ? <EditButton role={userRole} /> : ''}


                        {userRole === 'CUSTOMER' ? <PurchaseButton role={userRole} /> : ''}

                    </Row>

                </Col>

            </Container >

            <Container>

                <DisplayMap location={location} />

            </Container>

        </div >


    )
}
