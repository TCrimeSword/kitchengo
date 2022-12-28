const mongoose = require('mongoose');
const logger = require('./logger');
const { mongoConfig } = require('../configs/');

const connectDB = async () => {
  try {
    logger.info('from db connect', mongoConfig.getPath());
    await mongoose.connect(mongoConfig.getPath(), mongoConfig.option);
    logger.info('Connect DB success');
  } catch (err) {
    logger.error('Cannot connect to db ' + err);
  }
};

module.exports = connectDB;
