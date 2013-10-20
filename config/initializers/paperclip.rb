if Rails.env.production? or Rails.env.staging?
  Paperclip::Attachment.default_options[:storage] = :filesystem
  Paperclip::Attachment.default_options[:url] = "/system/:class/:attachment/:id_partition/:style/:filename"
end

Paperclip::Attachment.default_options[:hash_secret] = ENV['PAPERCLIP_SECRET']