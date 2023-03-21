import React, { useEffect, useState, useContext } from "react";
import { useNavigate, Link } from 'react-router-dom';
import { Container, Row, Col } from "reactstrap";
import Helmet from "../components/Helmet/Helmet";
import { useParams } from "react-router-dom";
import BookingForm from "../components/UI/BookingForm";
import PaymentMethod from "../components/UI/PaymentMethod";
import axios from "axios";
import API_URL from "../api/Router";
import { AuthContext } from "../context/authContext";
import Modal from 'react-modal';
import DatePicker from 'react-datepicker';
import { differenceInDays, addDays, startOfDay } from "date-fns";
import { toast } from 'react-toastify';
import toastOption from "../config/toast";
import Loading from 'react-loading';

const VehicleDetails = () => {
  const { currentToken, userDecode } = useContext(AuthContext);
  const navigate = useNavigate();
  const { slug } = useParams();
  const [vehicleDetail, setVehicleDetail] = useState();
  const [vehicle, setVehicle] = useState();
  const [modalIsOpen, setModalIsOpen] = useState(false);
  const [modalConfirmBooking, setModalConfirmBooking] = useState(false);

  const [isLoading, setIsLoading] = useState(true);

  const [startDate, setStartDate] = useState(new Date());
  const [endDate, setEndDate] = useState(addDays(startDate, 1));
  const [diffDate, setDiffDate] = useState(differenceInDays(startOfDay(endDate), startOfDay(startDate)));
  const [loadingConfirm, setLoadingConfirm] = useState(false);

  const getVehiclesByLicensePlate = async () => {
    try {
      const res1 = await axios.get(`${API_URL}/api/vehicles/vehicleDetails/${slug}`);
      const res2 = await axios.get(`${API_URL}/api/vehicles/${slug}`);

      if (res1.status === 200) {
        setVehicleDetail(res1.data)
        setVehicle(res2.data)
      }


    } catch (error) {
      console.log(error.message);
    }
  }

  const singleVehicleItem = ''
  // const singleVehicleItem = vehicleDetail?.find((item) => item?.licensePlate === slug);

  const editVehicleHandle = () => {

  }

  const handleRentalVehicle = () => {
    if (!userDecode) {
      openModal()
    } else {
      openConfirmModal()
    }
  }

  const openModal = () => {
    setModalIsOpen(true);
  }

  const closeModal = () => {
    setModalIsOpen(false);
  }

  const openConfirmModal = () => {
    setModalConfirmBooking(true);
  }

  const closeConfirmModal = () => {
    setModalConfirmBooking(false);
  }

  const handleStartDate = (date) => {
    if (date > endDate) {
      setStartDate(date)
      setEndDate(addDays(date, 1))
    } else {
      setStartDate(date)
    }
  }

  const handleEndDate = (date) => {
    setEndDate(date)
  }

  const confirmBookingHandle = async () => {
    setLoadingConfirm(true)
    try {
      const config = {
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${currentToken}`,
        },
      };

      const data = {
        licensePlate: slug,
        bookingStart: startDate.toISOString().slice(0, 10),
        bookingEnd: endDate.toISOString().slice(0, 10),
        hasDriver: false
      }

      const res = await axios.post(`${API_URL}/api/bookings`, data, config);
      console.log('res booking', res)
      if (res.status === 200 || res.status === 201) {
        closeConfirmModal(true)
        createBookingDetail(res.data._id, config)
        setLoadingConfirm(false)
        toast.success('Booking successfully!', toastOption)
        navigate('/vehicles')
      }
    } catch (error) {
      toast.error('Booking failed!', toastOption)
    }
  }

  const createBookingDetail = async (id, config) => {
    
    console.log('config', config)

    const data = {
      custName: (userDecode?.firstName + ' ' + userDecode?.lastName),
      custEmail: userDecode?.email,
      custPhone: userDecode?.phone,
      custAddress: userDecode?.address,
      licensePlate: vehicle?.licensePlate,
      // payment: ....
    }

    console.log('data', data)
    console.log('id', id)

    try {
      const res = await axios.post(`${API_URL}/api/bookings/bookingDetails/${id}`, data, config)
      console.log('create booking detail res', res)
    } catch (error) {
      console.log(error)
    }
  }

  useEffect(() => {
    window.scrollTo(0, 0);
  }, [singleVehicleItem]);

  useEffect(() => {
    const timer = setTimeout(() => {
      setIsLoading(false);
    }, 1500);

    return () => clearTimeout(timer);
  }, []);

  useEffect(() => {
    getVehiclesByLicensePlate()
  }, [])

  useEffect(() => {
    const days = differenceInDays(startOfDay(new Date(endDate)), startOfDay(new Date(startDate)))
    setDiffDate(days)
  }, [startDate, endDate])

  return (
    <div className="d-flex justify-content-center">
      {isLoading ?
        <Loading type="spin" color="#000" />
        :
        <Helmet title={slug}>
          <section>
            <Container>
              <button className="btn btn-outline-secondary mb-3" onClick={() => navigate(-1)}><i className="ri-arrow-go-back-line"></i></button>
              <Row>
                <Col lg="6">
                  <img src={vehicle?.image} alt="" className="w-100" />

                  <div className="position-relative">
                    <div className="car__info">
                      <h2 className="section__title">{vehicleDetail?.model}</h2>
                      <h4 className="fw-bold">{vehicle?.licensePlate}</h4>

                      <div className=" d-flex align-items-center gap-5 mb-4 mt-3">

                        <span className=" d-flex align-items-center gap-2">
                          <span style={{ color: "#f9a826" }}>
                            <i className="ri-star-s-fill"></i>
                            <i className="ri-star-s-fill"></i>
                            <i className="ri-star-s-fill"></i>
                            <i className="ri-star-s-fill"></i>
                            <i className="ri-star-s-fill"></i>
                          </span>
                          ({singleVehicleItem?.rating} ratings)
                        </span>
                      </div>

                      <p className="section__description">
                        {vehicle?.description}
                      </p>

                      <div
                        className=" d-flex align-items-center mt-3"
                        style={{ columnGap: "4rem" }}
                      >
                        <span className=" d-flex align-items-center gap-1 section__description">
                          <i
                            className="ri-roadster-line"
                            style={{ color: "#f9a826" }}
                          ></i>{" "}
                          {vehicleDetail?.transmission}
                        </span>

                        <span className=" d-flex align-items-center gap-1 section__description">
                          <i
                            className="ri-settings-2-line"
                            style={{ color: "#f9a826" }}
                          ></i>{" "}
                          {vehicleDetail?.fuelType}
                        </span>

                        <span className=" d-flex align-items-center gap-1 section__description">
                          <i
                            className="ri-timer-flash-line"
                            style={{ color: "#f9a826" }}
                          ></i>{" "}
                          {vehicle?.isRented ? 'Unrentable' : 'Rentable'}
                        </span>
                      </div>

                      <div
                        className=" d-flex align-items-center mt-3"
                        style={{ columnGap: "2.8rem" }}
                      >
                        <span className=" d-flex align-items-center gap-1 section__description">
                          <i className="ri-map-pin-line" style={{ color: "#f9a826" }}></i>{" "}
                          Unlocation
                        </span>

                        <span className=" d-flex align-items-center gap-1 section__description">
                          <i
                            className="ri-wheelchair-line"
                            style={{ color: "#f9a826" }}
                          ></i>{" "}
                          {vehicleDetail?.vehicleType}
                        </span>

                        <span className=" d-flex align-items-center gap-1 section__description">
                          <i
                            className="ri-building-2-line"
                            style={{ color: "#f9a826" }}
                          ></i>{" "}
                          {vehicleDetail?.yearOfManufacturer}
                        </span>
                      </div>
                    </div>
                  </div>
                </Col>

                <Col lg="6" className="position-relative detail-vehicle">
                  <h6 className="rent__price__detail fw-bold">
                    {vehicle?.price ? <span> {vehicle?.price.toLocaleString('vi', { style: 'currency', currency: 'VND' })} / Day</span> : <span>Free</span>}
                  </h6>

                  <label htmlFor="start-date">Start booking date:</label>
                  <div className="input_date">
                    <i class="ri-calendar-2-line"></i>
                    <DatePicker
                      id="start-date"
                      selected={startDate}
                      dateFormat="yyyy-MM-dd"
                      onChange={handleStartDate}
                      minDate={new Date()}
                    />
                  </div>


                  <label htmlFor="end-date">End booking Date:</label>
                  <div className="input_date">
                    <i class="ri-calendar-2-line"></i>
                    <DatePicker
                      id="end-date"
                      selected={endDate}
                      dateFormat="yyyy-MM-dd"
                      onChange={handleEndDate}
                      minDate={addDays(startDate, 1)}
                    />

                  </div>

                  <div className="detail__price">
                    <h3>Detail price</h3>
                    <div className="d-flex justify-content-between"><p>Rental unit price: </p> <p> {vehicle?.price} / day</p>
                    </div>
                    <div className="d-flex justify-content-between"><p>Service charge: </p> <p>(Not support)</p>
                    </div>
                    <div className="d-flex justify-content-between"><p>Insurance fees: </p> <p>(Not support)</p>
                    </div>
                    <hr></hr>
                    <div className="d-flex justify-content-between align-items-center mb-2 mt-2"><p className="mb-0">Total cost of car rental: </p> <p className="d-flex align-items-center mb-0">{vehicle?.price} x <p className="date_dif mb-0">{diffDate} day</p></p>
                    </div>
                    <hr></hr>
                    <div className="d-flex justify-content-between"><p className="total_price">Total price:  </p>
                      <p className="total_price_money">{(vehicle?.price * diffDate).toLocaleString('vi', { style: 'currency', currency: 'VND' })}</p>
                    </div>
                  </div>

                  {!userDecode
                    && <button className="btn btn-primary mt-5 button_booking" onClick={handleRentalVehicle}>Booking now</button>}

                  {userDecode
                    && userDecode.role_id.roleName !== 'Hotelier'
                    && <button className="btn btn-primary mt-5 button_booking" onClick={handleRentalVehicle}>Booking now</button>}

                  {userDecode
                    && userDecode.role_id.roleName === 'Hotelier'
                    && userDecode._id === vehicle?.user_id
                    && <div className="handle__detail__vehicle">
                      <div className='edit__vehicle__item' onClick={editVehicleHandle}><i className="ri-edit-line"></i></div>
                      <div className='delete__vehicle__item' onClick={editVehicleHandle}><i className="ri-delete-bin-line"></i></div>
                    </div>}

                  <Modal ariaHideApp={false} isOpen={modalIsOpen} onRequestClose={closeModal} style={{
                    content: {
                      width: '300px',
                      height: '180px',
                      top: '50%',
                      left: '50%',
                      transform: 'translate(-50%, -50%)',
                      backgroundColor: '#fff',
                      borderRadius: '5px',
                      boxShadow: '0px 0px 10px rgba(0, 0, 0, 0.5)',
                      padding: '20px'
                    },
                  }}>
                    <p>You need to login before booking</p>
                    <Link to='/login' style={{ textUnderlineOffset: '3px' }}>Go to login</Link>
                    <br />
                    <br />
                    <button onClick={closeModal} className='btn btn-outline-secondary'>Close</button>
                  </Modal>

                  <Modal ariaHideApp={false} isOpen={modalConfirmBooking} onRequestClose={closeConfirmModal} style={{
                    content: {
                      width: '600px',
                      height: '600px',
                      top: '50%',
                      left: '50%',
                      transform: 'translate(-50%, -50%)',
                      backgroundColor: '#fff',
                      borderRadius: '5px',
                      boxShadow: '0px 0px 10px rgba(0, 0, 0, 0.5)',
                      padding: '20px'
                    },
                  }}>
                    <h4>Confirm booking</h4>
                    <p>Personal Information:</p>
                    <p>Last Name: {userDecode?.lastName}</p>
                    <p>Email: {userDecode?.email}</p>
                    <p>Vehicle Information:</p>
                    <p>Model: {vehicleDetail?.model}</p>
                    <p>License Plate: {vehicle?.licensePlate}</p>
                    <p>Booking Information</p>
                    <p>Start booking date: {startDate.toISOString().slice(0, 10)}</p>
                    <p>End booking date: {endDate.toISOString().slice(0, 10)}</p>
                    <p>Total price: {(vehicle?.price * diffDate).toLocaleString('vi', { style: 'currency', currency: 'VND' })} </p>

                    <button onClick={closeConfirmModal} className='btn btn-outline-secondary'>Cancel</button>
                    <button onClick={confirmBookingHandle} className='btn btn-primary'>Confirm</button>

                    {loadingConfirm ? <>Processing...</> : ''}
                  </Modal>
                </Col>

                {/* <Col lg="7" className="mt-5">
              <div className="booking-info mt-5">
                <h5 className="mb-4 fw-bold ">Booking Information</h5>
                <BookingForm />
              </div>
            </Col> */}

                {/* <Col lg="5" className="mt-5">
              <div className="payment__info mt-5">
                <h5 className="mb-4 fw-bold ">Payment Information</h5>
                <PaymentMethod />
              </div>
            </Col> */}

              </Row>
            </Container>
          </section>
        </Helmet>}
    </div>
  );
};

export default VehicleDetails;
