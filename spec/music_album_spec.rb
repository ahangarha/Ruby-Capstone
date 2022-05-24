require_relative '../lib/music_album'

describe MusicAlbum do
  before :all do
    @album = MusicAlbum.new 2022
  end

  it 'Should be a MusicAlbum instance' do
    expect(@album).to be_instance_of MusicAlbum
  end

  it 'album publish year should be == 2022' do
    expect(@album.publish_date).to eql 2022
  end

  it 'expect album not to be on spotify' do
    expect(@album.on_spotify).to be_falsey
  end

  it 'expect album not be be archivable' do
    @album.move_to_archive
    expect(@album.archived).to be_falsey
  end
end
