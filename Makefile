all: .make.build seth.container

.make.build:
	podman build -t seth-docker .
	touch $@

seth.container: .make.build
	podman run -it -v $$(pwd):/host seth-docker
