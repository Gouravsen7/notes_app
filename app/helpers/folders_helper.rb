module FoldersHelper

  def folder_for_select
    Folder.unscoped.all.collect { |m| [m.name, m.id] }
  end

end
