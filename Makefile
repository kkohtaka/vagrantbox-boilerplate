# Copyright (c) 2016 Kazumasa Kohtaka. All rights reserved.
# This file is available under the MIT license.

BASE_BOX=boxcutter/ubuntu1610
BASE_BOX_VERSION=2.0.19
PROVIDER=virtualbox

ARTIFACT_BASE=boilerplate
ARTIFACT_BOX=$(ARTIFACT_BASE)-$(PROVIDER).box

default: build

build: $(ARTIFACT_BOX)

$(ARTIFACT_BOX): packer.json
	-vagrant box add \
		--provider $(PROVIDER) \
		--box-version $(BASE_BOX_VERSION) \
		$(BASE_BOX)
	packer build \
		-var 'artifact_base=$(ARTIFACT_BASE)' \
		$<
