class Lifelog
  class Github
    require 'mechanize'
#    require 'capybara-webkit'
#    include Capybara::DSL
    HOST = 'https://github.com'

    def client
      @client ||= Mechanize.new do |m|
        m.user_agent_alias = 'Mac Safari'
      end
    end

    def login
      client.get(HOST) do |page|
        login_page = client.click(page.link_with(:text => /Sign in/))

        logined = login_page.form_with(:action => /session/) do |l|
          l.login = ENV['github_loginname']
          l.password = ENV['github_loginpass']
        end.submit

        # now implementing
      end
    end
  end
end
