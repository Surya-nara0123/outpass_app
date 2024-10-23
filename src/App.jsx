import { useState } from 'react'
import './App.css'
import UserSignup from './components/UserSignup';
import UserSignin from './components/UserSignin';

function App() {
  const [count, setCount] = useState(0)

  return (
    <>
     <UserSignup/>
     <UserSignin/>
    </>
  )
}

export default App
