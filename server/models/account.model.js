const mongoose = require('mongoose');
const bcrypt = require('bcrypt');
const { Schema } = mongoose;

const accountSchema = new Schema(
  {
    username: { type: String, required: true }, // String is shorthand for {type: String}
    password: { type: String, required: true },
    email: { type: String, required: true },
    role: { type: String },
    avatar: { type: String },
    refreshToken: { type: String },
  },
  {
    timestamps: true,
  }
);

accountSchema.methods.isPassword = async function (password) {
  const res = await bcrypt.compare(password, this.password);
  return res;
};

accountSchema.pre('save', async function (next) {
  if (this.isNew) {
    try {
      this.password = await bcrypt.hash(this.password, 10);
      next();
    } catch (error) {
      throw new Error(error);
    }
  }
});

const AccountModel = mongoose.model('Account', accountSchema);
module.exports = AccountModel;
