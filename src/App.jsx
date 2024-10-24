import { useState } from 'react'
import './App.css'
import AuthorSignup from './components/AuthorSignup'
import AuthorSignin from './components/AuthorSignin'
import UserSignin from './components/UserSignin'
import UserSignup from './components/UserSignup'

function App() {
  const [count, setCount] = useState(0)

  return (
    <>
    <UserSignup/>
    </>
  )
}

export default App
