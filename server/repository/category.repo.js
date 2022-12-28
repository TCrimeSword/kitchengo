const Category = require('../models/category.model');
const { CustomError } = require('../utils/errorHandling');

class CategoryRepo {
  async getList() {
    const list = await Category.find()
      .populate('recipes')
      .populate({
        path: 'recipes',
        populate: [
          {
            path: 'comments',
            populate: { path: 'account', select: '-password -refreshToken' },
          },
          {
            path: 'author',
            select: '-password -refreshToken',
          },
        ],
      });
    return list;
  }

  async findById(id) {
    const category = await Category.findById(id)
      .populate('recipes')
      .populate({
        path: 'recipes',
        populate: {
          path: 'comments',
          populate: { path: 'account', select: '-password -refreshToken' },
        },
      });
    if (!category) throw new CustomError(6, 404, 'Category not found');
    return category;
  }

  async findByName(name) {
    const category = await Category.findOne({
      name: { $regex: name, $option: 'i' },
    })
      .populate('recipes')
      .populate({
        path: 'recipes',
        populate: {
          path: 'comments',
          populate: { path: 'account', select: '-password -refreshToken' },
        },
      });
    return category;
  }

  async create(name, image) {
    const category = new Category({ name, image });
    await category.save();
    return category;
  }

  async update(id, name, image) {
    const category = await Category.findByIdAndUpdate(id, {
      name,
      image,
    });
    return category;
  }
  async delete(id) {
    const res = await Category.findByIdAndRemove(id);
    if (!res) throw new CustomError(6, 404, 'Category not found');
    return res.nRemoved;
  }
}

module.exports = new CategoryRepo();
