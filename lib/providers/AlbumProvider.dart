import 'package:flutter/cupertino.dart';
import 'package:flutter_app_homeone/entity/Album.dart';
import 'package:flutter_app_homeone/network/api_response.dart';
import 'package:flutter_app_homeone/repository/album_repo.dart';

class AlbumProvider with ChangeNotifier {
  AlbumRepository _albumRepository;

  ApiResponse<List<Album>> _albums;

  ApiResponse<List<Album>> get albums => _albums;

  AlbumProvider() {
    _albumRepository = AlbumRepository();
    fetchAlbums();
  }

  fetchAlbums() async {
    _albums = ApiResponse.loading("loading... ");
    notifyListeners();
    try {
      List<Album> albumList =
          (await _albumRepository.fetchAlbum()).cast<Album>();
      _albums = ApiResponse.completed(albumList);
      notifyListeners();
    } catch (e) {
      _albums = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
