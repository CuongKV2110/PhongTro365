import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/shop.dart';
import 'shop_state.dart';

class ShopBloc extends Cubit<ShopState> {
  ShopBloc() : super(ShopInitial());
  final List<Shop> list = [
    Shop(
      img1:
          'https://blogcdn.muaban.net/wp-content/uploads/2018/07/5-luu-y-khi-tim-phong-tro-Ha-Noi.jpg',
      img2:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSv3y10LoWWvC6TIfFp0OVATJ-D0XekAOjYNBybOh2P522d81IEfDohgNeP2IVM8HJUkZc&usqp=CAU',
      img3:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCLFlYm1e4Ofm6ZucG5416NsvYd3KXQNHEvcrkC6KZ2pOpdBbvvYEYBCkYkFyKDuu_Nqk&usqp=CAU',
      content:
          'Havertz made his senior debut with the club at the same year. Upon making his debut, Havertz became the club\'s youngest-ever debutant ',
      isTym: false,
      isSave: false,
    ),
    Shop(
      img1:
          'https://news.mogi.vn/wp-content/uploads/2019/10/thuephongtrohanoi5.jpg',
      img2:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrVkstm2xCjXgjMwHD9hu9PgkSy2FtnWxyNMFAqk83pc6iDVg-E36QVXN91J8txH2LhyM&usqp=CAU',
      img3:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJbMD83eUjHiG_GR2WmQK27887B_tvdgNfLa08LAETRpvstZnoM2w5-TYYOTOE5jKw3c0&usqp=CAU',
      content:
          'Chelsea matches including the one against Barnsley in the third round of the EFL Cup on 23 September, which ended in a 6–0 win at home',
      isTym: false,
      isSave: false,
    ),
    Shop(
      img1:
          'https://www.chotot.com/kinhnghiem/wp-content/uploads/2018/06/phong-tro-sinh-vien-ha-noi-1.jpg',
      img2:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiLmRS-6yF0GEd8SHIy4OBumh4_DaUDZ7Mt31kLlG4t6Fog4wouec94iSUTd9EmubX4wY&usqp=CAU',
      img3:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT02KqXTklts0oeybEUcNB2sJ_d5UkDCiT4En1S-uwYhaa1kHBY7sRdFVMXmVes1X2DHvE&usqp=CAU',
      content:
          'Ronaldo made his international debut for Portugal in 2003 at the age of 18 and has since earned over 180 caps, making him Portugal',
      isTym: false,
      isSave: false,
    ),
  ];

  Future<void> getData() async {
    emit(ShopLoading());
    List<Shop> newList = list;
    print(newList[0].content);
    emit(ShopLoaded(data: newList));
  }
}
