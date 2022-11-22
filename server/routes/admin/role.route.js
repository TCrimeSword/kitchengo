const express = require('express');
const multer = require('multer');
const upload = multer({ dest: 'public/images/categories' });
const RoleController = require('./controllers/role.controller');
const { tryCatchFunc } = require('../../utils/errorHandling');
const router = express.Router();

const cpUpload = upload.fields([
  { name: 'image', maxCount: 1 },
  { name: 'backgroundImage', maxCount: 1 },
]);

/**
 * Index View
 */
router.get('/', tryCatchFunc(RoleController.index));

/**
 * Create View
 */
router.get('/add', tryCatchFunc(RoleController.create));

/**
 * Show detail View
 */
router.get('/:id', tryCatchFunc(RoleController.show));

/**
 * Edit View
 */
router.get('/edit/:id', tryCatchFunc(RoleController.edit));

/**
 * Update
 */
router.patch('/:id', tryCatchFunc(RoleController.update));

/**
 * Create
 */
router.post('/', tryCatchFunc(RoleController.store));

/**
 * Delete
 */
router.delete('/:id', tryCatchFunc(RoleController.destroy));

module.exports = router;
