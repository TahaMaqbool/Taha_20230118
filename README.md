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

Install the front-end dependencies by running:

``yarn install``

Start the server:

``bin/dev``


### Running tests
Run the following command to run the tests:

``rspec``


* Running tests for an specific file:
```bash
rspec spec/models/video_spec.rb
```

Finally, open the app in the browser:

``http://localhost:3000``


Feel free to contact me if you have any problems running the app or questions send me email at taha.maqbool96@gmail.com

### Notes

I have added two test files for test scenarios specs. All the videos are uploaded on S3 and locations are saved in Database with the variants.