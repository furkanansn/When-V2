enum APIPath {
  register_user,
  change_password,
  change_password_by_user,
  forgot_password,
  send_again,
  get_comments_by_event_id,
  add_comment,
  delete_comment,
  add_fav,
  delete_fav,
  get_users_by_event_id,
  get_users_from_fav_by_search,
  add_friend,
  delete_friend,
  update_friend,
  get_friends,
  get_friends_by_search,
  home,
  discover,
  fetch_album,
  fetch_all_album,
  send_notification
}

class APIPathHelper {
  static String getValue(APIPath apiPath) {
    switch (apiPath) {
      case APIPath.register_user:
        return "/api/token/register";
      case APIPath.change_password:
        return "/api/token/change-password";
      case APIPath.change_password_by_user:
        return "/api/token/change-password-by-user";
      case APIPath.forgot_password:
        return "/api/token/forgot-password";
      case APIPath.send_again:
        return "/api/token/send-again";
      case APIPath.get_comments_by_event_id:
        return "/api/comment/v1";
      case APIPath.add_comment:
        return "/api/comment/v1";
      case APIPath.delete_comment:
        return "/api/comment/v1";
      case APIPath.add_fav:
        return "/api/fav/v1";
      case APIPath.delete_fav:
        return "/api/fav/v1";
      case APIPath.get_users_by_event_id:
        return "/api/fav/v1/users";
      case APIPath.get_users_from_fav_by_search:
        return "/api/fav/v1/users/search";
      case APIPath.add_friend:
        return "/api/friends/v1";
      case APIPath.delete_friend:
        return "/api/friends/v1";
      case APIPath.update_friend:
        return "/api/friends/v1";
      case APIPath.get_friends:
        return "/api/friends/v1";
      case APIPath.get_friends_by_search:
        return "/api/friends/v1/search";
      case APIPath.home:
        return "/api/events/v1/house/initialize";
      case APIPath.send_notification:
        return "/api/notification/v1/send-notification";

      case APIPath.fetch_album:
        return "/albums/1";
      case APIPath.fetch_all_album:
        return "/albums/";
      case APIPath.discover:
        return "/api/events/v1/discover/initialize";
      default:
        return "";
    }
  }
}
