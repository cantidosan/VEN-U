import React from 'react'
import { Button } from 'react-bootstrap'
import { useNavigate } from 'react-router-dom'

import { useStateValue } from '../../state';

export default function MakeBidButton(props) {

    let navigate = useNavigate();
    const [{ userRole }, dispatch] = useStateValue();

    const { id } = props;
    console.log('ID', id)

    return (
        <Button onClick={() => { navigate(`/events/create/${id}`) }}> Make Bid</Button>
    )

}
