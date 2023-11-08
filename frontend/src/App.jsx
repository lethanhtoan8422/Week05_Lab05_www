import './App.css'
import { BrowserRouter, Route, Routes } from 'react-router-dom'
import Home from './home/Home'
import DetailWork from './detailWork/DetailWork'
import Login from './login/Login'

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path='/' element={<Login/>}/>
        <Route path='/home' element={<Home/>}/>
        <Route path='/detail-work' element={<DetailWork/>}/>
      </Routes>
    </BrowserRouter>
  )
}

export default App
