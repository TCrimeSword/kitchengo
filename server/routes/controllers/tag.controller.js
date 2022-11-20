const TagRepo = require('../../repository/tag.repo');
const { successRes } = require('../../utils/resposeUtils');
const { CustomError } = require('../../utils/errorHandling');
const { validate, tagValidate } = require('../../utils/validation');

exports.getAll = async (req, res, next) => {
  const tag = await TagRepo.getList();
  successRes(res, tag);
};

exports.get = async (req, res, next) => {
  const id = req.params.id;
  const tag = await TagRepo.findById(id);
  successRes(res, tag);
};

exports.store = async (req, res, next) => {
  validate(tagValidate, req.body, false);
  const { name } = req.body;
  const image = req.file;
  if (!image) throw new CustomError(1, 400, 'Invalid image');
  const tag = await TagRepo.create(name, image.path.replace('public', ''));
  successRes(res, tag);
};

exports.update = async (req, res, next) => {
  validate(tagValidate, req.body, true);
  const id = req.params.id;
  const { name } = req.body;
  const image = req.file;
  const tag = await TagRepo.update(id, name, image.path.replace('public', ''));
  successRes(res, tag);
};

exports.delete = async (req, res, next) => {
  const id = req.params.id;
  await TagRepo.delete(id);
  successRes(res);
};
