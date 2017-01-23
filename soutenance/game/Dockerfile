from debian:sid
run sed -e 's/deb.debian.org/debian.mirrors.ovh.net/g' -i /etc/apt/sources.list
run apt-get update \
    && apt-get install -y \
      bundler \
      libcairo2-dev \
      ruby \
    && apt-get clean 
add . /workspace
workdir /workspace
run bundle install 
