const express = require('express');
const multer = require('multer');
const multipart = require('connect-multiparty');
const upload = multer({ dest: 'public/images/categories' });
const multipartMiddleware = multipart();
const RecipeController = require('./controllers/recipe.controller');
const { tryCatchFunc } = require('../../utils/errorHandling');
const router = express.Router();

const cpUpload = upload.fields([
  { name: 'image', maxCount: 1 },
  { name: 'backgroundImage', maxCount: 1 },
]);

/**
 * Index View
 */
router.get('/', tryCatchFunc(RecipeController.index));

/**
 * Create View
 */
router.get('/add', tryCatchFunc(RecipeController.create));

/**
 * Show detail View
 */
router.get('/:id', tryCatchFunc(RecipeController.show));

/**
 * Edit View
 */
router.get('/edit/:id', tryCatchFunc(RecipeController.edit));

/**
 * Update
 */
router.patch('/:id', tryCatchFunc(RecipeController.update));

/**
 * Create
 */
router.post('/', tryCatchFunc(RecipeController.store));

/**
 * Delete
 */
router.delete('/:id', tryCatchFunc(RecipeController.destroy));

/**
 * Upload Image
 */
router.post(
  '/image',
  multipartMiddleware,
  tryCatchFunc(RecipeController.uploadImage)
);

module.exports = router;
