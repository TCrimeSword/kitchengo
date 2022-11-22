const TagRepo = require('../../../repository/tag.repo');
const { successRes } = require('../../../utils/resposeUtils');
const { CustomError } = require('../../../utils/errorHandling');
const { validate, tagValidate } = require('../../../utils/validation');

exports.index = async (req, res) => {
  const { page } = req.query;
  const PER_PAGE = 10;
  const tags = await TagRepo.getList(null, page, PER_PAGE);
  res.render('admin/tags', { tags });
};

exports.create = async (req, res) => {
  res.render('admin/tags/add');
};

exports.store = async (req, res, next) => {
  validate(tagValidate, req.body, false);
  const { name } = req.body;
  const image = req.file;
  if (!image) throw new CustomError(1, 400, 'Invalid image');
  await TagRepo.create(name, image.path.replace('public', ''));
  res.redirect('/admin/tags');
};

exports.edit = async (req, res, next) => {
  const id = req.params.id;
  const tag = await TagRepo.findById(id);
  res.render('admin/tags/edit', { tag });
};

exports.update = async (req, res, next) => {
  validate(tagValidate, req.body, true);
  const id = req.params.id;
  const { name } = req.body;
  let image;
  if (req.file) {
    image = req.file.path.replace('public', '');
  }
  await TagRepo.update(id, name.trim(), image);
  successRes(res);
};

exports.destroy = async (req, res, next) => {
  const id = req.params.id;
  await TagRepo.delete(id);
  successRes(res);
};
