import React from 'react';
import { render, screen } from '@testing-library/react';

import DisplayAmenityOptions from '../DisplayAmenityOptions';




describe('DisplayAmenityOptions', () => {

    it('renders amenities as buttons', () => {
        const amenities = [
            // ...
        ];

        render(<DisplayAmenityOptions amenities={amenities} />);

        amenities.forEach((amenity) => {
            const button = screen.getByRole('button', { name: amenity.name });

            expect(button).toBeInTheDocument();
        });
    });
});