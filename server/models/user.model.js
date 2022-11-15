const { DataTypes } = require('sequelize');
const sequelize = require('../helpers/connectDB');
const bcrypt = require('bcrypt');

const User = sequelize.define(
  'User',
  {
    id: {
      type: DataTypes.BIGINT.UNSIGNED,
      primaryKey: true,
      autoIncrement: true,
    },
    username: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true,
    },
    password: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    email: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true,
    },
    refreshToken: {
      type: DataTypes.STRING,
    },
  },
  {
    timeStamp: true,
    tableName: 'User',
  }
);

User.prototype.isCheckPassword = async function (password) {
  return await bcrypt.compare(password, this.password);
};

User.beforeCreate(async (user, options) => {
  const salt = 10;
  const hashedPassword = await bcrypt.hash(user.password, salt);
  user.password = hashedPassword;
});

User.sync({ alter: true })
  .then(() => console.log('Sync DB'))
  .catch((err) => console.log('Sync error: ' + err));

module.exports = User;
