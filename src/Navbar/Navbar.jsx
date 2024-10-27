import './nav.css'
import logo from '../assets/logo.png';
import { RiNotification2Line} from 'react-icons/ri';
import {FaCaretDown, FaUserCircle} from 'react-icons/fa';
export function Navbar({islogged}) {
    if (islogged===1){
        return (
            <div className='Navbar'>
              <div className='header'>
                <img src={logo} alt="Logo" className='logo' />
                Outpass App
              </div>
              <div className='right-push'>
                <div className='user-info'>
                  <FaUserCircle className='icon' />
                </div>
              </div>
            </div>
          );
    }
    else{
        return(
            <div>
            </div>
        )
    }

}