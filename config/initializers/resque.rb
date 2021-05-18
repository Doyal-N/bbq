Resque.logger = Logger.new(Rails.root.join('log', "#{Rails.env}_resque.log"))

# По умолчанию уровень логирования DEBUG, очень подробный
# Если проблем с фоновыми задачами нет, можете раскомментировать строку
# И понизить до INFO или WARN
Resque.logger.level = Logger::INFO
