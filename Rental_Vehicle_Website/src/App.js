import { BrowserRouter } from "react-router-dom";
import UserRouter from "./routers/UserRouter";
import AdminRouter from "./routers/AdminRouter";
import AuthContextProvider from "./context/authContext";
import { ToastContainer } from "react-toastify";
import StoreContextProvider from "./context/storeContext";


function App() {
  return (
    <BrowserRouter>
      <StoreContextProvider>
        <AuthContextProvider>
          <UserRouter />
          <AdminRouter />
          
          <ToastContainer
            position="top-right"
            autoClose={5000}
            hideProgressBar={false}
            newestOnTop={false}
            closeOnClick
            rtl={false}
            pauseOnFocusLoss
            draggable
            pauseOnHover
            theme="light"
          />
        </AuthContextProvider>
      </StoreContextProvider>
    </BrowserRouter>
  );
}

export default App;
