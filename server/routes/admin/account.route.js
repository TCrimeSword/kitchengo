const express = require('express');
const multer = require('multer');
const upload = multer({ dest: 'public/images/categories' });
const AccountController = require('./controllers/account.controller');
const { tryCatchFunc } = require('../../utils/errorHandling');
const router = express.Router();

const cpUpload = upload.fields([
  { name: 'image', maxCount: 1 },
  { name: 'backgroundImage', maxCount: 1 },
]);

/**
 * Index View
 */
router.get('/', tryCatchFunc(AccountController.index));

/**
 * Create View
 */
router.get('/add', tryCatchFunc(AccountController.create));

/**
 * Show detail View
 */
router.get('/:id', tryCatchFunc(AccountController.show));

/**
 * Edit View
 */
router.get('/edit/:id', tryCatchFunc(AccountController.edit));

/**
 * Update
 */
router.patch('/:id', tryCatchFunc(AccountController.update));

/**
 * Create
 */
router.post('/', tryCatchFunc(AccountController.store));

/**
 * Delete
 */
router.delete('/:id', tryCatchFunc(AccountController.destroy));

module.exports = router;
