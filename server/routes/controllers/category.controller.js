const CategoryRepo = require('../../repository/category.repo');
const { successRes } = require('../../utils/resposeUtils');
const { CustomError } = require('../../utils/errorHandling');
const { validate, categoryValidate } = require('../../utils/validation');

exports.getAll = async (req, res, next) => {
  const category = await CategoryRepo.getList();
  successRes(res, category);
};

exports.get = async (req, res, next) => {
  const id = req.params.id;
  const category = await CategoryRepo.findById(id);
  successRes(res, category);
};

exports.store = async (req, res, next) => {
  validate(categoryValidate, req.body, false);
  const { name } = req.body;
  const image = req.file;
  if (!image) throw new CustomError(1, 400, 'Invalid image');
  const category = await CategoryRepo.create(
    name,
    image.path.replace('public', '')
  );
  successRes(res, category);
};

exports.update = async (req, res, next) => {
  validate(categoryValidate, req.body, true);
  const id = req.params.id;
  const { name } = req.body;
  let image;
  if (req.file) {
    image = req.file.path.replace('public', '');
  }
  const category = await CategoryRepo.update(id, name, image);
  successRes(res, category);
};

exports.delete = async (req, res, next) => {
  const id = req.params.id;
  await CategoryRepo.delete(id);
  successRes(res);
};
