const User = require('../../repository/user.repo');

exports.getAll = async (req, res, next) => {
  const categories = await User.getList();
  res.status(200).json({ success: true, data: categories });
};

exports.get = async (req, res, next) => {};

exports.create = async (req, res, next) => {};

exports.update = async (req, res, next) => {};

exports.delete = async (req, res, next) => {
  const { id } = req.params;
  const result = await User.delete(id);
  if (result === 0) throw new CustomError(6, 404, 'User not found');
  return res.status(200).json({ success: true });
};
