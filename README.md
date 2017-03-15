[![Code Climate](https://codeclimate.com/github/SamyRai/webmarks/badges/gpa.svg)](https://codeclimate.com/github/SamyRai/webmarks)
[![Issue Count](https://codeclimate.com/github/SamyRai/webmarks/badges/issue_count.svg)](https://codeclimate.com/github/SamyRai/webmarks)
[![Test Coverage](https://codeclimate.com/github/SamyRai/webmarks/badges/coverage.svg)](https://codeclimate.com/github/SamyRai/webmarks/coverage)
[![Build Status](https://semaphoreci.com/api/v1/gigadamer/webmarks/branches/master/shields_badge.svg)](https://semaphoreci.com/gigadamer/webmarks)

<div align="center">
  <img src="./public/favicon.png"/>
  <h1>Keep all your bookmarks in a safe place</h1>
</div>

## :construction: Development

### Docker

Make sure you have the latest version of docker and docker-compose or at least:
```
Docker version 17.03.0-ce
docker-compose version 1.11.1
```

Then run

```sh
docker-compose up
```

Yes, it is that sipmple, just one command, and you application will be available at

`http://localhost` if you use *Linux* and

`ip address of your docker-machine` is you use *Mac*

To run tests please use this command:

```sh
docker-compose run app rails test
```

:rocket::rocket::rocket:

### Local machine

If you don't want to install docker you still can run application by simply installing all requriments

```
ruby v.2.4
rails v.5.0.2
PostgreSQL v.9.6
```

Edit `database.yml` file and run

```sh
rails s
```
