<div align="center">
  <img src="./public/favicon.png"/>
  <h1>Keep all your bookmarks in a safe place</h1>
</div>

# README

## Development

### Docker

Make sure you have the latest version of docker and docker-compose or at least:
 *Docker version 17.03.0-ce*
 *docker-compose version 1.11.1*

Then run

```sh
docker-compose up
```

Yes, it is that sipmple, just one command, and you application will be available at

`http://localhost` if you use linux and
`ip address of your docker-machine` is you use Mac

### Local machine

If you don't want to install docker you still can run application by simply installing all requriments

ruby v.2.4
rails v.5.0.2
PostgreSQL v.9.6

Edit `database.yml` file and running

```sh
rails s
```
