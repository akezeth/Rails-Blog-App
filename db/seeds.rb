Comment.delete_all
Like.delete_all
Post.delete_all
User.delete_all

user_1 = User.create(name: 'Lawrence McDaniel',
	photo: 'https://cdn.filestackcontent.com/e59vmdzRKGVwdjNKKLy0', 
	bio: 
		%{Lawrence McDaniel is an American full stack developer with significant experience with classic backend stacks and front-end frameworks including Django, React, Angular, and WordPress. He also work extensively with the Open edX learning management system. A curated collection of technical how-to articles written by Lawrence McDaniel for AWS, Python, Django, Open edX, and WordPress.},
	posts_counter: 0)
user_2 = User.create(name: 'Nick Janetakis',
	photo: 'https://yt3.googleusercontent.com/ytc/AGIKgqNOkQifJxJFApzSI618fOq3H9xfByIPZzxYUSjtDA=s900-c-k-c0x00ffffff-no-rj',
	bio:
		%{Nich Janetakis a full-stack developer and teacher who focuses on building and deploying web apps. Take a look at his blog or courses. If he is not building or deploying web apps, then he is writing about what he have learned along the way in his blog. From development to production you will get all the information there.},
	posts_counter: 0)
user_3 = User.create(name: 'Wes Bos',
	photo: 'https://miro.medium.com/v2/resize:fit:2400/0*aEfbQnQjpV7YOzbs.jpeg',
	bio:
		%{Wes Bos is a web developer, teacher and speaker from Hamilton, Ontario. He uses HTML, CSS and JavaScript. Though constantly changing, his focus right now he is using React.js, Node, Express, Lambda, Gatsby and Next.js.},
	posts_counter: 0)

# Create at least 4 Posts
post_1 = Post.create(author: user_1,
	title: 'WordPress oAuth Provider for Open edX',
	text: 
		%{I’m a big advocate of leveraging WordPress as a marketing front end for Open edX; even more so if you need e-commerce for monetizing your course content. But did you know that you can also configure your WordPress site as an upstream oAuth provider for your Open edX installation? This makes a lot of sense if you’d prefer to manage your user account life cycle outside of Open edX, which would be a sensible goal for a lot of reasons.},
	comments_counter: 0,
	likes_counter: 0)
post_2 = Post.create(author: user_1,
	title: 'Managing Your Open edX Backend With Terraform',
	text: 
		%{Earlier this year I open-sourced my personal Terraform and Github Actions scripts in the form of a Cookiecutter template repository named Cookiecutter Openedx Devops. You can use this Cookiecutter to create your own Open edX devops repository, perfectly configured with your custom domain name and AWS account information. Cookiecutter Open edX Devops is a highly opinionated set of tools for creating and maintaining an AWS backend for Open edX that satisfies all five of these principals.},
	comments_counter: 0,
	likes_counter: 0)
post_3 = Post.create(author: user_2,
	title: 'Flask Nested Blueprints Example',
	text: 
		%{So you’ve decided nested blueprints are what you need and now you want to use them.

		Maybe you’ve encountered circular dependency errors, other issues or the docs weren’t quite enough to get you going. Got it, let’s go over a real example of using them in a multi-file project that uses the Flask app factory pattern and write tests too.
		
		We’re going to use my example Flask / Docker app so we have a baseline app to work with if you want to follow along but nothing here is specific to Docker.},
	comments_counter: 0,
	likes_counter: 0)
post_4 = Post.create(author: user_2,
	title: 'Hello World!',
	text: 
		%{I tend to write a lot of glue code with shell scripts. Sometimes I find myself sending POST requests to APIs where it’s expected to send in a decent amount of JSON.

		There’s a few pitfalls when it comes to doing the above.
		
		By the way in all of the examples below I visit localhost:8008. If you want to follow along, I’ve created a zero dependency web server that echos your request back. I’ve written about it in the past. It comes in handy for testing scripts like this.},
	comments_counter: 0,
	likes_counter: 0)
post_5 = Post.create(author: user_3,
	title: 'Beginner JavaScript',
	text: 
		%{It's here! I'm incredibly proud to announce Beginner JavaScript — a fun, exercise heavy approach to learning Modern JavaScript from scratch. This is a course I've worked on for over a year, and I've been dreaming of how to make the best introduction to JavaScript for years now.

		A rock solid understanding of JavaScript is essential for success, no matter which framework you use. This course will give you that.
		
		JavaScript is hard to learn. Frustration, abandonment and rage quits all stem from trying to use something when we don't understand how things work.},
	comments_counter: 0,
	likes_counter: 0)
post_5 = Post.create(author: user_3,
	title: 'React\’s New Context API Explained',
	text: 
		%{Hey Folks! React 16.3 has a new Context API which makes accessing data and functions anywhere in your application a snap. If you ever find yourself passing data down via props 4-5 levels deep, context might be what you are looking for.

		Enjoy!
		
		https://youtu.be/XLJN4JfniH4
		
		Code Examples available at https://github.com/wesbos/React-Context},
	comments_counter: 0,
	likes_counter: 0)

# Create at least 6 Posts Comments
Comment.create(user: user_2,
	post: post_1,
	text: 
		%{I’ve been surfing on the web more than 3 hours today, yet I never found any stunning article like yours. It’s alluringly worth for me. As I would see it, if all web proprietors and bloggers made puzzling substance as you did, the net will be in a general sense more beneficial than at whatever point in late memory.})
Comment.create(user: user_3,
	post: post_2,
	text: 'That was really a great Artucle.Thanks for sharing information. Continue doing this.')
Comment.create(user: user_1,
	post: post_3,
	text: 'Your Blog is very nice. Wish to see much more like this. Thanks for sharing your information.')
Comment.create(user: user_1,
	post: post_4,
	text: 'Enjoyed reading the article above , really explains everything in detail, the article is very interesting and effective. Thank you and good luck in the upcoming articles.')
Comment.create(user: user_3,
	post: post_3,
	text: 'Thanks for sharing such a great information. It really helpful to me..I always search to read the quality content and finally i found this in you post. keep it up!')
Comment.create(user: user_2,
	post: post_5,
	text: 'Your Blog is very nice. Wish to see much more like this. Thanks for sharing your information.')

Like.create(user: User.first, post: Post.first)
Like.create(user: User.second, post: Post.second)
Like.create(user: User.third, post: Post.third)