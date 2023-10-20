const UserService = require('../services/user.service');

// a controller for the users logged with sessions

exports.login = async (req, res, next) => {
  try {
    const { phoneNumber, password } = req.body;
    
    const user = await UserService.findUserByPhoneAndPassword(phoneNumber, password);

    if (!user) {
      res.status(401).json({ error: 'Authentification échouée' });
      return;
    }

    // Stockez la session utilisateur ou générez un token JWT
    req.session.user = user;

    res.json({ status: true, success: 'Authentification réussie', token: 'votre_token' });
  } catch (error) {
    throw error;
  }
};
