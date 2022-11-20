const Tag = require('../models/tag.model');
const { CustomError } = require('../utils/errorHandling');

class TagRepo {
  async getList() {
    const list = await Tag.find();
    return list;
  }

  async findById(id) {
    const tag = await Tag.findById(id);
    if (!tag) throw new CustomError(6, 404, 'Tag not found');
    return tag;
  }

  async findByName(name) {
    const tag = await Tag.findOne({
      name: { $regex: name, $option: 'i' },
    });
    return tag;
  }

  async create(name, image) {
    const tag = new Tag({ name, image });
    await tag.save();
    return tag;
  }

  async update(id, name, image) {
    const tag = await Tag.findByIdAndUpdate(id, {
      name,
      image,
    });
    return tag;
  }
  async delete(id) {
    const res = await Tag.findByIdAndRemove(id);
    if (!res) throw new CustomError(6, 404, 'Tag not found');
    return res.nRemoved;
  }
}

module.exports = new TagRepo();
