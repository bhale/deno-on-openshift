# Deno server that runs on OpenShift

Small server written in TypeScript that runs on OpenShift with Deno.

## Running local

### Simple

Prerequisite: Deno runtime: https://deno.land/#installation

```sh
deno run --allow-net server.ts
```

#### Alternative using [Makefile](./Makefile)

```sh
make run
```

### With docker

```sh
make docker-run
```
