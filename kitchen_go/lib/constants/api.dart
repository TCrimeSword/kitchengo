class Api {
  static String baseUrl = 'http://10.0.2.2:3000';
  static String baseUrlApi = 'http://10.0.2.2:3000/api';
  static final Map<String, String> url = {
    'RecipeApi': '$baseUrlApi/recipes',
    'BlogApi': '$baseUrlApi/blogs',
    'CategoryApi': '$baseUrlApi/categories',
    'LoginApi': '$baseUrl/login',
    'RegisterApi': '$baseUrl/register',
    'LogoutApi': '$baseUrl/logout',
  };
  static getCommentUrl(String type, String id) {
    return '$baseUrlApi/$type/$id/comments';
  }
}
