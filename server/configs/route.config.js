const API_URL = '/api/';

const config = {
  api: {
    Account: API_URL + 'accounts',
    Recipe: API_URL + 'recipes',
    Blog: API_URL + 'blogs',
    Tag: API_URL + 'tags',
    Category: API_URL + 'categories',
  },
  base: {
    Home: '/',
    Login: '/login',
    Register: '/register',
  },
};

module.exports = config;
