const BlackListToken = require('../models/blackListToken.model');
const { CustomError } = require('../utils/errorHandling');

class BlackListTokenRepo {
  async getList() {
    const list = await BlackListToken.find();
    return list;
  }

  async findById(id) {
    const blackListToken = await BlackListToken.findById(id);
    if (!blackListToken)
      throw new CustomError(6, 404, 'BlackListToken not found');
    return blackListToken;
  }

  async findByToken(token) {
    const blackListToken = await BlackListToken.findOne({
      token: { $regex: token, $options: 'i' },
    });
    return blackListToken;
  }

  async create(token, iat) {
    const blackListToken = new BlackListToken({ token, iat });
    await blackListToken.save();
    return blackListToken;
  }

  async delete(id) {
    const res = await BlackListToken.findByIdAndRemove(id);
    if (!res) throw new CustomError(6, 404, 'Black list Token not found');
    return res.nRemoved;
  }
}

module.exports = new BlackListTokenRepo();
