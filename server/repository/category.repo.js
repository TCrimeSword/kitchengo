const Category = require('../models/category.model');
const { CustomError } = require('../utils/errorHandling');

class CategoryRepo {
  async getList() {
    const list = await Category.find();
    return list;
  }

  async findById(id) {
    const category = await Category.findById(id);
    if (!category) throw new CustomError(6, 404, 'Category not found');
    return category;
  }

  async findByName(name) {
    const category = await Category.findOne({
      name: { $regex: name, $option: 'i' },
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
