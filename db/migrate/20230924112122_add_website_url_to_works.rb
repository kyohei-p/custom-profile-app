class AddWebsiteUrlToWorks < ActiveRecord::Migration[7.0]
  def change
    add_column :works, :website_url, :string
  end
end
