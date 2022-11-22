const API_URL = '/api/';
const ADMIN_URL = '/admin/';

const config = {
  admin: {
    Dashboard: ADMIN_URL + 'dashboard',
    Category: ADMIN_URL + 'categories',
    Tag: ADMIN_URL + 'tags',
    Blog: ADMIN_URL + 'blogs',
    Account: ADMIN_URL + 'account',
    Recipe: ADMIN_URL + 'recipes',
  },
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
