## Video App

### Build Instructions
Clone the repository and run the following commands in the root directory of the project:

``git clone git@github.com:TahaMaqbool/Taha_20230118.git``

Go to the project directory:

``cd Taha_20230118``

Set the ``master_key`` in ``config/master.key`` file provided in the email.

Install the system dependencies:

Install imageMagick for image processing:

``brew install imagemagick``

Install the image processing library ffmpeg:

``brew install ffmpeg``

Now run the bundle command to install the gems:

``bundle install``

Setup the database:

``rails db:setup``

This will create the database, run the migrations and seed the database so that categories are available when app starts.

Start the server:

``bin/dev``


### Running tests
Run the following command to run the tests:

``bundle exec rspec``

* Running all tests:
```bash
bin/test
```

* Running tests for an specific file:
```bash
bin/test test/models/video.rb
```
