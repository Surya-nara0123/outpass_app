import { useState } from "react";
import axios from "axios";
import './form.css'
import logo from '../assets/logo.png'

export default function UserSignin() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const handleSubmit = async (event) => {
    event.preventDefault();

    const requestBody = {
      email: email,
      password: password,
    };

    try {
      const response = await axios.post("http://localhost:8080/user/signup", requestBody, {
        headers: {
          "Content-Type": "application/json",
        },
      });
      console.log("Response data:", response.data);
      alert(response.data.message)
    } catch (error) {
      console.error("Error making POST request:", error);
    }
  };

  return (
    <div className="container">
      <form onSubmit={handleSubmit} className="form">
        <div className="input-container">
          <div className="image-container">
            <img src={logo} alt="" className="login-image" />
          </div>
          <div className="placholder m-8">
            <input className="inputbox"
              placeholder="Email"
              type="Email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
            />
          </div>
          <div className="placholder m-8">
            <input className="inputbox"
              type="password"
              placeholder="Password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
            />
          </div>
          <div className="form-bottom">
            <input type="checkbox" name="rememberusername" id="rememberusername" value="1" />
            <label for="rememberusername">Remember username</label>
            <button type="submit" className="btn">Submit</button>
            <div className="or-divider">
              <span className="or-text">or</span>
            </div>
            <div className="image-container">
              <a href="">Forgotten your password?</a>
            </div>
          </div>
        </div>
      </form>
    </div>
  );
}
