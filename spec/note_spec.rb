require_relative '../lib/notebook/note'

describe NoteBook::Note do
   context 'validation' do
    it {expect(NoteBook::Note.valid?("2008-10-19-note-foo.adoc")).to eq 0}
    it {expect(NoteBook::Note.valid?("2008-10-19-note-foo.md")).to eq 0}
    it {expect(NoteBook::Note.valid?("blah.adoc")).to eq nil}
  end
  
  context 'process' do
    tmp = NoteBook::Note.new(".","2008-10-19-note-foo.adoc")
    it {expect(tmp.date).to eq("2008-10-19")}
    it {expect(tmp.slug).to eq("foo")}
    it {expect(tmp.ext).to eq("adoc")}
  end
  
end