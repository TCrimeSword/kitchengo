const RecipeRepo = require('../../repository/recipe.repo');
const { successRes } = require('../../utils/resposeUtils');
const { CustomError } = require('../../utils/errorHandling');
const { validate, recipeValidate } = require('../../utils/validation');

exports.getAll = async (req, res, next) => {
  const recipes = await RecipeRepo.getList();
  successRes(res, recipes);
};

exports.get = async (req, res, next) => {
  const id = req.params.id;
  const recipe = await RecipeRepo.findById(id);
  successRes(res, recipe);
};

// TODO: Tìm cách khi thêm recipe có thể thêm nguyên liệu
exports.store = async (req, res, next) => {
  validate(recipeValidate, req.body, false);
  const { title, description, ingredients } = req.body;
  const author = req.accountId;
  const images = req.files;
  let imageUrls = [];
  for (let i = 0; i < images.length; i++) {
    imageUrls.push(images[i].path.replace('public', ''));
  }
  const recipe = await RecipeRepo.create(
    title,
    description,
    author,
    ingredients,
    imageUrls
  );
  successRes(res, recipe);
};

// TODO: Sửa lại cách Update image
exports.update = async (req, res, next) => {
  validate(recipeValidate, req.body, true);
  const id = req.params.id;
  const { title, description, ingredients, images } = req.body;
  const recipe = await RecipeRepo.update(
    id,
    title,
    description,
    ingredients,
    images
  );
  successRes(res, recipe);
};

exports.delete = async (req, res, next) => {
  const id = req.params.id;
  const row = await RecipeRepo.delete(id);
  successRes(res);
};

/**
 * Add comment with path /recipes/:id/comments
 * @param {*} req
 * @param {*} res
 * @param {*} next
 */
exports.addComment = async (req, res, next) => {
  const accountId = req.accountId;
  const { content } = req.body;
  const recipeId = req.params.id;
  const recipe = await RecipeRepo.addComment(recipeId, accountId, content);
  successRes(res, recipe);
};
