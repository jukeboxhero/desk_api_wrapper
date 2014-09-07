DESK_API_CONFIG = YAML.load_file("#{Rails.root}/config/desk_api.yml")[Rails.env]
DESK_CLIENT = DeskClient.new