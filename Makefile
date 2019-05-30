pack:
	rm -f temp/source* && pushd source && zip -r -q ../temp/source.zip * && popd

terraform:
	terraform apply

push:
	pack terraform

console:
	pry -r ./bin/console.rb
