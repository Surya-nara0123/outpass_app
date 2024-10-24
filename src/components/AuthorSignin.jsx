import { useState } from "react";
import axios from "axios";
import './form.css'
export default function AuthorSignin() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const handleSubmit = async (event) => {
    event.preventDefault();

    const requestBody = {
      email: email,
      password: password,
    };

    try {
      const response = await axios.post("http://localhost:8080/authority/signin", requestBody, {
        headers: {
          "Content-Type": "application/json",
        },
      });

      // Assume the token is in response.data.token
      const token = response.data.token;
      console.log("Token received:", token);

      // Store the token in localStorage for future requests
      localStorage.setItem("authToken", token);

      // Optionally alert the token (or success message)
      alert("Logged in successfully!");
    } catch (error) {
      console.error("Error making POST request:", error);
    }
  };

  return (
    <form onSubmit={handleSubmit} className="form">
      <div className="input-container">
      <div className="heading">Sign in</div>
      <div className="placholder m-8">
        <label htmlFor="Email">Email</label>
        <input className="inputbox" 
          placeholder="Email"
          type="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
        />
      </div>
      <div className="placholder m-8">
      <label htmlFor="Password">Password</label>
        <input className="inputbox"
          type="password"
          placeholder="Password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
        />
      </div>
        <button type="submit" className="btn">Submit</button>
      </div>
    </form>
  );
}
