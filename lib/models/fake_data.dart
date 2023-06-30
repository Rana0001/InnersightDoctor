import 'package:doctor/models/fake_models/chat_message_model.dart';
import 'package:doctor/models/fake_models/appointment_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';
import '../utils/images.dart';
import 'fake_models/intro_content_model.dart';
import 'fake_models/chats_model.dart';
import 'fake_models/my_chat_model.dart';
import 'fake_models/payment_option_model.dart';
import 'fake_models/product_model.dart';
import 'fake_models/product_review_model.dart';
import 'fake_models/recent_payment_product_model.dart';
import 'fake_models/recent_transaction_model.dart';
import 'fake_models/saved_address_model.dart';

/* <-------- Fake data list --------> */
class FakeData {
  // Intro screens
  static List<FakeIntroContent> fakeIntroContents = [
    FakeIntroContent(
        localSVGImageLocation: 'assets/images/intro_illustration1.png',
        slogan: 'Discover something new',
        content:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry'),
    FakeIntroContent(
        localSVGImageLocation: 'assets/images/intro_illustration2.png',
        slogan: 'Clearly different',
        content:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry'),
    FakeIntroContent(
        localSVGImageLocation: 'assets/images/intro_illustration3.png',
        slogan: 'Buy, think & grow',
        content:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry'),
  ];

  // Products for various screens
  static List<FakeProductModel> products = [
    FakeProductModel(
        name: 'Sony DR-ZX1AP',
        productImage: Image.asset(
                'assets/images/demo_images/product_categories/item1.png')
            .image,
        availableSizes: ['S', 'M', 'X', 'XL', 'XXL'],
        description:
            'There are many variations of passages Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.',
        rating: 4.2),
    FakeProductModel(
        name: 'Bose Quiet Comfort',
        productImage: Image.asset(
                'assets/images/demo_images/product_categories/item2.png')
            .image,
        availableSizes: ['S', 'M', 'X', 'XL', 'XXL'],
        description:
            'There are many variations of passages Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.',
        rating: 4.2),
    FakeProductModel(
        name: 'Beats Pro Wired',
        productImage: Image.asset(
                'assets/images/demo_images/product_categories/item3.png')
            .image,
        availableSizes: ['S', 'M', 'X', 'XL', 'XXL'],
        description:
            'There are many variations of passages Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.',
        rating: 4.2),
    FakeProductModel(
        name: 'JBL Wireless',
        productImage: Image.asset(
                'assets/images/demo_images/product_categories/item4.png')
            .image,
        availableSizes: ['S', 'M', 'X', 'XL', 'XXL'],
        description:
            'There are many variations of passages Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.',
        rating: 4.2),
  ];

  // chats
  static List<FakeChatsGroupModel> fakeChatDGroups = [
    FakeChatsGroupModel(
      groupChats: [
        FakeChatModel(
            timeText: '02:02 PM',
            isRead: false,
            texts: [
              FakeChatTextModel(text: 'Michles Leoss Hunt', isBoldText: true),
            ],
            name: 'Hi, Doctor. I need your help.',
            image: Image.asset('assets/images/background.jpg').image),
        FakeChatModel(
            timeText: '03:10 PM',
            isRead: true,
            texts: [
              FakeChatTextModel(text: 'Michle Leo Hunt', isBoldText: true),
            ],
            name: 'Michle Jhon Smith',
            image: Image.asset('assets/images/background.jpg').image),
        FakeChatModel(
            timeText: '02:02 PM',
            isRead: false,
            texts: [
              FakeChatTextModel(text: 'Michles Leoss Hunt', isBoldText: true),
            ],
            name: 'Michle Jhon Smith',
            image: Image.asset('assets/images/background.jpg').image),
      ],
    ),
  ];

  static List<AppointmentSections> appointmentSections = [
    AppointmentSections(
        title: 'Headphone',
        itemNumber: 22,
        categoryImage: Image.asset('assets/images/background.jpg').image),
    AppointmentSections(
        title: 'Photography',
        itemNumber: 22,
        categoryImage: Image.asset('assets/images/background.jpg').image),
    AppointmentSections(
        title: 'Accessories',
        itemNumber: 22,
        categoryImage: Image.asset('assets/images/background.jpg').image),
    AppointmentSections(
        title: 'Hand watch',
        itemNumber: 22,
        categoryImage: Image.asset('assets/images/background.jpg').image),
    AppointmentSections(
        title: 'Home Decor',
        itemNumber: 22,
        categoryImage: Image.asset('assets/images/background.jpg').image),
    AppointmentSections(
        title: 'Sound speaker',
        itemNumber: 22,
        categoryImage: Image.asset('assets/images/background.jpg').image),
  ];

  /// Reviews
  static List<ProductReview> reviews = [
    ProductReview(
        reviewerName: 'Michle Jhon Smith',
        rating: 4,
        reviewDateText: '23 Sep, 2021',
        reviewText:
            'There are many variations of passages Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.',
        reviewerProfileImage:
            Image.asset('assets/images/demo_images/reviewers/reviewer1.png')
                .image),
    ProductReview(
        reviewerName: 'Angle Saniya',
        rating: 4,
        reviewDateText: '23 Sep, 2021',
        reviewText:
            'There are many variations of passages Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.',
        reviewerProfileImage:
            Image.asset('assets/images/demo_images/reviewers/reviewer2.png')
                .image)
  ];

  /// Payment options
  static List<FakePaymentOptionModel> paymentOptions = [
    FakePaymentOptionModel(
        name: 'Credit card',
        paymentImage: SvgPicture.asset(AppAssetImages.homeSVGLogoLine)),
    FakePaymentOptionModel(
        name: 'Paypal',
        paymentImage: SvgPicture.asset(AppAssetImages.homeSVGLogoLine)),
    FakePaymentOptionModel(
        name: 'Debit card',
        paymentImage: SvgPicture.asset(AppAssetImages.homeSVGLogoLine)),
    FakePaymentOptionModel(
        name: 'Cash on delivery',
        paymentImage: SvgPicture.asset(AppAssetImages.homeSVGLogoLine,
            color: AppColors.primaryColor, height: 32, width: 32)),
  ];

  /// Sample delivery man chat data
  static List<FakeChatMessageModel> deliveryManChats = [
    FakeChatMessageModel(
      isMyMessage: false,
      message: 'Hey there?\nHow much time?',
      dateTimeText: '11:59 am',
    ),
    FakeChatMessageModel(
      isMyMessage: true,
      message: 'On my way sir.\nWill reach in 10 mins.',
      dateTimeText: '11:59 am',
    ),
    FakeChatMessageModel(
      isMyMessage: false,
      message: 'Ok come with carefully!\nRemember the address please!',
      dateTimeText: '11:59 am',
    ),
    FakeChatMessageModel(
      isMyMessage: true,
      message:
          'Btw, I want to know more about the room space and facilities & can I get some more picture of current.',
      dateTimeText: 'Sep 04 2020',
    ),
  ];

  /// My orders
  static List<FakeMyChatModel> myChats = [
    FakeMyChatModel(
        name: 'Kishan Jaiswal',
        lastMessage: 'Hi, Suhani',
        personImage: Image.asset('assets/images/background.jpg').image,
        dateText: '26 Dec, 2033'),
    FakeMyChatModel(
        name: 'Aup Burlakoti',
        lastMessage: 'Hi, monika',
        personImage: Image.asset('assets/images/background.jpg').image,
        dateText: '26 Dec, 2033'),
    FakeMyChatModel(
        name: 'Ashok GC',
        lastMessage: 'Ashok Don',
        personImage: Image.asset('assets/images/background.jpg').image,
        dateText: '26 Dec, 2033'),
  ];

  /// Recently my bought product
  static List<FakeRecentPaymentProduct> recentPaymentProducts = [
    FakeRecentPaymentProduct(
        productName: 'Sennheiser Headphones',
        paymentDateTimeText: '30 Sep 2021, 11:59am',
        priceText: '129.00',
        itemCount: 3,
        productImage:
            Image.asset('assets/images/demo_images/recent_payment/image1.png')
                .image),
    FakeRecentPaymentProduct(
        productName: 'JBL Headphones',
        paymentDateTimeText: '30 Sep 2021, 11:59am',
        priceText: '129.00',
        itemCount: 3,
        productImage:
            Image.asset('assets/images/demo_images/recent_payment/image2.png')
                .image),
    FakeRecentPaymentProduct(
        productName: 'Beats Headphones',
        paymentDateTimeText: '30 Sep 2021, 11:59am',
        priceText: '129.00',
        itemCount: 3,
        productImage:
            Image.asset('assets/images/demo_images/recent_payment/image3.png')
                .image),
    FakeRecentPaymentProduct(
        productName: 'Bose Headphones',
        paymentDateTimeText: '30 Sep 2021, 11:59am',
        priceText: '129.00',
        itemCount: 3,
        productImage:
            Image.asset('assets/images/demo_images/recent_payment/image4.png')
                .image),
  ];

  /// Saved addresses
  static List<FakeSavedAddressModel> savedAddresses = [
    FakeSavedAddressModel(
        addressType: 'home',
        addressText:
            'Flat No 12, First Floor, Central Residency 1023, Central Residency, Hamilton Park New York, USA'),
    FakeSavedAddressModel(
        addressType: 'office',
        addressText:
            'Flat No 12, First Floor, Central Residency 1023, Central Residency, Hamilton Park New York, USA'),
    FakeSavedAddressModel(
        addressType: 'other',
        addressText:
            'Flat No 12, First Floor, Central Residency 1023, Central Residency, Hamilton Park New York, USA'),
  ];

  /// Recent transactions
  static List<FakeRecentTransaction> recentTransactions = [
    FakeRecentTransaction(
        title: '#ECO52597',
        itemCount: 4,
        dateText: '23 July, 2021',
        timeText: '10:30 pm',
        amountText: '6.80',
        transactionType: 'earning-up'),
    FakeRecentTransaction(
        title: '#ECO84585',
        itemCount: 4,
        dateText: '23 July, 2021',
        timeText: '10:30 pm',
        amountText: '6.80',
        transactionType: 'earning-down'),
    FakeRecentTransaction(
        title: 'Send to bank',
        itemCount: 4,
        dateText: '23 July, 2021',
        timeText: '10:30 pm',
        amountText: '6.80',
        transactionType: 'send-to-bank')
  ];
}
