import React, { useState, useEffect } from 'react'
import { Carousel } from 'react-bootstrap';
import LoginButton from '../components/Buttons/LoginButton';
import LogoutButton from '../components/Buttons/LogoutButton';
import SignUpButton from '../components/Buttons/SignUpButton';
import Footer from '../components/layout/Footer';
import setHeaders from '../setHeaders';
import { useStateValue } from '../state';



export default function HomePage() {

    const timeInterval = 1000
    const logo = "https://unsplash.com/photos/hTv8aaPziOQ"

    const [{ userRole, username }, dispatch] = useStateValue();


    const [eventArray, setEventArray] = useState([])


    // TODO FETCH FROM THE EVENTS TABLE AND RETURN 

    useEffect(() => {

        fetch(`http://venu.com.local:3001/events`, {
            headers: setHeaders(),
        })

            .then(response => response.json())

            .then(response => setEventArray(response))
    }, [])




    return (

        <div className='d-flex flex-column'>
            <div className='container d-flex justify-content-between align-items-center'>
                {/* TODO REQUIRES STYLING */}
                <LoginButton />
                <h1>VEN-U</h1>
                <SignUpButton />

            </div>

            {/* TODO FIX VISUAL BUG WHEN SLIDES TRANSITION */}
            <div className="align-self-center">
                <Carousel fade >

                    {eventArray.splice(0, 6).map((event, key) => {


                        return < Carousel.Item interval={key === 0 ? 2 * timeInterval : timeInterval}>
                            {console.log('event', event.promotional_details)}
                            <img
                                className="d-block"
                                src={"https://res.cloudinary.com/daydto7f1/image/upload/v1649168588/pexels-photo-1105666_oekgsr.webp"}
                                alt={`${key} slide`}
                                key={key}
                                width="500"
                                height="333"

                            />
                            <Carousel.Caption>
                                <h3>{event.name}</h3>
                                <p>{event.promotional_details}</p>
                            </Carousel.Caption>
                        </Carousel.Item>
                    })
                    }
                </Carousel>
            </div>
            <Footer />

        </div>
    )
}
