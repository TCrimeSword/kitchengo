const mongoose = require('mongoose');
const { Schema } = mongoose;

const categorySchema = new Schema(
  {
    name: { type: String, required: true }, // String is shorthand for {type: String}
    image: { type: String, required: true },
  },
  {
    timestamps: true,
  }
);
const CategoryModel = mongoose.model('Tag', categorySchema);
module.exports = CategoryModel;
