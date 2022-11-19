const express = require('express');
const multer = require('multer');
const { tryCatchFunc } = require('../utils/errorHandling');

const upload = multer({ dest: 'public/images/categories' });
const CategoryController = require('./controllers/category.controller');

const router = express.Router();

router.get('/', tryCatchFunc(CategoryController.getAll));
router.get('/:id', tryCatchFunc(CategoryController.get));
router.post(
  '/',
  upload.single('image'),
  tryCatchFunc(CategoryController.store)
);
router.patch(
  '/:id',
  upload.single('image'),
  tryCatchFunc(CategoryController.update)
);
router.delete('/:id', tryCatchFunc(CategoryController.delete));

module.exports = router;
