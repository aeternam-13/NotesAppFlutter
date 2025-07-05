# notesappflutter

Notes application in with with Riverpod, Hive/API and MVI + Clean architecture.

This app can work with local storage or connect to the API https://github.com/aeternam-13/NotesBackend

##
## Getting Started

Plattform support

* Linux
* Android
* IOS
* Windows
* Mac
* Web

<img width="1440" height="3120" alt="Image" src="https://github.com/user-attachments/assets/87959531-c9ad-4d06-b31d-0893016248a5" />

<img width="1440" height="3120" alt="Image" src="https://github.com/user-attachments/assets/346f4769-54f7-4a1c-bd1d-102787c4d0d0" />

<img width="1440" height="3120" alt="Image" src="https://github.com/user-attachments/assets/809a5649-c44b-4357-87db-42cf38f4dc52" />

<img width="1440" height="3120" alt="Image" src="https://github.com/user-attachments/assets/367f35f8-e813-4bc4-a4e2-9154c8e16b3b" />

All platforms except WEB support API + local, WEB only supports API

This is another implementation for https://github.com/aeternam-13/NotesApp which is a Kotlin compose MVVM + Clean architecture, the target is to implement and compare both aproaches in different languages.

It aims to be an example of how to use this architecture and libraries in flutter projects.

## Run project

> flutter pub get
> flutter run

### Using Go API

To use the API you need to compile https://github.com/aeternam-13/NotesBackend
> go build -o notes_api

Then run your binary './notes_api', give permissions if needed.

In case you are inside an android emulator or in a external device, you will need to modify the baseUrl for the one that targets the port of the machine where backend is running.


