const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const expressLayouts = require('express-ejs-layouts');
const logger = require('morgan');
const connectDB = require('./helpers/connectDB');
require('./utils/prototype');
const route = require('./routes');

const app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
app.set('layout', './admin/layout/_layout');
app.set('layout extractScripts', true);

app.use(logger('dev'));
app.use(express.json({ limit: '50mb' }));
app.use(
  express.urlencoded({ extended: true, limit: '50mb', parameterLimit: 1000000 })
);
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(expressLayouts);
connectDB();

route(app);

module.exports = app;
