import logo from './logo.svg';
import './App.css';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import VenueDetailsPage from './pages/VenueDetailsPage';
import EventDetailsPage from './pages/EventDetailsPage'
import EventEditPage from './pages/EventEditPage'
import VenueEditPage from './pages/VenueEditPage'
import Events from './pages/Events'
import Venues from './pages/Venues'
import HomePage from './pages/HomePage'
import EventCreatePage from './pages/EventCreatePage'
import VenueCreatePage from './pages/VenueCreatePage'
import SignUpPage from './pages/SignUpPage';
import LoginPage from './pages/LoginPage';
import { StateProvider } from './state';

function App() {

  const initialState = {
    userToken: null,
    isLoggedIn: false,
    username: null,
    userRole: null
  };

  const reducer = (state, action) => {
    switch (action.type) {
      case 'userLogin':
        return {
          ...state,
          userToken: action.payload,

        }
      case 'loginState':
        return {
          ...state,
          isLoggedIn: action.payload,
        }
      case 'userRole':
        return {
          ...state,
          userRole: action.payload,
        }
      case 'username':
        return {
          ...state,
          username: action.payload,
        };
      case 'userId':
        return {
          ...state,
          userId: action.payload,
        };

      default:
        return state;
    }
  };




  return (

    <StateProvider initialState={initialState} reducer={reducer}>

      <BrowserRouter>
        <Routes>

          <Route path="events/create/:venue_id" element={<EventCreatePage />} />
          <Route path="events/:event_id/edit" element={<EventEditPage />} />
          <Route path="events/:event_id" element={<EventDetailsPage />} />
          <Route path="events" element={<Events />} />
          <Route path="/" exact element={<HomePage />} />
          <Route path="venues/:venue_id/edit" element={<VenueEditPage />} />
          <Route path="venues/:venue_id" element={<VenueDetailsPage />} />
          <Route path="venues" element={<Venues />} />
          <Route path="venues/create" element={<VenueCreatePage />} />
          <Route path="signup" element={<SignUpPage />} />
          <Route path="login" element={<LoginPage />} />



        </Routes>
      </BrowserRouter>

    </StateProvider>
  );
}

export default App;
