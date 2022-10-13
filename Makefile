##
# \file Makefile
# \brief Makefile to create polytech builder
# \author Jeremy HERGAULT (reneca), Anthony THOMAS
# \version 1.0
# \date 2022-10-13
#
# This file is part of PolyBuilder, which is builder for overware programs.
# Copyright (C) 2022  HERGAULT Jeremy, Alexandre, Thierry ( reneca )
#
# PolyBuilder is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# PolyBuilder is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with OVCloud. If not, see <http://www.gnu.org/licenses/>.
##

IMG_NAME=overware/polybuilder

.PHONY: all push run clean

all: ## Make debian builder
	if ! echo "$(shell docker images $(IMG_NAME))" | grep -q $(IMG_NAME); then docker build -t $(IMG_NAME) .; fi

help:
	@grep -hE '(^[\.a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-16s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

push: ## Make debian multi-arch builder
	docker buildx build --platform linux/amd64,linux/arm64/v8 -t $(IMG_NAME) --push .

run: ## Try to run the docker builder
	docker run -ti --rm -h polytech-dev --name polytech-dev $(IMG_NAME)

clean: ## Remove docker builder
	if echo "$(shell docker images $(IMG_NAME))" | grep -q $(IMG_NAME); then docker rmi -f $(IMG_NAME); fi


# End of file
