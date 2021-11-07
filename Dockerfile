RUN set -x \
  && apt update \
  && apt install -y --no-install-recommends \
  lib32stdc++6

RUN rake db:create
RUN rake db:migrate
RUN rake db:seed
