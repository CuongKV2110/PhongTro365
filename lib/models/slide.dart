class Slide {
  final String imgUrl;
  final String content;
  final String description;

  Slide({
    required this.imgUrl,
    required this.content,
    required this.description,
  });
}

final slideList = [
  Slide(
    imgUrl: 'images/9.png',
    content: 'Tìm người thuê phòng, người ở ghép',
    description: 'Bạn đang có phòng cho thuê hay đang cần tìm người ở ghép ?',
  ),
  Slide(
    imgUrl: 'images/6.png',
    content: 'Đăng bài dễ dàng, nhanh chóng',
    description: 'Cung cấp môi trường, công cụ đăng bài nhanh chóng. Bình luận, đánh giá phòng trọ',
  ),
  Slide(
    imgUrl: 'images/12.png',
    content: 'Tiết kiệm thời gian, hiệu quả',
    description: 'Hãy trải nghiệm và nó sẽ giúp bạn một cách hiệu quả nhất',
  ),
];
