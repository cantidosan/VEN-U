import React, { useState, useEffect } from 'react'
import { Form, Button } from 'react-bootstrap'
import { useNavigate } from 'react-router-dom'
import { useStateValue } from '../state';

export default function LoginPage() {

    const [username, setUsername] = useState([])
    const [password, setPassword] = useState([])
    const navigate = useNavigate();
    const [{ userRole }, dispatch] = useStateValue();

    const handleSubmit = async (e) => {

        e.preventDefault();

        // const data = new FormData(e.target);
        // formData.append("username", username)
        // formData.append("password", password)

        const res = await fetch("http://venu.com.local:3001/login", {

            method: 'POST',
            // credentials: 'same-origin',
            credentials: 'include',
            // withCredentials: true,
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
                // 'Access-Control-Allow-Origin': '*'

            },

            body: JSON.stringify({
                "username": username,
                "password": password

            }),


        });
        // WE HAVE ACCESS TO BOTH THE PASSPORT OBJECT AND THE COOKIE CREATED
        const response = await res.json();

        const { user, session, sessionId, id } = response;

        const { user_type } = user;
        // const { sessionId } = response.sessionID


        switch (user_type) {
            case 'HOST':

                dispatch({ type: 'userRole', payload: user_type });
                dispatch({ type: 'loginState', payload: true });
                dispatch({ type: 'username', payload: username });
                dispatch({ type: 'userID', payload: id });


                localStorage.setItem('sessionId', sessionId);
                navigate('/venues')

                break;
            case 'BOOKEE':
                dispatch({ type: 'userRole', payload: user_type });
                dispatch({ type: 'loginState', payload: true });
                dispatch({ type: 'username', payload: username });
                dispatch({ type: 'userID', payload: id });


                localStorage.setItem('sessionId', sessionId);
                navigate('/venues')
                break;

            case 'CUSTOMER':
                dispatch({ type: 'userRole', payload: user_type });
                dispatch({ type: 'loginState', payload: true });
                dispatch({ type: 'username', payload: username });
                dispatch({ type: 'userID', payload: id });

                localStorage.setItem('sessionId', sessionId);
                navigate('/events')
                break;

            default:
                //TODO  Possible window alert notifying incorrect login creds
                navigate('/login')
        }

    }

    return (

        <div className=' container d-flex flex-column'>

            <div >
                <h1 >VEN-U</h1>
            </div>

            <Form onSubmit={handleSubmit}>

                <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                    <Form.Label>Username</Form.Label>
                    <Form.Control name="username" type="text" onChange={(event) => setUsername(event.target.value)} placeholder="Enter username here" />
                </Form.Group>

                <Form.Group className="mb-3" controlId="exampleForm.ControlTextarea1">
                    <Form.Label>Password</Form.Label>
                    <Form.Control type="password" name="password" onChange={(eve) => setPassword(eve.target.value)} placeholder="password" />
                </Form.Group>
                <Button type="submit" >Submit</Button>
            </Form>


        </div>
    )
}
