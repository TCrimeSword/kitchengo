const express = require('express');
const { tryCatchFunc } = require('../utils/errorHandling');
const AccountController = require('./controllers/account.controller');
const router = express.Router();

router.get('/login', (req, res) => {
  throw new Error('test');
});
router.post('/login', tryCatchFunc(AccountController.login));
router.post('/register', tryCatchFunc(AccountController.resgister));
router.get('/logout', tryCatchFunc(AccountController.logout));

module.exports = router;
