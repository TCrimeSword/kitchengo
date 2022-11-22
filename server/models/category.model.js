const mongoose = require('mongoose');
const { Schema } = mongoose;

const categorySchema = new Schema(
  {
    name: { type: String, required: true }, // String is shorthand for {type: String}
    image: { type: String },
  },
  {
    timestamps: true,
  }
);
const CategoryModel = mongoose.model('Category', categorySchema);
module.exports = CategoryModel;
