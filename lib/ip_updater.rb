require 'socket'
require 'net/http'
require 'net/https'
require 'resolv'
require_relative 'cdmon_updater/config'
require_relative 'cdmon_updater'

module CDMonUpdater
  class IPUpdater
    def initialize(config_file = "../config/cdmon.yml")
      Config.load(config_file)
      @resolver = Resolv::DNS.new(:nameserver => Config.dns, :search => ["localhost"], :dots => 1)
      CDMonUpdater.log_level = Config.log_level
    end

    def update
      url = URI.parse(Config.service_url)
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = (url.scheme == 'https')
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

#require 'debug'
      begin
        Config.users.keys.each do |usr|
          request = Net::HTTP::Get.new(Config.get_cdmon_ip_path_for(usr))
          Config.hosts_for(usr).each do |host|
            host_ip_by_cdmon = @resolver.getaddress(host).to_s
            values = parse_response(http.request(request).body)
            current_cdmon_ip = values["newip"] if values.has_key?("newip")
            unless host_ip_by_cdmon == current_cdmon_ip
              request = Net::HTTP::Get.new(Config.cdmon_ip_path_for(usr, current_cdmon_ip))
              response = parse_response(http.request(request).body)
              case response["resultat"]
                when Config::CDMON_OK_IP
                  CDMonUpdater.log_all("IP Succesfully updated")
                when Config::CDMON_BAD_IP
                  CDMonUpdater.log_all("Bad IP Provided")
                when Config::CDMON_ERROR_LOGIN
                  CDMonUpdater.log_all("Login Error")
              end
            end
          end
        end
      rescue SocketError
       CDMonUpdater.log_all("SocketError: Probably the internet connection is broken")
      rescue Resolv::ResolvError
        CDMonUpdater.log_all("ResolvError: Cannot get DNS results")
      end

    end

    private 
    def parse_response(response)
     values = response.split("&")
     pairs = {}
     values.each do |val|
       key_val = val.split("=")
       pairs[key_val[0]] = key_val[1]
     end
     pairs
    end
  end

end
