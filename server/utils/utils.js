const crypto = require('crypto');

exports.randomString = () => {
  return crypto.randomBytes(16).toString('hex');
};
