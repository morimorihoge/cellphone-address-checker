# -*- coding: utf-8 -*-
$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module CellphoneAddressChecker
  VERSION = '0.0.1'

  class CellphoneAddressChecker
    # carrier domain from
    # http://bui.asablo.jp/blog/2011/07/11/5950931
    CARRIER_DOMAINS = {
      :docomo => [
        "docomo\.ne\.jp",
        "docomo-onlineshop\.ne\.jp",
        "mydocomo\.com",
        "docomo\.blackberry\.com",
        "docomo-camera\.ne\.jp",
        "mail\.visualnet\.mopera\.ne\.jp",
        "dwmail\.jp",
        "mobachemail\.ne\.jp",
        "docomo-bill\.ne\.jp"
      ],

      :softbank => [
        "softbank\.ne\.jp",
        "i\.softbank\.jp",
        "c\.vodafone\.ne\.jp",
        "d\.vodafone\.ne\.jp",
        "h\.vodafone\.ne\.jp",
        "k\.vodafone\.ne\.jp",
        "n\.vodafone\.ne\.jp",
        "q\.vodafone\.ne\.jp",
        "r\.vodafone\.ne\.jp",
        "s\.vodafone\.ne\.jp",
        "t\.vodafone\.ne\.jp"
      ],

      :au => [
        "ezweb\.ne\.jp",
        "[a-z0-9]+\.ezweb\.ne\.jp",
        "[a-z0-9]+\.biz\.ezweb\.ne\.jp",
        "[a-z0-9]+\.ido\.ne\.jp",
        "jp-c\.ne\.jp",
        "jp-d\.ne\.jp",
        "jp-h\.ne\.jp",
        "jp-n\.ne\.jp",
        "jp-k\.ne\.jp",
        "jp-q\.ne\.jp",
        "jp-r\.ne\.jp",
        "jp-s\.ne\.jp",
        "jp-t\.ne\.jp"
      ],

      :willcom => [
        "willcom\.com",
        "pdx\.ne\.jp",
        "di\.pdx\.ne\.jp",
        "dj\.pdx\.ne\.jp",
        "dk\.pdx\.ne\.jp",
        "wm\.pdx\.ne\.jp"
      ],

      :emnet => [
        "emnet\.ne\.jp"
      ],

      :disneymobile => [
        "disney\.ne\.jp"
      ],

      :vertu => [
        "vertuclub\.ne\.jp"
      ]
    }

    # get carrier symbol
    # ==== Return
    # supported carriers:
    #   :docomo
    #   :softbank
    #   :au
    #   :willcom
    #   :emnet
    #   :disneymobile
    #   :vertu
    # nil if not cellphone carrier's
    # 
    def self.get_carrier(email) 
      CARRIER_DOMAINS.each do |k, domains|
        domains.each do |domain|
          pattern = Regexp.new("@#{domain}$")
          if email =~ pattern
            return k
          end
        end
      end
      return nil
    end

    def self.cellphone_address?(email)
      self.get_carrier(email).nil? ? false : true
    end
  end
end
