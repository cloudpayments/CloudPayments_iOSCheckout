# Использование  

Приложение CloudPayments Checkout Example демонстрирует работу iOS приложения с платежным шлюзом CloudPayments, а так же работу с Apple Pay.

Схемы проведения платежа http://cloudpayments.ru/Docs/Integration#schemes

## Инсталляция

Скачать архивом или клонировать репозитоний командой:
git clone https://github.com/cloudpayments/CloudPayments_iOSCheckout.git

В папке проекта выполнить команду:
pod install 

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
## Подключение Apple Pay для клиентов CloudPayments

https://cloudpayments.ru/docs/applepay - о Apple Pay

[https://www.raywenderlich.com/87300/apple-pay-tutorial](https://www.raywenderlich.com/87300/apple-pay-tutorial) \- туториал, по подключению Apple Pay в приложение.

**ВАЖНО**:

При обработке успешного ответа от Apple Pay, необходимо выполнить переобразование объекта PKPayment в криптограмму для передачи в платежное API CloudPayments

```
let cryptogram = PKPaymentConverter.convert(toString: payment) 
```
После успешного преобразования криптограмму можно использовать для проведения оплаты.

## Проведение оплаты

В примере `merchantPulicId` и `merchantApiPass` это тестовые Public ID и пароль для API, Вам необходимо получить свои данные в личном кабинете на сайте CloudPayments.
Не храните пароль для API в мобильном приложении - это не безопасно, приложение должно выполнять запросы согласно схеме через ваш сервер: https://cloudpayments.ru/Docs/MobileSDK

1) В приложении необходимо получить получить объект PKPayment от Apple Pay и преобразовать его в криптограмму, либо  получить карточные данные и создать на их основе криптограмму;
2) Отправить криптограмму и все данные для платежа с мобильного устройства на ваш сервер; 
3) С сервера вашего сервера провести оплату через платежное API CloudPayments.
