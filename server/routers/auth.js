const express = require("express");

const User = require("../models/user");

const authRouter = express.Router();

authRouter.post("/api/singup", async(req,res)=>{
    const {name, telefone, email,password, renda} = req.body;

    const existingUser = await User.findOne({email});

    if(existingUser){
        return res.status(400).json({msg:'este email já existe'});
    }

    let user = new User({
        name,
        telefone,
        email,
        password, 
        renda,

    })

    user = await user.save();
    res.json(user);

});

module.exports = authRouter;