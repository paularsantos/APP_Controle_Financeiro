const express = require("express");
const User = require("../models/user");
const authRouter = express.Router();

const bcryptjs = require('bcryptjs');

authRouter.post("/api/singup", async(req,res)=>{
    try {

    const {name, email, password, renda, tefone} = req.body;

    const existingUser = await User.findOne({email});
    if(existingUser){
        return res.status(400).json({msg:'este email já existe'});
    }

    const  hashPassword = await bcryptjs.hash(password, 8);

    let user = new User({
        email,
        password: hashPassword, 
        name,
        tefone,
        renda,

    });

    user = await user.save();
    res.json(user);

        
    } catch (e) {
        res.status(500).json({error:e.message});
        
    }

});

module.exports = authRouter;