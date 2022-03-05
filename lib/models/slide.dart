class Slide {
  final String imgUrl;
  final String description;

  Slide({
    required this.imgUrl,
    required this.description,
  });
}

final slideList = [
  Slide(imgUrl: 'images/9.png', description: 'Screen 1'),
  Slide(imgUrl: 'images/6.png', description: 'Screen 2'),
  Slide(imgUrl: 'images/12.png', description: 'Screen 3'),
];
