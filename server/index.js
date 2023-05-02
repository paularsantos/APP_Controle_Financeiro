

const express = require("express");
const authRouter = require("./routers/auth");
const mongoose = require('mongoose');


//tudo parte daqui, este é o o init inicializacao da nossa aplicacao
const PORT = 3000;
const app = express();

app.use(authRouter);

app.use(express.json)

const DB = "mongodb+srv://user:useradmin123@cluster0.zxaqbos.mongodb.net/?retryWrites=true&w=majority"
mongoose.connect(DB).then(()=>{
    console.log("OPi");
}).catch((e)=>{
    console.log(e);
});

app.listen(PORT, ()=>{
    console.log(`CONEXAO NA PORTA ${PORT}`);
});