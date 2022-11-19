const mongoose = require('mongoose');
const { Schema } = mongoose;

const recipeSchema = new Schema(
  {
    title: { type: String, required: true }, // String is shorthand for {type: String}
    description: { type: String },
    author: { type: Schema.Types.ObjectId, ref: 'Account' },
    ingredients: [
      {
        name: { type: String },
        amount: { type: Number },
        unit: { type: String },
      },
    ],
    comments: [
      {
        id: Schema.Types.ObjectId,
        account: { type: Schema.Types.ObjectId, ref: 'Account' },
        content: { type: String, required: true },
      },
    ],
    images: [
      {
        id: Schema.Types.ObjectId,
        url: { type: String, required: true },
      },
    ],
  },
  {
    timestamps: true,
  }
);
const RecipeModel = mongoose.model('Recipe', recipeSchema);
module.exports = RecipeModel;
