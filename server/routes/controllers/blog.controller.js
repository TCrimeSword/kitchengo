const BlogRepo = require('../../repository/blog.repo');
const { successRes } = require('../../utils/resposeUtils');
const { validate, blogValidate } = require('../../utils/validation');

exports.getAll = async (req, res, next) => {
  const blog = await BlogRepo.getList();
  successRes(res, blog);
};

exports.get = async (req, res, next) => {
  const id = req.params.id;
  const blog = await BlogRepo.findById(id);
  successRes(res, blog);
};

exports.store = async (req, res, next) => {
  validate(blogValidate, req.body, false);
  const { title, content } = req.body;
  const author = req.accountId;
  const images = req.files;
  let imageUrls = [];
  for (let i = 0; i < images.length; i++) {
    imageUrls.push(images[i].path.replace('public', ''));
  }
  const blog = await BlogRepo.create(title, author, content, imageUrls);
  successRes(res, blog);
};

exports.update = async (req, res, next) => {
  validate(blogValidate, req.body, true);
  const id = req.params.id;
  const { title, author, content } = req.body;
  const blog = await BlogRepo.update(id, title, author, content);
  successRes(res, blog);
};

exports.delete = async (req, res, next) => {
  const id = req.params.id;
  await BlogRepo.delete(id);
  successRes(res);
};

/**
 * Add comment with path /blogs/:id/comments
 * @param {*} req
 * @param {*} res
 * @param {*} next
 */
exports.addComment = async (req, res, next) => {
  const accountId = req.accountId;
  const { content } = req.body;
  const recipeId = req.params.id;
  const recipe = await BlogRepo.addComment(recipeId, accountId, content);
  successRes(res, recipe);
};
