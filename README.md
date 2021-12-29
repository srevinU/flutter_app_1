# flutter_application_1
First flutter project application. The application aims to manage list of contact with categories.

## Details info:
### Frontend:
- Flutter
### Backend:
- Dart
### Database:
- Postgresql
### Devops:
- N/A

## Getting Started with macOS
### Flutter setUp
- [Install Flutter](https://docs.flutter.dev/get-started/install/macos)
- [Install xCode](https://apps.apple.com/us/app/xcode/id497799835?mt=12)
- [Install Android Studio](https://developer.android.com/studio?gclid=Cj0KCQiA8ICOBhDmARIsAEGI6o39f66VozuRhMIyFv77gAWBHTINDuZPGmpt3AXCYW7IJTYpan1YuHQaAq_zEALw_wcB&gclsrc=aw.ds)

Run to check dependancies:
```
flutter doctor
```
Info error:
- [cmdline-tools component is missing](https://stackoverflow.com/questions/68236007/i-am-getting-this-errors-cmdline-tools-component-is-missing-after-installing-f)


### Postgresql setUp
Install homebrew
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
Install postgresql
```
brew install postgresql
```
Install postgresql if needed
```
brew install pgadmin4
```

#### Database setUp

Start/Strop server
```
brew services start postgres
brew services stop postgres
```
Create database
```
createdb db_flutter_app_1
```
Access server
```
psql db_flutter_app_1
```
Create Super admin role
```
CREATE ROLE super_admin WITH LOGIN PASSWORD 'superadmin123';
ALTER ROLE super_admin Superuser;
```
Create admin role
```
CREATE ROLE admin WITH LOGIN PASSWORD 'admin123';
ALTER ROLE admin CREATEDB;
```
