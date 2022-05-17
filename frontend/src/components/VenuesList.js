import React, { useEffect } from 'react'
import ImageListSortButtons from './Buttons/ImageListSortButtons'
import { useState } from 'react'
import { CardGroup } from 'react-bootstrap'
import VenueGalleryImage from './VenueGalleryImage'
import { useStateValue } from '../state';


import setHeaders from '../setHeaders'


export default function VenuesList() {

    const sessionId = window.localStorage.getItem('sessionId');

    const [venues, setVenues] = useState([])
    const [{ userRole, username }, dispatch] = useStateValue();


    useEffect(() => {

        fetch(`http://venu.com.local:3001/venues`, {

            headers: setHeaders(),
        })

            .then(response => response.json())

            .then(response => setVenues(response))

    }, [])

    // useEffect(() => {

    //     setVenues(venuesMockData)

    // })

    return (
        <div className='container d-flex flex-column '>

            <ImageListSortButtons />

            <CardGroup>

                {venues.map((venue, key) =>
                (

                    key < 8 && <VenueGalleryImage imgSrc={venue.pic_url}
                        key={key} location={venue.location}
                        name={venue.name} price={venue.price} venue_id={venue.id} />
                )

                )}

            </CardGroup>
            <div>
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

        </div>
    )
}
