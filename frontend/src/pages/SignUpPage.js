import React, { useState, useEffect } from 'react'
import { Form, Button } from 'react-bootstrap'
import setHeaders from '../setHeaders'
import { useNavigate } from 'react-router-dom'


export default function SignUpPage() {

    const [username, setUsername] = useState([])
    const [password, setPassword] = useState([])

    const [userRole, setUserRole] = useState([])
    let navigate = useNavigate();


    const handleSubmit = async () => {


        console.log(userRole)
        const res = await fetch(`http://venu.com.local:3001/signup`, {
            method: 'POST',
            headers: setHeaders(),
            body: JSON.stringify({
                username, password, userRole
            })


        })
        // const resObj = await res.json();
        console.log('response object login', res)
        if (res) {
            navigate('/events')


        }
    }
    return (
        <div>SignUpPage
            <Form>
                <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">

                    <Form.Label>Username</Form.Label>
                    <Form.Control type="username" onChange={(eve) => setUsername(eve.target.value)}
                        placeholder="Enter username here" />

                </Form.Group>

                <Form.Group className="mb-3" controlId="exampleForm.ControlTextarea1">
                    <Form.Label>Password</Form.Label>
                    <Form.Control type="password" onChange={(ev) => setPassword(ev.target.value)}
                        placeholder="password" />
                </Form.Group>

                <Form.Group className="mb-3" controlId="exampleForm.ControlTextarea1">
                    <Form.Label>Role</Form.Label>
                    <Form.Select size="sm" onChange={(e) => setUserRole(e.target.value)}>
                        <option value='HOST'>HOST</option>
                        <option value='CUSTOMER'>CUSTOMER</option>
                        <option value='BOOKEE'>BOOKEE</option>
                    </Form.Select>

                </Form.Group>
            </Form>
            <Button type="Button" onClick={handleSubmit}>Submit</Button>

        </div>
    )
}
