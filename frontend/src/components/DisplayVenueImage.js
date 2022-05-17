import React, { useEffect, useState } from 'react'
import Image from 'react-bootstrap/Image'
import venuesMockData from '../venuesMockData.json'
import { Carousel } from 'react-bootstrap';
import eventsListMockData from '../eventsListMockData.json'
import eventPicsMockData from '../mock_data_jsons/event_pics_mock_data.json'
import { useParams } from 'react-router-dom';

//  THIS COMPONENT WILL DISPLAY EVENT PHOTOS
//  AFTER FETCHING FROM EVENTS TABLE
//
//
//
export default function DisplayVenueImage(props) {


    const params = useParams();

    const [imageArray, setImageArray] = useState([])

    //FETCH HERE
    useEffect(() => {

        fetch(`http://venu.com.local:3001/pictures/venues/${params.venue_id}`)

            .then(response => response.json())

            .then(response => setImageArray(response))
    }, [])

    console.log('image obg', imageArray)

    return (


        <Carousel>

            {
                imageArray.map((image, key) => {
                    console.log('imageArray', image.pic_url)
                    return <Carousel.Item>
                        <img
                            className="d-block w-100"
                            src={image.pic_url}
                            alt="First slide"
                            key={image.pic_url}
                        />
                        <Carousel.Caption>
                            <h3> First slide label </h3>
                            < p > Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
                        </Carousel.Caption>
                    </Carousel.Item>
                })
            }

        </Carousel>



    )
}
