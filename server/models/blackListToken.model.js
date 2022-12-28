const mongoose = require('mongoose');
const { Schema } = mongoose;

const blackListTokenSchema = new Schema(
  {
    token: { type: String, required: true },
    iat: { type: Date },
  },
  {
    timestamps: true,
  }
);
const BlackListTokenModel = mongoose.model(
  'BlackListToken',
  blackListTokenSchema
);
module.exports = BlackListTokenModel;
