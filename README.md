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

On a different terminal you need to create you database:

`docker-compose run web rake db:create`

And finally you can connect to your App web on this direction `http://localhost:3000`
