import { useState } from 'react'
import './App.css'
import { Navbar } from './Navbar/Navbar';

import { BrowserRouter, Routes, Route } from 'react-router-dom';
import routes from '../routes';

function App() {
  const [islogged,Setlogged]=useState(1);
  return (
    <BrowserRouter>
      <Navbar islogged={islogged}/>
      <Routes>
        {routes.map((route) => (
          <Route key={route.path} path={route.path} element={route.element} />
        ))}
      </Routes>
    </BrowserRouter>
  );
}

export default App;