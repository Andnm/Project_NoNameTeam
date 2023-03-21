import React from 'react'
import { Container } from "reactstrap";
import RegisterForm from "../components/UI/CarOwnerRegisterForm"
import "../styles/vehicle-owner.css"


const VehicleOwner = () => {
  return (
    <div className="vehicle_owner">
      <div className="vehicle_owner_header">
        <div className="vehicle_owner_header_content">
          <p className="content_title">IT’S NOT DIFFICULT TO</p>
          <p className="content_title">INCREASE YOUR INCOME</p>
          <p className="content_title">WITH DRIVE2CO</p>
          <br /><br /><br /><br />
          <p className="content_text">Hotline: 1900100x</p>
          <p className="content_text">Or leave a message for</p>
          <p className="content_text">Drive2Co via Form below</p>
        </div>
      </div>
      <Container>
        <div className="content_title">
          <h1>Drive2Co Host</h1>
          <p>Share few more details and move one step closer to EARNING. Our team will contact to you guide you through the program</p>
        </div>
        <RegisterForm />
      </Container>
    </div>

  )
}

export default VehicleOwner