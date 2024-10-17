// routes/userRoute.js
const { Router } = require("express");
const UserModel = require("../Models/UserModel.js"); // Import the model directly
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const saltRounds = 10;
const userRouter = Router();
const { JWT_USER_PASSWORD } = require("../config");

userRouter.post("/signup", async (req, res) => {
    const { name, email, password, Authority, Roll_Number } = req.body;
    const hashedPassword = await bcrypt.hash(password, saltRounds);
    
    try {
        await UserModel.create({
            name,
            email,
            password: hashedPassword,
            Authority,
            Roll_Number
        });
        res.json({ message: "You are signed up" });
    } catch (e) {
        res.status(500).json({ message: e.message });
    }
});


userRouter.post("/signin",async (req,res)=>{
    const email = req.body.email;
    const password = req.body.password;
    const response = await UserModel.findOne({
        email:email
    })

    if(!response){
        res.status(403).json({
            message : "User not found"
        })
    
    }

    const passwordMatch = bcrypt.compare(password, response.password);
    if(!passwordMatch){
        res.status(403).json({
            message : "Incorrect password"
        })
    }

    if(passwordMatch){
        const token = jwt.sign({id: response._id},JWT_USER_PASSWORD)
        res.json({
            token: token
        })
    }

})




module.exports = { userRouter };
