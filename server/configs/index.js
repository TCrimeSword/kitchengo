require('dotenv').config();
const routeConfig = require('./route.config');
const defaultConfig = {
  sqlConfig: {
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USERNAME,
    database: process.env.DB_NAME || 'DBName',
    password: process.env.DB_PASSWORD,
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0,
    pool: {
      max: 5,
      min: 0,
      acquire: 30000,
      idle: 10000,
    },
  },
  mongoConfig: {
    host: process.env.DB_HOST || 'localhost',
    port: 27017,
    username: process.env.DB_USERNAME || '',
    password: process.env.DB_PASS || '',
    database: process.env.DB_NAME || 'KitchenGo',
    // pathOption: process.env.DB_PATH_OPTION || '',
    modelList: [],
    getPath() {
      let path = '';
      if (process.env.NODE_ENVIRONMENT === 'Local Develop') {
        path = 'mongodb://';
        if (this.username != '') path += this.username + ':';
        if (this.password != '') path += this.password + '@';
        path += this.host + ':' + this.port + '/' + this.database;
      } else if (process.env.NODE_ENVIRONMENT === 'Test server') {
        path = 'mongodb+srv://';
        if (this.username != '') path += this.username + ':';
        if (this.password != '') path += this.password + '@';
        path +=
          this.host + '/' + this.database + '?retryWrites=true&w=majority';
      }
      return path;
    },
    option: {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    },
  },
  routeConfig: routeConfig,
};

module.exports = defaultConfig;
