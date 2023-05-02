const { Double } = require('mongodb');
const mongoose = require('mongoose');

const userSchema = mongoose.Schema({
    name: {
        required: true,
        type: String,
        trim: true,
    },

    email: {
        required: true,
        type: String,
        trim: true,
        validate:{
            validator:(value)=>{
                const re = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                return value.match(re);        
            },  
            message: "Favor entrar com email valido!",
        }
    },

    password: {
        required: true,
        type: String,
    },

    address: {
        type: String,
        default: '',
        
    },
    renda: {
        required: true,
        type: String,
        trim: true,
    },
    
    type: {
        type: String,
        default: 'user',
    },

});

const User = mongoose.model("User", userSchema);

module.exports = User;