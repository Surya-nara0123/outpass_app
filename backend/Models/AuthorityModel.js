const mongoose = require("mongoose");

const AuthorSchema = new mongoose.Schema({
    Name: String,   // Match the field name exactly as it appears in MongoDB
    Mail: String,
});

const AuthorModel = mongoose.model("authors", AuthorSchema);
module.exports = AuthorModel;
