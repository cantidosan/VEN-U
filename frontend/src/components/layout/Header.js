import React from 'react'
import { Navbar, Nav } from 'react-bootstrap'
import { useStateValue } from '../../state';

export default function Header() {

    const [{ userRole, userId, username, isLoggedIn }, dispatch] = useStateValue();

    const handleLogout = () => {

        dispatch({ type: 'isLoggedIn', payload: false });

    }
    return (
        // <nav className="navbar navbar-expand-lg navbar-light bg-light  justify-content-end">
        //     <a className="navbar-brand" href="#">VEN-U logo</a>
        //     <button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        //         <span className="navbar-toggler-icon"></span>
        //     </button>
        //     <div className="collapse navbar-collapse" id="navbarNavAltMarkup">
        //         <div className="navbar-nav">
        //             <a className="nav-item nav-link active" href="#">Home <span className="sr-only">(current)</span></a>
        //             <a className="nav-item nav-link" href="#">Venues</a>
        //             <a className="nav-item nav-link" href="#">Events</a>
        //             <a className="nav-item nav-link disabled" href="#">Disabled</a>
        //         </div>
        //     </div>
        // </nav>
        <Nav className="justify-content-between " activeKey="/home">
            <Nav.Item>
                {/* THIS WILL REQUIRE CONDITIONAL RENDERING BASED ON USER ROLES */}
                <Nav.Link href="/venues">Venues</Nav.Link>
            </Nav.Item>
            <Nav.Item>
                {/* THIS WILL REQUIRE CONDITIONAL RENDERING BASED ON USER ROLES */}
                <Nav.Link href="/events">Events</Nav.Link>
            </Nav.Item>
            <Nav.Item>

                <Nav.Link href="/" eventKey="link-1">VEN-U</Nav.Link>
            </Nav.Item>
            {(!isLoggedIn) ? <Nav.Item>
                <Nav.Link href="login" eventKey="link-2">Login</Nav.Link>
            </Nav.Item> : ''}
            {(!!isLoggedIn) ? <Nav.Item>
                <Nav.Link href="/" onClick={handleLogout}>
                    Logout
                </Nav.Link>
            </Nav.Item> : ''}
        </Nav>

    )
}
