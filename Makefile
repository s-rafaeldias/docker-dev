.PHONY: python-build
python-build:
	docker build -f Dockerfile-pydev . -t rds/pydev

.PHONY: python-run
python-run:
	docker run --name=pydev \
		--init \
		--rm \
		--detach \
		--interactive \
		--entrypoint=/bin/bash \
		rds/pydev

.PHONY: python
python: python-build python-run
