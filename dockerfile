# Use a imagem oficial do Ruby
FROM ruby:2.7.8

# Instale as dependências do sistema
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs sqlite3

# Configure a pasta de trabalho dentro do contêiner
WORKDIR /app

# Copie o Gemfile e o Gemfile.lock para o contêiner
COPY Gemfile Gemfile.lock ./

# Instale as gemas
RUN bundle install

# Copie o código da aplicação para o contêiner
COPY . .

# Exponha a porta 3000 para o servidor Rails
EXPOSE 3000

# Comando padrão para iniciar o servidor Rails
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
