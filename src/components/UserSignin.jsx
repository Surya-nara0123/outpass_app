import { useState } from "react";
import axios from "axios";

export default function Auth() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const handleSubmit = async (event) => {
    event.preventDefault();

    const requestBody = {
      email: email,
      password: password,
    };

    try {
      const response = await axios.post("http://localhost:8080/user/signin", requestBody, {
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
    <form onSubmit={handleSubmit} className="m-8">
      <div>
        Enter Email:{" "}
        <input
          type="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
        />
      </div>
      <div>
        Enter Password:{" "}
        <input
          type="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
        />
      </div>
      <div>
        <button type="submit">Submit</button>
      </div>
    </form>
  );
}
