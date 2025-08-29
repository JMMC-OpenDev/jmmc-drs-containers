# Build a docker image 
# Building requires :
# - docker buildx
# look at the Dockerfile for main building operations
#

include ./common.mk

# CONTAINER_REGISTRY
CONTAINER_REGISTRY:=gricad-registry.univ-grenoble-alpes.fr/osug/jmmc/containers/

all:	build tag_latest

# call force-build to start again building process from the beginning
force-build:	Dockerfile OImaging-uws.war
	docker buildx build --no-cache=true -t $(NAME):$(VERSION) .

build:	Dockerfile 
	docker buildx build -t $(NAME):$(VERSION) .

tag_latest:
	docker tag $(NAME):$(VERSION) $(NAME):latest

run:
	docker rm $(NAME) || true
	docker run -it --name $(NAME) $(NAME):$(VERSION)

shell:
	docker exec -it $(NAME) /bin/bash


push:
	@echo "Please login first using next command if your push fails ():"
	@echo " docker login $(CONTAINER_REGISTRY)"
	docker tag $(NAME):$(VERSION) $(CONTAINER_REGISTRY)$(NAME):$(VERSION)
	docker push $(CONTAINER_REGISTRY)$(NAME):$(VERSION)
	@echo "Please logout after your pushes:"
	@echo " docker logout $(CONTAINER_REGISTRY)"

push_latest:
	docker tag $(NAME):$(VERSION) $(CONTAINER_REGISTRY)$(NAME):latest
	docker push $(CONTAINER_REGISTRY)$(NAME):latest

clean:
	true
