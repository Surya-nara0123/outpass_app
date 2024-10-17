const { JWT_USER_PASSWORD } = require("../config.js");
const jwt = require('jsonwebtoken');

async function UserMiddleware(req,res,next){
    const token = req.headers.token;
    try{
        const decoded = jwt.verify(token,JWT_USER_PASSWORD);
        if(decoded){
            req.userId = decoded.id;
            next();
        }
        else{
            res.status('403').json({
                message:"sign in to continue"
            })
        }
    }
    catch(e){
        res.json({
            message : e.message
        })
    }
}

module.exports = {
    UserMiddleware : UserMiddleware
}