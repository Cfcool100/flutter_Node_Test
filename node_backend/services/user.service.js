const UserModel = require('../models/user.model');

// a fonction to find a user by phone number and password 

class UserService {
  static async findUserByPhoneAndPassword(phoneNumber, password) {
    try {
      return UserModel.findOne({ phoneNumber, password });
    } catch (error) {
      console.log(error.message);
    }
  }
}

module.exports = UserService;