if Rails.env.production? or Rails.env.staging?
  Paperclip::Attachment.default_options[:storage] = :file
  Paperclip::Attachment.default_options[:url] = ":file_domain_url"
end

Paperclip::Attachment.default_options[:hash_secret] = ENV['PAPERCLIP_SECRET']