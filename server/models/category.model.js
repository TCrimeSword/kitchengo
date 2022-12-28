const mongoose = require('mongoose');
const { Schema } = mongoose;

const categorySchema = new Schema(
  {
    name: { type: String, required: true },
    image: { type: String, required: true },
    description: { type: String },
    recipes: [{ type: Schema.Types.ObjectId, ref: 'Recipe' }],
  },
  {
    timestamps: true,
  }
);
const CategoryModel = mongoose.model('Category', categorySchema);
module.exports = CategoryModel;
