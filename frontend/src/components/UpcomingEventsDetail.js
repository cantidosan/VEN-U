import React from 'react'
import { useNavigate, Link } from 'react-router-dom'

export default function UpcomingEventsDetail(props) {

    const { event } = props;
    let navigate = useNavigate();

    // const handleClick = () => {

    //     if (event.isActive) {

    //         navigate(`http://venu.com.local:3000/events/${event.id}`)

    //     }
    //     else {

    //         navigate(`http://venu.com.local:3000/events/${event.id}/edit`)
    //     }

    // }
    const combinedUrl = event.isActive ? `/events/${event.id}` : `/events/${event.id}/edit`;

    return (
        <Link to={combinedUrl} className="list-group-item list-group-item-action d-flex flex-column " aria-current="true">
            <div>

                <div className="d-flex w-100 justify-content-between">
                    <h6 className="mb-1">{event.name}</h6>
                    <small>{event.location}</small>
                    <p className="mb-1 ">Cost:$</p>
                </div>

                <small>Event Date:</small>

            </div>
        </Link>
    )
}
