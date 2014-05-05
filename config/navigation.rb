SimpleNavigation.config.selected_class = 'active'

SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.dom_class = 'nav navbar-nav'
    primary.item :home, 'Home', root_url
    primary.item :victims, 'Victims', victims_url
    primary.item :offenses, 'Offenses', offenses_url
    primary.item :users, 'Users', users_url
  end
end
