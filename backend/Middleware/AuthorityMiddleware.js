const { JWT_ADMIN_PASSWORD } = require("../config.js");
const jwt = require('jsonwebtoken');

async function AuthorityMiddleware(req,res,next){
    const token = req.headers.token;
    try{
        const decoded = jwt.verify(token,JWT_ADMIN_PASSWORD);
        if(decoded){
            req.authorityId = decoded.id;
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
    AuthorityMiddleware : AuthorityMiddleware
}