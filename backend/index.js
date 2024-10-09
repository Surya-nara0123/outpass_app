const express = require("express");
const nodemailer = require("nodemailer");
const jwt = require("jsonwebtoken");
const mongoose = require("mongoose");
const { userRouter } = require("./routes/userRoute.js");
const { outpassRouter } = require("./routes/outPass.js");
const  AuthorModel  = require("./Models/AuthorityModel.js"); 
const OutPassModel = require("./Models/OutPassModel.js")


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



// Check if Mongoose model is connected before attempting to watch
OutPassModel.watch().on("change", async (change) => {
    console.log("Change detected:", change);
    if (change.operationType === "insert") {
        const newDocument = change.fullDocument;
        await notifyAuthority(newDocument);
    }
});


async function notifyAuthority(outpassData) {
    const authorityName = outpassData.Authority; 

    // Fetch the author (authority) details from the 'authors' collection based on the name
    const author = await AuthorModel.findOne({ Name: authorityName });
    console.log("Queried Author:", author); // Log the queried author
    

    if (!author) {
        console.error("Author not found");
        return;
    }

    // Setting up Nodemailer
    const transporter = nodemailer.createTransport({
        service: 'gmail',
        auth: {
            user: process.env.EMAIL_USER,
            pass: process.env.EMAIL_PASS,
        },
    });

    // Mail options
    const mailOptions = {
        from: process.env.EMAIL_USER,
        to: author.mailid, // Send email to the author’s mailid
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

// Middleware for parsing JSON
app.use(express.json());

// Routes
app.use("/user", userRouter);
app.use("/outpass", outpassRouter);

// Start the server
app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
