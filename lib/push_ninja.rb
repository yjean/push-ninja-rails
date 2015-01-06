require 'push_ninja/exporter'

module PushNinja
  # CONFIGURATION OPTIONS
  ## environnement to use : [:staging, :production]
  mattr_accessor :env
  @@env = :staging

  ## default platform id : integer
  mattr_accessor :default_platform_id
  @@default_platform_id = nil

  ## authentification token : string
  mattr_accessor :authentification_token
  @@authentification_token = nil

  def self.config
    yield self
  end
end
