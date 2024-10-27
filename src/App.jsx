import { useState } from 'react'
import './App.css'
import AuthorSignup from './components/AuthorSignup'
import AuthorSignin from './components/AuthorSignin'
import UserSignin from './components/UserSignin'
import UserSignup from './components/UserSignup'

import { BrowserRouter, Routes, Route } from 'react-router-dom';
import routes from '../routes';

function App() {
  return (
    <BrowserRouter>
      <Routes>
        {routes.map((route) => (
          <Route key={route.path} path={route.path} element={route.element} />
        ))}
      </Routes>
    </BrowserRouter>
  );
}

export default App;