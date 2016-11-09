workdir   = /usr/src/app
container = codesimple/elm:0.17
basecmd   = docker run --rm -ti -v $$(pwd):$(workdir) -w $(workdir)

dev-cli:
	$(basecmd) --entrypoint bash $(container)

dev-server:
	$(basecmd)  -p 8000:8000 $(container) reactor --address 0.0.0.0

buildName = chr0n1x/docker-elm-example
build:
	docker build --tag $(buildName):$$(git rev-parse HEAD) .
	docker tag $(buildName):$$(git rev-parse HEAD) $(buildName):latest
