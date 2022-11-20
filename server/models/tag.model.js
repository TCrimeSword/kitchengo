const mongoose = require('mongoose');
const { Schema } = mongoose;

const tagSchema = new Schema(
  {
    name: { type: String, required: true }, // String is shorthand for {type: String}
    image: { type: String, required: true },
  },
  {
    timestamps: true,
  }
);
const TagModel = mongoose.model('Tags', tagSchema);
module.exports = TagModel;
