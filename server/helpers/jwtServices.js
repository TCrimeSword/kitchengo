const jwt = require('jsonwebtoken');
const { CustomError } = require('../utils/errorHandling');

const signAccessToken = (userId) => {
  const payload = { userId };
  const secret = process.env.JWT_ACCESS_KEY;
  const opt = { expiresIn: '1m' };
  const accessToken = jwt.sign(payload, secret, opt);
  return accessToken;
};

const signRefreshToken = (userId) => {
  const payload = { userId };
  const secret = process.env.JWT_REFRESH_KEY;
  const opt = { expiresIn: '30d' };
  const refreshToken = jwt.sign(payload, secret, opt);
  return refreshToken;
};

/**
 * Middleware verifyAccessToken
 * @param {*} req
 * @param {*} res
 * @param {*} next
 */
const verifyAccessToken = (req, res, next) => {
  const authHeader = req.headers.authorization;
  if (!authHeader) {
    next(new CustomError(4, 400, 'Invalid authorization'));
  }
  const bearerToken = authHeader.split(' ');
  const token = bearerToken[0];
  if (token) {
    const decoded = jwt.verify(token, process.env.JWT_ACCESS_KEY);
    req.userId = decoded.userId;
    next();
  }
};

const verifyRefreshToken = (refreshToken) => {
  if (!refreshToken) throw new CustomError(6, 400, 'Invalid refresh token');
  const decoded = jwt.verify(refreshToken, process.env.JWT_REFRESH_KEY);
  return decoded;
};

module.exports = {
  signAccessToken,
  signRefreshToken,
  verifyAccessToken,
  verifyRefreshToken,
};
