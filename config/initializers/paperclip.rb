if Rails.env.production? or Rails.env.staging?
end

Paperclip::Attachment.default_options[:hash_secret] = ENV['PAPERCLIP_SECRET']