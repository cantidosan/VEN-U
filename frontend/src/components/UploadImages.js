import React from 'react'
import UploadButton from './Buttons/UploadButton'
import { Figure } from 'react-bootstrap'
import DeleteImageButton from './Buttons/DeleteImageButton'

//TODO INTEGRATE CLOUDINARY UPLOAD FEATURE INTO THIS COMPONENT 
export default function UploadImages() {

    return (



        <Figure>
            <Figure.Image
                width={600}
                height={400}
                alt="171x180"
                src="https://res.cloudinary.com/daydto7f1/image/upload/c_thumb,w_200,g_face/v1649168588/pexels-photo-1105666_oekgsr.webp"
            />
            <Figure.Caption>
                DEFAULT VENUE IMAGE
            </Figure.Caption>

            {/* <UploadButton />
            <DeleteImageButton /> */}

        </Figure>


    )
}
