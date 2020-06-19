NAME = deno-server
PORT = 8080

.PHONY: docker-build
docker-build:
	docker build -t $(NAME) .

.PHONY: docker-run
docker-run:
	docker run -i -t --rm -p $(PORT):$(PORT) --name $(NAME) $(NAME)

.PHONY: docker-stop
docker-stop:
	docker stop $(NAME)
