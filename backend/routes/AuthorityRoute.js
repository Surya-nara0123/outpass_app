// routes/userRoute.js
const { Router } = require("express");
const AuthorModel = require("../Models/AuthorityModel.js");
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const saltRounds = 10;
const AuthorityRouter = Router();
const { JWT_ADMIN_PASSWORD } = require("../config.js");

AuthorityRouter.post("/signup", async (req, res) => {
    const { name, email, password } = req.body;
    const hashedPassword = await bcrypt.hash(password, saltRounds);
    
    try {
        console.log(name)
        await AuthorModel.create({
            Name : name,
            Mail : email,
            Password: hashedPassword,
        });
        res.json({ message: "You are signed up" });
    } catch (e) {
        res.status(500).json({ message: e.message });
    }
});


AuthorityRouter.post("/signin",async (req,res)=>{
    const email = req.body.email;
    const password = req.body.password;
    const response = await AuthorModel.findOne({
        Mail:email
    })

    if(!response){
        res.status(403).json({
            message : "User not found"
        })
    
    }

    const passwordMatch = bcrypt.compare(password, response.Password);
    if(!passwordMatch){
        res.status(403).json({
            message : "Incorrect password"
        })
    }

    if(passwordMatch){
        const token = jwt.sign({id: response._id},JWT_ADMIN_PASSWORD)
        res.json({
            token: token
        })
    }

})




module.exports = { AuthorityRouter };
