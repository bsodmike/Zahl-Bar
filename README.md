# zbar_mike

Developed in under 9 hours to fulfil a certain specification; this is still a work in progress.

## Running in development...

1. Run `bundle install --without=production` to ensure you have the required dependencies.  This will create a `.bundle/config` file which will always force the skipping of any gems listed in the production group &mdash; this is done to skip the need for mysql as defined in the Gemfile.

2. Run the migrations, `rake db:migrate`

3. Two rake tasks have been created to assist in (a) creating an admin user account and (b) seeing the database with sample data in lieu of the pending CRUD controller/views that are missing in the app.

4. Once both rake tasks have been executed, perform the following.

```ruby
User.last.update_attribute(:role,"admin")
```

5. [Download and install wkhtmltopdf](http://code.google.com/p/wkhtmltopdf/) and place the binary at `/usr/local/bin` &mdash; this is needed to allow downloading of PDFs from the application.

6. Fire up the development server via `rails s` and visit [http://localhost:3000](http://localhost:3000)

## License
zbar_mike is Copyright (c) 2011 [Michael de Silva](http://www.bsodmike.com) ([@bsodmike](https://twitter.com/#!/bsodmike) &amp; [G+](https://plus.google.com/102197309611185157885/posts)), and is released under MIT-LICENSE.