#TODO enable file type checking
Paperclip.options[:content_type_mappings] = { :stl => 'text/plain', :stl => 'application/octet-stream', :stl => 'application/vnd.ms-pki.stl', :stl => 'application/sla' }
require 'paperclip/media_type_spoof_detector'
module Paperclip
	class MediaTypeSpoofDetector
		def spoofed?
			false
		end
	end
end

