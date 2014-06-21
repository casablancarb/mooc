#MOOCx
 
A simple, work-in-progress MOOC platform.

 
![alt tag](https://raw.githubusercontent.com/casablancarb/mooc/master/public/screenshot.jpg)


# How to install 

	bundle install
	rake db:migrate

# How to create first user 

	rails console 

Then create your user

	User.create(email: "name@example.com", password: "foobar", password_confirmation: "foobar", firstname: "admin", lastname: "user", is_teacher: true)
	
	
# Roadmap 
Visit the public Trello board to know more about features and the roadmap for this project : 
[https://trello.com/b/653rlfZw](https://trello.com/b/653rlfZw)

If you're interested in contributing with features please drop me an email : zakaria.braksa [at] gmail [dot] com 


