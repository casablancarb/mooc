A simple, work-in-progress MOOC platform.

# How to install 

	bundle install
	rake db:migrate

# How to create first user 

	rails console 

Then create your user

	User.create(email: "name@example.com", password: "foobar", password_confirmation: "foobar", firstname: "admin", lastname: "user", is_teacher: true)