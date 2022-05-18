import React, { useState, useEffect } from 'react'
import { Button } from 'react-bootstrap';
import setHeaders from '../../setHeaders';
// import AmenitiesSetup from '../AmenitiesSetup';
import axios from '../../utils/axios'
import { useNavigate } from 'react-router-dom'
import { Dropdown, DropdownButton, ButtonGroup } from 'react-bootstrap';

// THIS COMPONENT ONLY HANDLES POSTING THE IMAGE TO THE CLOUD HOST(CLOUDINARY)
export default function UploadButton(props) {

    const { venueName, venueLocation, venuePrice, userId } = props;

    let navigate = useNavigate();
    const [venueId, setVenueId] = useState([]);

    const [imageLink, setImageLink] = useState([]);
    const [amenities, setAmenities] = useState([]);
    const [isActive, setIsActive] = useState(true);
    const [isAmenityAvailable, setIsAmenityAvailable] = useState(false);

    const dateNow = new Date();
    const createdAt = new Date();

    console.log('userId', userId)

    const [imageSelected, setImageSelected] = useState([])
    console.log('image selected', imageSelected)
    console.log('venueId ', venueId)

    useEffect(() => {

        fetch(`http://venu.com.local:3001/amenities`, {

            headers: setHeaders(),
        })

            .then(response => response.json())

            .then(response => setAmenities(response))
    }, [])
    const onAmenityChange = (newAmenity) => {

        setAmenities(newAmenity)
    }
    function updateAmenities(newAmenity) {



        const newAmenities = [...amenities]; // make a new copy to ensure new render cycle triggered when setting
        const amenityNdx = amenities.findIndex((amenity) => amenity.name === newAmenity.name);

        // .findIndex() returns -1 if not found
        if (amenityNdx >= 0) {
            // remove the 1 amenity in the array at `amenityNdx`
            // and replace with `newAmenity`
            newAmenities.splice(amenityNdx, 1, newAmenity);
            // or: newAmenities[amenityNdx] = newAmenity;
        }

        // onAmenityChange(newAmenities)
        onAmenityChange(newAmenities)
        setIsAmenityAvailable()

    }
    function handleIsAmenityAvailable(amenity, value) {



        switch (amenity.name) {

            case 'parking':
                updateAmenities({ ...amenity, availability: value });
                break;
            case 'blankets':
                updateAmenities({ ...amenity, availability: value });
                break;
            case 'food':

                updateAmenities({ ...amenity, availability: value });
                break;
            case 'Electricity':
                updateAmenities({ ...amenity, availability: value });
                break;
            case 'WiFi':
                updateAmenities({ ...amenity, availability: value });
                break;
            default:



        }
    }

    const handleUpload = async () => {

        // console.log('userIdddd', userId.id)
        // const [host_id] = userId.id

        // console.log('id', host_id)
        // FORM DATA TO DB THEN WITH ID RETURNED PICTURE DATA TO WEBHOST AND WITH URL RETURN POST URL AND ID TO RESPECTIVE DB TABLES

        // });
        const res = await axios.post('/venues',
            {
                data:
                {
                    "venueName": venueName,
                    "venueLocation": venueLocation,
                    "venuePrice": venuePrice,
                    "host_id": userId.id,
                    "is_active": isActive
                }
            })



        console.log('venueId Response VALID', res.data[0].id)

        setVenueId(res.data[0].id)
        console.log('venueId after init setter ', venueId)
        amenities.map((amenity, key) => {

            console.log('amenity #', amenity)

            return axios.post(`/amenities/${res.data[0].id}`,
                {
                    data:
                    {
                        "id": amenity.id,
                        "is_active": amenity.availability
                    }
                })



        })



        const formData = new FormData();
        formData.append("file", imageSelected)
        formData.append("upload_preset", "qbjfqx59")
        console.log('form data', formData)
        const response = await fetch('https://api.cloudinary.com/v1_1/daydto7f1/auto/upload', {

            method: 'POST',

            body: formData


        })
        // console.log('response', response)
        const cloudinaryObj = await response.json()
        // console.log('cloudinary obj', cloudinaryObj.url)
        setImageLink(cloudinaryObj.url)
        // console.log('imageLink', imageLink)

        //TODO POST THE VENUE DETAILS ALONG WITH THE 
        //PICTURE URL TO THE VENUE PICTURES TABLE

        // console.log('venueId before picture post', venueId)
        const combinedUrl = `/pictures/venues/${res.data[0].id}`
        console.log('image link', imageLink)
        const venuesPicturesResponse = await axios.post(combinedUrl, {


            data: { "imageLink": cloudinaryObj.url, "isActive": isActive }
            // JSON.stringify({ formData })

        })

        console.log('venuesPIcturesResponse', venuesPicturesResponse)
        const combinedUrlNavigate = `/venues/${res.data[0].id}`
        if (!!venuesPicturesResponse) {
            console.log('venue Id before navigate', combinedUrlNavigate)
            navigate(combinedUrlNavigate)
        }
        // const venuesPicObject = await venuesPicturesResponse.json();
        //TODO INFORM AND NAVIGATE USER BASED ON THE VENUES_PICTURES_RESPONSE OBJECT

    }







    return (
        <div>
            {amenities.map((amenity, key) =>

                < DropdownButton

                    as={ButtonGroup}
                    key={amenity.name}
                    id={`dropdown-amenitys-${amenity.name}`}
                    amenity={amenity.name}
                    title={amenity.name}

                >

                    <Dropdown.Item eventKey="1"
                        value='yes'
                        active={amenity.availability}

                        onClick={() => handleIsAmenityAvailable(amenity, true)} >Yes</Dropdown.Item>
                    <Dropdown.Item eventKey="2"
                        active={!amenity.availability}
                        onClick={() => handleIsAmenityAvailable(amenity, false)} >No</Dropdown.Item>

                </DropdownButton>
            )
            }


            <input
                type="file"
                onChange={(e) => {
                    setImageSelected(e.target.files[0]);
                }}
            />

            <Button type="button" onClick={handleUpload} variant="primary" size="mb-2">Submit</Button>

        </div>
    )
}
