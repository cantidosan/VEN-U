// import React, { useEffect, useState } from 'react'
// import setHeaders from '../setHeaders';
// import { Dropdown, DropdownButton, ButtonGroup } from 'react-bootstrap';

// // THIS COMPONENT RENDERS ALL AVAILABLE AMENITIES AND MAKES THEM SUBJECT TO CHANGE
// //
// //
// //
// //
// function AmenitiesSetup() {

//     const [amenities, setAmenities] = useState([]);
//     const [isAmenityAvailable, setIsAmenityAvailable] = useState(false);

//     useEffect(() => {

//         fetch(`http://venu.com.local:3001/amenities`, {

//             headers: setHeaders(),
//         })

//             .then(response => response.json())

//             .then(response => setAmenities(response))
//     }, [])

//     const onAmenityChange = (newAmenity) => {

//         setAmenities(newAmenity)
//     }

//     function updateAmenities(newAmenity) {



//         const newAmenities = [...amenities]; // make a new copy to ensure new render cycle triggered when setting
//         const amenityNdx = amenities.findIndex((amenity) => amenity.name === newAmenity.name);
//         console.log('amenities inside updt amenities', newAmenities)
//         // .findIndex() returns -1 if not found
//         if (amenityNdx >= 0) {
//             // remove the 1 amenity in the array at `amenityNdx`
//             // and replace with `newAmenity`
//             newAmenities.splice(amenityNdx, 1, newAmenity);
//             // or: newAmenities[amenityNdx] = newAmenity;
//         }
//         console.log('updated Amenities', newAmenities)
//         onAmenityChange(newAmenities)
//         setIsAmenityAvailable()

//     }
//     function handleIsAmenityAvailable(amenity, value) {



//         switch (amenity.name) {

//             case 'parking':
//                 updateAmenities({ ...amenity, availability: value });
//                 break;
//             case 'blankets':
//                 updateAmenities({ ...amenity, availability: value });
//                 break;
//             case 'food':

//                 updateAmenities({ ...amenity, availability: value });
//                 break;
//             case 'Electricity':
//                 updateAmenities({ ...amenity, availability: value });
//                 break;
//             case 'WiFi':
//                 updateAmenities({ ...amenity, availability: value });
//                 break;
//             default:



//         }
//     }

//     return (

//         <div>
//             {amenities.map((amenity, key) =>

//                 < DropdownButton

//                     as={ButtonGroup}
//                     key={amenity.name}
//                     id={`dropdown-amenitys-${amenity.name}`}
//                     amenity={amenity.name}
//                     title={amenity.name}

//                 >

//                     <Dropdown.Item eventKey="1"
//                         value='yes'
//                         active={amenity.availability}

//                         onClick={() => handleIsAmenityAvailable(amenity, true)} >Yes</Dropdown.Item>
//                     <Dropdown.Item eventKey="2"
//                         active={!amenity.availability}
//                         onClick={() => handleIsAmenityAvailable(amenity, false)} >No</Dropdown.Item>

//                 </DropdownButton>
//             )
//             }

//         </div >

//     )
// }

// export default AmenitiesSetup