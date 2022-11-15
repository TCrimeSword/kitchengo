const Joi = require('joi');
const registerValidate = (data) => {
  const userSchema = Joi.object({
    username: Joi.string().alphanum().min(2).max(50).required(),
    password: Joi.string()
      .min(4)
      .max(32)
      .pattern(new RegExp('^[a-zA-Z0-9]{3,30}$'))
      .required(),
    email: Joi.string().email().required(),
  });
  return userSchema.validate(data);
};

module.exports = {
  registerValidate,
};
