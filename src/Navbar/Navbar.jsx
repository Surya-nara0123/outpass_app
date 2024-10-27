import React, { useState } from 'react';
import './nav.css';
import logo from '../assets/logo.png';
import { FaCaretDown, FaCaretUp, FaUserCircle, FaBell, FaSignOutAlt } from 'react-icons/fa';

export function Navbar({ islogged }) {
    const [dropdownOpen, setDropdownOpen] = useState(false);

    const toggleDropdown = () => {
        setDropdownOpen(!dropdownOpen);
    };

    const handleLogout = () => {
        // Logic to log out the user
        console.log('Logging out...');
        setDropdownOpen(false); // Close the dropdown on logout
    };

    const handleNotifications = () => {
        // Logic to show notifications
        console.log('Showing notifications...');
        setDropdownOpen(false); // Close the dropdown after clicking
    };

    const handleProfile = () => {
        // Logic to navigate to the profile page
        console.log('Navigating to profile...');
        setDropdownOpen(false); // Close the dropdown after clicking
    };

    if (islogged === 1) {
        return (
            <div className='Navbar'>
                <div className='header'>
                    <img src={logo} alt="Logo" className='logo' />
                    Outpass App
                </div>
                <div className='right-push'>
                    <div className='user-info' onClick={toggleDropdown}>
                        <FaUserCircle className='icon' />
                        {dropdownOpen ? (
                            <FaCaretUp className='icon' style={{ marginLeft: '0px', marginRight: '10px' }} />
                        ) : (
                            <FaCaretDown className='icon' style={{ marginLeft: '0px', marginRight: '10px' }} />
                        )}
                    </div>
                    {dropdownOpen && (
                        <div className='dropdown-menu'>
                            <button onClick={handleNotifications}>
                                <FaBell style={{ marginRight: '8px' }} />
                                Notifications
                            </button>
                            <button onClick={handleLogout}>
                                <FaSignOutAlt style={{ marginRight: '8px' }} />
                                Logout
                            </button>
                        </div>
                    )}
                </div>
            </div>
        );
    } else {
        return <div></div>;
    }
}
