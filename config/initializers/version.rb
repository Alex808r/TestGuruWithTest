# frozen_string_literal: true

# версия приложения относится к приложению,
# чтобы не засорять глобальное пространство имен
# константу нужно объявить контексте приложения
# Обратимся к config/application.rb чтобы определить
# в какой модуль обернуто все приложение (9-я строка).
# freeze - обязательно, ограничим изменение объекта.

module TestGuru
  class Application < Rails::Application
    VERSION = '0.1.0'
  end
end
