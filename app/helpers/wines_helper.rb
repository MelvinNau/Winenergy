module WinesHelper
    def information(wine, fake)
        informations = [:_name, :_label, :_variety, :_designation]  # :_domain, :_vintage, :_alcohol, :_years, :_price
        information_values = informations.map do |information|
            special_class = fake ? 'blur-effect' : ''
            content_tag(:div, wine.send(information, fake), class: special_class)
        end
        joined_information = safe_join(information_values, '')

        joined_information.html_safe 
    end

    def link_to_by_signed_in(signed, wine)
        if signed
            return wine_path(wine)
        else
            return root_url
        end
    end
end
