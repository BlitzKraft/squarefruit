# config/initializers/refile.rb
<<<<<<< HEAD
require "refile/s3"

# aws = {
#   access_key_id: Rails.application.secrets.access_key,
#   secret_access_key: Rails.application.secrets.secret_key,
#   region: Rails.application.secrets.region,
#   bucket: Rails.application.secrets.bucket,
# }

aws = {
  access_key_id:"AKIAI3FB4DWKFXN5XJTA",
  secret_access_key:"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",
  region:"us-west-2",
  bucket:"squarefruit-bucket"
}
=======
# require "refile/s3"

aws = {
  region: "us-west-2",
  access_key_id: "AKIAI3FB4DWKFXN5XJTA",
  secret_access_key: "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",
  bucket: "squarefruit-bucket"
  }
>>>>>>> dev
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)
