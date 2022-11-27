.PHONY: python-build
python-build:
	docker build -f Dockerfile-pydev . -t ghcr.io/s-rafaeldias/pydev:latest

.PHONY: python-run
python-run:
	docker run --name=pydev \
		--init \
		--rm \
		--detach \
		--interactive \
		--entrypoint=/bin/bash \
		ghcr.io/s-rafaeldias/pydev:latest

.PHONY: python
python: python-build python-run

.PHONY: python-deploy
python-deploy: python-build
	docker push ghcr.io/s-rafaeldias/pydev:latest

.PHONY: deploy
deploy: python-deploy

.PHONY: start
start: python-run
