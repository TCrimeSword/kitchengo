const express = require('express');
const multer = require('multer');
const { tryCatchFunc } = require('../utils/errorHandling');

const upload = multer({ dest: 'public/images/tags' });
const TagController = require('./controllers/tag.controller');

const router = express.Router();

router.get('/', tryCatchFunc(TagController.getAll));
router.get('/:id', tryCatchFunc(TagController.get));
router.post('/', upload.single('image'), tryCatchFunc(TagController.store));
router.patch(
  '/:id',
  upload.single('image'),
  tryCatchFunc(TagController.update)
);
router.delete('/:id', tryCatchFunc(TagController.delete));

module.exports = router;
