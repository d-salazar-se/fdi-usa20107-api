class Document < ApplicationRecord
  # Maybe use STI Inheritance per document?
  self.inheritance_column = :_sti_disabled

  validates :identifier, uniqueness: true, allow_blank: true
  
  enum type: { unidentified: 0, thesis: 1 }
end
