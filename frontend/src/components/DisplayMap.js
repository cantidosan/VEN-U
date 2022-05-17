import React, { useRef, useEffect, useState } from 'react'
import { Figure } from 'react-bootstrap'
import 'mapbox-gl/dist/mapbox-gl.css';
import mapboxgl from 'mapbox-gl';


// THIS FUNTION WILL BE PASSED A GEOGRAPHIC LOCATION
// AND SHOULD RENDER A GOOGLEMAPS LIKE IMAGE SHOWING THE LOCAITON
// USE MAPBOX

export default function DisplayMap(props) {

    const { location } = props;


    const encodedLocation = encodeURI(location);


    const mapContainer = useRef(null);
    const map = useRef(null);

    const [lng, setLng] = useState(-70.9);
    const [lat, setLat] = useState(42.35);
    const [zoom, setZoom] = useState(13);



    mapboxgl.accessToken = 'pk.eyJ1IjoiY2FudGlkb3NhbiIsImEiOiJja3RxM3I2aG0wc3ZiMm9ycnJzaWdwM3Z3In0.SKUoZQmoZ8aec4XKYcdW4A';

    useEffect(() => {


        fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${encodedLocation}.json?access_token=pk.eyJ1IjoiY2FudGlkb3NhbiIsImEiOiJja3RxM3I2aG0wc3ZiMm9ycnJzaWdwM3Z3In0.SKUoZQmoZ8aec4XKYcdW4A`)

            .then(response => response.json())
            // .then(response => console.log(response.features[0].center[0]))
            .then(response => {

                setLng(response.features[0].center[0])
                setLat(response.features[0].center[1])

            })



        // setLat(response.features[0].center[0])
        // setLng(response.features[0].center[1])




        if (!map.current) {

            map.current = new mapboxgl.Map({

                container: mapContainer.current,
                style: 'mapbox://styles/mapbox/streets-v11',
                center: [lng, lat],
                zoom: zoom

            });

        }
        else {

            map.current.setCenter([lng, lat]);

        }



    }, [lng, lat])



    // const map = new mapboxgl.Map({
    //     container: 'map', // container ID
    //     style: 'mapbox://styles/mapbox/streets-v11', // style URL
    //     center: [-74.5, 40], // starting position [lng, lat]
    //     zoom: 9 // starting zoom

    // });





    return (

        <div>
            <div ref={mapContainer} className="map-container" />

            {/* <Figure>
                <Figure.Image src={"https://res.cloudinary.com/daydto7f1/image/upload/c_thumb,w_200,g_face/v1649430194/maps_cip2is.png"}
                    className=""
                    width={600}
                    height={400}
                    alt="171x180"
                />

                </Figure> */}


        </div>



    )

}