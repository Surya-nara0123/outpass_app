import { useState } from 'react'
import './App.css'
import Auth from './components/AuthorSignin'
import AuthorSignin from './components/AuthorSignin'

function App() {
  const [count, setCount] = useState(0)

  return (
    <>
    <AuthorSignin/>
    </>
  )
}

export default App
