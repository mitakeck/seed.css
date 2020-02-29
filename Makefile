test:
	echo `pwd`

init:
	docker build . -t mitake/sass

start:
	docker run -it --init -v `pwd`:/app -t mitake/sass /app/sass/main.scss:/app/css/app.css --watch

build:
	docker run -it --init -v `pwd`:/app -t mitake/sass /app/sass/main.scss:/app/css/app.css --style compressed
