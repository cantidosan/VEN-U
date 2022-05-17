import React from 'react'
import { Button } from 'react-bootstrap'

export default function DisplayAmenityOptions(props) {

    const { amenities } = props;
    // console.log('display mamen opt', amenities)

    return (

        <div>
            {amenities.map((amenity, key) =>

                <Button key={key} variant="primary">{amenity.name}</Button>
            )}

        </div>
    )
}
