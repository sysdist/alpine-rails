class ApplicationController < ActionController::Base

    def hello
        render html: "hello, world! derpi derp"
    end

end
