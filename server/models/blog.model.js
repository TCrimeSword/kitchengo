const mongoose = require('mongoose');
const { Schema } = mongoose;

const blogSchema = new Schema(
  {
    title: { type: String, required: true }, // String is shorthand for {type: String}
    author: { type: Schema.Types.ObjectId, ref: 'Account' },
    content: { type: String },
    comments: [
      {
        id: Schema.Types.ObjectId,
        account: { type: Schema.Types.ObjectId, ref: 'Account' },
        content: { type: String, required: true },
      },
    ],
    images: { type: String },
  },
  {
    timestamps: true,
  }
);
const BlogModel = mongoose.model('Blog', blogSchema);
module.exports = BlogModel;
