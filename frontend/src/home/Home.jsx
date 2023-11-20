import axios from "axios";
import { useEffect, useState } from "react";
import "./home.scss";
import { useLocation, useNavigate } from "react-router-dom";

const Home = () => {
  let navigate = useNavigate()
  let location = useLocation()

  const [companies, setCompanies] = useState([]);
  const [pageChosen, setPageChosen] = useState(0);
  const [totalPages, setTotalPages] = useState([]);
  const [user, setUser] = useState({})

  useEffect(() => {
    setUser(location.state.user)
  }, [JSON.stringify(location.state.user)])

  useEffect(() => {
    let apiGetDataInfo = async () => {
      let data = await axios.get(
        `http://localhost:8080/company/get-page/${pageChosen}`
      );
      setTotalPages( Array.from({ length: data.data.totalPages}, (_, index) => index + 1))
      setCompanies(data.data.companies);
      console.log(data.data);
    };
    apiGetDataInfo();
  }, [pageChosen]);

  let handlePressWork = (id) => {
    navigate("/detail-work", {state : {companyID : id, user : user}})
  }
  return (
    <div className="container-home">
      <div className="content-users">
        <div className="icon">
          <i className="fa-solid fa-bell icon"></i>
        </div>
        <i className="fa-solid fa-user icon"></i>
        <span className="name-user">{user.fullName !== undefined && user.fullName}</span>
      </div>
      <span className="header">TUYỂN DỤNG VIỆC LÀM</span>
      <div className="content-works">
        {companies.map((data, index) => (
          <div key={index} className="content-work" onClick={() => handlePressWork(data.id)}>
            <div className="content-company">
              <span>Name : {data.name}</span>
              <span>About : {data.about}</span>
              <span>Email : {data.email}</span>
              <span>Phone : {data.phone}</span>
              <span>URL : {data.webUrl}</span>
              <span>
                Address :{" "}
                {`${data.address.number} ${data.address.street} ${data.address.zipcode} ${data.address.city} ${data.address.country}`}
              </span>
            </div>
          </div>
        ))}
      </div>
      <div className="pages">
        {
          totalPages.map(page => (
            <button key={page} onClick={() => setPageChosen(page-1)}
            style={{
              backgroundColor : page-1===pageChosen ? "yellow" : 'transparent'
            }}
            >{page}</button>
          ))
        }
      </div>
    </div>
  );
};

export default Home;
