const path = require('path');
const fs = require('fs');
const BlogRepo = require('../../../repository/blog.repo');
const { successRes } = require('../../../utils/resposeUtils');
const { randomString } = require('../../../utils/utils');

exports.index = async (req, res) => {
  const { page } = req.query;
  const PER_PAGE = 10;
  const blogs = await BlogRepo.getList(null, page, PER_PAGE);
  for (let blog of blogs) {
    blog.content = blog.content.htmlToText();
  }
  res.render('admin/blogs', { blogs });
};

exports.show = async (req, res) => {
  const id = req.params.id;
  const blog = await BlogRepo.findById(id);
  res.render('admin/blogs/show', { blog });
};

exports.create = async (req, res) => {
  res.render('admin/blogs/add');
};

exports.store = async (req, res, next) => {
  const { title, contents } = req.body;
  const authorId = req.accountId || '637839fbc1d0ee46dcd5cb7a';
  await BlogRepo.create(title, authorId, contents);
  res.redirect('/admin/blogs');
};

exports.edit = async (req, res, next) => {
  const id = req.params.id;
  const blog = await BlogRepo.findById(id);
  res.render('admin/blogs/edit', { blog });
};

exports.update = async (req, res, next) => {
  const id = req.params.id;
  const { title, contents } = req.body;
  await BlogRepo.update(id, title.trim(), contents.trim());
  res.redirect('/admin/blogs');
};

exports.destroy = async (req, res, next) => {
  const id = req.params.id;
  await BlogRepo.delete(id);
  successRes(res);
};

exports.uploadImage = async (req, res, next) => {
  fs.readFile(req.files.upload.path, function (err, data) {
    const fileName = randomString();
    var newPath = path.join(
      __dirname,
      '../../../public/images/blogs/' + fileName
    );
    // __dirname + '../../../public/images/recipes/' + req.files.upload.name;
    fs.writeFile(newPath, data, function (err) {
      if (err) console.log({ err: err });
      else {
        let url = '/images/blogs/' + fileName;
        let msg = 'Upload successfully';
        let funcNum = req.query.CKEditorFuncNum;

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
