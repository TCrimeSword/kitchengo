const express = require('express');
const UserController = require('./controllers/user.controller');
const router = express.Router();

/* GET users listing. */
router.get('/', UserController.getAll);
router.delete('/:id', UserController.delete);
module.exports = router;
