import React from 'react'
import './updateInformation.css'

const UpdateInformation = ({ userProfile, userFirstName, userLastName, userGender, userBirthDay, userAddress, userPhone }) => {

    return (
        <form className='update_profile_form'>
            <div className="row">
                <div className="col-md-3">
                    <label className="labels">First Name:</label>
                    <input type="text" className="form-control" placeholder="First name" ref={userFirstName} defaultValue={userProfile.firstName}/>
                </div>
                <div className="col-md-4">
                    <label className="labels">Last Name:</label>
                    <input type="text" className="form-control" placeholder="Last name" ref={userLastName} defaultValue={userProfile.lastName}/>
                </div>
            </div>
            <div className="row">
                <div className="col-md-7">
                    <label className="labels">Gender:</label>
                    <input type="text" className="form-control" placeholder="Gender"  ref={userGender} defaultValue={userProfile.gender}/>
                </div>
                <div className="col-md-7">
                    <label className="labels">Birthday:</label>
                    <input type="text" className="form-control" placeholder="Birthday"  ref={userBirthDay} defaultValue={userProfile.dob}/>
                </div>
                <div className="col-md-7">
                    <label className="labels">Address:</label>
                    <input type="text" className="form-control" placeholder="Address"  ref={userAddress} defaultValue={userProfile.address}/>
                </div>
                <div className="col-md-7">
                    <label className="labels">Phone:</label>
                    <input type="number" className="form-control" placeholder="Phone"  ref={userPhone} defaultValue={userProfile.phone}/>
                </div>

            </div>

        </form>
    )
}

export default UpdateInformation