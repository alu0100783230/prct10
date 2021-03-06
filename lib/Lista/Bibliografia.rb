module Listaa
    class Bibliografia
        include Comparable
        attr_reader :Author, :Title, :Serie, :Editorial, :Edicion
        attr_reader :Fecha_Publication
        def initialize 
            @Author = []
            @Title = "Sin título"
            @Serie = nil
            @Editorial = "Editorial sin definir"
            @Edicion = 0
            @Fecha_Publication = "01-ENE-1901"
            @Tipo = nil
        end 
    
        def add_author(name,apellido)
            if(@Author == nil)
                @Author = []
                @Author[0] = Listaa::Autor.new(name,apellido)
            else
                @Author << Listaa::Autor.new(name,apellido)
            end
        end
        
        def add_title(name)
            @Title = name
        end
        
        def add_serie(name)
            @Serie = name
        end
        
        def add_editorial(name)
            @Editorial = name
        end
        
        def set_edicion(num)
            @Edicion = num
        end
        
        def set_publication(fech)
            @Fecha_Publication = fech
        end
        
        def get_formato
            a = @Author.join(", ") +"\n"+@Title.to_s+"\n"+@Serie.to_s+
            "; "+@Edicion.to_s+" edition ("+@Fecha_Publication.to_s+")\n"
        end
        
        def get_tipo
            @Tipo    
        end
        
        def <=> (o)  
            if autorTo_s!=o.autorTo_s
                autorTo_s <=> o.autorTo_s
            else
                if(o.Fecha_Publication[7..10] > @Fecha_Publication[7..10])
                    -1
                else
                    1
                end
            end
        end
        
        def autorTo_s
            f=""
            if(@Author.count>1)
                @Author.collect { |x| f=f+x.to_s+" & "}
            else
                @Author.collect { |x| f=f+x.to_s}
            end
            f
        end
    end
end