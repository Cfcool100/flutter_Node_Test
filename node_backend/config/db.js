const mongoose = require('mongoose');
require('dotenv').config();

const URI = process.env.MONGODB_URI;

// connection to database

const connection = mongoose.createConnection(URI).on('open',()=>{
  console.log('MongoDB connected');
}).on('error',()=>{
  console.log('MongoDB connection error');
});

module.exports = connection;