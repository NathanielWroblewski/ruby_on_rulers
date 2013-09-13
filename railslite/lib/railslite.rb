require 'railslite/version'
require 'railslite/active_support_array'
require 'railslite/routing'
require 'railslite/util'
require 'railslite/dependencies'
require 'railslite/controller'

module Railslite
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404,
          { 'Content-Type' => 'text/html' }, []]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)
      `echo debug > debug.txt`;
        [200, {'Content-Type' => 'text/html'},
          [text]]
    end
  end
end
