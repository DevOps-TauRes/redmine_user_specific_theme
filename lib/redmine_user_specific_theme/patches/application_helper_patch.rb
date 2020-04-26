module RedmineUserSpecificTheme::Patches:: ApplicationHelperPatch

    def current_theme
      user_theme = Redmine::Themes.theme(User.current.pref.ui_theme)
      user_theme || super
    end

    def body_css_classes
      css_classes = super
      user_theme = Redmine::Themes.theme(User.current.pref.ui_theme)
      user_theme ?
          css_classes.gsub(/theme-\S+/, "theme-#{user_theme.name}") :
          css_classes
    end

end
