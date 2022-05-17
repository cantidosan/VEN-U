import React from 'react'
import { Button } from 'react-bootstrap'
import { useStateValue } from '../../state';



export default function PurchaseButton() {


    const [{ userRole }, dispatch] = useStateValue();



    return (
        <Button> Purchase</Button>
    )

}
