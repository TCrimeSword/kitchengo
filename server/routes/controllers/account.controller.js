const { CustomError } = require('../../utils/errorHandling');
const User = require('../../repository/user.repo');
const { registerValidate } = require('../../utils/validation');
const jwtService = require('../../helpers/jwtServices');
const UserRepo = require('../../repository/user.repo');

exports.login = async (req, res, next) => {
  const { username, password } = req.body;
  if (!username || !password)
    throw new CustomError(1, 404, 'Invalid username or password');
  const user = await User.getByUserName(username);
  if (!user) throw new CustomError(6, 404, 'User not found');
  if (!(await user.isCheckPassword(password)))
    throw new CustomError(3, 400, 'Password is incorrect');
  const accessToken = jwtService.signAccessToken(user.id.toString());
  const refreshToken = jwtService.signRefreshToken(user.id.toString());
  user.refreshToken = refreshToken;
  await user.save();
  return res
    .status(200)
    .json({ success: true, data: { accessToken, refreshToken } });
};

exports.resgister = async (req, res, next) => {
  const { error } = registerValidate(req.body);
  if (error) throw new CustomError(1, 400, error.details[0].message);
  const { username, password, email } = req.body;
  const user = await User.getByUserNameOrEmail(username, email);
  if (user)
    throw new CustomError(2, 400, 'Username or Email is already in use');
  const newUser = await User.create({ username, password, email });
  return res.status(201).json({ success: true, data: newUser });
};

/**
 * Get Access Token from the Refresh Token
 */
exports.getAccessToken = async (req, res, next) => {
  const { refreshToken } = req.body;
  if (!refreshToken) throw new CustomError(6, 400, 'Invalid refresh token');
  const payload = jwtService.verifyRefreshToken(refreshToken);
  const userId = payload.userId;
  const newAccessToken = jwtService.signAccessToken(userId);
  const newRefreshToken = jwtService.signRefreshToken(userId);
  const user = UserRepo.getById(userId);
  user.refreshToken = newRefreshToken;
  await user.save();
  return res.status(200).json({});
};

exports.logout = async (req, res, next) => {};
