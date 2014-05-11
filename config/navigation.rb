SimpleNavigation.config.selected_class = 'active'

SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.dom_class = 'nav navbar-nav'
    primary.item :home, 'Home', root_url
    primary.item :victims, 'Victims', victims_url, highlights_on: %r(/victims)
    primary.item :offenses, 'Offenses', offenses_url, highlights_on: %r(/offenses) do |offense|
      offense.item :new, 'New offense', new_offense_url
      offense.item :warnings, 'List warnings', offenses_type_url('warnings')
      offense.item :suspensions, 'List suspensions', offenses_type_url('suspensions')
    end
    primary.item :users, 'Users', users_url, highlights_on: %r(/users)
  end
end
