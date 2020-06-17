.PHONY: run

docker-build:
	docker build -t deno-server .

docker-run:
	docker run -i -t --rm -p 3000:3000 deno-server
