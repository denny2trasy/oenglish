require 'openssl'
require 'base64'
require 'uri'
require 'net/https'

module Webex

  class UrlApi
    BASEURL = "https://onlineenglish.webex.com/onlineenglish/"  
    USER = "dngai"
    PWD = "Dan12345"
    MEETING_PWD = "eleuid"

    def login(back_url)
      params = {}
      params["AT"] = "LI"
      params["WID"] = USER
      params["PW"] = PWD
      params["MU"] = back_url     

      login_url = BASEURL + "p.php?" + params.to_param
      return login_url
    end
    
    def schedule_meeting(params)
      #params = {}
      params["AT"] = "SE"
      params["ENRE"] = "1"  # enrollment is required
      params["PW"] = MEETING_PWD
      params["TZ"] = "45" # beijing time
      params["MT"] = "9"
      params["WIRE"] = "1" #registration is required for the event or not
      params["VP"] = "1" #Whether the event uses an Internet Phone.
            
      schedule_url = BASEURL + "m.php?" + params.to_param
      return schedule_url
    end
    
    
    def join_meeting(back_url,meeting_key,email,f_name,l_name,join_pw)
      params = {}
      params["AT"] = "JE"
      params["BU"] = back_url
      params["MK"] = meeting_key 
      params["AE"] = email
      params["FN"] = f_name
      params["LN"] = l_name
      params["JPW"] = join_pw
      
      join_url = BASEURL + "m.php?" + params.to_param
      return join_url
    end
    

    def start_meeting(meeting_key,back_url)
      params ={}
      params["AT"] = 'TE'
      params["MK"] = meeting_key
      params["BU"] = back_url
      start_url = BASEURL + "m.php?" + params.to_param
    end

    
    def set_meeting_type
      params = {}
      params["AT"] = "ST"
      params["SP"] = "EC"
      set_type_url = BASEURL + "o.php?" + params.to_param
      return set_type_url
    end
    
    
    def enroll_meeting(params,back_url)
      # params = {}
      params["AT"] = "EN"      
      # params["AE"] = email
      # params["FN"] = f_name
      # params["LN"] = l_name
      # params["MK"] = meeting_key      
      params["PW"] = MEETING_PWD
      params["BU"] = back_url
      start_url = BASEURL + "m.php?" + params.to_param
    end
    
    def join_enrolled_meeting(params,back_url)
      # params = {}
      params["AT"] = "JE"      
      params["BU"] = back_url
      # params["EI"] = enroll_id
      # params["JPW"] = join_pw
      # params["MK"] = meeting_key
      join_url = BASEURL + "m.php?" + params.to_param
      return join_url
    end

  end


end