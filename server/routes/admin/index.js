const routeName = require('../../configs').routeConfig.admin;
const BlogRouter = require('./blog.route');
const RecipeRouter = require('./recipe.route');
const CategoryRouter = require('./category.route');
const TagRouter = require('./tag.route');
const AccountRouter = require('./account.route');

function route(app) {
  app.use(routeName.Blog, BlogRouter);
  app.use(routeName.Category, CategoryRouter);
  app.use(routeName.Tag, TagRouter);
  app.use(routeName.Account, AccountRouter);
  app.use(routeName.Recipe, RecipeRouter);
}

module.exports = route;
