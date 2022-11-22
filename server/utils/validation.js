const Joi = require('joi');
const { CustomError } = require('./errorHandling');
const registerValidate = (data) => {
  const accountSchema = Joi.object({
    username: Joi.string().alphanum().min(2).max(50).required(),
    password: Joi.string()
      .min(4)
      .max(32)
      .pattern(new RegExp('^[a-zA-Z0-9]{3,30}$'))
      .required(),
    email: Joi.string().email().required(),
  });
  return accountSchema.validate(data);
};

const loginValidate = (data) => {
  const accountSchema = Joi.object({
    username: Joi.string().alphanum().min(2).max(50).required(),
    password: Joi.string()
      .min(4)
      .max(32)
      .pattern(new RegExp('^[a-zA-Z0-9]{3,30}$'))
      .required(),
  });
  return accountSchema.validate(data);
};

const recipeValidate = (data, isUpdate) => {
  let recipeSchema;
  if (isUpdate) {
    recipeSchema = Joi.object({
      title: Joi.string().min(5).max(150),
      description: Joi.string().min(5),
      ingredients: Joi.array().items(
        Joi.object({
          name: Joi.string().min(1).max(100),
          amount: Joi.number(),
          unit: Joi.string().min(1).max(50),
        })
      ),
      images: Joi.array(),
    });
  } else {
    recipeSchema = Joi.object({
      title: Joi.string().min(5).max(150).required(),
      description: Joi.string().min(5),
      ingredients: Joi.array().items(
        Joi.object({
          name: Joi.string().min(1).max(100),
          amount: Joi.number(),
          unit: Joi.string().min(1).max(50),
        })
      ),
      images: Joi.array(),
    });
  }
  return recipeSchema.validate(data);
};

const blogValidate = (data, isUpdate) => {
  let blogSchema;
  if (isUpdate) {
    blogSchema = Joi.object({
      title: Joi.string().min(5).max(150),
      content: Joi.string().min(5),
      images: Joi.array(),
    });
  } else {
    blogSchema = Joi.object({
      title: Joi.string().min(5).max(150).required(),
      content: Joi.string().min(5),
      images: Joi.array(),
    });
  }
  return blogSchema.validate(data);
};

const categoryValidate = (data, isUpdate) => {
  let categorySchema;
  if (isUpdate) {
    categorySchema = Joi.object({
      name: Joi.string().min(1).max(150),
      image: Joi.any(),
    });
  } else {
    categorySchema = Joi.object({
      name: Joi.string().min(1).max(150).required(),
      image: Joi.any(),
    });
  }
  return categorySchema.validate(data);
};

const tagValidate = (data, isUpdate) => {
  let tagSchema;
  if (isUpdate) {
    tagSchema = Joi.object({
      name: Joi.string().min(5).max(150),
      image: Joi.any(),
    });
  } else {
    tagSchema = Joi.object({
      name: Joi.string().min(5).max(150).required(),
      image: Joi.any(),
    });
  }
  return tagSchema.validate(data);
};

const validate = (validateFunc, data, isUpdate) => {
  const res = validateFunc(data, isUpdate);
  if (res.error)
    throw new CustomError(
      1,
      400,
      'Data is not valid: ' + res.error.details[0].message
    );
  return res;
};

module.exports = {
  registerValidate,
  loginValidate,
  recipeValidate,
  blogValidate,
  tagValidate,
  categoryValidate,
  validate,
};
