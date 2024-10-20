const mongoose = require("mongoose");

const OutPassSchema = new mongoose.Schema({
    Name: String,
    Roll_Number: String,
    Authority: String,
    Location: String,
    OutDate: Date,
    Remarks: String,
    Status: { type: String, enum: ['Pending', 'Approved', 'Denied'], default: 'Pending' }, // Add Pending here
    ApprovalDate: { type: Date, default: null },
    comments: { type: String, default: "" },
});

const OutPassModel = mongoose.model("OutPass", OutPassSchema);
module.exports = OutPassModel; 
