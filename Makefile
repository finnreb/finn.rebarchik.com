deploy: build
	aws s3 sync ./ s3://finn.rebarchik.com --acl public-read --delete
	aws s3 rm s3://finn.rebarchik.com --exclude "*" --include ".*" --include "Makefile" --recursive
	aws configure set preview.cloudfront true
	aws cloudfront create-invalidation --distribution-id XXX --paths '/*'
