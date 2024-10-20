// routes/outPass.js
const { Router } = require("express");
const OutPassModel = require("../Models/OutPassModel.js"); 
const UserModel = require("../Models/UserModel.js")
const AuthorModel = require("../Models/AuthorityModel.js");
const { UserMiddleware } = require("../Middleware/student.js");
const { AuthorityMiddleware } = require("../Middleware/AuthorityMiddleware.js");
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

        const authorityRecord = await AuthorModel.findOne({ Name: Authority });
        if (!authorityRecord) {
            return res.status(404).json({ message: "Authority not found" });
        }

        const authorityId = authorityRecord._id;

        const newOutpass = new OutPassModel({
            Name: name,
            Roll_Number: Roll_Number,
            Authority: authorityId,
            Location: Location,
            OutDate: OutDate,
            Remarks: Remarks,
            // No need to set Status; it will default to 'Pending'
        });

        await newOutpass.save();

        res.status(201).json({
            message: "Outpass applied successfully!",
            outpass: newOutpass,
        });
    } catch (e) {
        res.status(500).json({ message: e.message });
    }
});


outRouter.post("/approve/:id",AuthorityMiddleware,async(req,res)=>{
    const authorityId = req.authorityId;
    const approvalId = req.params.id;
    const { status } = req.body; 

    if (!['Approved', 'Rejected'].includes(status)) {
        return res.status(400).json({ message: "Invalid status" });
    }

    try {
        
        const approval = await OutPassModel.findById(approvalId);
        if (!approval) {
            return res.status(404).json({ message: "Approval record not found" });
        }

        
        if (approval.Authority!== authorityId) {
            return res.status(403).json({ message: "Unauthorized" });
        }

        // Update the approval status and time
        approval.Status= status;
        approval.ApprovalDate = new Date();

        await approval.save();

        res.json({ message: `Outpass has been ${status.toLowerCase()}.`, approval });

    } catch (e) {
        res.status(500).json({ message: e.message });
    }
});


module.exports = { outpassRouter: outRouter }; // Make sure this matches your import
