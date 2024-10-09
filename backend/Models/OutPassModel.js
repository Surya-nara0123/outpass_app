    // models/OutPassModel.js
const mongoose = require("mongoose");

const OutPassSchema = new mongoose.Schema({
    Name: String,
    Roll_Number: String,
    Authority: String,
    Location: String,
    OutDate: Date,
    Remarks: String
});

const OutPassModel = mongoose.model("OutPass", OutPassSchema);
module.exports = OutPassModel;
