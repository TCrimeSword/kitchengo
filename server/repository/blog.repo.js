const Blog = require('../models/blog.model');
const { CustomError } = require('../utils/errorHandling');

//TODO mock data Blog
class BlogRepo {
  async getList() {
    const list = await Blog.find();
    return list;
  }

  async findById(id) {
    const blog = await Blog.findById(id).populate('author', [
      'username',
      'email',
      'avatar',
    ]);
    if (!blog) throw new CustomError(6, 404, 'Blog not found');
    return blog;
  }

  async findByTitle(title) {
    const blog = await Blog.findOne({
      title: { $regex: title, $option: 'i' },
    });
    return blog;
  }

  async create(title, author, content, images) {
    const blog = new Blog({ title, content, author });
    if (images) {
      for (let item of images) {
        Blog.images.push({ url: item });
      }
    }
    await blog.save();
    return blog;
  }

  async update(id, title, content) {
    const blog = await Blog.findByIdAndUpdate(id, {
      title,
      content,
    });
    return blog;
  }
  async delete(id) {
    const res = await Blog.findByIdAndRemove(id);
    if (!res) throw new CustomError(6, 404, 'Blog not found');
    return res.nRemoved;
  }

  async addComment(BlogId, accountId, content) {
    const blog = await Blog.findById(BlogId);
    if (!blog) throw new CustomError(6, 404, 'Blog not found');
    blog.comments.push({ account: accountId, content: content });
    await blog.save();
    return blog;
  }
}

module.exports = new BlogRepo();
