import 'package:flutter/cupertino.dart';
import './models/guest_info.dart';

enum Status {
  Pending,
  Confirmed,
  Declined,
}

var guest_data = [
  GuestInfo(
    fullName: "John Watson",
    phoneNumber: "0777777777",
    status: Status.Pending,
    imageUrl:
        'https://as1.ftcdn.net/v2/jpg/02/00/90/24/1000_F_200902415_G4eZ9Ok3Ypd4SZZKjc8nqJyFVp1eOD6V.jpg',
  ),
  GuestInfo(
    fullName: "Rusty Maggio",
    phoneNumber: "0742749382",
    status: Status.Confirmed,
    imageUrl:
        "https://as1.ftcdn.net/v2/jpg/02/22/85/16/1000_F_222851624_jfoMGbJxwRi5AWGdPgXKSABMnzCQo9RN.jpg",
  ),
  GuestInfo(
    fullName: "Lonzo Sawayn",
    phoneNumber: "0745253688",
    status: Status.Declined,
    imageUrl:
        "https://as2.ftcdn.net/v2/jpg/03/07/36/97/1000_F_307369771_Mm1wbpgaNeaW36hLqivp86gnsx20LSWY.jpg",
  ),
  GuestInfo(
    fullName: "Adriana Daugherty",
    phoneNumber: "0732234989",
    status: Status.Confirmed,
    imageUrl:
        "https://as2.ftcdn.net/v2/jpg/03/02/94/53/1000_F_302945354_dqIiUiITKpard7fBVKDLtffIqnkDbyo4.jpg",
  ),
  GuestInfo(
    fullName: "Lonzo Sawayn",
    phoneNumber: "0745523688",
    status: Status.Declined,
    imageUrl:
        "https://as1.ftcdn.net/v2/jpg/01/41/71/88/1000_F_141718851_medgS5EBKZEmf8WMRMqN8pJO7JD5R5D4.jpg",
  ),
  GuestInfo(
    fullName: "Brett Lesch",
    phoneNumber: "0532224828",
    status: Status.Confirmed,
    imageUrl:
        "https://as1.ftcdn.net/v2/jpg/01/36/44/00/1000_F_136440037_H0veBELL8xnvI14eOR7a8uZFMs7Wmopt.jpg",
  ),
  GuestInfo(
    fullName: "Theo Daugherty",
    phoneNumber: "0684722282",
    status: Status.Pending,
    imageUrl:
        "https://as1.ftcdn.net/v2/jpg/01/45/12/66/1000_F_145126694_RDl1ZhYdqPL45vI0XLMBtQqdTjdgu9IB.jpg",
  ),
];
