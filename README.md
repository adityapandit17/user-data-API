# User Data API

This README would normally document whatever steps are necessary to get this API
application up and running.


* Clone Project Repository from Github url:- 

- bundle install

* Ruby version
  - ``ruby "3.0.0"``

* Rails version
  - ``rails "7.0.7.2"``

## make changes to database.yml according to local postgres configuration.

* Database creation
  - ``rails db:create``

* After database creation run the migration
  - ``rails db:migrate``

* Create sample data
  - ``rails db:seed``

- Import API collection by Postman URL

  https://api.postman.com/collections/27623406-5ffd0bf8-6cb4-4bec-b09d-c5375dd6fb2e?access_key=PMAT-01H8QWM71STCFHH790X3DKTAPG

* API usage

To test this we already seed the users in the database and to access that we need
auth token and to generate that use below endpoint

- POST `localhost:3000/oauth/token`

  The params client_uid and client_secret value take from rails console

```ruby
  Doorkeeper::Application.find_by(user: User.first).uid
  Doorkeeper::Application.find_by(user: User.first).secret
```
  # change value according to user

- GET `localhost:3000/api/v1/users/me`

  ```Authorization: Bearer YOUR_ACCESS_TOKEN```

  Access_token take from POST api response

* Run Rspec

- rspec spec

