const express = require('express');
const multer = require('multer');
const upload = multer({ dest: 'public/images/categories' });
const CategoryController = require('./controllers/category.controller');
const { tryCatchFunc } = require('../../utils/errorHandling');
const router = express.Router();

/**
 * Index View
 */
router.get('/', tryCatchFunc(CategoryController.index));

/**
 * Create View
 */
router.get('/add', tryCatchFunc(CategoryController.create));

/**
 * Edit View
 */
router.get('/edit/:id', tryCatchFunc(CategoryController.edit));

/**
 * Update
 */
router.patch(
  '/:id',
  upload.single('image'),
  tryCatchFunc(CategoryController.update)
);

/**
 * Create
 */
router.post(
  '/',
  upload.single('image'),
  tryCatchFunc(CategoryController.store)
);

/**
 * Delete
 */
router.delete('/:id', tryCatchFunc(CategoryController.destroy));

module.exports = router;
