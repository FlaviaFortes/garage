if Rails.env.production? or Rails.env.staging?
  Paperclip::Attachment.default_options[:storage] = :s3
  Paperclip::Attachment.default_options[:bucket] = ENV['AMAZON_S3_BUCKET']
  Paperclip::Attachment.default_options[:s3_permissions] = :public_read
  Paperclip::Attachment.default_options[:s3_credentials] = { access_key_id: ENV['AMAZON_ACCESS_KEY_ID'], secret_access_key: ENV['AMAZON_SECRET_ACCESS_KEY'] }
  Paperclip::Attachment.default_options[:url] = ":s3_domain_url"
end

Paperclip::Attachment.default_options[:hash_secret] = ENV['PAPERCLIP_SECRET']