FROM --platform=linux/x86_64 ruby:3.2.2
# ベースにするイメージを指定

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs default-mysql-client vim
# RailsのインストールやMySQLへの接続に必要なパッケージをインストール

RUN mkdir /myapp
# コンテナ内にmyappディレクトリを作成

WORKDIR /myapp
# 作成したmyappディレクトリを作業用ディレクトリとして設定

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
# ローカルの Gemfile と Gemfile.lock をコンテナ内のmyapp配下にコピー

RUN gem update --system ${RUBYGEMS_VERSION} && \
    bundle install
# コンテナ内にコピーした Gemfile の bundle install

COPY . /myapp
# ローカルのmyapp配下のファイルをコンテナ内のmyapp配下にコピー

# コンテナ起動時に実行させるスクリプトを追加
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# CMD:コンテナ実行時、デフォルトで実行したいコマンド
# Rails サーバ起動
CMD ["rails", "server", "-b", "0.0.0.0"]


# https://qiita.com/Yusuke_Hoirta/items/3a50d066af3bafbb8641