.PHONY: watch build build-image clean

IMG_NAME=docker-api-docs
BUILD_IMG_NAME=docker-api-docs-build

watch: build-image
	docker run --rm -it -p 4567:4567 -v `pwd`:/app ${BUILD_IMG_NAME}

build: build-image
	docker run --rm -it -v `pwd`:/app ${BUILD_IMG_NAME} rake build

build-image:
	docker build -t ${BUILD_IMG_NAME} -f Dockerfile.build .

image: build
	docker build -t ${IMG_NAME} .

clean:
	docker rmi $(BUILD_IMG_NAME} && \
		rm -rf build