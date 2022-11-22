const fs = require('fs');
const path = require('path');
const RecipeRepo = require('../../../repository/recipe.repo');
const { successRes } = require('../../../utils/resposeUtils');
const { validate, recipeValidate } = require('../../../utils/validation');

exports.index = async (req, res) => {
  const { page } = req.query;
  const PER_PAGE = 10;
  const recipes = await RecipeRepo.getList(null, page, PER_PAGE);
  if (recipes) {
    for (let recipe of recipes) {
      recipe.content = recipe.content
        ? recipe.content.htmlToText()
        : recipe.content;
    }
  }
  res.render('admin/recipes', { recipes });
};

exports.show = async (req, res) => {
  const id = req.params.id;
  const recipe = await RecipeRepo.findById(id);
  res.render('admin/recipes/show', { recipe });
};

exports.create = async (req, res) => {
  res.render('admin/recipes/add');
};

exports.store = async (req, res, next) => {
  validate(recipeValidate, req.body, false);
  const { title, description, ingredients } = req.body;
  const images = req.files;
  let imageUrls = [];
  if (images) {
    for (let i = 0; i < images.length; i++) {
      imageUrls.push(images[i].path.replace('public', ''));
    }
  }
  const authorId = req.accountId || '637839fbc1d0ee46dcd5cb7a';
  await RecipeRepo.create(title, description, authorId, ingredients, imageUrls);
  res.redirect('/admin/recipes');
};

exports.edit = async (req, res, next) => {
  const id = req.params.id;
  const recipe = await RecipeRepo.findById(id);
  res.render('admin/recipes/edit', { recipe });
};

exports.update = async (req, res, next) => {
  // validate(recipeValidate, req.body, true);
  const id = req.params.id;
  const { title, description, ingredients, images } = req.body;
  await RecipeRepo.update(
    id,
    title.trim(),
    description.trim(),
    ingredients,
    images
  );
  successRes(res);
};

exports.destroy = async (req, res, next) => {
  const id = req.params.id;
  await RecipeRepo.delete(id);
  successRes(res);
};

// TODO: Xem hiểu  lại cách Upload file và Cách thêm nguyên liệu vào CThức
exports.uploadImage = async (req, res, next) => {
  fs.readFile(req.files.upload.path, function (err, data) {
    var newPath = path.join(
      __dirname,
      '../../../public/images/recipes/' + req.files.upload.name
    );
    // __dirname + '../../../public/images/recipes/' + req.files.upload.name;
    fs.writeFile(newPath, data, function (err) {
      if (err) console.log({ err: err });
      else {
        console.log(req.files.upload.originalFilename);
        //     imgl = '/images/req.files.upload.originalFilename';
        //     let img = "<script>window.parent.CKEDITOR.tools.callFunction('','"+imgl+"','ok');</script>";
        //    res.status(201).send(img);

        let fileName = req.files.upload.name;
        let url = '/images/recipes/' + fileName;
        let msg = 'Upload successfully';
        let funcNum = req.query.CKEditorFuncNum;
        console.log({ url, msg, funcNum });

        res
          .status(201)
          .send(
            "<script>window.parent.CKEDITOR.tools.callFunction('" +
              funcNum +
              "','" +
              url +
              "','" +
              msg +
              "');</script>"
          );
      }
    });
  });
  // console.log('ok');
};
