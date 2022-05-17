import React from "react";
import { Button } from "react-bootstrap";
import LoginPage from "../../pages/LoginPage";
import { useNavigate } from "react-router-dom";

export default function LoginButton() {

    let navigate = useNavigate();

    const handleClick = () => {
        navigate('/login')
    }

    return (
        <div>
            <Button onClick={handleClick} variant="success">Login</Button>{''}
        </div>
    )
}
