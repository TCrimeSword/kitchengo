const AccountRepo = require('../../../repository/account.repo');
const { validate, registerValidate } = require('../../../utils/validation');
const { successRes } = require('../../../utils/resposeUtils');

exports.index = async (req, res) => {
  const { page } = req.query;
  const PER_PAGE = 10;
  const accounts = await AccountRepo.getList(null, page, PER_PAGE);
  res.render('admin/accounts', { accounts });
};

exports.show = async (req, res) => {
  const id = req.params.id;
  const account = await AccountRepo.findById(id);
  res.render('admin/accounts/show', { account });
};

exports.create = async (req, res) => {
  res.render('admin/accounts/add');
};

exports.store = async (req, res, next) => {
  validate(registerValidate, req.body);
  await AccountRepo.create(req.body);
  res.redirect('/admin/accounts');
};

exports.edit = async (req, res, next) => {
  const id = req.params.id;
  const account = await AccountRepo.findById(id);
  res.render('admin/accounts/edit', { account });
};

exports.update = async (req, res, next) => {
  const id = req.params.id;
  validate(registerValidate, req.body);
  await AccountRepo.update(id, req.body);
  res.redirect('/admin/accounts');
};

exports.destroy = async (req, res, next) => {
  const id = req.params.id;
  await AccountRepo.delete(id);
  successRes(res);
};
