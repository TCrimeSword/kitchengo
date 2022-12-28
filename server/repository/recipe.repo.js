const Recipe = require('../models/recipe.model');
const { CustomError } = require('../utils/errorHandling');

class RecipeRepo {
  async getList() {
    const list = await Recipe.find()
      .populate('author', '-password -refreshToken')
      .populate({
        path: 'comments',
        populate: { path: 'account', select: '-password -refreshToken' },
      });
    // list['comments'].populate('account');
    return list;
  }

  async findById(id) {
    const recipe = await Recipe.findById(id);
    if (!recipe) throw new CustomError(6, 404, 'Recipe not found');
    return recipe;
  }

  async findByTitle(title) {
    const recipe = await Recipe.findOne({
      title: { $regex: title, $option: 'i' },
    });
    return recipe;
  }

  async create(title, description, author, ingredients, images) {
    const recipe = new Recipe({ title, author, description });
    if (ingredients) {
      for (let item of ingredients) {
        recipe.ingredients.push(item);
      }
    }
    if (images) {
      for (let item of images) {
        recipe.images.push({ url: item });
      }
    }
    await recipe.save();
    return recipe;
  }

  async update(id, title, description, ingredients, images) {
    const recipe = await Recipe.findByIdAndUpdate(id, {
      title,
      description,
      ingredients,
      images,
    });
    return recipe;
  }
  async delete(id) {
    const res = await Recipe.findByIdAndRemove(id);
    if (!res) throw new CustomError(6, 404, 'Recipe not found');
    return res.nRemoved;
  }

  async addComment(recipeId, accountId, content) {
    const recipe = await Recipe.findById(recipeId);
    if (!recipe) throw new CustomError(6, 404, 'Recipe not found');
    recipe.comments.push({ account: accountId, content: content });
    await recipe.save();
    return recipe;
  }
}

module.exports = new RecipeRepo();
