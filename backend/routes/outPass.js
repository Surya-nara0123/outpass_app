// routes/outPass.js
const { Router } = require("express");
const OutPassModel = require("../Models/OutPassModel.js"); 
const UserModel = require("../Models/UserModel.js")
const { UserMiddleware } = require("../Middleware/student.js");
const outRouter = Router();

outRouter.post("/apply", UserMiddleware, async (req, res) => {
    const studentId = req.userId; 

    try {
        const user = await UserModel.findById(studentId);
        if (!user) {
            return res.status(404).json({ message: "User not found" });
        }

        const { name, Roll_Number, Authority } = user; 
        const { Location, OutDate, Remarks } = req.body;

     
        await OutPassModel.create({
            Name:name,
            Roll_Number: Roll_Number,
            Authority: Authority, 
            Location: Location,
            OutDate: OutDate,
            Remarks: Remarks
        });

        res.json({ message: "Outpass applied successfully!" });
    } catch (e) {
        res.status(500).json({ message: e.message });
    }
});


module.exports = { outpassRouter: outRouter }; // Make sure this matches your import
