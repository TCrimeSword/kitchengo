const Account = require('../models/account.model');

class AccountRepo {
  async getList() {
    const accounts = await Account.find();
    return accounts;
  }
  async getById(id) {
    const account = await Account.findById(id);
    return account;
  }
  async getByUserName(username) {
    const account = await Account.findOne({ username });
    return account;
  }
  async getByUserNameOrEmail(username, email) {
    const account = await Account.findOne({ $or: [{ username }, { email }] });
    return account;
  }
  async create(data) {
    const newAccount = new Account(data);
    await newAccount.save();
    return newAccount;
  }
  async update(id, data) {
    const account = await Account.findByIdAndUpdate(id, data);
    return account;
  }
  async delete(id) {
    const res = await Account.findByIdAndRemove(id);
    if (!res) throw new CustomError(6, 404, 'Account not found');
    return res.nRemoved;
  }
}

module.exports = new AccountRepo();
