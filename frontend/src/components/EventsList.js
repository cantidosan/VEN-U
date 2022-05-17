import React, { useState, useEffect } from 'react'
import ImageListSortButtons from './Buttons/ImageListSortButtons'
import { CardGroup } from 'react-bootstrap'
import EventGalleryImage from './EventGalleryImage'
import eventsListMockData from '../eventsListMockData.json'
import eventsMockData from '../mock_data_jsons/events_mock_data.json'
import { Container } from 'react-bootstrap'
import { useNavigate } from "react-router-dom";
import setHeaders from '../setHeaders'
import { useStateValue } from '../state';
//   HANDLE RENDERING THE IMAGES PULLED FROM THE IMAGE HOSTING SITE
//   THIS COMPONENT SHOULD ACCEPT A RESPONSE OBJECT OF A LIST OF EVENTS
//   
//​
// 0: Object { name: "Squirrel, malabar", location: "59805 Nancy Court", imgSrc: "url", … }
// 1: Object { name: "Cottonmouth", location: "236 Harbort Terrace", imgSrc: "url", … }

export default function EventsList() {

    let navigate = useNavigate();

    const [events, setEvents] = useState([])
    const [{ userRole, username }, dispatch] = useStateValue();

    useEffect(() => {

        // setEvents(eventsMockData)

        fetch(`http://venu.com.local:3001/events`, {
            headers: setHeaders(),
        })

            .then(response => response.json())

            .then(response => setEvents(response))
    }, [])


    // useEffect(() => {

    //     setEvents(eventsMockData)

    // })
    console.log(events)


    // TO DO: FETCH FROM event TAble and set response to local variable for mapping

    return (
        <div className='container d-flex flex-column '>


            <ImageListSortButtons />

            <div className='d-flex flex-row flex-wrap mt-5 justify-content-center'>

                {events.map((event, key) =>

                    // if (key < 8) {
                    //     return <GalleryImage imgSrc={event.imgSrc}
                    //         key={key}
                    //         location={event.location}
                    //         name={event.name} />
                    // }
                    // else {
                    //     return ''
                    // }
                    key < 8 && <EventGalleryImage imgSrc={event.pic_url}
                        key={key}
                        location={event.location}
                        name={event.name}
                        eventId={event.id} />

                )}

            </div>
            <nav aria-label="Page navigation example">
                <ul className="pagination">
                    <li className="page-item"><a className="page-link" href="#">Previous</a></li>
                    <li className="page-item"><a className="page-link" href="#">1</a></li>
                    <li className="page-item"><a className="page-link" href="#">2</a></li>
                    <li className="page-item"><a className="page-link" href="#">3</a></li>
                    <li className="page-item"><a className="page-link" href="#">Next</a></li>
                </ul>
            </nav>


        </div>
    )
}
