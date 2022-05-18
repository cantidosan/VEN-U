import React, { useEffect, useState } from 'react'
import { Button } from 'react-bootstrap'
import axios from '../../utils/axios'
import { useNavigate } from 'react-router-dom'
export default function SubmitButton(props) {

    const [imageLink, setImageLink] = useState([]);
    const [eventId, setEventId] = useState([]);
    const [userInfo, setUserInfo] = useState([]);


    console.log(eventId)

    let navigate = useNavigate();

    const {
        imageSelected,
        eventName,
        eventLocation,
        eventPrice,
        startDate,
        eventType,
        startTime,
        duration,
        promotionalDetails,
        venue_id,
        isActive,
        userId
    } = props

    const formData = new FormData();
    formData.append("file", imageSelected)
    formData.append("upload_preset", "qbjfqx59")

    useEffect(() => {

        axios.post('/events', {
            data: {
                eventName,
                eventLocation,
                eventPrice,
                startDate,
                startTime,
                duration,
                userId,
                eventType,
                promotionalDetails,
                venue_id,
                isActive,

            }
        })
            .then((response) => setEventId(response.data.id))
            .then(axios.post('https://api.cloudinary.com/v1_1/daydto7f1/auto/upload', {

                data: {
                    formData

                }

            }))
            .then(response => setImageLink(response.data.url))
            .then(axios.post(`/pictures/events/${eventId}`, {
                data: {
                    "pic_url": imageLink,
                }
            }))

    }, [])


    // const res = axios.post('/events', {
    //     data: {
    // eventName,
    // eventLocation,
    // eventPrice,
    // startDate,
    // startTime,
    // duration,
    // promotionalDetails,
    // venue_id,
    // isActive

    //     }
    // })



    return (
        <Button type="submit">Submit</Button>
    )

}