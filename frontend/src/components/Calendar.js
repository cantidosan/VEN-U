import React, { useState, useEffect } from 'react'
import ReactCalendar from 'react-calendar'
import { differenceInCalendarDays } from 'date-fns'
import setHeaders from '../setHeaders';

export default function Calendar(props) {

    const { venue_id } = props;
    const dateStringObjects = []
    const [disabledDates, setDisabledDates] = useState([])

    const [value, setValue] = useState(new Date());


    console.log('eventdetails Calendar', venue_id)

    // FETCH FROM THE EVENTS TABLE TO RETRIEVE ALL START DATES TIED
    useEffect(() => {


        fetch(`http://venu.com.local:3001/venues/${venue_id}/eventDates`, {
            headers: setHeaders(),
        })

            .then(response => response.json())

            .then(response => setDisabledDates(response))



        /////////////THE FORMAT BELOW WORKS WELL WITH  isSameDay function
        // [new Date('2022/04/28'), new Date('2022/04/29'), new Date('2022/04/30')])
        //  THE RESPONSE VARIABLE SHOULD HAVE VENUEID AS AS OBJECT ATRIBUTE
    }, [])
    // TO THIS VENUEID

    // console.log('the array', dateStringObjects)

    function isSameDay(a, b) {

        return differenceInCalendarDays(a, b) === 0;

    }
    function tileDisabled({ date, view }) {


        // Disable tiles in month view only
        if (view === 'month') {



            // Check if a date React-Calendar wants to check is on the list of disabled dates
            return disabledDates.find(dDate => isSameDay(new Date(dDate.start_date), date));
        }
    }
    // RPC TO GET DATE INFORMATION  FROM EVENT TABLE
    // fetch(`http://venu.com.local:3001/venues/${venue_id}/dates`)
    //     .then(response => response.json(response))
    //     .then(response => setDisabledDates(response))
    ///THE RESPONSE OBJECT WILL CONTAIN START DATES IN IT

    console.log('disabled dates post ', disabledDates)

    return (

        <div>
            <ReactCalendar calendarType='US'
                value={value}
                tileDisabled={tileDisabled} />
        </div>
    )
}
