import { useState } from "react";
import axios from "axios";
import './form.css'

export default function AuthorSignup() {
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const handleSubmit = async (event) => {
    event.preventDefault();

    const requestBody = {
      name: name,
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
    <form onSubmit={handleSubmit} className="form">
      <div className="input-container">
        <div className="heading">Register</div>
        <div className="placholder m-8">
          <label htmlFor="Name">Name</label>
          <input className="inputbox"
            type="text"
            id="Name"
            placeholder="Name"
            value={name}
            onChange={(e) => setName(e.target.value)}
          /></div>
        <div className="placholder m-8">
          <label htmlFor="Email">Email</label>
          <input className="inputbox"
            type="email"
            value={email}
            placeholder="Email"
            onChange={(e) => setEmail(e.target.value)}
          /></div>
        <div className="placholder m-8">
          <label htmlFor="Password">Password</label>
          <input className="inputbox"
            type="password"
            placeholder="Password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          /></div>
        <button type="submit" className="btn">Submit</button>
      </div>

    </form>
  );
}
