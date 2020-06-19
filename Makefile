NAME = deno-server
PORT = 8080

.PHONY: run
run:
	deno run --allow-net server.ts

.PHONY: docker-build
docker-build:
	docker build -t $(NAME) .

.PHONY: docker-run
docker-run:
	docker run -i -t --rm -p $(PORT):$(PORT) --name $(NAME) $(NAME)

.PHONY: docker-stop
docker-stop:
	docker stop $(NAME)

pre-commit: README.md
	npx prettier --write README.md
