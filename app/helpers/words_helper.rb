module WordsHelper
  JOINED_TABLE_COLUMNS = %w[categories.title]
  def sort_column
    if (JOINED_TABLE_COLUMNS || Word.column_names).include?(params[:sort])
      params[:sort]
    else 
      :content
    end
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
