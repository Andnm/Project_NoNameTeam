const DATE_TIME_FORMAT = "yyyy-MM-ddTHH:mm:ssZ";
const DATE_TIME_FORMAT2 = "dd/MM/yyyy HH:mm";
const DATE_FORMAT = "dd/MM/yyyy";
const DATE_FORMAT2 = "dd-MM-yyyy";
const DATE_OF_WEEK_FORMAT = "EEE, dd/MM";
const TIME_FORMAT = "HH:mm";
final minDate = DateTime(1900, 1, 1, 0, 0, 0);
final maxDate = DateTime(3000, 1, 1, 0, 0, 0);
const MIN_YEAR_OLD_USED_APP = 18;
const PAGE_SIZE = 30;

const BASE_URL_DEV = "https://rental-vehicle-na07.onrender.com/api";
const UPLOAD_PHOTO_URL_DEV = "https://api-mxhdulich.netalo.vn";
const DOWNLOAD_PHOTO_URL_DEV = "https://dev-cdn.netalo.vn";

const BASE_URL_PROD = "http://157.245.57.162:3000"; // production
const UPLOAD_PHOTO_URL_PROD = "https://pro.netalomo.vn"; //production
const DOWNLOAD_PHOTO_URL_PROD = "https://ss1.netalomo.vn"; // production

const BASE_URL_STA = "http://157.245.57.162:3000"; // staging
const UPLOAD_PHOTO_URL_STA = "https://sta.netalomo.vn"; //staging
const DOWNLOAD_PHOTO_URL_STA = "https://ss1.netalomo.vn";
const BASE_URL_PHOTO_STA = "http://dev-cdn.netalo.vn"; // staging

const URL_TTGD = "https://v2.247care.vn";
const URL_TERM = "https://telemedicine.netalo.vn/vn/term.html";

String PHOTO_URL_CDN = "";
String UPLOAD_PHOTO_URL = "";

const LOGIN_BY_PHONE = "/auth/login";
const USER_INFO = "/users/current";
const LIST_VEHICLE = "/vehicles/home";
const VEHICLE_DETAILS = "/vehicles/vehicleDetails/%s";
const BOOKING_VEHICLE = "/bookings";
const LIST_BOOKING = "/bookings";
const LIST_BOOKING_ADMIN = "/bookings/admin";

// firebase
const PUSH_DEVICE_TOKEN = "/v1/app/device/%s";

//Static
const CONFIG_CDN = "/v1/static/config";

const NETALO_API = "https://api.netalo.vn";
const COUNTRY_CODE = "/api/v1/list_country_code";
const CONFIRM_OTP = "/v1/oauth/register/otp";
const UPDATE_PROFILE = "/v1/oauth/me";

const LIST_DISCOVERY = "/v1/post";
const FAVORITE_POST = "/v1/favorite/post/%s";
const POST_COMMENT = "/v1/comment";
const FIND_HOTEL = "/v1/hotel";
