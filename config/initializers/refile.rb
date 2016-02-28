# config/initializers/refile.rb
# require "refile/s3"

aws = {
  region: "us-west-2",
  access_key_id: "AKIAI3FB4DWKFXN5XJTA",
  secret_access_key: "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",
  bucket: "squarefruit-bucket"
  }
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)
