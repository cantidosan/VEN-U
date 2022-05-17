import React, { useEffect, useState } from 'react'
import Image from 'react-bootstrap/Image'
import venuesMockData from '../venuesMockData.json'
import { Carousel } from 'react-bootstrap';
import eventsListMockData from '../eventsListMockData.json'
import eventPicsMockData from '../mock_data_jsons/event_pics_mock_data.json'
import setHeaders from '../setHeaders';
import { useParams } from 'react-router-dom';

//  THIS COMPONENT WILL DISPLAY EVENT PHOTOS
//  AFTER FETCHING FROM EVENTS TABLE
//
//
//
export default function DisplayEventImage() {


    const params = useParams();

    const [imageArray, setImageArray] = useState([])
    // TODO MODIFY events,venue_pictures tables as the current URLs are invalid.

    useEffect(() => {

        fetch(`http://venu.com.local:3001/pictures/events/${params.event_id}`, {
            headers: setHeaders(),
        })

            .then(response => response.json())

            .then(response => setImageArray(response))
    }, [])

    // console.log('image obg', imageArray[0].pic_url)

    return (


        <Carousel>

            {imageArray.map((image, key) => {

                return <Carousel.Item>
                    <img
                        className="d-block w-100"
                        // src={image.pic_url}
                        src="https://images.unsplash.com/photo-1429962714451-bb934ecdc4ec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
                        alt="First slide"
                        key={key}
                    />

                    <Carousel.Caption>
                        <h3>{image.url}</h3>
                        <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
                    </Carousel.Caption>
                </Carousel.Item>
            })
            }

        </Carousel>



    )
}
