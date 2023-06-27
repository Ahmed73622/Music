import '../items/item_music.dart';

class MusicData {
  static var musicNumper = -1;
  List<Music> music = [
    Music(
        imageUrl:
            'https://cdn.pixabay.com/photo/2016/09/08/21/09/piano-1655558__340.jpg',
        musicName: 'amen-break-no-copyright-remake-120bpm-25924.mp3',
        musicS: '',
        desc: 'descrptoin music'),
    Music(
        imageUrl:
            'https://cdn.pixabay.com/photo/2014/05/21/15/18/musician-349790__340.jpg',
        musicName: 'bang-140381.mp3',
        musicS: '',
        desc: 'descrptoin music'),
    Music(
        imageUrl:
            'https://images.genius.com/f6f40001ee2b786090967f3dfd9d051f.400x400x1.jpg',
        musicName: 'Red-right-hand-Nick-Cave-&-The-Bad-Seeds-(with-lyrics).mp3',
        musicS: '',
        desc: 'descrptoin music'),
    Music(
        imageUrl:
            'https://cdn.pixabay.com/photo/2016/11/09/23/16/music-1813100__340.png',
        musicName: 'Name Music',
        musicS: '',
        desc: 'descrptoin music'),
    Music(
        imageUrl:
            'https://cdn.pixabay.com/photo/2015/01/20/13/13/samsung-605439__340.jpg',
        musicName: 'Name Music',
        musicS: '',
        desc: 'descrptoin music'),
    Music(
        imageUrl:
            'https://cdn.pixabay.com/photo/2015/09/17/14/24/woman-944261__340.jpg',
        musicName: 'Name Music',
        musicS: '',
        desc: 'descrptoin music'),
    Music(
        imageUrl:
            'https://cdn.pixabay.com/photo/2015/12/27/05/48/turntable-1109588__340.jpg',
        musicName: 'Name Music',
        musicS: '',
        desc: 'descrptoin music'),
    Music(
        imageUrl:
            'https://cdn.pixabay.com/photo/2017/03/09/20/53/microphone-2130806__340.jpg',
        musicName: 'Name Music',
        musicS: '',
        desc: 'descrptoin music'),
    Music(
        imageUrl:
            'https://cdn.pixabay.com/photo/2018/06/29/01/47/piano-3505109__340.jpg',
        musicName: 'Name Music',
        musicS: '',
        desc: 'descrptoin music'),
    Music(
        imageUrl:
            'https://cdn.pixabay.com/photo/2015/01/20/12/51/mobile-605422__340.jpg',
        musicName: 'Name Music',
        musicS: '',
        desc: 'descrption music'),
  ];

  String getImage() {
    return music[musicNumper].imageUrl;
  }

  String getMusicName() {
    return music[musicNumper].musicName;
  }

  String getDescribtion() {
    return music[musicNumper].desc;
  }

  void nextMusic() {
    if (musicNumper > music.length - 2) {
      musicNumper = 0;
    } else {
      musicNumper++;
    }
  }

  void zeroMusic() {
    musicNumper = 0;
  }

  int getListLinght() {
    return music.length;
  }
}
