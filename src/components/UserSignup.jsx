import { useState } from "react";
import axios from "axios";
import './form.css'

export default function UserSignin() {
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [rollNumber, setRollNumber] = useState("");

  const handleSubmit = async (event) => {
    event.preventDefault();

    const requestBody = {
      name: name,
      email: email,
      password: password,
      Roll_Number: rollNumber,
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
    <form onSubmit={handleSubmit} className="form">
      <div className="input-container">
        <div className="heading">Sign in</div>
        <div className="placholder m-8">
          <label htmlFor="text">Name</label>
          <input className="inputbox"
            type="text"
            value={name}
            onChange={(e) => setName(e.target.value)}
          />
        </div>
        <div className="placholder m-8">
          <label htmlFor="Email">Email</label>
          <input className="inputbox"
            type="Email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
          />
        </div>
        <div className="placholder m-8">
          <label htmlFor="Password">Password</label>
          <input className="inputbox"
            type="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
        </div>
        <div className="placholder m-8">
          <label htmlFor="text">Roll number</label>
          <input className="inputbox"
            type="text"
            value={rollNumber}
            onChange={(e) => setRollNumber(e.target.value)}
          />
        </div>
        <div>
          <button type="submit" className="btn">Submit</button>
        </div>
      </div>
    </form>
  );
}
