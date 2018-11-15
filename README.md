# How to create a Rails instance with Docker
You need to have this 4 files in your folder or clone this repository:
* Dockerfile
* docker-compose.yml
* Gemfile
* Gemfile.lock

And create a `.env` file

After that you need to run this command to build your docker image:

`docker-compose run web rails new . --force --database=postgresql`

then you need to change the ownership of your files with:

`sudo chown -R $USER:$USER .`

After that you need to run your server with:

`docker-compose up --build`

Before create the database you need to add to `config/database.yml` file the following lines:
```
default: &default
  adapter: postgresql
  encoding: unicode
  host: postgres
  username: postgres
  password:
  pool: 5
```

On a different terminal you need to create you database:

`docker-compose run web rake db:create`

And finally you can connect to your App web on this direction `http://localhost:3000`

#### The advantage to make a container with docker-compose you can see it here, you can have a complete app web running in your computer with the correct versions in only minutes. 

You only have to run the following commands in your machine:
* git clone https://github.com/jfcampos1/grupo-25
* `docker-compose up --build`
On another console run this two to set up the database:
* `docker-compose run web rake db:create`
* `docker-compose run web rake db:migrate`
And there you go, you have a running app web on your computer.

And finally you can connect to your App web on this direction `http://localhost:3000`


References:

* https://docs.docker.com/compose/rails/

* https://docs.docker.com/engine/reference/builder/#usage

* https://docs.docker.com/compose/compose-file/
