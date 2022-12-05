const express = require('express');
const multer = require('multer');
const multipart = require('connect-multiparty');
const multipartMiddleware = multipart();
const upload = multer({ dest: 'public/images/blogs' });
const BlogController = require('./controllers/blog.controller');
const { tryCatchFunc } = require('../../utils/errorHandling');
const router = express.Router();

/**
 * Index View
 */
router.get('/', tryCatchFunc(BlogController.index));

/**
 * Create View
 */
router.get('/add', tryCatchFunc(BlogController.create));

/**
 * Show detail View
 */
router.get('/:id', tryCatchFunc(BlogController.show));

/**
 * Edit View
 */
router.get('/edit/:id', tryCatchFunc(BlogController.edit));

/**
 * Update
 */
router.patch('/:id', tryCatchFunc(BlogController.update));

/**
 * Create
 */
router.post('/', tryCatchFunc(BlogController.store));

/**
 * Delete
 */
router.delete('/:id', tryCatchFunc(BlogController.destroy));

/**
 * Upload Image
 */
router.post(
  '/image',
  multipartMiddleware,
  tryCatchFunc(BlogController.uploadImage)
);

module.exports = router;
