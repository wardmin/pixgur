class AddAttachmentPixfileToPictures < ActiveRecord::Migration
  def self.up
    change_table :pictures do |t|
      t.attachment :pixfile
    end
  end

  def self.down
    remove_attachment :pictures, :pixfile
  end
end
