const express = require('express');
const multer = require('multer');
const { tryCatchFunc } = require('../utils/errorHandling');
const { verifyAccessToken } = require('../helpers/jwtServices');

const upload = multer({ dest: 'public/images/recipes' });
const RecipeController = require('./controllers/recipe.controller');

const router = express.Router();

router.get('/', tryCatchFunc(RecipeController.getAll));
router.get('/:id', tryCatchFunc(RecipeController.get));
router.post(
  '/',
  verifyAccessToken,
  upload.array('images', 12),
  tryCatchFunc(RecipeController.store)
);
router.patch('/:id', tryCatchFunc(RecipeController.update));
router.delete('/:id', tryCatchFunc(RecipeController.delete));
router.post(
  '/:id/comments',
  verifyAccessToken,
  tryCatchFunc(RecipeController.addComment)
);

module.exports = router;
