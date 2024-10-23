const express = require("express");
const nodemailer = require("nodemailer");
const jwt = require("jsonwebtoken");
const mongoose = require("mongoose");
const { userRouter } = require("./routes/userRoute.js");
const { AuthorityRouter } = require("./routes/AuthorityRoute.js"); 
const { outpassRouter } = require("./routes/outPass.js");
const AuthorModel = require("./Models/AuthorityModel.js");
const OutPassModel = require("./Models/OutPassModel.js");
const cors = require("cors");

require('dotenv').config();

const app = express();
const port = 8080;

// MongoDB connection
mongoose.connect(process.env.MONGO_URL)
    .then(() => {
        console.log('Successfully connected to MongoDB');
    })
    .catch(err => {
        console.error('Error connecting to MongoDB:', err.message);
    });

// Watch for changes in the OutPass collection
OutPassModel.watch().on("change", async (change) => {
    console.log("Change detected:", change);
    if (change.operationType === "insert") {
        const newDocument = change.fullDocument;
        await notifyAuthority(newDocument);
    }
});

async function notifyAuthority(outpassData) {
    const authorityName = outpassData.Authority;

    const author = await AuthorModel.findOne({ Name: authorityName });
    console.log("Queried Author:", author);

    if (!author) {
        console.error("Author not found");
        return;
    }

    // Create OAuth2 transporter
    const transporter = nodemailer.createTransport({
        service: 'gmail',
        auth: {
            type: 'OAuth2',
            user: process.env.EMAIL_USER, // Your email
            clientId: process.env.OAUTH_CLIENT_ID,
            clientSecret: process.env.OAUTH_CLIENT_SECRET,
            refreshToken: process.env.OAUTH_REFRESH_TOKEN,
        },
    });

    const mailOptions = {
        from: process.env.EMAIL_USER,
        to: author.mailid,
        subject: 'New OutPass Request',
        text: `Dear ${author.name},\n\nA new outpass request has been created:\n\n${JSON.stringify(outpassData, null, 2)}`,
    };

    try {
        await transporter.sendMail(mailOptions);
        console.log("Notification sent successfully!");
    } catch (error) {
        console.error("Error sending notification:", error);
    }
}

app.use(express.json());
app.use(cors({
    origin: "http://localhost:5173" // Only allow requests from this origin
  }));
  
app.use(express.json());

// Routes
app.use("/user", userRouter);
app.use("/outpass", outpassRouter);
app.use("/authority",AuthorityRouter);

// Start the server
app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
