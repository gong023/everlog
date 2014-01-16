task default: :post_daily

task :post_daily do
  $:.push File.dirname(__FILE__)
  require 'evernote_oauth'
  require 'yaml'
  require 'pp'
  setting = YAML.load_file(File.dirname(__FILE__) + '/setting.yml')
  evernote_client = EvernoteOAuth::Client.new(token: setting['evernote']['access_token'])
  note = Evernote::EDAM::Type::Note.new
  note.title = 'title test'
  note.content = <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE en-note SYSTEM "http://xml.evernote.com/pub/enml2.dtd">
<en-note>hoge</en-note>
EOF
  evernote_client.note_store.createNote(setting['evernote']['access_token'], note)
end
