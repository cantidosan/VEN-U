import React, { useState } from 'react';
import { fireEvent, render, screen } from '@testing-library/react';
import AmenityOptionsList from '../AmenityOptionsList';



describe('AmenityOptionsList', () => {

    // const amenities = [
    //     {
    //         "amenity_name": "Parking",
    //         "venue_id": 3,
    //         "availability": false
    //     },
    //     {
    //         "amenity_name": "Blankets",
    //         "venue_id": 3,
    //         "availability": false
    //     },
    //     {
    //         "amenity_name": "Food",
    //         "venue_id": 2,
    //         "availability": true
    //     },
    //     {
    //         "amenity_name": "Electricity",
    //         "venue_id": 7,
    //         "availability": false
    //     },
    //     {
    //         "amenity_name": "WI-Fi",
    //         "venue_id": 6,
    //         "availability": true
    //     }
    // ];

    beforeEach(() => {

    })



    it('renders  button components successfully', () => {

        const amenities = [
            // ...
        ];
        // const onAmenityChange = (newAmenity) => {

        //     setAmenities(newAmenity)

        // }

        render(
            <AmenityOptionsList
                amenities={amenities}

            />)
        amenities.forEach((amenity) => {
            const button = screen.getByRole('button', { name: amenity.name });

            expect(button).toBeInTheDocument();
        });

    });

    it('reveals dropdown options on click', () => {
        // render the dropdown button then click on it
        // assess the state of the dropdown button
        const amenities = [
            // ...
        ];
        // const onAmenityChange = (newAmenity) => {

        //     setAmenities(newAmenity)

        // }

        render(
            <AmenityOptionsList
                amenities={amenities}

            />)
        amenities.forEach((amenity) => {

            const button = screen.getByRole('button', { name: amenity.name });
            fireEvent.click(button);
            expect(screen.getByText("LMAO")).toBeInTheDocument();

        })



    });


    // it('checks button dropdown onclick', () => {
    //     // render the dropdown button then click on it
    //     // assess the state of the dropdown button

    // });








});