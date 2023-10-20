const express = require('express');
const bodyParser = require('body-parser');
const userRouter = require('./routers/user.router');
const session = require('express-session');
require('dotenv').config();


const app = express();

// use session to keep the user logged in

app.use(
  session({
    secret: process.env.SESSION_SECRET,
    resave: false,
    saveUninitialized: false,
  })
);
app.use(bodyParser.json());
app.use('/', userRouter);

module.exports = app;