mix phx.gen.context Recipes Aliment aliments name:string quantity:integer unit:enum:ml:g calories:integer protein:integer carbs:integer carbs_sugar:integer carbs_fibre:integer sodium:integer fat:integer fat_trans:integer fat_saturated:integer cholesterol:integer other:map

mix phx.gen.context Program Program programs name:string duration:string avg_exercice_duration:string difficulty:string thumbnail:string

mix phx.gen.context Recipes Recipe recipes title:string description:string instruction:string cooking_time:string preparation_time:string notes:string is_private:boolean program_id:references:programs