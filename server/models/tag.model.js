const mongoose = require('mongoose');
const { Schema } = mongoose;

const tagSchema = new Schema(
  {
    name: { type: String, required: true },
    description: { type: String },
    image: { type: String, required: true },
    recipes: { type: Schema.Types.ObjectId, ref: 'Recipe' },
  },
  {
    timestamps: true,
  }
);
const TagModel = mongoose.model('Tags', tagSchema);
module.exports = TagModel;
