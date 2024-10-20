const mongoose = require("mongoose");
const { Schema } = mongoose;
const ObjectId = mongoose.Types.ObjectId;

const UserSchema = new Schema({
    name : String,
    email : {type : String , unique : true},
    password : String,
    Authority : String,
    Roll_Number  :Number
})


const outPassSchema = new Schema({
  Name : String,
  Roll_Number : Number,
  Authority : Number,
  Location : String,
  OutDate : String,
  Remarks : String
});

const OutPassModel = mongoose.model('OutPass', outPassSchema);
const UserModel = mongoose.model('Student',UserSchema);
module.exports = {
    OutPassModel : OutPassModel,
    UserModel : UserModel
}

