# Использование  

Приложение CloudPayments Checkout Example демонстрирует работу iOS приложения с платежным шлюзом CloudPayments.

Схемы проведения платежа http://cloudpayments.ru/Docs/Integration#schemes

## Инсталяция
git clone https://github.com/cloudpayments/CloudPayments_iOSCheckout.git
pod install (в папке проекта)

## Описание работы приложения с SDK CloudPayments

SDK CloudPayments позволяет:

* Проводить проверку карточного номера на корректность

```
Boolean Card.isCardNumberValid(cardNumber)

```

* Определять тип платежной системы по номеру карты или по первой его части

```
String Card.cardType(toString: Card.cardType(fromCardNumber: cardNumber))

```

* Шифровать карточные данные и создавать криптограмму для отправки на сервер

```
let card = Card()
String card.makeCryptogramPacket(cardNumber, andExpDate: expDate, andCVV: cvv, andMerchantPublicID: Constants.merchantPulicId)

```
## Проведение оплаты

В примере merchantPulicId и merchantApiPass это тестовые Public ID и пароль для API, Вам необходимо получить свои данные в личном кабинете на сайте CloudPayments.
Не храните пароль для API в мобильном приложении это не безопасно, приложение должно выполнять запросы согласно схеме через ваш сервер: https://cloudpayments.ru/Docs/MobileSDK

1) В приложении необходимо получить карточные данные и создать на их основе криптограмму;
2) Отправить криптограмму (токен) и все данные для платежа с мобильного устройства на ваш сервер; 
3) С сервера вашего сервера провести оплату через платежное API CloudPayments.
