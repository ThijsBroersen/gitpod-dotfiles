#!/bin/zsh

mkdir -p ~/.bloop
echo '{"javaOptions": ["-Xms1G","-Xmx8G","-Xss64m","-XX:ReservedCodeCacheSize=256M","-XX:MaxInlineLevel=20","-XX:+UseParallelGC","-Dfile.encoding=UTF-8"]}' > ~/.bloop/bloop.json

curl -fL https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz | gzip -d > cs
chmod +x cs
./cs setup --yes
rm cs

cs install bloop --only-prebuilt=true
