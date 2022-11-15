const UserModel = require('../models/user.model');
const { Op } = require('sequelize');

class UserRepo {
  async getList() {
    const users = await UserModel.findAll();
    return users;
  }
  async getById(id) {
    const user = UserModel.findByPk(id);
    return user;
  }
  async getByUserName(username) {
    const user = await UserModel.findOne({ where: { username } });
    return user;
  }
  async getByUserNameOrEmail(username, email) {
    const user = await UserModel.findOne({
      where: { [Op.or]: [{ username }, { email }] },
    });
    return user;
  }
  async create(user) {
    const newUser = await UserModel.create(user);
    return newUser;
  }
  async update(user) {
    const result = await UserModel.update(user, {
      where: { id: user.id },
    });
    return result;
  }
  async delete(id) {
    const result = await UserModel.destroy({ where: { id } });
    return result;
  }
}

module.exports = new UserRepo();
