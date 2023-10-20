const mongoose = require('mongoose');
const db = require('../config/db');

const userSchema = new mongoose.Schema({
  phoneNumber: {
    type: String,
    required: true,
    unique: true,
  },
  password: {
    type: String,
    required: true,
  },
});

const UserModel = db.model('user', userSchema);

module.exports = UserModel;