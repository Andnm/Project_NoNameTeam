import React, { useContext, useEffect, useState } from 'react'
import logo from "../../../assets/all-images/avatar.jpg";
import './sidebar.css'
import { AuthContext } from "../../../context/authContext";

import { Link, NavLink } from "react-router-dom";

const Sidebar = () => {
  const { userDecode, currentToken, logout } = useContext(AuthContext);

  const menuItem = [
    {
      path: "/admin/vehicle_management",
      name: "Vehicle Management",
      icon: "ri-car-line"
    },
    {
      path: "/admin/blog_management",
      name: "Blog Management",
      icon: "ri-file-line"
    },
    {
      path: "/admin/user_management",
      name: "User Management",
      icon: "ri-user-line"
    },
    {
      path: "/admin/booking_management",
      name: "Booking Management",
      icon: "ri-user-line"
    },
  ];

  return (
    <div className="sidebar ">
      <div className="sidebar__top d-flex justify-content-center align-items-center">
        <Link to='/admin'>

          <div className="sidebar__top__logo">
            <img src={logo}></img>
          </div>
          <p className="sidebar__top__text">
            {userDecode.lastName}
          </p>
        </Link>
      </div>

      <div className="sidebar__middle d-flex justify-content-center flex-column">
        {menuItem.map((item, index) => (
          <NavLink
            to={item.path}
            key={index}
            className="link"
          >
            <i className={item.icon}></i>
            <div className="link_text">{item.name}</div>
          </NavLink>
        ))}
      </div>

      <button className="sidebar__bottom__btn btn " onClick={logout}>
        Log out
      </button>
    </div>
  )
}

export default Sidebar