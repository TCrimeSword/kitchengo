const RoleRepo = require('../../../repository/role.repo');
const { successRes } = require('../../../utils/resposeUtils');

exports.index = async (req, res) => {
  const { page } = req.query;
  const PER_PAGE = 10;
  const roles = await RoleRepo.getList(null, page, PER_PAGE);
  for (let role of roles) {
    role.content = role.content.htmlToText();
  }
  res.render('admin/roles', { roles });
};

exports.show = async (req, res) => {
  const id = req.params.id;
  const role = await RoleRepo.findById(id);
  res.render('admin/roles/show', { role });
};

exports.create = async (req, res) => {
  res.render('admin/roles/add');
};

exports.store = async (req, res, next) => {
  const { title, contents } = req.body;
  const authorId = req.accountId || '637839fbc1d0ee46dcd5cb7a';
  await RoleRepo.create(title, authorId, contents);
  res.redirect('/admin/roles');
};

exports.edit = async (req, res, next) => {
  const id = req.params.id;
  const role = await RoleRepo.findById(id);
  res.render('admin/roles/edit', { role });
};

exports.update = async (req, res, next) => {
  const id = req.params.id;
  const { title, contents } = req.body;
  await RoleRepo.update(id, title.trim(), contents.trim());
  res.redirect('/admin/roles');
};

exports.destroy = async (req, res, next) => {
  const id = req.params.id;
  await RoleRepo.delete(id);
  successRes(res);
};
