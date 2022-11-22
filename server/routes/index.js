// const routeName = require('../../configs').routeConfig.api;
const { errorHandling } = require('../utils/errorHandling');
const routeName = require('../configs/index').routeConfig;
const AccountRouter = require('./account.route');
const RecipeRouter = require('./recipe.route');
const BlogRouter = require('./blog.route');
const CategoryRouter = require('./category.route');
const TagRouter = require('./tag.route');
const AdminRoute = require('./admin');

function route(app) {
  app.get('/health', (req, res) => {
    res.send('OK');
  });

  AdminRoute(app);
  app.use(routeName.base.Home, AccountRouter);
  app.use(routeName.api.Recipe, RecipeRouter);
  app.use(routeName.api.Blog, BlogRouter);
  app.use(routeName.api.Category, CategoryRouter);
  app.use(routeName.api.Tag, TagRouter);

  /**
   * Handle error 404
   */
  app.use((req, res, next) => {
    res.status(404);

    // respond with html page
    if (req.accepts('html')) {
      return res.render('404', { layout: false });
    }

    // respond with json
    if (req.accepts('json')) {
      return res.json({ error: 'Not found' });
    }

    // default to plain-text. send()
    res.type('txt').send('Not found');
  });
  app.use((err, req, res, next) => {
    errorHandling(err, res);
  });
}
module.exports = route;
