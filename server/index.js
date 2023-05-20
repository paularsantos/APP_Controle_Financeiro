

const express = require("express");
const authRouter = require("./routers/auth");
const mongoose = require('mongoose');


//tudo parte daqui, este é o o init inicializacao da nossa aplicacao
const PORT = 3000;
const app = express();

app.use(express.json());
app.use(authRouter);

const DB = "mongodb+srv://user:useradmin123@cluster0.zxaqbos.mongodb.net/?retryWrites=true&w=majority"
mongoose.connect(DB).then(()=>{
    console.log("conexao com sucesso");
}).catch((e)=>{
    console.log(e);
});

app.listen(PORT, "0.0.0.0", ()=>{
    console.log(`CONEXAO NA PORTA ${PORT}`);
});