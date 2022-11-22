const CategoryRepo = require('../../../repository/category.repo');
const { successRes } = require('../../../utils/resposeUtils');
const { CustomError } = require('../../../utils/errorHandling');
const { validate, categoryValidate } = require('../../../utils/validation');

exports.index = async (req, res) => {
  const { page } = req.query;
  const PER_PAGE = 10;
  const categories = await CategoryRepo.getList(null, page, PER_PAGE);
  res.render('admin/categories', { categories });
};

exports.create = async (req, res) => {
  res.render('admin/categories/add');
};

exports.store = async (req, res, next) => {
  validate(categoryValidate, req.body, false);
  const { name } = req.body;
  let image;
  if (req.file) {
    image = req.file.path.replace('public', '');
  }
  // if (!image) throw new CustomError(1, 400, 'Invalid image');
  await CategoryRepo.create(name, image);
  res.redirect('/admin/categories');
};

exports.edit = async (req, res, next) => {
  const id = req.params.id;
  const category = await CategoryRepo.findById(id);
  res.render('admin/categories/edit', { category });
};

exports.update = async (req, res, next) => {
  // validate(categoryValidate, req.body, true);
  const id = req.params.id;
  const { name } = req.body;
  let image;
  if (req.file) {
    image = req.file.path.replace('public', '');
  }
  await CategoryRepo.update(id, name.trim(), image);
  successRes(res);
};

exports.destroy = async (req, res, next) => {
  const id = req.params.id;
  await CategoryRepo.delete(id);
  successRes(res);
};
