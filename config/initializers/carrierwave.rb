if Rails.env.production?
    CarrierWave.configure do |config|
        config.fog_credentials = {
          provider: 'AWS',
          aws_access_key_id: ENV['AKIAX3TRONJEXGS6VO4Q'],
          aws_secret_access_key: ENV['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'],
          region: ENV['ap-northeast-1'],
          path_style: true
        }
        config.fog_public = true
        config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}
      
        config.remove_previously_stored_files_after_update = false
      
        config.fog_directory = ENV['bucket-name-xxx']
        config.asset_host = ENV['bucket-name-xxx']
      end
      # 日本語の文字化けを防ぐ
      CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
end
