if Rails.env.production? or Rails.env.staging?
  Paperclip::Attachment.default_options[:storage] = :filesystem
  Paperclip::Attachment.default_options[:path] = ":rails_root/public/:url"
  Paperclip::Attachment.default_options[:url] = "images/:class/:id/:style/:filename"
end

Paperclip::Attachment.default_options[:hash_secret] = ENV['PAPERCLIP_SECRET']