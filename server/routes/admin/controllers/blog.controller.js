const BlogRepo = require('../../../repository/blog.repo');
const { successRes } = require('../../../utils/resposeUtils');

exports.index = async (req, res) => {
  const { page } = req.query;
  const PER_PAGE = 10;
  const blogs = await BlogRepo.getList(null, page, PER_PAGE);
  for (let blog of blogs) {
    blog.content = blog.content.htmlToText();
  }
  res.render('admin/blogs', { blogs });
};

exports.show = async (req, res) => {
  const id = req.params.id;
  const blog = await BlogRepo.findById(id);
  res.render('admin/blogs/show', { blog });
};

exports.create = async (req, res) => {
  res.render('admin/blogs/add');
};

exports.store = async (req, res, next) => {
  const { title, contents } = req.body;
  const authorId = req.accountId || '637839fbc1d0ee46dcd5cb7a';
  await BlogRepo.create(title, authorId, contents);
  res.redirect('/admin/blogs');
};

exports.edit = async (req, res, next) => {
  const id = req.params.id;
  const blog = await BlogRepo.findById(id);
  res.render('admin/blogs/edit', { blog });
};

exports.update = async (req, res, next) => {
  const id = req.params.id;
  const { title, contents } = req.body;
  await BlogRepo.update(id, title.trim(), contents.trim());
  res.redirect('/admin/blogs');
};

exports.destroy = async (req, res, next) => {
  const id = req.params.id;
  await BlogRepo.delete(id);
  successRes(res);
};
