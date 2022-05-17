import React, { children } from 'react'
import Footer from './Footer';
import Header from './Header';



export default function PageLayout(props) {

    const { children } = props;

    return (
        <div>
            <Header />
            <main>
                {children}
            </main>
            <Footer />
        </div>
    )
}
