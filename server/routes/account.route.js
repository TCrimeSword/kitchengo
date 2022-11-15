const express = require('express');
const routeName = require('../configs/index').routeConfig;
const { tryCatchFunc } = require('../utils/errorHandling');
const AccountController = require('./controllers/account.controller');
const router = express.Router();

router.get('/login', (req, res) => {
  throw new Error('test');
});
router.post('/login', tryCatchFunc(AccountController.login));
router.post('/register', tryCatchFunc(AccountController.resgister));
router.post('/logout', tryCatchFunc(AccountController.logout));

module.exports = router;
