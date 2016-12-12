FROM centos:latest
MAINTAINER okisanjp <okisan.jp@gmail.com>

# crontabsをインストール
RUN yum -y update
RUN yum -y install crontabs

# タイムゾーンをJSTへ
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# 手元のcronファイルをコンテナへ持っていく
ADD cron-test /etc/cron.d/test

# 実行できるように権限を付ける
RUN chmod 0644 /etc/cron.d/test

# 動作確認用のファイル
RUN touch /tmp/test.txt

# 起動
CMD crond && tail -f /dev/null
