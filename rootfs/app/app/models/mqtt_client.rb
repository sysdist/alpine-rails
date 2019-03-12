class MqttClient

    def initialize
        #uri=URI.parse("mqtt://mqttuser:changeme@localhost:1883")
        uri = URI.parse(ENV['MQTT_URL'])
        @client = MQTT::Client.connect(host: uri.hostname,
                                      port: uri.port, 
                                      username: uri.user,
                                      password: uri.password )
    end

    def send_message(topic, message)
        @client.publish(topic, message)
        #self.disconnect()
    end
  
    def receive_messages
        @client.subscribe('#')
        @client.get do |topic,message|
            puts "topic: #{topic}, msg: #{message}"
            
            # t = topic.split('/')
            # case t[4]
            # when "load"
            # log_socket_load(topic, message)
            # when "status"
            # socket_id = t[3]
            # update_socket_status(socket_id, message)
            # when "auth"
            # auth_tag(topic, message)
            # end
        end
    end
      
  end