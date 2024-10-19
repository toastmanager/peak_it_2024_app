# Ужин с пандой

**Ужин с пандой** — приложения для заказа еды из ресторана китайской кухни. Разработано для хакатона PeakIT 2024. Состояние на конец хакатона находится в ветке `temporary-solutions-is-always-the-best`.

## Содержание

- [Технологии](#технологии)
- [Разработка](#разработка)
- [Сборка](#сборка)
- [Команда](#команда)

## Технологии

### Языки

- [Dart](https://dart.dev/)

### Фреймворки

- [Flutter](https://flutter.dev/)

### Пакеты

- [auto_route](https://pub.dev/packages/auto_route) — навигация между страницами
- [equatable](https://pub.dev/packages/equatable) - возможность сравнения объектов с помощью `==`
- [flutter_bloc](https://pub.dev/packages/flutter_bloc) — управление состояниями
- [injectable](https://pub.dev/packages/injectable) — внедрение зависимостей
- [intl](https://pub.dev/packages/intl) — интернационализация
- [jwt_decoder](https://pub.dev/packages/jwt_decoder) — работа с JWT токенами
- [logger](https://pub.dev/packages/logger) — логирование
- [retrofit](https://pub.dev/packages/retrofit) — работа с API
- [shared_preferences](https://pub.dev/packages/shared_preferences) — работа с кэшем
- [widgetbook](https://pub.dev/packages/widgetbook) — библиотека для изолированного создания компонентов и страниц.

## Разработка

### Требования

- [Dart](https://dart.dev/)
- [Flutter](https://flutter.dev/)

### Копирование репозитория

```
# Скопируйте репозиторий в нужную директорию
git clone https://github.com/toastmanager/peak_it_2024_app.git

# Перейдите в созданную директорию
cd peak_it_2024_app
```

### Установка зависимостей

```
flutter pub get
```

### Запуск приложения в режиме разработки

1. Найдите идентификатор целевого устройства

```
flutter devices
```

2. Запустите приложение на целевом устройстве. Уберите `-d <id>`, чтобы flutter выбрал устройство за вас.

```
flutter run -d <id>
```

## Сборка

### Android

```
flutter build apk --split-per-abi
```

Удаление флага --split-per-abi приводит к созданию большого APK файла, содержащего ваш код, скомпилированный для **всех** целевых ABI.

### iOS

```
flutter build ios
```

Добавьте `--no-codesign`, если хотите собрать приложение без подписи

## Команда

| Фамилия Имя      | Роль        |
| ---------------- | ----------- |
| Габышев Николай  | Разработчик |
| Корякин Владимир | Дизайнер    |
| Лаптева Милана   | Менеджер    |
