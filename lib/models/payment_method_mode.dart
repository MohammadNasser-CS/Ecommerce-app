class PaymentMethodModel {
  final String id;
  final String name;
  final String cardNumber;
  final String cardHolderName;
  final String expiredDate;
  final String cvvCode;
  final String imageUrl;
  PaymentMethodModel(
      {required this.id,
      required this.cardNumber,
      required this.cardHolderName,
      required this.expiredDate,
      required this.cvvCode,
      this.name = 'MasetCard',
      this.imageUrl =
          'https://images.fastcompany.net/image/upload/w_1200,c_limit,q_auto:best/wp-cms/uploads/2023/04/i-3-90885664-mastercard-logo.jpg'});
}

List<PaymentMethodModel> savedCards = [
  PaymentMethodModel(
      id: '1',
      cardNumber: '4689265476218943',
      cardHolderName: 'User 1',
      expiredDate: '01/26',
      cvvCode: '856'),
  PaymentMethodModel(
      id: '2',
      cardNumber: '6852231497002682',
      cardHolderName: 'User 2',
      expiredDate: '02/25',
      cvvCode: '856'),
  PaymentMethodModel(
      id: '3',
      cardNumber: '2369428726942955',
      cardHolderName: 'User 3',
      expiredDate: '05/28',
      cvvCode: '856'),
  PaymentMethodModel(
      id: '4',
      cardNumber: '5697500578624861',
      cardHolderName: 'User 4',
      expiredDate: '04/29',
      cvvCode: '856'),
];
