import { useState } from "react";
import axios from "axios";

export default function Auth() {
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [authority, setAuthority] = useState("");
  const [rollNumber, setRollNumber] = useState("");

  const handleSubmit = async (event) => {
    event.preventDefault();

    const requestBody = {
      name: name,
      email: email,
      password: password,
      Authority: authority,
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
    <form onSubmit={handleSubmit} className="m-8">
      <div>
        Enter Name:{" "}
        <input
          type="text"
          value={name}
          onChange={(e) => setName(e.target.value)}
        />
      </div>
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
        Enter Authority:{" "}
        <input
          type="text"
          value={authority}
          onChange={(e) => setAuthority(e.target.value)}
        />
      </div>
      <div>
        Enter Roll Number:{" "}
        <input
          type="text"
          value={rollNumber}
          onChange={(e) => setRollNumber(e.target.value)}
        />
      </div>
      <div>
        <button type="submit">Submit</button>
      </div>
    </form>
  );
}
