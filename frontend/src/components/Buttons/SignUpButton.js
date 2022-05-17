import React from 'react'
import { Button } from 'react-bootstrap'
import { useNavigate } from 'react-router-dom';

export default function SignUpButton() {

    let navigate = useNavigate();

    const handleClick = () => {

        navigate('/signup')
    }
    return (
        <div>
            <Button onClick={handleClick} variant="success">SignUp</Button>{''}
        </div>
    )
}
