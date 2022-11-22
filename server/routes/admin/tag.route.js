const express = require('express');
const multer = require('multer');
const upload = multer({ dest: 'public/images/tags' });
const TagController = require('./controllers/tag.controller');
const { tryCatchFunc } = require('../../utils/errorHandling');
const router = express.Router();

const cpUpload = upload.fields([
  { name: 'image', maxCount: 1 },
  { name: 'backgroundImage', maxCount: 1 },
]);

/**
 * Index View
 */
router.get('/', tryCatchFunc(TagController.index));

/**
 * Create View
 */
router.get('/add', tryCatchFunc(TagController.create));

/**
 * Edit View
 */
router.get('/edit/:id', tryCatchFunc(TagController.edit));

/**
 * Update
 */
router.patch(
  '/:id',
  upload.single('image'),
  tryCatchFunc(TagController.update)
);

/**
 * Create
 */
router.post('/', upload.single('image'), tryCatchFunc(TagController.store));

/**
 * Delete
 */
router.delete('/:id', tryCatchFunc(TagController.destroy));

module.exports = router;
