# ===== Go Dev =====

build-dev:
	# darwin_arm64
	go build
	mkdir -p ~/.terraform.d/plugins/local/local/secret/0.1.0-dev/darwin_arm64/
	cp terraform-provider-secret ~/.terraform.d/plugins/local/local/secret/0.1.0-dev/darwin_arm64/terraform-provider-secret

	# darwin_amd64
	go build
	mkdir -p ~/.terraform.d/plugins/local/local/secret/0.1.0-dev/darwin_amd64/
	cp terraform-provider-secret ~/.terraform.d/plugins/local/local/secret/0.1.0-dev/darwin_amd64/terraform-provider-secret

	# darwin_arm64
	go build
	mkdir -p ~/.terraform.d/plugins/local/local/secret/0.1.0-dev/linux_amd64/
	cp terraform-provider-secret ~/.terraform.d/plugins/local/local/secret/0.1.0-dev/linux_amd64/terraform-provider-secret

# ===== Terrafrom =====

tf-fmt:
	terraform fmt -recursive

tf-fmt-check:
	terraform fmt -recursive -check

# ===== Git Hooks =====

setup-git-hooks:
	rm -rf .git/hooks
	(cd .git && ln -s ../.git-hooks hooks)
