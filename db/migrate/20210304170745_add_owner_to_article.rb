class AddOwnerToArticle < ActiveRecord::Migration[6.1]
  def change
    # En un principio cuando se hace la migracion aparece en vez del simbolo :owner, :user lo cual
    # no es correcto. pero al hacer este cambio, rails por defecto va a buscar la tabla owner la cual
    # no existe, por lo que se le indica al foreign_key a donde debe apuntar, y el index para dar
    # mejor rendimiento en busquedas
    add_reference :articles, :owner, null: false, foreign_key: { to_table: :users }, index: true
  end
end
