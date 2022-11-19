const express = require('express');
const multer = require('multer');
const { verifyAccessToken } = require('../helpers/jwtServices');
const { tryCatchFunc } = require('../utils/errorHandling');

const upload = multer({ dest: 'public/images/blogs' });
const BlogController = require('./controllers/blog.controller');

const router = express.Router();

router.get('/', tryCatchFunc(BlogController.getAll));
router.get('/:id', tryCatchFunc(BlogController.get));
router.post(
  '/',
  verifyAccessToken,
  upload.array('images', 12),
  tryCatchFunc(BlogController.store)
);
router.patch('/:id', tryCatchFunc(BlogController.update));
router.delete('/:id', tryCatchFunc(BlogController.delete));
router.post(
  '/:id/comments',
  verifyAccessToken,
  tryCatchFunc(BlogController.addComment)
);

module.exports = router;
